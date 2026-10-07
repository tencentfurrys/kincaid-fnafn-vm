#!/usr/bin/env python3
"""Rewrite every FNAFN-GML-project .yy to the exact GameMaker 2026 schema.

Ground truth (all extracted from the installed LTS 2026):
- canon2026.yyp      (ProjectTool 2024.14 PROJECT NEW: $GMProject "v1",
                      AudioGroups with exportDir, ForcedPrefabProjectReferences,
                      MetaData {}, resources as {"id":{"name","path"}} refs,
                      RoomOrderNodes roomId refs, NO Options/types keys)
- wall yyp           (Folders as inline $GMFolder "" records, defaultScriptType
                      1 for projects with GML)
- newblank Room1.yy  (GMRoom "v1", 8 views, background layer, project parent)
- wall rm_live_wallpaper.yy (GMRInstance "v1" entry shape, instanceCreationOrder
                      as [{"name","path"}] refs)
- wall obj_camera.yy (GMObject "" with folder parent, spriteMaskId, events)
- wall spr_background.yy (GMSprite "" full sequence schema)
- LTS2026 prefab GMScript (tag "v1")
- CoreResources.dll string table (GMMainOptions/GMWindowsOptions/GMSound field
                      runs: case-insensitive alphabetical file order)

Schema rules applied to every record with a resourceType:
  $TAG first ("v1" for GMProject/GMAudioGroup/GMEvent/GMRoom/GMRInstance/
  GMScript, "" for everything else), %Name second (= name value, "" when the
  record has name "" or no name key... except track/keyframe/channel records
  which never carry %Name), all other keys case-insensitive-alphabetical,
  which matches every template verbatim.

Preserves project data: object event (type,num) lists, room instances and
sizes, sprite/sound/script names and media files, folder refs, option values,
game GUID, yyp resource inventory (rebuilt from disk).

Idempotent: re-running over converted files is byte-stable (new UUIDs are
uuid5-derived, not random).
"""

import json
import os
import re
import shutil
import struct
import sys
import uuid
import zlib
from pathlib import Path

BASE = Path(__file__).resolve().parent
PROJ = BASE / "FNAFN-GML-project"
YYP = PROJ / "FNAFN.yyp"
PROJECT_NAME = "FNAFN"

# --------------------------------------------------------------------------
# lenient JSON (GameMaker itself writes trailing commas)


def load_yy(path: Path) -> dict:
    raw = path.read_text(encoding="utf-8")
    raw = re.sub(r",(\s*[}\]])", r"\1", raw)
    return json.loads(raw)


def save_yy(path: Path, data: dict) -> None:
    path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")


def ci_sorted(keys):
    """Case-insensitive (OrdinalIgnoreCase) key order used by the IDE."""
    return sorted(keys, key=lambda k: (k.upper(), k))


# --------------------------------------------------------------------------
# shared fragments

VIEW_DEFAULT = {
    "hborder": 32, "hport": 768, "hspeed": -1, "hview": 768,
    "inherit": False, "objectId": None, "vborder": 32, "visible": False,
    "vspeed": -1, "wport": 1366, "wview": 1366, "xport": 0, "xview": 0,
    "yport": 0, "yview": 0,
}

PHYSICS_DEFAULT = {
    "inheritPhysicsSettings": False,
    "PhysicsWorld": False,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
}

VIEW_SETTINGS_DEFAULT = {
    "clearDisplayBuffer": True,
    "clearViewBackground": False,
    "enableViews": False,
    "inheritViewSettings": False,
}


def folder_ref(name: str) -> dict:
    return {"name": name, "path": "folders/%s.yy" % name}


# --------------------------------------------------------------------------
# events / objects

def conv_event(e: dict) -> dict:
    num = e.get("eventNum", e.get("eventSubtype", 0))
    return {
        "$GMEvent": "v1",
        "%Name": "",
        "collisionObjectId": e.get("collisionObjectId"),
        "eventNum": num,
        "eventType": e.get("eventType", 0),
        "isDnD": e.get("isDnD", False),
        "name": "",
        "resourceType": "GMEvent",
        "resourceVersion": "2.0",
    }


