#!/usr/bin/env python3
"""Step 2 of wiring: fill room .yy instance tables from data.win ROOM chunk.

Parses the ROOM chunk of fnafn/binaries/data.win (YYC build, no CODE chunk)
and populates the "Instances" GMRInstanceLayer + instanceCreationOrderIds
in each of the 9 FNAFN-GML-project/rooms/<Rm>/<Rm>.yy files.

Reverse-engineered layout (validated across all 9 rooms, see notes below):

  ROOM chunk: u32 count, then count x u32 absolute file offsets (room table).
  Room entry header (u32 indices):
    [0] name ptr (absolute offset of NUL-terminated name in STRG region)
    [1] 0 (caption/creation-code placeholder)
    [2] width, [3] height
    [4..7] 0
    [8] room creation-code ref (-1 or small id; unresolvable, YYC has no CODE)
    [9] flags (0x3000x)
    [10] backgrounds table ptr (count=0 in all 9 rooms)
    [11] views table ptr (count=8 in all 9 rooms)
    [12] instances table ptr (u32 n, then n x u32 absolute entry offsets)
    [13] tiles table ptr (count=0 in all 9 rooms)

  Instance entry: 12 x u32/i32/f32 = 48 bytes, stride verified 48 in every
  room with n>1. Fields (by i32 index / float view):
    [0] x (i32; -32/-18 occur: deliberate off-screen placements)
    [1] y (i32)
    [2] object index (0..76, indexes OBJT chunk = obj_names.json keys)
    [3] instance id (100000..100086 globally unique, except 100081 missing:
        presumably deleted in the original project)
    [4] creation-code ref (-1, or 56..69 / room-level 61,64,66,71,72.
        NOT a STRG index (those slots hold sound names); unresolvable in a
        YYC build, so .yy keeps hasCreationCode=false and the raw value is
        only reported on stdout)
    [5] scaleX (float; 1.0, 1.025, 0.94457727, 0.95, 1.055 observed)
    [6] scaleY (float; same set)
    [7] 1.0 for all 86 instances -> mapped to imageSpeed (GMS2 default 1.0)
    [8] imageIndex: PROVEN by pattern - the 10 Obj_Night_Camera_Icons in
        Rm_Office carry 1..10 (first carries 0), vent icons 1..4, radio
        buttons 2..3, custom-night images 0..4. Each icon = one subimage.
    [9] -1 always, [10] 0 always (colour/rotation slots, defaults in .yy)
    [11] -1 always except ONE instance (Rm_Loading/Obj_Menu_Loading = 68);
        unknown, kept at default, reported on stdout.

Idempotent: instance GUIDs are deterministic uuid5(room, instance-id), so
re-runs produce byte-identical files. Only the 9 room .yy files are touched
(gen_yy_wiring.py step 4 must NOT be run - it would overwrite the rooms).
"""

import json
import struct
import uuid
from pathlib import Path

BASE = Path(__file__).resolve().parent
DATA = BASE / "fnafn" / "binaries" / "data.win"
PROJ = BASE / "FNAFN-GML-project"

# Off-screen margin tolerated by validation (real placements: x=-32, y=-18).
MARGIN = 64


def load_chunks(raw: bytes) -> dict:
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


def cstr(raw: bytes, abs_off: int) -> str:
    end = raw.index(b"\0", abs_off)
    return raw[abs_off:end].decode("utf-8", "replace")


def parse_rooms(raw: bytes):
    chunks = load_chunks(raw)
    r_off, _ = chunks["ROOM"]
    n = struct.unpack_from("<I", raw, r_off)[0]
    rooms = []
    for i in range(n):
        rp = struct.unpack_from("<I", raw, r_off + 4 + 4 * i)[0]
        hdr = struct.unpack_from("<14I", raw, rp)
        hdr_s = struct.unpack_from("<14i", raw, rp)
        name = cstr(raw, hdr[0])
        inst_tbl = hdr[12]
        ni = struct.unpack_from("<I", raw, inst_tbl)[0]
        insts = []
        for j in range(ni):
            ep = struct.unpack_from("<I", raw, inst_tbl + 4 + 4 * j)[0]
            h = struct.unpack_from("<5i", raw, ep)
            f = struct.unpack_from("<3f", raw, ep + 20)
            t = struct.unpack_from("<4i", raw, ep + 32)
            insts.append({
                "x": h[0], "y": h[1], "obj": h[2], "iid": h[3],
                "code": h[4], "sx": f[0], "sy": f[1], "spd": f[2],
                "img": t[0], "u9": t[1], "u10": t[2], "u11": t[3],
            })
        rooms.append({
            "index": i, "name": name,
            "width": hdr_s[2], "height": hdr_s[3],
            "room_code": hdr_s[8],
            "bg_n": struct.unpack_from("<I", raw, hdr[10])[0],
            "view_n": struct.unpack_from("<I", raw, hdr[11])[0],
            "tile_n": struct.unpack_from("<I", raw, hdr[13])[0],
            "instances": insts,
        })
    return rooms


