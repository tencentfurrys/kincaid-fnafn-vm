# PORTING.md — FNAFN C → GML porting guide

## Reading the decompiled C: decoded runner-call patterns

The YYC output is highly conventional. Once decoded, functions read almost
like GML. Patterns established by cross-referencing many functions:

| C pattern | Meaning | GML |
|---|---|---|
| `uStack_XX = 0xfffffffffffffffe;` | exception frame setup | (none) |
| `puStack_XX = &UNK_... /* "gml_..." */` | function's own name for profiler | (none) |
| `puRam0000000140657668` save/set/restore | with/self context push & pop | (none) |
| `func_0x000140001410(&slot)` | RValue destructor/Release | (none) |
| `(**(code **)(*param_1 + 0x10))(self, ID)` | **fetch variable OR function by registry id** (one GameMaker id-space covers both; see `builtin_ids.json`). A fetched slot written to right after = variable assignment: `(self,0x18719); *slot=1.0;` -> `fading = 1;` | `fading = 1` / `script_name()` |
| `func_0x000140141d00(self)` | push self as call argument | (implicit) |
| `func_0x000140141c50(n)` | set argument count = n | (implicit) |
| `func_0x00014012b840(ret, argc)` | perform the pending builtin/script call into `ret` | the call itself |
| `func_0x00014015f1a0(self, VARREF, 0x80000000, &val[, flags, mask])` | READ instance/property variable into &val (op-operand fetch; CORRECTED 2026-10-01 — result feeds arithmetic/copy in Menu_Static Create, Camera_Static Create/Step; `variable_instance_set` = 0x000140160140 with no extra args) | `x = variable` |
| `func_0x00014015be60(&val, DOUBLE, VARREF, flags)` / compared `> 0` | read instance variable + compare | `if (variable > x)` |
| `func_0x000140160140(self, VARREF, 0x80000000, &val)` | write built-in property (image_*, x, y, ...) | `image_alpha = val` |
| `func_0x00014017c070(self, other, 0, 0)` | **instance_destroy()** (PROVEN 2026-10-06; was wrongly guessed room_goto_next — see below) | `instance_destroy()` |
| `func_0x00014017c0e0(self, other, N)` | **instance_exists(N)** (PROVEN 2026-10-06) | `if (instance_exists(Obj_N))` |
| `func_0x000140181c50(self, other, TYPE, NUM)` | **event_perform(TYPE, NUM)** (PROVEN 2026-10-06; was wrongly guessed room/goto service). TYPE uses standard GM event constants: 2 = ev_alarm, 9 = ev_keypress | `event_perform(ev_alarm, 1)` |
| for-loop over helpers 0x140144bd0/0x1401451f0/0x1401449f0 with "repeat const" C | **`with (object C) {}` block** — the repeat const is the OBJECT INDEX, not a loop count (PROVEN 2026-10-06) | `with (Obj_RoundedRoom) { ... }` |
| `0x3ff0000000000000` | double 1.0 | `1` |
| `0x3fe0000000000000` | double 0.5 | `0.5` |
| `0x3ff4000000000000` | double 1.25 | `1.25` |
| `0x4071800000000000` | double 300.0 | `300` |
| `0xffffff` in the u32 half of an RValue slot | type tag = unset/temp | (none) |

**Variable identity**: the `VARREF` slots (e.g. `uRam...1405c7c18`) are
statically `0xffffffff` in the exe and are **patched at load time from
data.win's variable table** — the names live in game.droid, not the exe.
**2026-09-30 status**: the shipped data.win is the YYC build's data file
and has NO VARI chunk (chunks are GEN8..AUDO only; verified by
`vari_extract.py`), and FNAFN.exe is no longer on this machine, so names
cannot be dumped from either. Cross-reference instead with `slot_map.py`
(see below) or accept `variable_resolve_placeholder` until in-game testing
disambiguates.

**Slot evidence tooling** (added 2026-09-30):
- `slot_map.py` → `SLOT-MAP.md`: every runtime `uRam` variable slot with
  function/read/write counts and the registry ids co-fetched in the same
  functions (evidence, not proof). 216 slots catalogued.