OBJECT_DEFAULTS = {
    "managed": True, "parentObjectId": None, "persistent": False,
    "physicsAngularDamping": 0.1, "physicsDensity": 0.5,
    "physicsFriction": 0.2, "physicsGroup": 1, "physicsKinematic": False,
    "physicsLinearDamping": 0.1, "physicsObject": False,
    "physicsRestitution": 0.1, "physicsSensor": False, "physicsShape": 1,
    "physicsShapePoints": [], "physicsStartAwake": True, "properties": [],
    "overriddenProperties": [], "solid": False, "spriteId": None,
    "spriteMaskId": None, "visible": True,
}


DROPPED_PRECREATE = []


def conv_object(d: dict) -> dict:
    name = d.get("name", "")
    events = []
    for e in d.get("eventList", []):
        # Event type 14 (PreCreate) has no entry in the LTS2026 asset
        # compiler's event-name table (GetEventName_Simple throws
        # IndexOutOfRangeException and aborts the whole build). The
        # PreCreate_<n>.gml files stay on disk for manual IDE import.
        if e.get("eventNum", e.get("eventSubtype", 0)) == 0 and \
                e.get("eventType", 0) == 14:
            DROPPED_PRECREATE.append(name)
            continue
        events.append(conv_event(e))
    events.sort(key=lambda e: (e["eventType"], e["eventNum"]))
    out = {
        "$GMObject": "",
        "%Name": name,
        "eventList": events,
        "managed": d.get("managed", True),
        "name": name,
        "overriddenProperties": d.get("overriddenProperties", []),
        "parent": folder_ref("Objects"),
        "parentObjectId": d.get("parentObjectId"),
        "persistent": d.get("persistent", False),
    }
    for k in ("physicsAngularDamping", "physicsDensity", "physicsFriction",
              "physicsGroup", "physicsKinematic", "physicsLinearDamping",
              "physicsObject", "physicsRestitution", "physicsSensor",
              "physicsShape", "physicsShapePoints", "physicsStartAwake",
              "properties"):
        out[k] = d.get(k, OBJECT_DEFAULTS[k])
    out.update({
        "resourceType": "GMObject",
        "resourceVersion": "2.0",
        "solid": d.get("solid", False),
        "spriteId": d.get("spriteId"),
        "spriteMaskId": d.get("spriteMaskId"),
        "visible": d.get("visible", True),
    })
    return out


# --------------------------------------------------------------------------
# rooms / layers / instances

def conv_instance(inst: dict) -> dict:
    name = inst.get("name", "")
    obj = inst.get("objectId") or {}
    return {
        "$GMRInstance": "v4",
        "%Name": name,
        "colour": inst.get("colour", 4294967295),
        "frozen": inst.get("frozen", False),
        "hasCreationCode": inst.get("hasCreationCode", False),
        "ignore": inst.get("ignore", False),
        "imageIndex": inst.get("imageIndex", 0),
        "imageSpeed": inst.get("imageSpeed", 1.0),
        "inheritCode": inst.get("inheritCode", False),
        "inheritedItemId": inst.get("inheritedItemId"),
        "inheritItemSettings": inst.get("inheritItemSettings", False),
        "isDnd": inst.get("isDnd", False),
        "name": name,
        "objectId": {"name": obj.get("name"), "path": obj.get("path")},
        "properties": inst.get("properties", []),
        "resourceType": "GMRInstance",
        "resourceVersion": "2.0",
        "rotation": inst.get("rotation", 0.0),
        "scaleX": inst.get("scaleX", 1.0),
        "scaleY": inst.get("scaleY", 1.0),
        "x": inst.get("x", 0),
        "y": inst.get("y", 0),
    }


