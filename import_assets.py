#!/usr/bin/env python3
"""Import REAL sprites + audio into FNAFN-GML-project (replaces placeholders).

Reads fnafn/binaries/data.win directly (no re-extraction of out/ needed,
but cross-checks against out/assets/tpag_map.json) and:
  - sprites/<Name>/: crops all frames from out/assets/textures/page_NNNN.png
    per TPAG rects, writes multi-frame 2026-schema .yy + frame PNGs.
  - sounds/<Name>/: copies extracted WAV bytes (ogg decoded via ffmpeg),
    updates .yy duration/sampleRate/volume, keeps silent placeholders only
    for the 3 external/streamed sounds.

FRAME LINKAGE (RESOLVED, HIGH confidence - supersedes the SPRT+88 caveat in
out/ASSET-EXTRACT-NOTES.md):
  Each SPRT record is 24 x u32: f1=width, f2=height, f3..f6=bbox as
  (left, right, bottom, top), f10=bboxMode (0=auto, 2=manual on
  Fon_Sprite_Font_1), f12/f13=xorigin/yorigin, f17=playback speed float
  (1.0/2.0/15.0/30.0; 0.0 = default, treated as 30.0 like the scaffold),
  f21=frame count, followed INLINE at +88 by f21 x u32 TPAG-entry pointers
  (NOT a [first,second] range: the old "f23 second pointer" reading was just
  frame[1]). Verified: all 1124 words resolve to TPAG entries, each TPAG
  index used exactly once, TPAG 242 unused. Sum(f21) = 1124 vs 1125 TPAGs.
  Frame ORDER = inline array order (matches UndertaleModTool subimage order).

FRAME RECONSTRUCTION: canvas = sprite (w,h), transparent; paste src crop at
  (tgt_x,tgt_y). Verified over all 1124 frames: src_w==tgt_w, src_h==tgt_h
  and every tgt rect fits inside (w,h), so no scaling/clipping is needed.
  bbox mapping: left=f3, top=f6, right=f4, bottom=f5, clamped to the frame.
  Origin: preset 0-8 when (x,y) exactly matches an anchor, else 9=Custom.

Re-run safe: writes .imported_real sentinels; gen_yy_wiring wire_* skip
sentinel dirs; format_2026 conv_sprite preserves multi-frame input.
Does NOT touch any .gml. Does NOT commit.
"""

import json
import shutil
import struct
import subprocess
import sys
import uuid
from pathlib import Path

from PIL import Image

BASE = Path(__file__).resolve().parent
PROJ = BASE / "FNAFN-GML-project"
DATA_WIN = BASE / "fnafn" / "binaries" / "data.win"
TEX_DIR = BASE / "out" / "assets" / "textures"
AUD_DIR = BASE / "out" / "assets" / "audio"
FFMPEG = (Path(r"C:\ProgramData\GameMakerStudio2-LTS2026\Cache\runtimes"
               r"\runtime-2026.0.0.23\bin\ffmpeg\windows") / "ffmpeg.exe")

import format_2026  # noqa: E402  (repo-local 2026 schema authority)


def load_chunks(raw: bytes) -> dict:
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


def read_sprites(raw, chunks):
    spr_off, _ = chunks["SPRT"]
    n = struct.unpack_from("<I", raw, spr_off)[0]
    ptrs = [struct.unpack_from("<I", raw, spr_off + 4 + 4 * i)[0]
            for i in range(n)]
    g_off, _ = chunks["TPAG"]
    gn = struct.unpack_from("<I", raw, g_off)[0]
    gptrs = [struct.unpack_from("<I", raw, g_off + 4 + 4 * i)[0]
             for i in range(gn)]
    p2i = {p: i for i, p in enumerate(gptrs)}
    names = {s["index"]: s["name"]
             for s in json.loads((BASE / "sprite_names.json").read_text())}
    out = []
    for i, sp in enumerate(ptrs):
        v = struct.unpack_from("<24I", raw, sp)
        f = struct.unpack_from("<f", struct.pack("<I", v[17]))[0]
        nframes = v[21]
        arr = struct.unpack_from("<%dI" % nframes, raw, sp + 88)
        frames = []
        for a in arr:
            assert a in p2i, (names[i], hex(a))
            e = struct.unpack("<11H", raw[a:a + 22])
            frames.append({
                "src_x": e[0], "src_y": e[1], "src_w": e[2], "src_h": e[3],
                "tgt_x": e[4], "tgt_y": e[5], "tgt_w": e[6], "tgt_h": e[7],
                "bound_w": e[8], "bound_h": e[9], "page": e[10],
                "tpag_index": p2i[a],
            })
        out.append({
            "index": i, "name": names[i], "width": v[1], "height": v[2],
            "bbox": (v[3], v[6], v[4], v[5]),  # (left, top, right, bottom)
            "bboxMode": v[10], "xorigin": v[12], "yorigin": v[13],
            "speed": f, "frames": frames,
        })
    return out