- Proven slot: `uRam00000001405c7b98` = `image_alpha` (EXE-REGISTRY.md
  name-pointer rule; the old `fading` proof conflated id 0x18719 with the
  slot it feeds).
- Op-helper semantics (PROVEN 2026-10-01, three coherent sites):
  `func_0x0001400053f0` = MUL, `func_0x000140005290` = ADD, and
  `func_0x00014015f1a0` = READ (Menu_Static/Camera_Static decode coherently
  only with these).
- Proven op-helper semantics (from Disclaimer KeyPress_1 0.5 constant):
  `func_0x00014015be60` = 3-way compare (neg = less, pos = greater,
  -2 = incomparable).
- Compare-operator calibration (2026-10-06): the GML operator is chosen by
  how the CALLER tests the 3-way result (`if (fading > 0.5)` =
  `compare(fading, 0.5)` with `0 < r`): `0 < r` = `>`, `r == 0` = `==`,
  `r != 0` = `!=`, `r < 1` = `<=`, and a loop that breaks unless `r < 0`
  is the `<` condition.
- Compound-op helpers (PROVEN 2026-10-06): `func_0x00014000bdb0` = `-=`,
  `func_0x00014000bf90` = `+=` (both in-place on the first arg).
- `for`-loop shape (PROVEN 2026-10-06, Obj_Night_Time / Obj_Night_Shift_End):
  counter init; `while(true) { bound; if (compare(counter, bound) not < 0)
  break; body; typed-increment switch }`. The closing `switch(counter_type)`
  (cases 0 = double `+= dVar1`, 7 = int32 +1, 10 = int64 +1, default = the
  generic `++` operator, UNK_140439e10 = "++") is the single `counter += 1`;
  `dVar1` = _UNK_140439dd0 = 1.0. The bound may be a literal double or a
  call (`array_length(array)`).
- Variable-vs-script ids: an id fetched then passed to `array_length()` /
  the accessor shape is an ARRAY even when its registered name looks like a
  script — id 0x186d5 "Scr_Camera_Update" is a 12-element array.
- Two-case flag switch: `compare(case0, x); if (!=0) { compare(case1, x);
  if (!=0) skip; sel = 1; } label = table[sel]` decodes as
  `if (x == case0) {...} else if (x == case1) {...}`. Case constants AND
  the label table sit in the guarded constant pool; when the pool init
  zeroes the label table explicitly the case->branch mapping is provable
  offline (see the Obj_Pause/KeyPress inversion fix in PROGRESS.md).
- The `+8` fetch on the instance (`(**(code **)(*param_1 + 8))`) returns
  a VARIABLE by id, and `+0x10` also returns variables — both are used
  for reads; calls go through the separate arg-collection path.

**Registry ids (variables AND functions)**: every `0x186xx/0x187xx/0x188xx`
constant maps to a game name via `builtin_ids.json` (425 entries, extracted
from the exe's registration table; prefer gml_Script_/gml_GlobalScript_
entries - the table also contains object-event aliases of the same id).
2,221 id references are annotated in `gml_all_414_decompiled.annotated.c`,
together with 1,345 string-constant annotations. Proofs:
`0x18719 -> fading`, `0x18793 -> toggle`, `0x186d5 -> Scr_Camera_Update`,
`0x18703 -> customfunct_game_save`.

### Decoded examples (verified this session)

Obj_Menu_Disclaimer / Alarm_0:
```gml
fading = 1;
Scr_Camera_Update();
<some builtin>(300);   // 0x4071800000000000 = 300.0; name via fast-path slot, calibrate
```

Obj_Night_Camera_Switch / Create_0:
```gml
toggle = 1;            // fetched by id 0x18793, slot written 1.0
<property> = 1;        // fast-path property write follows
```

Obj_Menu_Main_Music / Create_0:
```gml
image_speed = 1.25;    // 0x3ff4000000000000, two property writes
<property2> = 1.25;    // second slot - likely image_*, calibrate in-game
```

Obj_Menu_Disclaimer / KeyPress_1 (any-key advance):
```gml
if (<input read> > 0) {
    <advance>(2, 1);   // room/event transition with args (2,1)
}
```

