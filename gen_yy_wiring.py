#!/usr/bin/env python3
"""Wire FNAFN-GML-project into a GameMaker-openable project.

Reads objects/*/ (*.gml), scripts/ported/*.gml + scripts/todo/*.gml,
room_names.json, sprite_names.json, obj_names.json and generates:
  - objects/<Obj>/<Obj>.yy          (GMObject, eventList from filenames)
  - scripts/<Script>.yy             (GMScript sibling stub; see note below)
  - rooms/<Rm>/<Rm>.yy + RoomCreationCode.gml
  - rewritten FNAFN.yyp resources[] with fresh UUIDs
  - git rm of tmp_dump_consts.py + tmp_read_dbl.py (subagent junk)
  - BUILD-DATA.md (game-data build steps)

Idempotent: safe to re-run; existing .yy files are overwritten.

Script-layout note: GMS2 pairs <name>.yy with <name>.gml in the SAME
folder, but our .gml files live flat in scripts/ported/ + scripts/todo/
(moving them would break the porting workflow), so the generated
scripts/<Script>.yy stubs sit in scripts/ root as valid GMscript JSON
(yyp parses; IDE shows empty body until the real .gml is imported via
drag-drop / copy-over). See BUILD-DATA.md step 2.
"""

import json
import re
import subprocess
import sys
import uuid
from pathlib import Path

BASE = Path(__file__).resolve().parent
PROJ = BASE / "FNAFN-GML-project"
OBJ_DIR = PROJ / "objects"
SCR_DIR = PROJ / "scripts"
YYP = PROJ / "FNAFN.yyp"

# GM event-type numbers (GMS2): 0=Create 1=Destroy 2=Alarm 3=Step
# 4=Collision 5=Keyboard 6=Mouse 7=Other 8=Draw 9=KeyPress
# 10=KeyRelease 12=CleanUp 14=PreCreate (GM 2022+ pre-creation).
EVENT_BASE = {
    "PreCreate": 14,
    "Create": 0,
    "Destroy": 1,
    "Alarm": 2,
    "Step": 3,
    "Collision": 4,
    "Keyboard": 5,
    "Mouse": 6,
    "Other": 7,
    "Draw": 8,
    "KeyPress": 9,
    "KeyRelease": 10,
    "CleanUp": 12,
}

SUB_RE = re.compile(r"sub-event\s+([A-Za-z]+)_(\d+)")
BEGIN_RE = re.compile(r"gml_Object_\w+_([A-Za-z]+)_(\d+)")
FILE_RE = re.compile(r"^([A-Za-z]+?)(?:_(\d+))?$")
IDENT_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")

warnings: list[str] = []


def scan_subtypes(text: str, base: str) -> list[int]:
    """Sub-event numbers found inside a combined .gml file for `base`."""
    found: set[int] = set()
    for m in SUB_RE.finditer(text):
        if m.group(1) == base:
            found.add(int(m.group(2)))
    for m in BEGIN_RE.finditer(text):
        if m.group(1) == base:
            found.add(int(m.group(2)))
    return sorted(found)


def events_for_file(obj: str, path: Path) -> list[tuple[int, int]]:
    """Map one object .gml file -> [(eventType, eventSubtype), ...]."""
    stem = path.stem
    text = path.read_text(encoding="utf-8", errors="replace")
    if stem == "PreCreate":
        return [(14, 0)]
    m = FILE_RE.match(stem)
    if not m:
        warnings.append(f"{obj}/{path.name}: unparseable filename, skipped")
        return []
    base, num = m.group(1), m.group(2)
    if base not in EVENT_BASE:
        warnings.append(f"{obj}/{path.name}: unknown event base "
                        f"'{base}', skipped")
        return []
    etype = EVENT_BASE[base]
    if base == "Create":  # Create has no subtypes; Create_0.gml == Create
        return [(0, 0)]
    if base == "Destroy":
        return [(1, 0)]
    if num is not None:  # split file, e.g. Alarm_0.gml / KeyPress_1.gml
        return [(etype, int(num))]
    subs = scan_subtypes(text, base)  # combined file, e.g. Mouse.gml
    if subs:
        return [(etype, s) for s in subs]
    # No detectable sub-event: single default-subtype entry; the GML
    # above the reference block is still the whole event body.
    warnings.append(f"{obj}/{path.name}: no sub-event header found, "
                    f"emitting ({etype}, 0)")
    return [(etype, 0)]


