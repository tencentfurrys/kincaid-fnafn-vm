#!/usr/bin/env python3
"""Parse data.win's OBJT chunk -> per-object event (type, subtype) lists.

Ground truth for event wiring: the YYC exe only keeps symbol names
(gml_Object_X_Step_1), but data.win's OBJT chunk lists every event the
original game registered, as (eventType, eventSubtype) pairs.

GM data.win format (FORM container; this 2026 build uses LE u32 sizes
and pads chunk sizes to even):
  OBJT chunk = list of object-entry pointers
  object entry: ..., int32 ptr-to-event-table
  event table: for each event type index (0..N-1), int32 pointer (0 = none)
  subevent list: int32 count, then count entries of
    int32 subtype, int32 code/action pointer (dead in YYC builds)
"""
import json
import struct
import sys
from pathlib import Path

DATA = Path("fnafn/binaries/data.win")
OUT = Path("objt_events.json")

N_EVENT_TYPES = 12  # create..keyrelease (GM <= 2022 layout); extras ignored


def walk_chunks(raw):
    chunks = {}
    off = 8
    while off + 8 <= len(raw):
        ident = raw[off:off + 4]
        size = struct.unpack_from("<I", raw, off + 4)[0]
        if not all(32 <= b < 127 for b in ident):
            break
        chunks[ident.decode()] = (off + 8, size)
        off += 8 + size
        if size % 2:
            off += 1
    return chunks


def u32(raw, off):
    return struct.unpack_from("<I", raw, off)[0]


def main() -> None:
    buf = DATA.read_bytes()
    chunks = walk_chunks(buf)

    if "OBJT" not in chunks:
        sys.exit("no OBJT chunk found (have: %s)" % sorted(chunks))
    start, size = chunks["OBJT"]
    count = u32(buf, start)
    ptrs = [u32(buf, start + 4 + 4 * i) for i in range(count)]
    print(f"OBJT: {count} objects")

    # obj_names.json has the index -> name mapping; reuse it.
    names = {}
    if OUT.exists() is False and Path("obj_names.json").exists():
        names = json.loads(Path("obj_names.json").read_text())

    result = {}
    for idx, p in enumerate(ptrs):
        name_ptr = struct.unpack(">I", buf[p:p + 4])[0]
        # name: STRG-style pointer (u32 len + bytes) resolved later via STRG
        # event table pointer: at offset p + 0x30 (after sprite/visible/solid/
        # depth/persistent/parent/mask + physics block). Find it by scanning:
        # the event table is the only pointer that lands in a list-of-lists.
        # Known layout (UMT UndertaleGameObject): 24-byte header fields then
        # physics sprite/... -- event ptr at p+0x2C in GM2022+? Scan offsets.
        ev_table = None
        for off in range(0x20, 0x60, 4):
            cand = u32(buf, p + off)
            if start < cand < start + size:
                n_types = (start + size - cand) // 4
                if n_types >= 12:
                    ev_table = cand
                    break
        if ev_table is None:
            result[str(idx)] = {"name_ptr": name_ptr, "events": []}
            continue
        events = []
        for etype in range(N_EVENT_TYPES):
            sub_ptr = u32(buf, ev_table + 4 * etype)
            if sub_ptr == 0 or not (start < sub_ptr < start + size):
                continue
            n_sub = u32(buf, sub_ptr)
            for s in range(n_sub):
                base = sub_ptr + 4 + 8 * s
                if base + 8 > len(buf):
                    break
                subtype, code = struct.unpack_from("<II", buf, base)
                events.append([etype, subtype])
        result[str(idx)] = {"name_ptr": name_ptr, "events": events}

    # resolve names from STRG chunk (name_ptr points into STRG string area
    # as (len, bytes) entries -- GM stores a pointer to the u32 length).
    try:
        s_start, s_size = chunks["STRG"]
        for idx, rec in result.items():
            np = rec["name_ptr"]
            if 0 < np < s_start + s_size:
                ln = u32(buf, np)
                if 0 < ln < 256:
                    rec["name"] = buf[np + 4:np + 4 + ln].decode("latin1")
    except KeyError:
        pass

    OUT.write_text(json.dumps(result, indent=1))
    # summary: distinct (type, subtype) pairs across all objects
    pairs = {}
    for rec in result.values():
        for et, sub in rec["events"]:
            pairs[(et, sub)] = pairs.get((et, sub), 0) + 1
    for (et, sub), n in sorted(pairs.items()):
        print(f"type={et:2d} subtype={sub:3d}  objects={n}")


if __name__ == "__main__":
    main()