def read_sond_volumes(raw, chunks):
    s_off, _ = chunks["SOND"]
    n = struct.unpack_from("<I", raw, s_off)[0]
    ptrs = [struct.unpack_from("<I", raw, s_off + 4 + 4 * i)[0]
            for i in range(n)]
    vols = {}
    names = {s["index"]: s["name"]
             for s in json.loads((BASE / "sound_names.json").read_text())}
    for i, sp in enumerate(ptrs):
        (vol,) = struct.unpack_from("<f", raw, sp + 20)
        (aidx,) = struct.unpack_from("<i", raw, sp + 32)
        vols[names[i]] = (vol, aidx)
    return vols


def origin_preset(w, h, x, y):
    anchors = [(0, 0), (w / 2, 0), (w, 0),
               (0, h / 2), (w / 2, h / 2), (w, h / 2),
               (0, h), (w / 2, h), (w, h)]
    for idx, (ax, ay) in enumerate(anchors):
        if x == ax and y == ay:
            return idx
    return 9  # Custom


def import_sprites(sprites) -> dict:
    by_page = {}
    for s in sprites:
        for fi, fr in enumerate(s["frames"]):
            by_page.setdefault(fr["page"], []).append((s, fi, fr))
    page_cache = {}
    total = 0
    per_sprite = {}
    for name in sorted(s["name"] for s in sprites):
        s = next(x for x in sprites if x["name"] == name)
        w, h = s["width"], s["height"]
        d = PROJ / "sprites" / name
        d.mkdir(parents=True, exist_ok=True)
        for stale in d.glob("*.png"):
            stale.unlink()
        if (d / "layers").exists():
            shutil.rmtree(d / "layers")
        fids = [str(uuid.uuid5(uuid.NAMESPACE_URL,
                               "FNAFN/sprite-frame/%s/%d" % (name, i)))
                for i in range(len(s["frames"]))]
        lid = str(uuid.uuid5(uuid.NAMESPACE_URL,
                             "FNAFN/sprite-layer/%s" % name))
        for i, fr in enumerate(s["frames"]):
            pg = fr["page"]
            if pg not in page_cache:
                page_cache[pg] = Image.open(TEX_DIR / ("page_%04d.png" % pg))
                # evict oldest to bound memory (keep <= 8 open pages)
                while len(page_cache) > 8:
                    old = next(iter(page_cache))
                    if old == pg:
                        break
                    page_cache.pop(old).close()
            crop = page_cache[pg].crop(
                (fr["src_x"], fr["src_y"],
                 fr["src_x"] + fr["src_w"], fr["src_y"] + fr["src_h"]))
            if crop.mode != "RGBA":
                crop = crop.convert("RGBA")
            assert (fr["src_w"], fr["src_h"]) == (fr["tgt_w"], fr["tgt_h"])
            assert fr["tgt_x"] + fr["tgt_w"] <= w
            assert fr["tgt_y"] + fr["tgt_h"] <= h
            canvas = Image.new("RGBA", (w, h), (0, 0, 0, 0))
            canvas.paste(crop, (fr["tgt_x"], fr["tgt_y"]), crop)
            png = d / (fids[i] + ".png")
            canvas.save(png, optimize=True)
            lay = d / "layers" / fids[i]
            lay.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(png, lay / (lid + ".png"))
        left, top, right, bottom = s["bbox"]
        left = min(max(left, 0), w - 1)
        right = min(max(right, 0), w - 1)
        top = min(max(top, 0), h - 1)
        bottom = min(max(bottom, 0), h - 1)
        speed = s["speed"] if s["speed"] != 0.0 else 30.0
        seed = {
            "name": name, "width": w, "height": h,
            "bbox_left": left, "bbox_top": top,
            "bbox_right": right, "bbox_bottom": bottom,
            "bboxMode": s["bboxMode"],
            "origin": origin_preset(w, h, s["xorigin"], s["yorigin"]),
            "frames": [{"name": f} for f in fids],
            "layers": [{"name": lid}],
            "sequence": {
                "xorigin": s["xorigin"], "yorigin": s["yorigin"],
                "playbackSpeed": speed,
            },
        }
        yy = format_2026.conv_sprite(
            seed, name, "sprites/%s/%s.yy" % (name, name))
        format_2026.save_yy(d / (name + ".yy"), yy)
        format_2026.fix_sprite_files(d, name, fids, lid)
        (d / ".imported_real").write_text(
            "real art: %d frames, TPAG [%s]\n" % (
                len(s["frames"]),
                ",".join(str(fr["tpag_index"]) for fr in s["frames"])))
        per_sprite[name] = len(s["frames"])
        total += len(s["frames"])
    for im in page_cache.values():
        im.close()
    return {"total_frames": total, "per_sprite": per_sprite}


