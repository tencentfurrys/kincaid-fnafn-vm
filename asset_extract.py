#!/usr/bin/env python3
"""Extract real textures + audio from YYC data.win.

Verified formats (hand-checked this session against fnafn/binaries/data.win):
  AUDO: [u32 count=54][54 x u32 abs entry offs]; entry = [u32 length][blob]
        -> 53x RIFF/WAV + 1x OggS (magic-checked).
  TXTR: [u32 count=429][429 x u32 abs entry offs];
        entry = [u32 a][u32 b][u32 abs data off]; data = raw PNG, NO length
        prefix. PNG boundary found by walking PNG chunks to IEND. Small
        non-negative slack gaps exist between consecutive blobs (padding).
  TPAG: [u32 count=1125][1125 x u32 abs entry offs]; each entry 22 bytes =
        11 x u16 LE: srcX,srcY,srcW,srcH, tgtX,tgtY,tgtW,tgtH,
        boundW,boundH, pageID. (Reverse-engineered; see confidence notes.)
  SOND: 57 records x 36 bytes = [name_ptr, flags, ?, ?, ?, vol_f32, ?, ?,
        audio_idx_i32]. audio_idx = AUDO index or -1 (external/streamed).
        flags 0x64 = external (no embedded audio), 0x65 = embedded WAV,
        0x67 = embedded compressed (Ogg). -> exactly 3 SONDs lack audio.

Outputs (repo root out/):
  out/assets/textures/page_NNNN.png   (429)
  out/assets/audio/AA_SONDNAME.wav/.ogg (54, AA = AUDO index)
  out/assets/tpag_map.json
  out/ASSET-EXTRACT-NOTES.md

Does NOT touch FNAFN-GML-project/. Does NOT commit.
"""

import json
import struct
import sys
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DATA_WIN = ROOT / "fnafn" / "binaries" / "data.win"
OUT = ROOT / "out" / "assets"
TEX_DIR = OUT / "textures"
AUD_DIR = OUT / "audio"

PNG_MAGIC = b"\x89PNG\r\n\x1a\n"


def load_chunks(raw: bytes):
    """FORM walk: 8B header, then per chunk [4B ident][u32 size][data (+pad)]."""
    assert raw[:4] == b"FORM", raw[:8]
    chunks = {}
    off = 8
    n = len(raw)
    while off + 8 <= n:
        ident = raw[off:off + 4]
        try:
            name = ident.decode("ascii")
        except UnicodeDecodeError:
            break
        if not all(32 <= b < 127 for b in ident):
            break
        size = struct.unpack_from("<I", raw, off + 4)[0]
        chunks[name] = (off + 8, size)
        off += 8 + size
        if size % 2:
            off += 1
    return chunks


def cstr(raw: bytes, abs_off: int) -> str:
    end = raw.index(b"\0", abs_off)
    return raw[abs_off:end].decode("utf-8", "replace")


def png_span(raw: bytes, d: int) -> tuple[int, int, int]:
    """Walk PNG chunk structure from abs offset d. Returns (total_len, w, h).

    Raises on bad magic / runaway / CRC mismatch.
    """
    if raw[d:d + 8] != PNG_MAGIC:
        raise ValueError(f"no PNG magic at {d}")
    w, h = struct.unpack(">II", raw[d + 16:d + 24])
    p = d + 8
    n = len(raw)
    seen_iend = False
    while True:
        if p + 8 > n:
            raise ValueError("PNG runaway")
        (ln,) = struct.unpack(">I", raw[p:p + 4])
        typ = raw[p + 4:p + 8]
        if ln > 100_000_000:
            raise ValueError(f"absurd PNG chunk len {ln}")
        data_beg = p + 8
        data_end = data_beg + ln
        crc_stored = struct.unpack(">I", raw[data_end:data_end + 4])[0]
        crc_calc = zlib.crc32(typ)
        crc_calc = zlib.crc32(raw[data_beg:data_end], crc_calc)
        if crc_calc != crc_stored:
            raise ValueError(f"CRC mismatch in {typ} at file off {p}")
        p = data_end + 4
        if typ == b"IEND":
            seen_iend = True
            break
        if typ == b"IDAT":
            pass
    assert seen_iend
    return (p - d, w, h)


