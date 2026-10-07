#!/usr/bin/env python3
"""Wire FNAFN-GML-project into a GameMaker-openable project.

Reads objects/*/ (*.gml), scripts/ported/*.gml + scripts/todo/*.gml,
room_names.json, sprite_names.json, sound_names.json, obj_names.json
and generates:
  - objects/<Obj>/<Obj>.yy          (GMObject, eventList from filenames)
  - scripts/<Script>.yy             (GMScript sibling stub; see note below)
  - rooms/<Rm>/<Rm>.yy + RoomCreationCode.gml
  - folders/*.yy (GMFolder: Objects/Rooms/Scripts/Sounds/Sprites)
  - options/main/options_main.yy (GMMainOptions defaults, game FNAFN)
  - options/windows/options_windows.yy (GMWindowsOptions, Windows VM build)
  - sprites/<Spr>/<Spr>.yy + 32x32 placeholder PNG frame(s)
  - sounds/<Snd>/<Snd>.yy + 0.1s silent 8-bit placeholder WAV
  - rewritten FNAFN.yyp resources[] with fresh UUIDs (+ Folders/Options)
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
import struct
import subprocess
import sys
import uuid
import zlib
from pathlib import Path

import format_2026

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
                    # format_2026 renames this key; accept both shapes.
                    keep_order = prev.get(
                        "instanceCreationOrder",
                        prev.get("instanceCreationOrderIds", []))
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


FOLDERS = ["Objects", "Rooms", "Scripts", "Sounds", "Sprites"]

# Stable scaffold game GUID (options_main option_gameguid). Fixed so
# re-runs do not churn the project identity.
GAME_GUID = str(uuid.uuid5(uuid.NAMESPACE_DNS, "FNAFN"))


def wire_folders() -> list[dict]:
    """Write folders/*.yy (GMFolder) + return yyp Folders entries."""
    fdir = PROJ / "folders"
    fdir.mkdir(parents=True, exist_ok=True)
    entries: list[dict] = []
    for name in FOLDERS:
        (fdir / f"{name}.yy").write_text(json.dumps({
            "resourceType": "GMFolder",
            "resourceVersion": "1.0",
            "name": name,
            "folderPath": f"folders/{name}.yy",
        }, indent=2) + "\n")
        entries.append({
            "folderPath": f"folders/{name}.yy",
            "name": name,
            "resourceType": "GMFolder",
            "resourceVersion": "1.0",
        })
    return entries


def wire_options() -> list[dict]:
    """Write Main + Windows options .yy; return yyp Options entries.

    Scaffold values only (defaults, game name FNAFN, Windows VM build,
    NOT YYC). Real tuning happens in the IDE.
    """
    main_dir = PROJ / "options" / "main"
    win_dir = PROJ / "options" / "windows"
    main_dir.mkdir(parents=True, exist_ok=True)
    win_dir.mkdir(parents=True, exist_ok=True)
    main_yy = {
        "resourceType": "GMMainOptions",
        "resourceVersion": "1.4",
        "name": "Main",
        "option_author": "",
        "option_collision_compatibility": False,
        "option_copy_on_write_enabled": False,
        "option_draw_colour": 4294967295,
        "option_game_speed": 60,
        "option_gameguid": GAME_GUID,
        "option_gameid": "0",
        "option_legacy_json_parsing": True,
        "option_legacy_number_parsing": True,
        "option_legacy_view_behaviour": False,
        "option_mips_for_3d_textures": False,
        "option_remove_unused_assets": False,
        "option_sci_usesci": False,
        "option_spine_licence": False,
        "option_steam_app_id": "0",
        "option_template_description": None,
        "option_template_icon": "${base_options_dir}/main/template_icon.png",
        "option_template_image": "${base_options_dir}/main/template_image.png",
        "option_window_colour": 255,
    }
    (main_dir / "options_main.yy").write_text(
        json.dumps(main_yy, indent=2) + "\n")
    win_yy = {
        "resourceType": "GMWindowsOptions",
        "resourceVersion": "1.1",
        "name": "Windows",
        "option_windows_allow_fullscreen_switching": False,
        "option_windows_borderless": False,
        "option_windows_company_info": "",
        "option_windows_copy_exe_to_dest": False,
        "option_windows_copyright_info": "",
        "option_windows_description_info": "FNAFN",
        "option_windows_display_cursor": True,
        "option_windows_display_name": "FNAFN",
        "option_windows_enable_steam": False,
        "option_windows_executable_name": "FNAFN.exe",
        "option_windows_icon": "${base_options_dir}/windows/icons/icon.ico",
        "option_windows_installer_finished":
            "${base_options_dir}/windows/installer/finished.bmp",
        "option_windows_installer_header":
            "${base_options_dir}/windows/installer/header.bmp",
        "option_windows_interpolate_pixels": False,
        "option_windows_license":
            "${base_options_dir}/windows/installer/license.txt",
        "option_windows_nsis_file":
            "${base_options_dir}/windows/installer/nsis_script.nsi",
        "option_windows_product_info": "FNAFN",
        "option_windows_resize_window": False,
        "option_windows_save_location": 0,
        "option_windows_scale": 0,
        "option_windows_sleep_margin": 10,
        "option_windows_splash_screen":
            "${base_options_dir}/windows/splash/splash.png",
        "option_windows_start_fullscreen": False,
        "option_windows_steam_use_alternative_launcher": False,
        "option_windows_texture_page": "2048x2048",
        "option_windows_use_x64": False,
        "option_windows_version": "1.0.0.0",
        "option_windows_vsync": False,
    }
    (win_dir / "options_windows.yy").write_text(
        json.dumps(win_yy, indent=2) + "\n")
    return [
        {"name": "Main", "path": "options/main/options_main.yy"},
        {"name": "Windows", "path": "options/windows/options_windows.yy"},
    ]


def _png_chunk(ctype: bytes, data: bytes) -> bytes:
    return (struct.pack(">I", len(data)) + ctype + data
            + struct.pack(">I", zlib.crc32(ctype + data) & 0xFFFFFFFF))


def white_png_32() -> bytes:
    """32x32 opaque-white RGBA PNG, pure stdlib (no PIL)."""
    row = b"\x00" + b"\xff\xff\xff\xff" * 32
    ihdr = struct.pack(">IIBBBBB", 32, 32, 8, 6, 0, 0, 0)
    return (b"\x89PNG\r\n\x1a\n"
            + _png_chunk(b"IHDR", ihdr)
            + _png_chunk(b"IDAT", zlib.compress(row * 32))
            + _png_chunk(b"IEND", b""))


def silent_wav_8bit(rate: int = 44100, secs: float = 0.1) -> bytes:
    """Mono 8-bit silent WAV (0x80 centre), pure stdlib."""
    n = int(rate * secs)
    data = bytes([0x80]) * n
    return (b"RIFF" + struct.pack("<I", 36 + n) + b"WAVE"
            + b"fmt " + struct.pack("<IHHIIHH", 16, 1, 1, rate, rate,
                                    1, 8)
            + b"data" + struct.pack("<I", n) + data)


def wire_sprites() -> list[dict]:
    """Scaffold sprites/<Name>/<Name>.yy + placeholder PNG frame.

    Object spriteId stays null (per-object sprite mapping is out of
    scope); this only proves the sprite resources compile. Re-run
    regenerates placeholders, except dirs carrying a .imported_real
    sentinel (real art from import_assets.py), which are left alone.
    """
    sprites = json.loads((BASE / "sprite_names.json").read_text())
    png = white_png_32()
    sdir = PROJ / "sprites"
    entries: list[dict] = []
    for s in sprites:
        name = s["name"]
        if not IDENT_RE.match(name):
            warnings.append(f"sprite '{name}': not a valid identifier, "
                            f"skipped")
            continue
        d = sdir / name
        if (d / ".imported_real").exists():
            # Real art already imported (see import_assets.py): keep it.
            entries.append({
                "id": str(uuid.uuid4()),
                "resourcePath": f"sprites/{name}/{name}.yy",
                "resourceType": "GMSprite",
            })
            continue
        d.mkdir(parents=True, exist_ok=True)
        for stale in d.glob("*.png"):
            stale.unlink()
        frame_id = str(uuid.uuid4())
        layer_id = str(uuid.uuid4())
        key_id = str(uuid.uuid4())
        yy_path = f"sprites/{name}/{name}.yy"
        frame_png = f"sprites/{name}/{frame_id}.png"
        layer_png = f"sprites/{name}/{layer_id}.png"
        (d / f"{frame_id}.png").write_bytes(png)
        (d / f"{layer_id}.png").write_bytes(png)
        yy = {
            "resourceType": "GMSprite",
            "resourceVersion": "2.0",
            "name": name,
            "bboxMode": 0,
            "collisionKind": 1,
            "type": 0,
            "origin": 0,
            "preMultiplyAlpha": False,
            "edgeFiltering": False,
            "collisionTolerance": 0,
            "swfPrecision": 2.525,
            "bbox_left": 0,
            "bbox_right": 31,
            "bbox_top": 0,
            "bbox_bottom": 31,
            "HTile": False,
            "VTile": False,
            "For3D": False,
            "width": 32,
            "height": 32,
            "textureGroupId": {
                "name": "Default",
                "path": "texturegroups/Default",
            },
            "swatchColours": None,
            "gridX": 0,
            "gridY": 0,
            "nineSlice": None,
            "frames": [
                {
                    "resourceType": "GMSpriteFrame",
                    "resourceVersion": "1.1",
                    "name": frame_id,
                    "spriteId": {"name": name, "path": yy_path},
                    "compositeImage": {
                        "resourceType": "GMSpriteCameraTrack",
                        "resourceVersion": "1.0",
                        "name": "",
                        "FrameId": {"name": frame_id, "path": frame_png},
                        "LayerId": None,
                    },
                    "images": [
                        {
                            "resourceType": "GMSpriteImage",
                            "resourceVersion": "1.0",
                            "name": "",
                            "FrameId": {"name": frame_id, "path": frame_png},
                            "LayerId": {"name": layer_id, "path": layer_png},
                        }
                    ],
                    "parent": {"name": name, "path": yy_path},
                }
            ],
            "sequence": {
                "resourceType": "GMSequence",
                "resourceVersion": "1.4",
                "name": name,
                "timeUnits": 1,
                "playback": 1,
                "playbackSpeed": 30.0,
                "playbackSpeedType": 0,
                "length": 1.0,
                "events": {
                    "resourceType":
                        "KeyframeStore<MessageEventKeyframe>",
                    "resourceVersion": "1.0",
                    "Keyframes": [],
                },
                "moments": {
                    "resourceType":
                        "KeyframeStore<MomentsEventKeyframe>",
                    "resourceVersion": "1.0",
                    "Keyframes": [],
                },
                "tracks": [
                    {
                        "resourceType": "GMSpriteFramesTrack",
                        "resourceVersion": "1.0",
                        "name": "frames",
                        "spriteId": None,
                        "keyframes": {
                            "resourceType":
                                "KeyframeStore<SpriteFrameKeyframe>",
                            "resourceVersion": "1.0",
                            "Keyframes": [
                                {
                                    "resourceType": "Keyframe",
                                    "resourceVersion": "1.0",
                                    "id": key_id,
                                    "Key": 0.0,
                                    "Length": 1.0,
                                    "Stretch": False,
                                    "Disabled": False,
                                    "IsCreationKey": False,
                                    "Channels": {
                                        "0": {
                                            "resourceType":
                                                "SpriteFrameKeyframe",
                                            "resourceVersion": "1.0",
                                            "Id": {"name": frame_id,
                                                   "path": yy_path},
                                        }
                                    },
                                }
                            ],
                        },
                        "trackColour": 0,
                        "inheritsTrackColour": True,
                        "builtinName": 0,
                        "traits": 0,
                        "interpolation": 1,
                        "tracks": [],
                        "events": [],
                        "modifiers": [],
                        "isCreationTrack": False,
                    }
                ],
                "visibleRange": None,
                "volume": 1.0,
                "lockOrigin": False,
                "showBackdrop": True,
                "showBackdropImage": False,
                "backdropImageOpacity": 0.5,
                "backdropImagePath": "",
                "backdropWidth": 1920,
                "backdropHeight": 1080,
                "backdropXOffset": 0.0,
                "backdropYOffset": 0.0,
                "xorigin": 0,
                "yorigin": 0,
                "eventToFunction": {},
                "eventStubScript": None,
                "parent": {"name": name, "path": yy_path},
            },
            "layers": [
                {
                    "resourceType": "GMSpriteLayer",
                    "resourceVersion": "1.0",
                    "name": layer_id,
                    "visible": True,
                    "hspeed": 0.0,
                    "vspeed": 0.0,
                    "x": 0,
                    "y": 0,
                }
            ],
            "parent": {"name": "Sprites", "path": "folders/Sprites.yy"},
        }
        (d / f"{name}.yy").write_text(json.dumps(yy, indent=2) + "\n")
        entries.append({
            "id": str(uuid.uuid4()),
            "resourcePath": yy_path,
            "resourceType": "GMSprite",
        })
    return entries


def wire_sounds() -> list[dict]:
    """Scaffold sounds/<Name>/<Name>.yy + 0.1s silent 8-bit WAV.

    Re-run regenerates placeholders, except dirs carrying a
    .imported_real sentinel (real audio from import_assets.py)."""
    sounds = json.loads((BASE / "sound_names.json").read_text())
    wav = silent_wav_8bit()
    sdir = PROJ / "sounds"
    entries: list[dict] = []
    for s in sounds:
        name = s["name"]
        if not IDENT_RE.match(name):
            warnings.append(f"sound '{name}': not a valid identifier, "
                            f"skipped")
            continue
        d = sdir / name
        if (d / ".imported_real").exists():
            # Real audio already imported (see import_assets.py): keep it.
            entries.append({
                "id": str(uuid.uuid4()),
                "resourcePath": f"sounds/{name}/{name}.yy",
                "resourceType": "GMSound",
            })
            continue
        d.mkdir(parents=True, exist_ok=True)
        for stale in d.glob("*.wav"):
            stale.unlink()
        wav_rel = f"sounds/{name}/{name}.wav"
        (d / f"{name}.wav").write_bytes(wav)
        yy = {
            "resourceType": "GMSound",
            "resourceVersion": "1.0",
            "name": name,
            "conversionMode": 0,
            "compression": 0,
            "volume": 1.0,
            "preload": False,
            "bitRate": 128,
            "sampleRate": 44100,
            "type": 0,
            "bitDepth": 0,
            "audioGroupId": {
                "name": "audiogroup_default",
                "path": "audiogroups/audiogroup_default",
            },
            "soundFile": wav_rel,
            "duration": 0.1,
            "parent": {"name": "Sounds", "path": "folders/Sounds.yy"},
        }
        (d / f"{name}.yy").write_text(json.dumps(yy, indent=2) + "\n")
        entries.append({
            "id": str(uuid.uuid4()),
            "resourcePath": f"sounds/{name}/{name}.yy",
            "resourceType": "GMSound",
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
    folder_entries = wire_folders()
    opt_entries = wire_options()
    spr_entries = wire_sprites()
    snd_entries = wire_sounds()

    yyp = json.loads(YYP.read_text(encoding="utf-8"))
    yyp["resources"] = (obj_entries + scr_entries + room_entries
                        + spr_entries + snd_entries)
    yyp["Folders"] = folder_entries
    yyp["Options"] = opt_entries
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

    # Rewrite every .yy to the exact GameMaker 2026 schema (replaces the
    # old tag_yy pass; keeps the format stable across re-runs).
    fmt_counts = format_2026.convert_all(PROJ)
    print(f"format_2026 applied: {fmt_counts}")

    # ---- validation (post-2026 conversion; format_2026 ran above) ----
    yyp_check = json.loads(YYP.read_text(encoding="utf-8"))
    assert isinstance(yyp_check["resources"], list) and yyp_check["resources"]
    # 2026 yyp shape: no legacy Options/types keys; resources are id refs.
    assert "Options" not in yyp_check, "legacy Options key in yyp"
    assert "types" not in yyp_check, "legacy types key in yyp"
    assert "RoomOrderNodes" in yyp_check and len(yyp_check["RoomOrderNodes"]) == 9
    obj_yy = list(OBJ_DIR.glob("*/*.yy"))
    dirs = [d for d in OBJ_DIR.iterdir() if d.is_dir()]
    missing = [d.name for d in dirs
               if not (d / f"{d.name}.yy").exists()]
    yy_all = (list(OBJ_DIR.glob("*/*.yy"))
              + list(SCR_DIR.glob("*.yy"))
              + list((PROJ / "rooms").glob("*/*.yy"))
              + list((PROJ / "sprites").glob("*/*.yy"))
              + list((PROJ / "sounds").glob("*/*.yy"))
              + list((PROJ / "folders").glob("*.yy"))
              + list((PROJ / "options").glob("*/*.yy")))
    # Every .yy must parse as JSON.
    bad_json = []
    for p in yy_all + [YYP]:
        try:
            json.loads(p.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError) as e:
            bad_json.append(f"{p}: {e}")
    # Every 2026 yyp id-ref must resolve on disk.
    unresolvable = [e["id"]["path"] for e in yyp_check["resources"]
                    if not (PROJ / e["id"]["path"]).exists()]
    # 2026 schema spot checks: events use eventNum, rooms carry 8 views
    # plus instanceCreationOrder refs (never the legacy key names).
    bad_events = []
    for p in OBJ_DIR.glob("*/*.yy"):
        for e in json.loads(p.read_text(encoding="utf-8"))["eventList"]:
            if "eventNum" not in e or "eventSubtype" in e:
                bad_events.append(str(p))
    bad_rooms = []
    for p in (PROJ / "rooms").glob("*/*.yy"):
        rd = json.loads(p.read_text(encoding="utf-8"))
        if len(rd.get("views", [])) != 8 or "instanceCreationOrderIds" in rd:
            bad_rooms.append(str(p))
    spr_yy = list((PROJ / "sprites").glob("*/*.yy"))
    snd_yy = list((PROJ / "sounds").glob("*/*.yy"))
    spr_png = list((PROJ / "sprites").rglob("*.png"))
    snd_wav = list((PROJ / "sounds").glob("*/*.wav"))
    print(f"objects: {len(dirs)} dirs, {len(obj_yy)} .yy, "
          f"missing: {missing or 'NONE'}")
    print(f"scripts: {len(scr_entries)} .yy, rooms: {len(room_entries)} .yy")
    print(f"sprites: {len(spr_entries)} .yy, {len(spr_yy)} on disk, "
          f"{len(spr_png)} png")
    print(f"sounds: {len(snd_entries)} .yy, {len(snd_yy)} on disk, "
          f"{len(snd_wav)} wav")
    print(f"folders: {len(folder_entries)} .yy, "
          f"options: {len(opt_entries)} .yy")
    print(f"total .yy files: {len(yy_all)}")
    print(f"yyp resources: {len(yyp_check['resources'])}")
    print(f"bad JSON: {bad_json or 'NONE'}")
    print(f"unresolvable id-refs: {unresolvable or 'NONE'}")
    print(f"bad 2026 events: {bad_events or 'NONE'}")
    print(f"bad 2026 rooms: {bad_rooms or 'NONE'}")
    assert not missing, f"objects missing .yy: {missing}"
    assert len(obj_yy) == len(dirs)
    assert not bad_json, f"unparseable .yy: {bad_json}"
    assert not unresolvable, f"dangling id-refs: {unresolvable}"
    assert not bad_events, f"legacy event entries: {bad_events}"
    assert not bad_rooms, f"legacy room shape: {bad_rooms}"
    assert len(spr_yy) == len(spr_entries) == 109, (
        f"sprite count: entries={len(spr_entries)} files={len(spr_yy)}")
    assert len(snd_yy) == len(snd_entries) == 57, (
        f"sound count: entries={len(snd_entries)} files={len(snd_yy)}")
    # Multi-frame sprites: 2 PNGs (root + layer) per declared frame.
    total_frames = 0
    for p in spr_yy:
        total_frames += len(
            json.loads(p.read_text(encoding="utf-8")).get("frames", []))
    assert len(spr_png) == 2 * total_frames, (
        f"sprite pngs: {len(spr_png)} vs 2 * frames={total_frames}")
    print(f"sprite frames (all sprites): {total_frames}")
    assert len(snd_wav) == len(snd_entries), f"sound wavs: {len(snd_wav)}"
    assert len(yyp_check["resources"]) == (
        len(obj_entries) + len(scr_entries) + len(room_entries)
        + len(spr_entries) + len(snd_entries))
    assert len(yyp_check["Folders"]) == len(folder_entries) == 5
    assert len(opt_entries) == 2  # options live on disk, not in the 2026 yyp
    print("warnings:")
    for w in warnings:
        print(f"  - {w}")
    print(f"({len(warnings)} warnings)")
    print("VALIDATION OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