def make_instance(room: str, inst: dict, obj_name: str) -> dict:
    iid = inst["iid"]
    iname = "inst_%08X" % iid  # data.win id as 8 uppercase hex (GMS2 style)
    guid = str(uuid.uuid5(uuid.NAMESPACE_URL, "FNAFN/%s/%d" % (room, iid)))
    return {
        "resourceType": "GMRInstance",
        "resourceVersion": "2.0",
        "name": iname,
        "id": guid,
        "objectId": {
            "name": obj_name,
            "path": "objects/%s/%s.yy" % (obj_name, obj_name),
        },
        "inheritCode": False,
        "hasCreationCode": False,
        "colour": 4294967295,
        "rotation": 0.0,
        "scaleX": inst["sx"],
        "scaleY": inst["sy"],
        "imageIndex": inst["img"],
        "imageSpeed": inst["spd"],
        "inherited": False,
        "frozen": False,
        "ignore": False,
        "inheritItemSettings": False,
        "x": inst["x"],
        "y": inst["y"],
    }


def main() -> int:
    raw = DATA.read_bytes()
    obj_names = json.loads((BASE / "obj_names.json").read_text())
    known_objs = set(obj_names.values())
    meta = json.loads((BASE / "room_names.json").read_text())
    meta_by_name = {r["name"]: r for r in meta}

    rooms = parse_rooms(raw)
    assert len(rooms) == 9, "expected 9 rooms, got %d" % len(rooms)

    # Cross-check against room_names.json.
    for r in rooms:
        assert r["name"] in meta_by_name, "room %r not in room_names.json" % r["name"]
        m = meta_by_name[r["name"]]
        assert (r["width"], r["height"]) == (m["width"], m["height"]), r["name"]
        assert r["index"] == m["index"], r["name"]

    all_guids: set = set()
    report = []
    for r in rooms:
        name = r["name"]
        entries = []
        order = []
        for inst in r["instances"]:
            key = str(inst["obj"])
            assert key in obj_names, "%s: obj index %d unresolved" % (name, inst["obj"])
            obj = obj_names[key]
            e = make_instance(name, inst, obj)
            assert e["id"] not in all_guids, "guid collision %s" % e["id"]
            all_guids.add(e["id"])
            entries.append(e)
            order.append({"name": e["name"],
                          "path": "rooms/%s/%s.yy" % (name, name)})
        # Bounds check (margin allows deliberate off-screen placements).
        for inst in r["instances"]:
            assert -MARGIN <= inst["x"] <= r["width"] + MARGIN, (name, inst)
            assert -MARGIN <= inst["y"] <= r["height"] + MARGIN, (name, inst)

        yy_path = PROJ / "rooms" / name / (name + ".yy")
        yy = json.loads(yy_path.read_text(encoding="utf-8"))
        assert yy["name"] == name
        layers = [l for l in yy["layers"]
                  if l.get("resourceType") == "GMRInstanceLayer"
                  and l.get("name") == "Instances"]
        assert len(layers) == 1, "%s: Instances layer missing/ambiguous" % name
        layers[0]["instances"] = entries
        yy["instanceCreationOrderIds"] = order
        yy_path.write_text(json.dumps(yy, indent=2) + "\n", encoding="utf-8")
        report.append((name, entries))

    # ---- validation: re-parse all 9 from disk ----
    seen = set()
    parsed_counts = {r["name"]: len(r["instances"]) for r in rooms}
    for name, _ in report:
        yy = json.loads(
            (PROJ / "rooms" / name / (name + ".yy")).read_text(encoding="utf-8"))
        il = [l for l in yy["layers"]
              if l.get("resourceType") == "GMRInstanceLayer"][0]["instances"]
        assert len(il) == parsed_counts[name], (name, len(il))
        for e in il:
            assert e["objectId"]["name"] in known_objs, e
            assert e["id"] not in seen
            seen.add(e["id"])
        assert len(yy["instanceCreationOrderIds"]) == len(il)

    # ---- stdout report ----
    print("room instances filled:")
    total = 0
    for r in rooms:
        name = r["name"]
        n = len(r["instances"])
        total += n
        print("  %s: %d instance(s)  [bg=%d views=%d tiles=%d room_code=%d]"
              % (name, n, r["bg_n"], r["view_n"], r["tile_n"], r["room_code"]))
        if n == 0:
            print("    SUSPICIOUS: zero instances")
        for inst in r["instances"]:
            print("    x=%5d y=%5d obj=%2d %-28s id=%d img=%d sx=%s sy=%s "
                  "code=%d u11=%d" % (
                      inst["x"], inst["y"], inst["obj"],
                      obj_names[str(inst["obj"])], inst["iid"], inst["img"],
                      repr(inst["sx"]), repr(inst["sy"]),
                      inst["code"], inst["u11"]))
    print("total instances: %d, unique guids: %d" % (total, len(all_guids)))
    print("VALIDATION OK (9 rooms parse, all objects resolve, bounds OK)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
