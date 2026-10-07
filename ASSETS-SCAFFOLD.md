# ASSETS-SCAFFOLD: placeholder sprites / sounds / folders / options

The GameMaker project in `FNAFN-GML-project/` is now structurally
complete: the IDE can open `FNAFN.yyp` and attempt a Windows **VM**
(non-YYC) compile. All artwork and audio are **placeholders** that
prove the resources compile; real assets get imported later.

## What was generated (by `gen_yy_wiring.py`, re-run safe)

- `folders/`: 5 `GMFolder` stubs (Objects, Rooms, Scripts, Sounds,
  Sprites) so the existing `parent` refs in script/room `.yy` files
  (`folders/Scripts.yy`, `folders/Rooms.yy`) resolve.
- `options/main/options_main.yy`: `GMMainOptions` 1.4, all
  default/sane values (game speed 60, window colour white, stable
  scaffold `option_gameguid` derived from `"FNAFN"`).
- `options/windows/options_windows.yy`: `GMWindowsOptions` 1.1,
  display name `FNAFN`, executable `FNAFN.exe`, VM-friendly defaults
  (no elevated texture page, vsync off). Build via
  Build -> Create Executable (Target: Windows, VM) — NOT YYC.
- `sprites/`: 109 `GMSprite` 2.0 resources (one per name in
  `sprite_names.json`, index 0-108). Each has one 32x32 opaque-white
  RGBA PNG frame (pure-stdlib `zlib`+`struct`, no PIL) written to the
  exact frame/layer `.png` paths the `.yy` references (2 PNGs per
  sprite, identical bytes). Bounding box = full 32x32, origin (0,0),
  30fps single-frame sequence.
- `sounds/`: 57 `GMSound` 1.0 resources (one per name in
  `sound_names.json`, index 0-56). Each has a 0.1s silent 8-bit mono
  WAV (44100 Hz, pure-stdlib header, silence = `0x80` centre).
- `FNAFN.yyp`: `resources` = 77 GMObject + 37 GMScript + 9 GMRoom +
  109 GMSprite + 57 GMSound = **289**; `Folders` lists the 5 folders;
  `Options` lists Main + Windows. `gen_yy_wiring.py` validation
  (`VALIDATION OK`) asserts all of this on every run.

## Deliberately left for the IDE / real import

- Object `spriteId` is `null` everywhere — per-object sprite mapping
  needs game-by-game assignment, out of scope for the scaffold.
- `texturegroups/Default` and `audiogroups/audiogroup_default` are
  referenced but have no `.yy` on disk; the IDE auto-creates both
  default groups on first load.
- Option values are defaults (collision compatibility off, legacy
  flags default, x86 runner). The original is likely a GMS-1.4-era
  game (see `__background_*` / `action_*` compat scripts), so legacy
  behaviour flags may need tuning against real gameplay later.

## Importing real assets (replaces the placeholders)

1. Export Sprites/Sounds from `fnafn/binaries/data.win` with
   UndertaleModTool (see `BUILD-DATA.md` step (a)).
2. In the IDE, replace each placeholder frame/WAV (or delete the
   scaffold `sprites/<Name>/` + `sounds/<Name>/` content and import).
3. Assign real sprites to objects (`spriteId`), tune options.
4. **Do NOT re-run `gen_yy_wiring.py` after the real import** —
   `wire_sprites()`/`wire_sounds()` regenerate placeholders and would
   clobber real art/audio (stale PNG/WAV pruning included).