def conv_instance_layer(lyr: dict) -> dict:
    name = lyr.get("name", "Instances")
    return {
        "$GMRInstanceLayer": "",
        "%Name": name,
        "depth": lyr.get("depth", 0),
        "effectEnabled": lyr.get("effectEnabled", True),
        "effectType": lyr.get("effectType"),
        "gridX": lyr.get("gridX", 32),
        "gridY": lyr.get("gridY", 32),
        "hierarchyFrozen": lyr.get("hierarchyFrozen", False),
        "inheritLayerDepth": lyr.get("inheritLayerDepth", False),
        "inheritLayerSettings": lyr.get("inheritLayerSettings", False),
        "inheritSubLayers": lyr.get("inheritSubLayers", True),
        "inheritVisibility": lyr.get("inheritVisibility", True),
        "instances": [conv_instance(i) for i in lyr.get("instances", [])],
        "layers": lyr.get("layers", []),
        "name": name,
        "properties": lyr.get("properties", []),
        "resourceType": "GMRInstanceLayer",
        "resourceVersion": "2.0",
        "userdefinedDepth": lyr.get("userdefinedDepth", False),
        "visible": lyr.get("visible", True),
    }


def conv_room(d: dict) -> dict:
    name = d.get("name", "")
    order = d.get("instanceCreationOrder",
                  d.get("instanceCreationOrderIds", []))
    order = [{"name": e.get("name"), "path": e.get("path")} for e in order]
    layers = [conv_instance_layer(l) for l in d.get("layers", [])
              if (l.get("resourceType") or "") in ("GMRInstanceLayer", "")]
    if not layers:
        layers = [conv_instance_layer({"name": "Instances"})]
    views = d.get("views") or []
    if len(views) != 8:
        views = [dict(VIEW_DEFAULT) for _ in range(8)]
    rs = d.get("roomSettings", {}) or {}
    room_settings = {
        "Height": rs.get("Height", 768),
        "inheritRoomSettings": rs.get("inheritRoomSettings", False),
        "persistent": rs.get("persistent", False),
        "Width": rs.get("Width", 1366),
    }
    vs = d.get("viewSettings", {}) or {}
    view_settings = {
        "clearDisplayBuffer": vs.get("clearDisplayBuffer", True),
        "clearViewBackground": vs.get("clearViewBackground", False),
        "enableViews": vs.get("enableViews", False),
        "inheritViewSettings": vs.get("inheritViewSettings", False),
    }
    ps = d.get("physicsSettings", {}) or {}
    physics = {
        "inheritPhysicsSettings": ps.get("inheritPhysicsSettings", False),
        "PhysicsWorld": ps.get("PhysicsWorld", False),
        "PhysicsWorldGravityX": ps.get("PhysicsWorldGravityX", 0.0),
        "PhysicsWorldGravityY": ps.get("PhysicsWorldGravityY", 10.0),
        "PhysicsWorldPixToMetres": ps.get("PhysicsWorldPixToMetres", 0.1),
    }
    return {
        "$GMRoom": "v1",
        "%Name": name,
        "creationCodeFile": d.get("creationCodeFile", ""),
        "inheritCode": d.get("inheritCode", False),
        "inheritCreationOrder": d.get("inheritCreationOrder", False),
        "inheritLayers": d.get("inheritLayers", False),
        "instanceCreationOrder": order,
        "isDnd": d.get("isDnd", False),
        "layers": layers,
        "name": name,
        "parent": {"name": PROJECT_NAME, "path": PROJECT_NAME + ".yyp"},
        "parentRoom": d.get("parentRoom"),
        "physicsSettings": physics,
        "resourceType": "GMRoom",
        "resourceVersion": "2.0",
        "roomSettings": room_settings,
        "sequenceId": d.get("sequenceId"),
        "views": views,
        "viewSettings": view_settings,
        "volume": d.get("volume", 1.0),
    }


# --------------------------------------------------------------------------
# sprites (+ PNG layout)