def wav_info(path: Path):
    raw = path.read_bytes()
    head = raw[:64]
    assert head[:4] == b"RIFF" and head[8:12] == b"WAVE", path
    (aufmt, ch, rate, brate, _al, bits) = struct.unpack("<HHIIHH", head[20:36])
    assert aufmt == 1, (path, aufmt)  # PCM
    # find data chunk size
    off = 12
    data_len = None
    while off + 8 <= len(raw):
        cid = raw[off:off + 4]
        (clen,) = struct.unpack("<I", raw[off + 4:off + 8])
        if cid == b"data":
            data_len = clen
            break
        off += 8 + clen + (clen % 2)
    assert data_len is not None, path
    assert len(raw) >= 44
    return {"channels": ch, "sampleRate": rate, "bits": bits,
            "byteRate": brate, "duration": data_len / brate}


def import_sounds(vols) -> dict:
    srcs = {}
    for p in sorted(AUD_DIR.iterdir()):
        if p.suffix.lower() in (".wav", ".ogg"):
            # AA_SONDNAME.ext, AA = AUDO index
            srcs.setdefault(p.stem.split("_", 1)[1], p)
    swapped = {}
    for s in json.loads((BASE / "sound_names.json").read_text()):
        name = s["name"]
        d = PROJ / "sounds" / name
        yy_path = d / (name + ".yy")
        data = json.loads(yy_path.read_text(encoding="utf-8"))
        src = srcs.get(name)
        if src is None:
            # external/streamed: keep silent placeholder, record why
            assert vols[name][1] == -1, (name, vols[name])
            data["volume"] = vols[name][0]
            format_2026.save_yy(yy_path, format_2026.conv_sound(data))
            (d / ".imported_real").write_text(
                "external/streamed (SOND audio_idx=-1): silence kept\n")
            swapped[name] = 0
            continue
        dst = d / (name + ".wav")
        for stale in d.glob("*.wav"):
            if stale != dst:
                stale.unlink()
        for stale in d.glob("*.ogg"):
            stale.unlink()
        if src.suffix.lower() == ".ogg":
            r = subprocess.run(
                [str(FFMPEG), "-y", "-v", "error", "-i", str(src),
                 "-c:a", "pcm_s16le", str(dst)],
                capture_output=True, text=True)
            assert r.returncode == 0, r.stderr
        else:
            shutil.copyfile(src, dst)
        info = wav_info(dst)
        data["soundFile"] = name + ".wav"
        data["duration"] = info["duration"]
        data["sampleRate"] = info["sampleRate"]
        data["volume"] = vols[name][0]
        format_2026.save_yy(yy_path, format_2026.conv_sound(data))
        (d / ".imported_real").write_text(
            "real audio from %s (%d bytes)\n" % (src.name,
                                                 dst.stat().st_size))
        swapped[name] = dst.stat().st_size
    return swapped


def main() -> int:
    raw = DATA_WIN.read_bytes()
    chunks = load_chunks(raw)
    sprites = read_sprites(raw, chunks)
    vols = read_sond_volumes(raw, chunks)
    # cross-check against extractor map
    tmap = json.loads((BASE / "out" / "assets" / "tpag_map.json").read_text())
    assert len(tmap["entries"]) == 1125
    assert len(sprites) == 109 == len(tmap["sprites"])
    used = {fr["tpag_index"] for s in sprites for fr in s["frames"]}
    assert len(used) == sum(len(s["frames"]) for s in sprites)
    print("sprites: %d, frames: %d, unique TPAG: %d, uncovered: %s" % (
        len(sprites), sum(len(s["frames"]) for s in sprites), len(used),
        sorted(set(range(1125)) - used)))
    sr = import_sprites(sprites)
    print("sprite frames written: %d" % sr["total_frames"])
    sw = import_sounds(vols)
    real = {k: v for k, v in sw.items() if v > 0}
    print("sounds swapped: %d (%d bytes), externals kept silent: %d" % (
        len(real), sum(real.values()), len(sw) - len(real)))
    print("IMPORT OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