def make_event_entry(etype: int, subtype: int) -> dict:
    return {
        "isDnD": False,
        "eventType": etype,
        "eventSubtype": subtype,
        "collisionObjectId": None,
        "resourceVersion": "1.0",
        "name": "",
        "resourceType": "GMEvent",
    }


def wire_objects() -> list[dict]:
    entries: list[dict] = []
    obj_names = json.loads((BASE / "obj_names.json").read_text())
    known = set(obj_names.values())
    dirs = sorted(d for d in OBJ_DIR.iterdir() if d.is_dir())
    for d in dirs:
        obj = d.name
        if obj not in known:
            warnings.append(f"object dir {obj} not in obj_names.json")
        # Split files (Alarm_0.gml) sort before combined ones (Alarm.gml)
        # so dedup prefers the precise single-event file.
        files = sorted(
            (p for p in d.iterdir() if p.suffix == ".gml"),
            key=lambda p: (FILE_RE.match(p.stem).group(1)
                           if FILE_RE.match(p.stem) else p.stem,
                           0 if (FILE_RE.match(p.stem)
                                 and FILE_RE.match(p.stem).group(2))
                           else 1,
                           p.name),
        )
        seen: set[tuple[int, int]] = set()
        event_list: list[dict] = []
        for f in files:
            for ev in events_for_file(obj, f):
                if ev in seen:
                    warnings.append(
                        f"{obj}: ({ev[0]}, {ev[1]}) already emitted, "
                        f"skipping dup from {f.name} (file kept on disk)")
                    continue
                seen.add(ev)
                event_list.append(make_event_entry(*ev))
        event_list.sort(key=lambda e: (e["eventType"], e["eventSubtype"]))
        yy = {
            "resourceType": "GMObject",
            "resourceVersion": "2.3",
            "name": obj,
            "spriteId": None,
            "solid": False,
            "visible": True,
            "managed": True,
            "persistent": False,
            "parentObjectId": None,
            "physicsAngularDamping": 0.1,
            "physicsDensity": 0.5,
            "physicsFriction": 0.2,
            "physicsGroup": 1,
            "physicsKinematic": False,
            "physicsLinearDamping": 0.1,
            "physicsObject": False,
            "physicsRestitution": 0.1,
            "physicsSensor": False,
            "physicsShape": 1,
            "physicsShapePoints": [],
            "physicsStartAwake": True,
            "properties": [],
            "overriddenProperties": [],
            "eventList": event_list,
        }
        (d / f"{obj}.yy").write_text(json.dumps(yy, indent=2) + "\n")
        entries.append({
            "id": str(uuid.uuid4()),
            "resourcePath": f"objects/{obj}/{obj}.yy",
            "resourceType": "GMObject",
        })
    # obj_names entries with no dir (assets not yet scaffolded)
    for n in sorted(known - {d.name for d in dirs}):
        warnings.append(f"obj_names.json has '{n}' but no objects/{n}/ dir "
                        f"(no .yy generated)")
    return entries


def wire_scripts() -> list[dict]:
    # ported/ wins on basename collision with todo/ (canonical GML).
    by_name: dict[str, Path] = {}
    for sub in ("ported", "todo"):
        for p in sorted((SCR_DIR / sub).glob("*.gml")):
            by_name.setdefault(p.stem, p)
    entries: list[dict] = []
    for name in sorted(by_name):
        src = by_name[name]
        if not IDENT_RE.match(name):
            warnings.append(f"script {src.name}: not a valid GML identifier, "
                            f"no .yy generated (port manually in IDE)")
            continue
        dup = [s for s in ("ported", "todo")
               if (SCR_DIR / s / f"{name}.gml").exists()]
        yy = {
            "resourceType": "GMScript",
            "resourceVersion": "2.0",
            "name": name,
            "isCompatibility": False,
            "isDnD": False,
            "parent": {"name": "Scripts",
                       "path": "folders/Scripts.yy"},
        }
        (SCR_DIR / f"{name}.yy").write_text(
            json.dumps(yy, indent=2) + "\n")
        if len(dup) == 2:
            warnings.append(f"script {name}.gml in both ported/ and todo/; "
                            f".yy stub created, canonical source = ported/")
        entries.append({
            "id": str(uuid.uuid4()),
            "resourcePath": f"scripts/{name}.yy",
            "resourceType": "GMScript",
        })
    return entries