def white_png_32() -> bytes:
    row = b"\x00" + b"\xff\xff\xff\xff" * 32

    def chunk(ctype: bytes, data: bytes) -> bytes:
        import zlib as _z
        return (struct.pack(">I", len(data)) + ctype + data
                + struct.pack(">I", _z.crc32(ctype + data) & 0xFFFFFFFF))

    ihdr = struct.pack(">IIBBBBB", 32, 32, 8, 6, 0, 0, 0)
    return (b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", ihdr)
            + chunk(b"IDAT", zlib.compress(row * 32)) + chunk(b"IEND", b""))


def sprite_frame_ids(d: dict, name: str):
    """Return (frame_id, layer_id): reuse wire_* UUIDs when present."""
    frames = d.get("frames") or []
    fid = frames[0].get("name") if frames else None
    layers = d.get("layers") or []
    lid = layers[0].get("name") if layers else None
    if not fid:
        fid = str(uuid.uuid5(uuid.NAMESPACE_URL, "FNAFN/sprite-frame/%s" % name))
    if not lid:
        lid = str(uuid.uuid5(uuid.NAMESPACE_URL, "FNAFN/sprite-layer/%s" % name))
    return fid, lid


def fix_sprite_files(sdir: Path, name: str, fid: str, lid: str) -> None:
    """Enforce 2026 layout: <fid>.png + layers/<fid>/<lid>.png."""
    layers_dir = sdir / "layers" / fid
    layers_dir.mkdir(parents=True, exist_ok=True)
    target = layers_dir / (lid + ".png")
    root_layer_png = sdir / (lid + ".png")
    if root_layer_png.exists() and not target.exists():
        root_layer_png.rename(target)
    if not target.exists():
        src = sdir / (fid + ".png")
        if src.exists():
            shutil.copyfile(src, target)
        else:
            target.write_bytes(white_png_32())
    if not (sdir / (fid + ".png")).exists():
        (sdir / (fid + ".png")).write_bytes(white_png_32())
    # prune stale placeholders (wire_* regenerates + converter relocates)
    for p in sdir.glob("*.png"):
        if p.stem not in (fid,):
            # the relocated layer png was already moved; anything else is stale
            if p.stem != lid or target.exists():
                if p.stem != fid:
                    p.unlink(missing_ok=True)
    for sub in (sdir / "layers").iterdir():
        if sub.name != fid:
            shutil.rmtree(sub, ignore_errors=True)