## BREAKTHROUGH 2026-10-06: SPRT chunk — every sprite id named

`data.win`'s SPRT chunk holds the 109 game sprites as
`count` + a pointer array; each entry's name is a NUL string at the address
stored in the pointer (exactly the OBJT/ROOM rule). Run `sprite_names.py`
-> `sprite_names.json` (`{'index', 'name'}`, 109 entries).

**The sprite id the YYC codegen passes as the first arg of the draw helper
`func_0x0001401755c0` (= draw_sprite_ext) is the SPRT chunk index.**
PROVEN by 100% semantic fit across all 30+ call sites in the annotated C:

| id | name | used by |
|---|---|---|
| 85 (0x55) | Spr_UI_Fade_Black (1px) | Obj_Menu_Fade/Draw, Obj_Night_Shift_End/Draw, Obj_Office_Camera_Control/Draw (fullscreen black overlay) |
| 89 (0x59) | Spr_Night_UI_Time | Obj_Night_Time/Draw (subimg = `time`) |
| 14 | Spr_Menu_Loading_Spinner | Obj_Menu_Loading/Draw |
| 78 | Spr_UI_Night_Number | Obj_Menu_Night_Display/Draw |
| 33 | Spr_Menu_Radio_Arrows | Obj_Menu_Radio_Cassette/Draw, Obj_Menu_Options_Preview/Draw |
| 6 | Spr_Night_UI_Power_Bar | Obj_Night_UI_Power/Draw |
| 17/99/102 | Camera_Button/Freddy_Alert/Key_Hints | Obj_Night_UI_Camera_Button/Draw |
| 16/4/39 | Siris/Sglow/Sring | gml_Script_draw_lensflare |

So: **every `draw_sprite_ext(<id>, ...)` port can now name its sprite** —
replace the id with `sprite_names.json[id]`. Only Obj_Menu_Fade/Draw carried
a sprite TODO; it is applied.

## BREAKTHROUGH 2026-10-07: SOND chunk — every sound id named

`data.win`'s SOND chunk holds the 57 game sounds as `count` + a pointer
array; each entry's first u32 is the name pointer into STRG (same rule as
SPRT/OBJT/ROOM). Run `sound_names.py` -> `sound_names.json`
(`{'index', 'name'}`, 57 entries, 0-56 contiguous).

**The sound id the YYC codegen passes as the first arg of `audio_play_sound`
is the SOND chunk index.** PROVEN by jumpscare sprite/sound pairs in
Obj_Jumpscare/Create (SPRT id already proven above):

| id | name | used by |
|---|---|---|
| 24 | Snd_Jumpscare_Bonnie_1 | Obj_Jumpscare/Create bonnie, with SPRT 77 Spr_Jumpscare_Bonnie_1 |
| 42 | Snd_Jumpscare_Chica_1 | Obj_Jumpscare/Create chica, with SPRT 44 Spr_Jumpscare_Chica_1 |
| 39 | Snd_Jumpscare_Foxy | Obj_Jumpscare/Create foxy, with SPRT 8 Spr_Jumpscare_Foxy |
| 9 | Snd_Jumpscare_Mangle | Obj_Jumpscare/Create mangle, with SPRT 93 Spr_Jumpscare_Mangle |
| 54 | Snd_Jumpscare_Freddy | Obj_Jumpscare/Alarm |
| 32 | Snd_Freddy_Power_Out | Obj_Jumpscare/Create freddy |
| 31 | Snd_Menu_Select | menus, 18 sites, highest count |
| 22 | Snd_Menu_Confirm | menus, 12 sites |
| 48 | Snd_Camera_Click | camera UI, 14 sites |

All 19 sound ids used in GML (84 call sites) fall in 0-56. Applied so far:
Obj_Jumpscare/Create (5 calls), Obj_Filter_Menus/Alarm sprite ids
30/52/68/90 = sprNoise1/Spr_Static_Custom/sprChromatic1/sprMaskWide1
(parity with Obj_Filter_Camera/Alarm, which already used names).

So: **every `audio_play_sound(<id>, ...)` port can now name its sound** —
replace the id with `sound_names.json[id]`. Priority/loop args stay
TODO(calibrate) (runtime pool @0x14065xxxx).