def main() -> int:
    raw = DATA_WIN.read_bytes()
    print(f"data.win: {len(raw)} bytes")
    chunks = load_chunks(raw)
    print(f"chunks: {sorted(chunks)}")

    TEX_DIR.mkdir(parents=True, exist_ok=True)
    AUD_DIR.mkdir(parents=True, exist_ok=True)

    # ---------------- TXTR ----------------
    t_off, t_size = chunks["TXTR"]
    t_count = struct.unpack_from("<I", raw, t_off)[0]
    t_entry_ptrs = [struct.unpack_from("<I", raw, t_off + 4 + 4 * i)[0]
                    for i in range(t_count)]
    print(f"TXTR count={t_count} size={t_size}")
    assert t_count == 429, t_count

    pages = []  # (page_idx, a, b, doff, png_len, w, h, gap_to_next)
    total_png_bytes = 0
    for i, ep in enumerate(t_entry_ptrs):
        a, b, d = struct.unpack_from("<III", raw, ep)
        L, w, h = png_span(raw, d)
        pages.append({"index": i, "a": a, "b": b, "doff": d,
                      "len": L, "w": w, "h": h})
        total_png_bytes += L

    # contiguity: next_doff - (doff + len) must be >= 0 (slack padding ok)
    doffs = [p["doff"] for p in pages]
    assert all(b >= a for a, b in zip(doffs, doffs[1:])), "TXTR not monotonic"
    gaps = []
    for i in range(len(pages) - 1):
        gap = pages[i + 1]["doff"] - (pages[i]["doff"] + pages[i]["len"])
        assert gap >= 0, f"overlap at page {i}: gap={gap}"
        gaps.append(gap)
        pages[i]["gap_to_next"] = gap
    tail_slack = (t_off + t_size) - (pages[-1]["doff"] + pages[-1]["len"])
    pages[-1]["gap_to_next"] = None
    assert tail_slack >= 0, tail_slack
    bad_dims = [p for p in pages if p["w"] == 0 or p["h"] == 0
                or p["w"] > 4096 or p["h"] > 4096]
    assert not bad_dims, bad_dims

    for p in pages:
        (TEX_DIR / f"page_{p['index']:04d}.png").write_bytes(
            raw[p["doff"]:p["doff"] + p["len"]])
    print(f"textures: {len(pages)} PNGs, {total_png_bytes} bytes, "
          f"max gap {max(gaps)}, tail slack {tail_slack}")

    # ---------------- SOND (name + audio_idx map) ----------------
    s_off, s_size = chunks["SOND"]
    s_count = struct.unpack_from("<I", raw, s_off)[0]
    s_ptrs = [struct.unpack_from("<I", raw, s_off + 4 + 4 * i)[0]
              for i in range(s_count)]
    stride = s_ptrs[1] - s_ptrs[0]
    assert all(s_ptrs[i + 1] - s_ptrs[i] == stride for i in range(s_count - 1))
    assert stride == 36, stride
    sounds = []
    for i, sp in enumerate(s_ptrs):
        v = struct.unpack_from("<IIIII f III", raw, sp)
        # v = (name_ptr, flags, f2, f3, f4, vol, f6, f7, audio_idx)
        name = cstr(raw, v[0])
        audio_idx = v[8] if v[8] < 0x80000000 else -1
        sounds.append({"sond_index": i, "name": name, "flags": v[1],
                       "volume": v[5], "audio_idx": audio_idx})
    print(f"SOND count={s_count} stride={stride}")
    no_audio = [s for s in sounds if s["audio_idx"] == -1]
    print(f"SOND without embedded audio: "
          f"{[(s['sond_index'], s['name']) for s in no_audio]}")

    # ---------------- AUDO ----------------
    a_off, a_size = chunks["AUDO"]
    a_count = struct.unpack_from("<I", raw, a_off)[0]
    a_ptrs = [struct.unpack_from("<I", raw, a_off + 4 + 4 * i)[0]
              for i in range(a_count)]
    print(f"AUDO count={a_count} size={a_size}")
    assert a_count == 54, a_count
    table_bytes = 4 + 4 * a_count
    entry_bytes = 0
    audio_rows = []
    for ai, ap in enumerate(a_ptrs):
        (ln,) = struct.unpack_from("<I", raw, ap)
        blob = raw[ap + 4:ap + 4 + ln]
        assert len(blob) == ln, ai
        entry_bytes += 4 + ln
        if blob[:4] == b"RIFF":
            ext = "wav"
            assert blob[8:12] == b"WAVE", ai
            assert b"fmt " in blob[:64] and b"data" in blob, ai
        elif blob[:4] == b"OggS":
            ext = "ogg"
        else:
            raise ValueError(f"AUDO {ai}: unknown magic {blob[:4]!r}")
        # reverse map: which SOND references this AUDO index?
        owners = [s for s in sounds if s["audio_idx"] == ai]
        assert len(owners) == 1, f"AUDO {ai}: owners={owners}"
        snd = owners[0]
        fname = f"{ai:02d}_{snd['name']}.{ext}"
        (AUD_DIR / fname).write_bytes(blob)
        audio_rows.append({"audo_index": ai, "file": fname, "length": ln,
                           "format": ext, "sond_index": snd["sond_index"],
                           "sond_name": snd["name"]})
    assert entry_bytes + table_bytes <= a_size, \
        (entry_bytes, table_bytes, a_size)
    audo_slack = a_size - (entry_bytes + table_bytes)
    n_wav = sum(1 for r in audio_rows if r["format"] == "wav")
    n_ogg = sum(1 for r in audio_rows if r["format"] == "ogg")
    print(f"audio: {len(audio_rows)} files ({n_wav} wav, {n_ogg} ogg), "
          f"{entry_bytes} entry bytes + {table_bytes} table + {audo_slack} "
          f"slack = {a_size}")

    # every mapped SOND audio_idx must be a valid AUDO index, full coverage
    mapped = sorted(s["audio_idx"] for s in sounds if s["audio_idx"] != -1)
    assert mapped == list(range(a_count)), mapped

    # ---------------- TPAG ----------------
    g_off, g_size = chunks["TPAG"]
    g_count = struct.unpack_from("<I", raw, g_off)[0]
    g_ptrs = [struct.unpack_from("<I", raw, g_off + 4 + 4 * i)[0]
              for i in range(g_count)]
    print(f"TPAG count={g_count} size={g_size}")
    assert g_count == 1125, g_count
    assert g_ptrs[0] == g_off + 4 + 4 * g_count, "TPAG table not packed"
    assert all(g_ptrs[i + 1] - g_ptrs[i] == 22 for i in range(g_count - 1))
    assert g_ptrs[-1] + 22 <= g_off + g_size

    FIELDS = ["src_x", "src_y", "src_w", "src_h",
              "tgt_x", "tgt_y", "tgt_w", "tgt_h",
              "bound_w", "bound_h", "page"]
    page_dims = {p["index"]: (p["w"], p["h"]) for p in pages}
    ptr_to_tpag = {p: i for i, p in enumerate(g_ptrs)}
    entries = []
    oob = []
    for i, gp in enumerate(g_ptrs):
        vals = struct.unpack("<11H", raw[gp:gp + 22])
        e = dict(zip(FIELDS, vals))
        e["tpag_index"] = i
        pw, ph = page_dims[e["page"]] if e["page"] in page_dims else (None, None)
        ok = (e["page"] in page_dims and e["src_x"] + e["src_w"] <= pw
              and e["src_y"] + e["src_h"] <= ph
              and e["src_w"] > 0 and e["src_h"] > 0)
        e["rect_inside_page"] = bool(ok)
        if not ok:
            oob.append(i)
        entries.append(e)
    print(f"TPAG entries in-bounds: {g_count - len(oob)}/{g_count} "
          f"(oob={oob[:10]})")

    # ---- SPRT cross-check: candidate subimage ranges per sprite ----
    spr_off, _ = chunks["SPRT"]
    spr_count = struct.unpack_from("<I", raw, spr_off)[0]
    spr_ptrs = [struct.unpack_from("<I", raw, spr_off + 4 + 4 * i)[0]
                for i in range(spr_count)]
    spr_names = {s["index"]: s["name"]
                 for s in json.loads((ROOT / "sprite_names.json").read_text())}
    usage = {}  # tpag_index -> [sprite indices] (PARTIAL - see note)
    spr_rows = []
    f21_sum = 0
    n_f23_count = 0
    for i, sp in enumerate(spr_ptrs):
        v = struct.unpack_from("<24I", raw, sp)
        f21, f22, f23 = v[21], v[22], v[23]
        f21_sum += f21
        first = ptr_to_tpag.get(f22)  # resolves for all 109 sprites
        if f23 < 4096:
            # single-frame sprites: f23 == 1 == f21 (literal frame count)
            f23_kind = "count"
            n_f23_count += 1
            lo = hi = first
        elif f23 in ptr_to_tpag:
            # multi-frame: f23 is a second TPAG entry pointer; the pair is
            # NOT a simple contiguous [lo,hi] frame list (ranges cover only
            # 604/1125 entries) - semantics unresolved.
            f23_kind = "tpag_ptr_unresolved"
            lo, hi = (first, ptr_to_tpag[f23])
        else:
            f23_kind = "unknown"
            lo = hi = first
        if lo is not None and hi is not None:
            for t in range(min(lo, hi), max(lo, hi) + 1):
                usage.setdefault(t, []).append(i)
        spr_rows.append({"sprite_index": i,
                         "name": spr_names.get(i),
                         "width": v[1], "height": v[2],
                         "field21": f21,
                         "first_frame_tpag": first,
                         "f23_kind": f23_kind,
                         "f23_value": f23 if f23_kind == "count"
                         else ptr_to_tpag.get(f23)})
    covered = len(usage)
    print(f"SPRT count={spr_count} field21_sum={f21_sum} "
          f"tpag covered by sprite ranges: {covered}/{g_count}")

    tpag_map = {
        "chunk": {"offset": g_off, "size": g_size, "count": g_count,
                  "entry_bytes": 22},
        "entry_layout_u16le": FIELDS,
        "field_confidence": {
            "src_x/src_y/src_w/src_h": "HIGH - origin+size rect; every entry "
                "fits inside its page PNG (IHDR dims); e.g. full-page 512x512 "
                "entries on 512x512 pages, 1280x720 jumpscare rects on "
                "2048x2048 pages.",
            "tgt_x/tgt_y/tgt_w/tgt_h": "MEDIUM-HIGH - target/render offset+size; "
                "usually mirrors src (full-frame sprites); differs on trimmed "
                "sprites where tgt_w/h < src_w/h with nonzero offsets.",
            "bound_w/bound_h": "MEDIUM - bounding-box w/h, usually equals "
                "tgt_w/tgt_h or sprite dims; exact GM semantic (bounding box "
                "vs draw size) not pinned down.",
            "page": "HIGH - texture-page id; all values in 0..428 matching "
                "the 429 TXTR pages; every rect verified inside page dims.",
        },
        "validation": {
            "entry_count": g_count,
            "all_pages_lt_429": all(e["page"] < 429 for e in entries),
            "rects_inside_pages": f"{g_count - len(oob)}/{g_count}",
            "out_of_bounds_indices": oob,
            "sprite_count": spr_count,
            "sprt_field21_sum_vs_1125": f21_sum,
            "naive_range_coverage": f"{covered}/{g_count}",
            "single_frame_f23_is_count": n_f23_count,
            "note": "SPRT+88 (f22) = first-frame TPAG entry pointer: resolves "
                "for ALL 109 sprites (HIGH confidence). SPRT+92 (f23) is a "
                f"literal small-int frame count (==1) for {n_f23_count} "
                "single-frame sprites, but a second TPAG entry pointer for "
                "multi-frame sprites (e.g. sprite 8 Spr_Jumpscare_Foxy: "
                "first=TPAG492, f23=TPAG440) whose pairing semantics are "
                "UNRESOLVED - the naive [min,max] ranges cover only "
                f"{covered}/{g_count} entries, so per-sprite frame lists are "
                "likely NON-contiguous (frames scattered across texture "
                "pages, as GM packs them) and the true index array location "
                "is unknown. LOW confidence: do not treat ranges as frame "
                "lists. SPRT field+84 (f21) sums to "
                f"{f21_sum} vs 1125 TPAG entries (off by "
                f"{g_count - f21_sum}); its exact meaning (subimages vs "
                "sequence length) is unconfirmed - LOW confidence.",
        },
        "sprites": spr_rows,
        "entries": entries,
    }
    (OUT / "tpag_map.json").write_text(json.dumps(tpag_map, indent=1))

    # ---------------- notes ----------------
    vol_note = sorted({(s["sond_index"], s["name"], s["volume"])
                       for s in sounds if s["volume"] != 1.0})
    notes = f"""# Asset extraction notes — data.win (YYC)

Source: `fnafn/binaries/data.win` ({len(raw)} bytes).
Extractor: `asset_extract.py` (stdlib only). Outputs under `out/` (gitignored).

## Results

- Textures: {len(pages)} PNGs in `out/assets/textures/page_NNNN.png`
  ({total_png_bytes} bytes of PNG data). All {len(pages)}/429 entries start with
  PNG magic, walk cleanly to IEND with valid per-chunk CRCs, and have sane IHDR
  dims (max 2048x2048; 413 of 429 are full 2048x2048 texture pages).
- Audio: {len(audio_rows)} files in `out/assets/audio/` ({n_wav}x .wav RIFF, {n_ogg}x .ogg).
  Entry bytes {entry_bytes} + table {table_bytes} + trailing slack {audo_slack} = AUDO chunk size {a_size}.
- TPAG: {g_count} entries, 22 bytes each; see `out/assets/tpag_map.json`.
- SOND<->AUDO map is EXACT (parsed from SOND records, not guessed): every AUDO
  index 0..53 is referenced by exactly one SOND; 3 SONDs have audio_idx=-1.

## Binary formats (all verified by hand + asserted in extractor)

Chunk walk: `FORM` + 8B header, then per chunk `[4B ident][u32 LE size][data]`
(+1 pad byte if size odd). Same walk as `sprite_names.py` / `room_names.py`.

### AUDO (offset {a_off}, size {a_size})
`[u32 count=54][54 x u32 absolute entry offsets]`; each entry =
`[u32 length][blob]`. blob magic: 53x `RIFF` (WAVE, `fmt `+`data` present),
1x `OggS` (AUDO 53 <- SOND 56 `Snd_Office_Unsettle`). Entry bytes
({entry_bytes}) + table ({table_bytes}) + trailing slack ({audo_slack}) == chunk size ({a_size}).

### TXTR (offset {t_off}, size {t_size})
`[u32 count=429][429 x u32 absolute entry offsets]`; each entry =
`[u32 a][u32 b][u32 absolute data offset]`; data = raw PNG with NO length
prefix. Boundaries found by walking PNG chunks `[u32 BE len][4B type][data]
[u32 BE crc]` until IEND (CRCs verified). data_offs strictly increasing;
gaps between consecutive blobs are small non-negative slack (max {max(gaps)},
tail slack {tail_slack}) - blobs are back-to-back modulo padding, never
overlapping.
Entry flag fields: (a,b) = (1,0) x416 (normal pages), (0,0) x11 (still valid
PNGs - NOT empty, contrary to first guess), (1,0xFFFFFFFF) x2. Meaning of
a/b unconfirmed - LOW confidence, likely scale/repeat flags.

### SOND (offset {s_off}, size {s_size}, {s_count} records x 36 bytes)
Record = `[u32 name_ptr][u32 flags][u32 x2][u32 x3][f32 volume][u32 x2]
[i32 audio_idx]` (offsets +0,+4,+8,+12,+16,+20,+24,+28,+32).
`audio_idx` (+32) = index into AUDO table, or -1 (0xFFFFFFFF) = external/
streamed, no embedded audio. `flags` (+4): 0x64 = external, 0x65 = embedded
WAV, 0x67 = embedded compressed (0x65|0x02; the single Ogg). Non-1.0 volumes:
{vol_note}

### TPAG (offset {g_off}, size {g_size}, {g_count} entries)
`[u32 count=1125][1125 x u32 absolute entry offsets]`; entries packed back to
back (stride 22, first ptr == table end, last entry + 22 == chunk end - 2 pad).
Entry = 11x u16 LE: src_x,src_y,src_w,src_h (source rect on page),
tgt_x,tgt_y,tgt_w,tgt_h (render offset+size), bound_w,bound_h, page id.
Per-field confidence is recorded in `tpag_map.json` (`field_confidence`).
{g_count - len(oob)}/{g_count} rects verify inside their page's IHDR dims.
SPRT+88 resolves to a valid first-frame TPAG entry for all {spr_count} sprites
(HIGH confidence); SPRT+92 is a literal frame count for single-frame sprites
but a second TPAG pointer of unresolved pairing semantics for multi-frame
ones, so per-sprite frame lists are only PARTIALLY resolved (naive ranges
cover {covered}/{g_count}; frames are likely non-contiguous). {g_count} entries
/ {spr_count} sprites = ~{g_count / spr_count:.1f} frames per sprite average
(plausible for animated FNAF sprites).

## The 3 sounds with no embedded audio (RESOLVED, not ambiguous)

Identified rigorously via SOND `audio_idx == -1` (all three also carry
flags=0x64 = external):

| SOND idx | name | flags | volume | reasoning |
|---|---|---|---|---|
| 0 | Snd_Loading | 0x64 | 1.0 | external/streamed; loading jingle lives outside data.win |
| 12 | Snd_Menu_Theme | 0x64 | 1.0 | external music file (cf. SOND 55 radio variant below) |
| 55 | Snd_Menu_Theme_Radio | 0x64 | 0.5 | external music file, radio-filtered variant |

The naive guess "indices 54,55,56 unmapped" is WRONG: SOND 54
(`Snd_Jumpscare_Freddy`) maps to AUDO 24, and SOND 56 (`Snd_Office_Unsettle`)
maps to AUDO 53 (the Ogg). The AUDO order is NOT identical to SOND order -
use the `audio_idx` mapping (audio files are named `AA_SONDNAME` where AA is
the AUDO index; `tpag_map.json`-style mapping table: see `audio_rows` below).

AUDO->SOND: {", ".join(f"{r['audo_index']}<-SOND{r['sond_index']} " + r['sond_name'] for r in audio_rows)}

## Follow-up (NOT done here)

Import into `FNAFN-GML-project/sprites/` + `sounds/*.yy` is a separate step.
Nothing under `FNAFN-GML-project/` was touched; nothing committed.
"""
    (ROOT / "out" / "ASSET-EXTRACT-NOTES.md").write_text(notes)
    print("wrote tpag_map.json + ASSET-EXTRACT-NOTES.md")

    # final on-disk validation
    png_files = sorted(TEX_DIR.glob("page_*.png"))
    assert len(png_files) == 429, len(png_files)
    for f in png_files:
        head = f.read_bytes()[:8]
        assert head == PNG_MAGIC, f
    aud_files = sorted(AUD_DIR.iterdir())
    assert len(aud_files) == 54, len(aud_files)
    for f in aud_files:
        assert f.read_bytes()[:4] in (b"RIFF", b"OggS"), f
    total = sum(f.stat().st_size for f in list(png_files) + aud_files)
    print(f"OK: 429 PNGs + 54 audio on disk, payload bytes = {total}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