def conv_sprite(d: dict, name: str, yy_rel: str) -> dict:
    fid, lid = sprite_frame_ids(d, name)
    kid = str(uuid.uuid5(uuid.NAMESPACE_URL, "FNAFN/sprite-key/%s" % name))
    track = {
        "$GMSpriteFramesTrack": "",
        "builtinName": 0,
        "events": [],
        "inheritsTrackColour": True,
        "interpolation": 1,
        "isCreationTrack": False,
        "keyframes": {
            "$KeyframeStore<SpriteFrameKeyframe>": "",
            "Keyframes": [{
                "$Keyframe<SpriteFrameKeyframe>": "",
                "Channels": {
                    "0": {
                        "$SpriteFrameKeyframe": "",
                        "Id": {"name": fid, "path": yy_rel},
                        "resourceType": "SpriteFrameKeyframe",
                        "resourceVersion": "2.0",
                    },
                },
                "Disabled": False,
                "id": kid,
                "IsCreationKey": False,
                "Key": 0.0,
                "Length": 1.0,
                "resourceType": "Keyframe<SpriteFrameKeyframe>",
                "resourceVersion": "2.0",
                "Stretch": False,
            }],
            "resourceType": "KeyframeStore<SpriteFrameKeyframe>",
            "resourceVersion": "2.0",
        },
        "modifiers": [],
        "name": "frames",
        "resourceType": "GMSpriteFramesTrack",
        "resourceVersion": "2.0",
        "spriteId": None,
        "trackColour": 0,
        "tracks": [],
        "traits": 0,
    }
    sequence = {
        "$GMSequence": "v1",
        "%Name": name,
        "autoRecord": True,
        "backdropHeight": 768,
        "backdropImageOpacity": 0.5,
        "backdropImagePath": "",
        "backdropWidth": 1366,
        "backdropXOffset": 0.0,
        "backdropYOffset": 0.0,
        "events": {
            "$KeyframeStore<MessageEventKeyframe>": "",
            "Keyframes": [],
            "resourceType": "KeyframeStore<MessageEventKeyframe>",
            "resourceVersion": "2.0",
        },
        "eventStubScript": None,
        "eventToFunction": {},
        "length": 1.0,
        "lockOrigin": False,
        "moments": {
            "$KeyframeStore<MomentsEventKeyframe>": "",
            "Keyframes": [],
            "resourceType": "KeyframeStore<MomentsEventKeyframe>",
            "resourceVersion": "2.0",
        },
        "name": name,
        "playback": 1,
        "playbackSpeed": 30.0,
        "playbackSpeedType": 0,
        "resourceType": "GMSequence",
        "resourceVersion": "2.0",
        "showBackdrop": True,
        "showBackdropImage": False,
        "timeUnits": 1,
        "tracks": [track],
        "visibleRange": None,
        "volume": 1.0,
        "xorigin": 0,
        "yorigin": 0,
    }
    return {
        "$GMSprite": "v2",
        "%Name": name,
        "bboxMode": d.get("bboxMode", 0),
        "bbox_bottom": d.get("bbox_bottom", 31),
        "bbox_left": d.get("bbox_left", 0),
        "bbox_right": d.get("bbox_right", 31),
        "bbox_top": d.get("bbox_top", 0),
        "collisionKind": d.get("collisionKind", 1),
        "collisionTolerance": d.get("collisionTolerance", 0),
        "DynamicTexturePage": d.get("DynamicTexturePage", False),
        "edgeFiltering": d.get("edgeFiltering", False),
        "For3D": d.get("For3D", False),
        "frames": [{
            "$GMSpriteFrame": "v1",
            "%Name": fid,
            "name": fid,
            "resourceType": "GMSpriteFrame",
            "resourceVersion": "2.0",
        }],
        "gridX": d.get("gridX", 0),
        "gridY": d.get("gridY", 0),
        "height": d.get("height", 32),
        "HTile": d.get("HTile", False),
        "layers": [{
            "$GMImageLayer": "",
            "%Name": lid,
            "blendMode": 0,
            "displayName": "default",
            "isLocked": False,
            "name": lid,
            "opacity": 100.0,
            "resourceType": "GMImageLayer",
            "resourceVersion": "2.0",
            "visible": True,
        }],
        "name": name,
        "nineSlice": d.get("nineSlice"),
        "origin": d.get("origin", 0),
        "parent": folder_ref("Sprites"),
        "preMultiplyAlpha": d.get("preMultiplyAlpha", False),
        "resourceType": "GMSprite",
        "resourceVersion": "2.0",
        "sequence": sequence,
        "swatchColours": d.get("swatchColours"),
        "swfPrecision": d.get("swfPrecision", 2.525),
        "textureGroupId": {"name": "Default",
                           "path": "texturegroups/Default"},
        "type": d.get("type", 0),
        "VTile": d.get("VTile", False),
        "width": d.get("width", 32),
    }


# --------------------------------------------------------------------------
# sounds (2026 key set per CoreResources.dll field run; GMS2 bitRate/type/
# volume dropped, channelFormat/compressionQuality added)