## BREAKTHROUGH 2026-10-06: instance_destroy / event_perform / instance_exists proven; with() loops decoded

Three high-frequency helpers were misguessed earlier and are now PROVEN by
disassembly. Every port using the old guesses was corrected this session.

1. **`func_0x00014017c070(self, other, 0, 0)` = `instance_destroy()`**
   (49 sites; old guess "room_goto_next" was WRONG). It iterates instances
   with scope -1 = self and fires event types 1 (ev_destroy) and 12
   (ev_cleanup) through the runner's event-fire routine. Example:
   Obj_Menu_Fade/Step removes itself when the fade completes — it does NOT
   change rooms.
2. **`func_0x000140181c50(self, other, TYPE, NUM)` = `event_perform(TYPE, NUM)`**
   (50 sites; old guess "room/event transition service / room_goto(N)" was
   WRONG). It tail-calls the runner's event-fire routine with standard GM
   event-type constants. TYPE 2 = ev_alarm. Obj_Menu_Disclaimer/KeyPress_1
   = `event_perform(ev_alarm, 1)`; its Alarm_1 does surface_free + room_goto(1),
   which is how the screen actually advances. Obj_Menu_Pause/Mouse calls
   `event_perform(ev_keypress, vk_escape)` on Obj_Pause to forward the
   click. NOTE: earlier ports that wrote `room_goto(N)` for this helper
   have been fixed; if you find a stale one, re-read it as event_perform.
3. **`func_0x00014017c0e0(self, other, N)` = `instance_exists(N)`**.
   Obj_Pause/KeyPress gates the RoundedRoom cleanup on
   `instance_exists(Obj_Menu_Pause)`.

**The "repeat const" for-loop is a `with()` block.** The shape
`for (helpers 0x140144bd0/0x1401451f0/0x1401449f0; repeat const C)` with body
`0x14017c070(...)` is `with (object C) { instance_destroy(); }` — C is the
OBJECT INDEX (obj_names.json), NOT a loop count. Proven sites: const 49.0 =
Obj_RoundedRoom, 48.0 = Obj_Menu_Pause, 46.0 = Obj_Menu_Options_Preview.
Obj_Menu_Pause/Destroy therefore frees its two surfaces, then destroys every
RoundedRoom overlay and every Menu_Pause instance (itself included).

## BREAKTHROUGH 2026-10-02: object table + object-tagged write helpers

### `obj_names.json` -- every object index -> name (from data.win OBJT)
`data.win`'s OBJT chunk holds the 77 game objects; each entry's name lives
as a NUL-terminated string at the address stored in the chunk's offset
array (absolute file offsets; the string table is the STRG chunk, NOT
"NAME"). Built by walking the chunk directory (see `vari_extract.py`'s
`read_chunks`) and reading `OBJT[count=77][77 * int32 offsets]`.
Run `python exe_strings.py` style lookups are unnecessary now -- just
`json.load(open('obj_names.json'))`. Samples: 2=Obj_Menu_Transition,
12=Obj_Menu_Fade, 29=Obj_Menu_Main_Back, 35=Obj_Menu_Selector,
45=Obj_Pause, 48=Obj_Menu_Pause, 50=Obj_Menu_Options_Icons.
This clears every `instance_deactivate_object(50)` / `object_set_visible(...)`
/ `instance_create_layer(...,obj)` style object-index TODO -- the index is
a real object you can now name.

### Object-tagged variable/property helpers (PROVEN this session)
Three helpers take a **target object index** as their first argument and
read/write a variable on that object (NOT self):

| C pattern | Meaning | GML |
|---|---|---|
| `func_0x00014015fea0(OBJ, builtin_slot, 0x80000000, &val)` | set built-in property on object OBJ | `Obj_Name.image_alpha = val` |
| `func_0x000140160b90(OBJ, var_id, 0x80000000, &val)` | set instance variable (by id) on object OBJ | `Obj_Name.select_y = val` |
| `func_0x000140160480(OBJ, var_id, 0x80000000, &out[, flags])` | read instance variable (by id) from object OBJ | `x = Obj_Name.select_y` |