def wire_rooms() -> list[dict]:
    rooms = json.loads((BASE / "room_names.json").read_text())
    entries: list[dict] = []
    for r in rooms:
        name, w, h = r["name"], r["width"], r["height"]
        rdir = PROJ / "rooms" / name
        rdir.mkdir(parents=True, exist_ok=True)
        (rdir / "RoomCreationCode.gml").write_text(
            f"/// {name} creation code (empty scaffold)\n")
        # Preserve populated instances on re-run (see room_instances.py):
        # a fresh scaffold has an empty Instances layer, but once the
        # ROOM-chunk dump has filled it, regenerating must not wipe it.
        keep_layers = None
        keep_order = None
        existing = rdir / f"{name}.yy"
        if existing.exists():
            try:
                prev = json.loads(existing.read_text(encoding="utf-8"))
                prev_layers = prev.get("layers") or []
                if any(len(lyr.get("instances", [])) > 0
                       for lyr in prev_layers
                       if lyr.get("resourceType") == "GMRInstanceLayer"):
                    keep_layers = prev_layers
                    keep_order = prev.get("instanceCreationOrderIds", [])
            except (json.JSONDecodeError, OSError) as e:
                warnings.append(f"room {name}: could not read existing .yy "
                                f"({e}), regenerating scaffold")
        yy = {
            "resourceType": "GMRoom",
            "resourceVersion": "2.0",
            "name": name,
            "creationCodeFile": f"rooms/{name}/RoomCreationCode.gml",
            "isDnd": False,
            "volume": 1.0,
            "views": [],
            "layers": keep_layers if keep_layers is not None else [
                {
                    "resourceType": "GMRInstanceLayer",
                    "resourceVersion": "2.0",
                    "name": "Instances",
                    "instances": [],
                    "visible": True,
                    "depth": 0,
                    "effectEnabled": False,
                    "effectType": None,
                    "gridX": 32,
                    "gridY": 32,
                    "hierarchyFrozen": False,
                    "inheritLayerDepth": False,
                    "inheritLayerSettings": False,
                    "inheritSubLayers": True,
                    "inheritVisibility": True,
                    "userdefinedDepth": False,
                }
            ],
            "instanceCreationOrderIds": keep_order if keep_order is not None else [],
            "roomSettings": {
                "inheritRoomSettings": False,
                "Width": w,
                "Height": h,
                "persistent": False,
            },
            "viewSettings": {
                "inheritViewSettings": False,
                "enableViews": False,
                "clearViewBackground": False,
                "clearDisplayBuffer": True,
            },
            "physicsSettings": {
                "inheritPhysicsSettings": False,
                "PhysicsWorld": False,
                "PhysicsWorldGravityX": 0.0,
                "PhysicsWorldGravityY": 10.0,
                "PhysicsWorldPixToMetres": 0.1,
            },
            "parentRoom": None,
            "parent": {"name": "Rooms", "path": "folders/Rooms.yy"},
        }
        (rdir / f"{name}.yy").write_text(json.dumps(yy, indent=2) + "\n")
        entries.append({
            "id": str(uuid.uuid4()),
            "resourcePath": f"rooms/{name}/{name}.yy",
            "resourceType": "GMRoom",
        })
    return entries


