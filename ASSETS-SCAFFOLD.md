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

## Importing real assets (DONE 2026-10-07 by `import_assets.py`)

Real sprites + audio were imported straight from `fnafn/binaries/data.win`
(no UndertaleModTool needed):
- `sprites/<Name>/`: 109 sprites, 1124 frames total (TPAG linkage resolved
  exactly: each SPRT record carries frame count + inline TPAG-pointer array
  at +88; every TPAG index used once, TPAG 242 unused). Frame = sprite-size
  RGBA canvas, src crop pasted at (tgt_x,tgt_y); origins/bbox/playback speed
  from SPRT fields (speed 0.0 = default 30.0; bbox clamped to the frame).
- `sounds/<Name>/`: 54 real sounds swapped in (53 WAV copied byte-identical,
  `Snd_Office_Unsettle` OGG decoded to PCM16 WAV via the runtime ffmpeg);
  .yy keeps the accepted GMSound shape, only duration/sampleRate/volume
  updated (volume from SOND). The 3 external/streamed sounds
  (`Snd_Loading`, `Snd_Menu_Theme`, `Snd_Menu_Theme_Radio`, SOND
  audio_idx=-1, no embedded bytes in data.win) keep silent placeholders.
- `.imported_real` sentinels mark imported dirs: `gen_yy_wiring.py`
  `wire_sprites()`/`wire_sounds()` skip them, so re-running the generator
  (and `format_2026.convert_all`, which preserves multi-frame sprites) is
  safe. Remaining work: assign real sprites to objects (`spriteId`), tune
  options.