Proof: Obj_Menu_Continue reads/writes `select_y` (id 0x1876d) only through
the `0x23`-tagged pair above, while `select`/`surface`/`draw_alpha` use the
direct self-fetch (`(*param_1 + 0x10/8)(self, id)`) path in the SAME
function -- the compiler uses two mechanisms because the targets differ.
`0x23` = object 35 = Obj_Menu_Selector, and every writer of `select_y`
(Continue, Customize, Main_Title) tags it `0x23` because they all drive the
shared selector object. Each instance var maps to exactly one tag across
the whole codebase (`arrow_alpha`->0x2e=Obj_Game_Over_Tablet,
`camera_text`->0x2c=Obj_Night_Camera_Tablet, ...). Small tags are real
object indices too: `fade_alpha` tag 1 = Obj_Office_Camera_Control,
`Room_to_go_to` tag 2 = Obj_Menu_Transition, `Tablet_Sprite_Speed` tag 4 =
Obj_Night_Camera_Tablet. The single self-arg property writer
`func_0x000140160140(self, slot, ...)` remains the SELF write.
NOTE: the first arg is the object index, so prefer `Obj_Name.var = value`;
whether the source was a `with(){}` block or a dotted object reference is
not distinguishable from the C -- use the dotted form.

### Slot-name derivation direct from the exe (no EXE-REGISTRY.md needed)
The registry rule "slot `uRam X` -> name at `X-8`" stores a POINTER at
`X-8` into .rdata, not the string itself. Two-step lookup:
1. read the 8-byte little-endian pointer at `X-8`;
2. read the NUL-terminated string at that address.
`exe_strings.py 0x<ptr>` does step 2. Verified: slot 0x1405c7b98 ->
ptr@0x1405c7b90 = 0x14043eecf -> "image_alpha". Resolves slots missing from
EXE-REGISTRY.md (e.g. 0x1405c7b78 = x, 0x1405c7b88 = y, 0x1405c7be8 =
sprite_index). Strings in the STRG-style .data region read directly
(`exe_strings.py 0x1405c39d0` -> "night 1").

## BREAKTHROUGH 2026-09-30: FNAFN.exe registry decoded
- `fnafn/binaries/FNAFN.exe` is BACK in the repo (LFS, restored 18:09).
- The exe's .data section contains the full GML registry as 16-byte
  entries: +0 = pointer to the name string, +8 = the slot the YYC
  codegen references as `uRam<addr>`.
  **Decode rule: slot uRam X -> name at X-8.** Tools: `exe_strings.py`
  (VA reader), outputs `EXE-REGISTRY.md` (684 slot names) and
  `EXE-CONSTANTS.md` (457 RValue constants in the menu range).
- This resolves EVERY runtime funcid slot and string constant. Key
  confirmations/corrections:
  - Slot 0x1405c7b98 = **image_alpha** (NOT `fading`; the old slot proof
    conflated the variable id 0x18719 with the slot it feeds). Fade
    objects fade their own image_alpha; re-check Fade ports.
  - Slot 0x1405c8c20 = surface_free (Disclaimer Alarm_1 confirmed).
  - Slot 0x1405c8d50 = instance_deactivate_layer / 0x1405c8fa0 =
    instance_activate_layer: Obj_Pause Esc pauses layers (Office_back,
    Office_front, Camera_HUD, HUD, AI), not objects.
  - Slot 0x1405c8f90 = audio_pause_all / 0x1405c8fb0 = audio_resume_all.
  - Slot 0x1405c8d90 = instance_create_layer; 0x1405c8d80 = string_width;
    0x1405c8d70 = draw_surface_ext; 0x1405c8da0 = draw_text;
    0x1405c8a50 = surface_exists; 0x1405c8a60 = surface_create;
    0x1405c8d40 = surface_copy; 0x1405c8cb0 = room_goto;
    0x1405c8cc0 = lerp; 0x1405c8ce0 = camera_set_view_pos;
    0x1405c8ab0 = draw_surface.
  - Named scripts resolvable too: scr_OLDTVFilter_{Setup,Settings,Draw},
    customfunct_ui_button_detection, Scr_Camera_Update, etc.
  - Obj_Pause KeyPress spawns instance "Night_end" layer via
    instance_create_layer(0,0,"Night_end",48) on unpause.
  - Obj_Menu_Pause Mouse: "return"/"exit" buttons; exit = room_goto(1).