BUILD_DATA = """# BUILD-DATA: getting runnable game data out of this project

The .yy wiring in FNAFN-GML-project/ is a scaffold: code + rooms are
mapped, but sprites/sounds/tilesets still live inside the original
`fnafn/binaries/data.win` (YYC build, 326 MB). Exact steps:

## (a) Export assets with UndertaleModTool
1. Install UndertaleModTool (https://github.com/UndertaleModTool/UndertaleModTool,
   GUI or CLI build).
2. Open `fnafn/binaries/data.win` in it.
3. Bulk-export: Sprites -> `FNAFN-GML-project/sprites/`,
   Sounds -> `FNAFN-GML-project/sounds/`,
   Backgrounds/Tilesets -> `FNAFN-GML-project/tilesets/`.
   Export is lossless for a YYC data.win (no VARI chunk to worry about;
   variable-slot identity lives in ../SLOT-MAP.md).

## (b) Open the project
Open `FNAFN-GML-project/FNAFN.yyp` in GameMaker 2022+ (licensed).
On first load the IDE relinks resources; expect two manual fixes:
- Scripts: `scripts/<Name>.yy` stubs sit in scripts/ root while the real
  GML lives in `scripts/ported/<Name>.gml` (canonical) or
  `scripts/todo/<Name>.gml`. Drag-drop (or copy over) each .gml body
  into its IDE script entry. `scripts/todo/0.gml` + `1.gml` are skipped
  (numeric names are not valid GML identifiers) - recreate by hand.
- Multi-sub-event files (`Alarm.gml` with Alarm_0+Alarm_1, `Mouse.gml`
  with Mouse_53+Mouse_54, etc. - 12 files total) share one .gml across
  several event entries. Split each sub-event into its own IDE event;
  the `// ---- sub-event <Type>_<N>` headers mark the cut points.

## (c) Build an executable / APK
- Windows: Build -> Create Executable. Output next to the project is a
  new `data.win` + runner exe - the rebuilt FNAFN.
- Android: requires the Android (YYC) export module plus SDK/NDK, already
  on this box at `C:\\Android\\android-sdk`. Set them in
  File -> Preferences -> Platform Settings -> Android, then
  Build -> Create Executable (Target: Android). The game payload is
  `assets/game.droid` inside the APK (same format as data.win).

## (d) Donor-packaging (Android load test)
Same pattern as `build_donor_apk.py`: copy every entry of a known-good
Kincaid runner APK byte-identical, replace only `assets/game.droid`
with the freshly built data.win, drop META-INF, re-sign. Assert the only
diff vs the donor APK is `assets/game.droid`.

## (e) TODO(calibrate) gate
Files marked TODO(calibrate) contain placeholder consts (runtime-pool
doubles @0x14065xxxx, unmapped sprite/sound indices). They MUST be
resolved in-game first (compare against the exe's behaviour room by
room); otherwise the build boots with wrong timings, silent audio, or
missing sprites.
"""


def main() -> int:
    sprites = json.loads((BASE / "sprite_names.json").read_text())
    print(f"sprites: {len(sprites)}, rooms: "
          f"{len(json.loads((BASE / 'room_names.json').read_text()))}, "
          f"obj_names: {len(json.loads((BASE / 'obj_names.json').read_text()))}")
    obj_entries = wire_objects()
    scr_entries = wire_scripts()
    room_entries = wire_rooms()

    yyp = json.loads(YYP.read_text(encoding="utf-8"))
    yyp["resources"] = obj_entries + scr_entries + room_entries
    yyp.setdefault("resourceVersion", "2.0")
    YYP.write_text(json.dumps(yyp, indent=2) + "\n")

    for junk in ("tmp_dump_consts.py", "tmp_read_dbl.py"):
        p = BASE / junk
        if p.exists():
            r = subprocess.run(["git", "rm", "--quiet", junk],
                               cwd=BASE, capture_output=True, text=True)
            print(f"git rm {junk}: rc={r.returncode} "
                  f"{r.stderr.strip() or 'ok'}")
        else:
            print(f"{junk}: already gone")

    (BASE / "BUILD-DATA.md").write_text(BUILD_DATA)

    # ---- validation ----
    yyp_check = json.loads(YYP.read_text(encoding="utf-8"))
    assert isinstance(yyp_check["resources"], list) and yyp_check["resources"]
    obj_yy = list(OBJ_DIR.glob("*/*.yy"))
    dirs = [d for d in OBJ_DIR.iterdir() if d.is_dir()]
    missing = [d.name for d in dirs
               if not (d / f"{d.name}.yy").exists()]
    yy_all = (list(OBJ_DIR.glob("*/*.yy"))
              + list(SCR_DIR.glob("*.yy"))
              + list((PROJ / "rooms").glob("*/*.yy")))
    print(f"objects: {len(dirs)} dirs, {len(obj_yy)} .yy, "
          f"missing: {missing or 'NONE'}")
    print(f"scripts: {len(scr_entries)} .yy, rooms: {len(room_entries)} .yy")
    print(f"total .yy files: {len(yy_all)}")
    print(f"yyp resources: {len(yyp_check['resources'])}")
    assert not missing, f"objects missing .yy: {missing}"
    assert len(obj_yy) == len(dirs)
    assert len(yyp_check["resources"]) == (
        len(obj_entries) + len(scr_entries) + len(room_entries))
    print("warnings:")
    for w in warnings:
        print(f"  - {w}")
    print(f"({len(warnings)} warnings)")
    print("VALIDATION OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