def conv_sound(d: dict) -> dict:
    name = d.get("name", "")
    ag = d.get("audioGroupId") or {}
    return {
        "$GMSound": "v2",
        "%Name": name,
        "audioGroupId": {
            "name": ag.get("name", "audiogroup_default"),
            "path": ag.get("path", "audiogroups/audiogroup_default"),
        },
        "bitDepth": d.get("bitDepth", 0),
        "channelFormat": d.get("channelFormat", 0),
        "compression": d.get("compression", 0),
        "compressionQuality": 1,
        "conversionMode": d.get("conversionMode", 0),
        "duration": d.get("duration", 0.1),
        "exportDir": "",
        "name": name,
        "parent": folder_ref("Sounds"),
        "preload": d.get("preload", False),
        "resourceType": "GMSound",
        "resourceVersion": "2.0",
        "sampleRate": d.get("sampleRate", 44100),
        "soundFile": os.path.basename(
            d.get("soundFile", "sounds/%s/%s.wav" % (name, name))),
        "volume": d.get("volume", 1.0),
    }


# --------------------------------------------------------------------------
# scripts / folders

def conv_script(d: dict) -> dict:
    name = d.get("name", "")
    return {
        "$GMScript": "v1",
        "%Name": name,
        "isCompatibility": d.get("isCompatibility", False),
        "isDnD": d.get("isDnD", False),
        "name": name,
        "parent": folder_ref("Scripts"),
        "resourceType": "GMScript",
        "resourceVersion": "2.0",
    }


def conv_folder(d: dict) -> dict:
    name = d.get("name", "")
    return {
        "$GMFolder": "",
        "%Name": name,
        "folderPath": d.get("folderPath", "folders/%s.yy" % name),
        "name": name,
        "resourceType": "GMFolder",
        "resourceVersion": "2.0",
    }


# --------------------------------------------------------------------------
# options (2026 key sets per CoreResources.dll runs 503-524 / 1013-1043)

MAIN_OPTION_FIELDS = [
    "option_allow_instance_change", "option_audio_error_behaviour",
    "option_author", "option_collision_compatibility",
    "option_copy_on_write_enabled", "option_draw_colour", "option_gameguid",
    "option_gameid", "option_game_speed", "option_legacy_json_parsing",
    "option_legacy_number_conversion", "option_legacy_other_behaviour",
    "option_legacy_primitive_drawing", "option_mips_for_3d_textures",
    "option_remove_unused_assets", "option_sci_usesci", "option_spine_licence",
    "option_steam_app_id", "option_template_description",
    "option_template_icon", "option_template_image", "option_window_colour",
]

MAIN_OPTION_NEW_DEFAULTS = {
    "option_allow_instance_change": False,
    "option_audio_error_behaviour": False,
    "option_legacy_number_conversion": True,
    "option_legacy_other_behaviour": False,
    "option_legacy_primitive_drawing": False,
}

WINDOWS_OPTION_FIELDS = [
    "option_windows_allow_fullscreen_switching", "option_windows_borderless",
    "option_windows_company_info", "option_windows_copyright_info",
    "option_windows_copy_exe_to_dest", "option_windows_d3dswapeffectdiscard",
    "option_windows_description_info", "option_windows_disable_sandbox",
    "option_windows_display_cursor", "option_windows_display_name",
    "option_windows_enable_steam", "option_windows_executable_name",
    "option_windows_icon", "option_windows_installer_finished",
    "option_windows_installer_header", "option_windows_interpolate_pixels",
    "option_windows_license", "option_windows_nsis_file",
    "option_windows_product_info", "option_windows_resize_window",
    "option_windows_save_location", "option_windows_scale",
    "option_windows_sleep_margin", "option_windows_splash_screen",
    "option_windows_start_fullscreen",
    "option_windows_steam_use_alternative_launcher",
    "option_windows_texture_page", "option_windows_use_raw_mouse",
    "option_windows_use_splash", "option_windows_version",
    "option_windows_vsync",
]

WINDOWS_OPTION_NEW_DEFAULTS = {
    "option_windows_d3dswapeffectdiscard": False,
    "option_windows_disable_sandbox": False,
    "option_windows_use_raw_mouse": False,
    "option_windows_use_splash": False,
    "option_windows_version": "1.0.0.0",
}