## Status ledger
- Annotated machine reference: `gml_all_414_decompiled.annotated.c` (USE THIS, not the plain .c)
- Registry id map (variables AND functions, 425 entries): `builtin_ids.json`
- Runtime slot evidence table (216 slots): `SLOT-MAP.md` via `slot_map.py`

### Regular event shapes (batch-portable, established 2026-10-01)
- **`gml_GlobalScript_*` (all 26)**: pure re-exports — they count/declare
  script ids (uStack_40 = N) and run NO GML. Port = empty logic + raw C kept.
  Ported in `scripts/todo/*.gml` (missing todo files for the
  action_draw_sprite / action_if_next_room / action_next_room /
  draw_set_blend_mode wrappers were created).
- **PreCreate 195 B blocks**: single no-arg call `func_0x000140181be0()` =
  `event_inherited();` (result discarded; PreCreate must be emitted because
  GML does not auto-chain). 124 B blocks = empty event, NOT emitted.
  76 `PreCreate.gml` files created for objects whose original PreCreate had
  the call (obj_OLDTVFilter_Logo has no directory in the generated project).
- **Draw 236/272 B no-arg blocks**: single call `func_0x000140175460()` =
  `draw_self()` (TODO calibrate: draw_self vs draw_sprite_ext defaults is
  indistinguishable in YYC). The `func_0x000140175460(param_1)` variant is a
  DIFFERENT (arg-passing) shape — do not batch it.
- Line markers: staged `uStack_XX = 1..N` ints are the ORIGINAL GML source
  line numbers per statement — use them to order/reconstruct statements.
- Runtime constants (`0x14065xxxx`) are outside the mapped exe image —
  mark TODO(calibrate), do not guess.
- **COMMENT PITFALL**: some Ghidra blocks start with
  `/* WARNING: Globals starting with '_' ... */` — pasting that verbatim
  inside a `/* BEGIN DECOMPILED REFERENCE ... */` GML block comment CLOSES
  the comment early (GML block comments do not nest) and the rest of the C
  becomes live code. Convert such lines to `// (Ghidra note) ...`.
  All 763 WARNING comments in `gml_all_414_decompiled.c` are single-line.
- **KEY/MOUSE STUBS WERE EMPTY**: gen_gml_project.py looks up event bodies
  as `gml_Object_<obj>_<ev>_0`, but key/mouse events are numbered
  (KeyPress_69, Mouse_53, ...), so those files generated with EMPTY
  reference bodies. `fill_keymouse_stubs.py` regenerates them with one
  `/* BEGIN ... END */` block per sub-event (WARNING comments sanitized),
  and refuses to overwrite a file containing a real port. Multi-sub-event
  files use per-sub-event comment blocks — do NOT wrap the whole file in
  one outer comment or inserted GML will be commented out (nesting hazard
  above). 34 files fixed 2026-10-02.
- exe const double-vs-string trap: exe_strings.py prints RAW bytes for
  non-ASCII; a value like `333333\xd3?` is the IEEE mantissa of a double
  (0x1405c4988 = 0.3), not text. Decode the 8 bytes as a double first.