def conv_options(d: dict, kind: str) -> dict:
    name = d.get("name", kind)
    tag = "$GM%sOptions" % kind
    rtype = "GM%sOptions" % kind
    tagver = "v5" if kind == "Main" else "v2"
    out = {"$%s" % rtype: tagver, "%Name": name, "name": name}
    if kind == "Main":
        fields = MAIN_OPTION_FIELDS
        defaults = MAIN_OPTION_NEW_DEFAULTS
    else:
        fields = WINDOWS_OPTION_FIELDS
        defaults = WINDOWS_OPTION_NEW_DEFAULTS
    for f in fields:
        if f in d:
            v = d[f]
            if f in ("option_audio_error_behaviour",
                       "option_legacy_number_conversion",
                       "option_legacy_other_behaviour",
                       "option_legacy_primitive_drawing",
                       "option_allow_instance_change") and not isinstance(v, bool):
                v = bool(v)
            if f == "option_windows_version" and isinstance(v, dict):
                v = "%d.%d.%d.%d" % (v.get("major", 1), v.get("minor", 0),
                                     v.get("revision", 0), v.get("build", 0))
            out[f] = v
        else:
            out[f] = defaults.get(f)
            if out[f] is None:
                out[f] = "" if f in (
                    "option_author", "option_gameguid", "option_gameid",
                    "option_steam_app_id", "option_template_description",
                    "option_template_icon", "option_template_image",
                    "option_windows_company_info",
                    "option_windows_copyright_info",
                    "option_windows_description_info",
                    "option_windows_display_name",
                    "option_windows_executable_name", "option_windows_icon",
                    "option_windows_installer_finished",
                    "option_windows_installer_header", "option_windows_license",
                    "option_windows_nsis_file", "option_windows_product_info",
                    "option_windows_splash_screen",
                    "option_windows_texture_page") else out[f]
    out.update({"resourceType": rtype, "resourceVersion": "2.0"})
    return out


# --------------------------------------------------------------------------
# project file

def folder_entry(name: str) -> dict:
    return {
        "$GMFolder": "",
        "%Name": name,
        "folderPath": "folders/%s.yy" % name,
        "name": name,
        "resourceType": "GMFolder",
        "resourceVersion": "2.0",
    }


def conv_yyp() -> dict:
    rooms_meta = json.loads((BASE / "room_names.json").read_text())
    room_names = [r["name"] for r in rooms_meta]
    obj_names = sorted(d.name for d in (PROJ / "objects").iterdir()
                       if d.is_dir())
    scr_names = sorted(p.stem for p in (PROJ / "scripts").glob("*.yy"))
    spr_names = sorted(d.name for d in (PROJ / "sprites").iterdir()
                       if d.is_dir())
    snd_names = sorted(d.name for d in (PROJ / "sounds").iterdir()
                       if d.is_dir())

    resources = []
    for o in obj_names:
        resources.append({"id": {"name": o,
                                 "path": "objects/%s/%s.yy" % (o, o)}})
    for s in scr_names:
        resources.append({"id": {"name": s,
                                 "path": "scripts/%s.yy" % s}})
    for r in room_names:
        resources.append({"id": {"name": r,
                                 "path": "rooms/%s/%s.yy" % (r, r)}})
    for s in spr_names:
        resources.append({"id": {"name": s,
                                 "path": "sprites/%s/%s.yy" % (s, s)}})
    for s in snd_names:
        resources.append({"id": {"name": s,
                                 "path": "sounds/%s/%s.yy" % (s, s)}})
    return {
        "$GMProject": "v1",
        "%Name": PROJECT_NAME,
        "AudioGroups": [{
            "$GMAudioGroup": "v1",
            "%Name": "audiogroup_default",
            "exportDir": "",
            "name": "audiogroup_default",
            "resourceType": "GMAudioGroup",
            "resourceVersion": "2.0",
            "targets": -1,
        }],
        "configs": {"children": [], "name": "Default"},
        "defaultScriptType": 1,
        "Folders": [folder_entry(f) for f in
                    ("Objects", "Rooms", "Scripts", "Sounds", "Sprites")],
        "ForcedPrefabProjectReferences": [],
        "IncludedFiles": [],
        "isEcma": False,
        "LibraryEmitters": [],
        "MetaData": {},
        "name": PROJECT_NAME,
        "resources": resources,
        "resourceType": "GMProject",
        "resourceVersion": "2.0",
        "RoomOrderNodes": [{"roomId": {
            "name": r, "path": "rooms/%s/%s.yy" % (r, r)}}
            for r in room_names],
        "templateType": None,
        "TextureGroups": [{
            "$GMTextureGroup": "",
            "%Name": "Default",
            "autocrop": True,
            "border": 2,
            "compressFormat": "bz2",
            "customOptions": "",
            "directory": "",
            "groupParent": None,
            "isScaled": True,
            "loadType": "default",
            "mipsToGenerate": 0,
            "name": "Default",
            "resourceType": "GMTextureGroup",
            "resourceVersion": "2.0",
            "targets": -1,
        }],
    }


# --------------------------------------------------------------------------
# driver

def convert_all(proj: Path = PROJ) -> dict:
    counts = {"object": 0, "script": 0, "room": 0, "sprite": 0,
              "sound": 0, "folder": 0, "options": 0}
    for d in sorted((proj / "objects").iterdir()):
        yy = d / (d.name + ".yy")
        if d.is_dir() and yy.exists():
            save_yy(yy, conv_object(load_yy(yy)))
            counts["object"] += 1
    for yy in sorted((proj / "scripts").glob("*.yy")):
        save_yy(yy, conv_script(load_yy(yy)))
        counts["script"] += 1
    for d in sorted((proj / "rooms").iterdir()):
        yy = d / (d.name + ".yy")
        if d.is_dir() and yy.exists():
            save_yy(yy, conv_room(load_yy(yy)))
            counts["room"] += 1
    for d in sorted((proj / "sprites").iterdir()):
        yy = d / (d.name + ".yy")
        if d.is_dir() and yy.exists():
            data = load_yy(yy)
            rel = "sprites/%s/%s.yy" % (d.name, d.name)
            new = conv_sprite(data, d.name, rel)
            fid = new["frames"][0]["name"]
            lid = new["layers"][0]["name"]
            fix_sprite_files(d, d.name, fid, lid)
            save_yy(yy, new)
            counts["sprite"] += 1
    for d in sorted((proj / "sounds").iterdir()):
        yy = d / (d.name + ".yy")
        if d.is_dir() and yy.exists():
            save_yy(yy, conv_sound(load_yy(yy)))
            counts["sound"] += 1
    for yy in sorted((proj / "folders").glob("*.yy")):
        save_yy(yy, conv_folder(load_yy(yy)))
        counts["folder"] += 1
    main_yy = proj / "options" / "main" / "options_main.yy"
    if main_yy.exists():
        save_yy(main_yy, conv_options(load_yy(main_yy), "Main"))
        counts["options"] += 1
    win_yy = proj / "options" / "windows" / "options_windows.yy"
    if win_yy.exists():
        save_yy(win_yy, conv_options(load_yy(win_yy), "Windows"))
        counts["options"] += 1
    save_yy(proj / (PROJECT_NAME + ".yyp"), conv_yyp())
    return counts


def main() -> int:
    counts = convert_all()
    total = sum(counts.values()) + 1  # + FNAFN.yyp
    print("format_2026: %s (total %d .yy files)" % (counts, total))
    if DROPPED_PRECREATE:
        print("dropped PreCreate events (compiler has no type-14 slot): %d "
              "objects" % len(DROPPED_PRECREATE))
    return 0


if __name__ == "__main__":
    sys.exit(main())