### Status ledger (ported files)
- **PORTED to real GML** (with calibrate-TODOs where a slot needs in-game
  verification): Obj_Menu_Disclaimer {Alarm_0, Alarm_1, KeyPress_1},
  Obj_Menu_Warning {Alarm_0, KeyPress_1} (mirror of Disclaimer - identical
  function sizes), Obj_Night_Camera_Switch Create_0, Obj_Menu_Main_Music
  Create_0, Obj_Menu_Fade {Create_0, Step_0, Draw_0},
  Obj_System_Delta_Time Create_0 (reference kept in-file),
  Obj_Menu_Pause {Create_0, Destroy_0, Step_0, Draw_0, Mouse_53},
  Obj_Pause {Create_0, KeyPress_27} (reference kept in-file).
  Session 2026-10-02: Obj_Menu_Transition {Create_0, Step_0, Draw_0}
  (fullscreen transition: surface setup + room-layer deactivation, fade
  image_alpha toward -0.5, then surface_free + room_goto(Room_to_go_to);
  Draw = draw_surface_ext at image_alpha), Obj_Menu_Options {Step_0,
  Destroy_0} (lerp draw_alpha->1 and select_y_final->select_y; on destroy
  instance_deactivate_object/display_reset/window_set_fullscreen/batch room
  service/object_set_visible), Obj_Menu_Continue {Create_0, KeyPress_81,
  Mouse_54} (night-select screen: text_night[0..7] = "night 1".."custom
  night", "exit"; Q / right-click = spawn Obj_Menu_Main_Title on "Main_menu"
  + room_goto_next). Script corrected: customfunct_audio_play_sound_single
  is (snd, priority, loop) = audio_stop_sound(snd); audio_play_sound(...)
  -- the skeleton's 2-param hardcoded-priority form was wrong.
  Corrections 2026-09-30: Disclaimer/Warning KeyPress_1 is
  `if (fading > 0.5)` (exact 0.5 constant decoded), not `> 0`.
  Pause decode notes 2026-09-30: Obj_Pause/KeyPress_27 toggles
  `paused ^= 1` then pauses/unpauses five objects by name via slots
  0x1405c8fa0 (pause) / 0x1405c8d50 (unpause) with name consts
  0x1405c5368..0x1405c5390 (exe data gone), sets Parallax_enabled and
  fade_alpha; Obj_Menu_Pause/Create seeds pause_text[0..1], creates
  pause_surface/back_surface (-1 default), sets alpha_current=0.4 and
  runs a 48-iteration settings scan; Mouse_53 uses the NAMED script
  gml_Script_customfunct_ui_button_detection (direct symbol — first
  GML-name-level function call seen in the YYC output).
- Helper semantics established 2026-09-30 (evidence in the ported files):
  `0x140181c50(self, other, 2, N)` = room/event transition service
  (50 sites, first service arg always 2; N ∈ {0,1,Room_to_go_to});
  `0x14017c070(self, other, 0, 0)` = no-arg room service (49 sites;
  best-fit room_goto_next, unproven); `0x1401755c0(self, 0x55, 0, 0, 0,
  1280.0, 736.0, 0, 0, alpha)` = fullscreen draw with alpha (Fade's Draw).
- Remaining: ~390 game-logic functions. Recipe per function:
  1. open its block in the annotated C
  2. decode using the pattern table above (ids via builtin_ids.json,
     doubles via the hex table, fast-path writes = property sets)
  3. replace the reference body in the object's .gml
  4. mark calibrate-TODOs where a VARREF/property name is ambiguous
- The `scripts/todo/` files still hold raw C; port them object by object,
  starting with small Create/Alarm events (40-60 lines of GML each).

## BREAKTHROUGH 2026-10-08: script .gml linkage (the black-screen blocker)
Symptom (Windows + Android): first script-function call dies at runtime
(`Variable Obj_X.name(...) not set before reading it`), builtins fine,
compile clean. MINI repro (1 room + 1 object + 1 script) failed identically,
so NOT project-specific. ProcMon on GMSC showed it probing
`scripts/test_fn/test_fn.gml` (PATH NOT FOUND) and never opening the flat
sibling `scripts/test_fn.gml`. Rule (decompile-confirmed in
GMAssetCompiler.dll `GMScript.GetScriptFilename` + silent skip on missing
file): a script's code MUST live at `<yy-dir>/<name>/<name>.gml`, i.e.
per-script subfolders `scripts/<Name>/<Name>.yy + <Name>.gml`, like every
other resource kind. Flat `scripts/<Name>.yy` + `scripts/<Name>.gml`
siblings register the name but compile to EMPTY stubs with NO error.
Fix: gen_yy_wiring.py now copies ported/|todo/ bodies byte-exact into the
subfolders and validates every body is present; MINI passes (TEST_FN_RAN).
Aside: yyp `defaultScriptType` (ours 1 vs IDE-canonical 0) and `isEcma`
(true/false) change nothing for this; `option_ecma` (absent = GML) selects
the .gml vs .js extension.
