# SESSION HANDOFF — resume here (box was dying, state saved 2026-10-08 ~00:40 CUT)

> ## Session 2026-10-08 (this box) — THE SCRIPT BLOCKER IS FIXED
> - Fresh box: installed GameMaker LTS 2026 (IDE 16) + runtime 2026.0.0.23
>   (public installer https://gms.yoyogames.com/GameMaker-Installer-2026.0.0.16.exe;
>   user signed in). No APK/Android SDK here — Windows VM iteration only.
> - **Root cause of black-screen blocker** (all script calls dying at runtime):
>   scripts lived FLAT (`scripts/<N>.yy` + `scripts/<N>.gml`); GMSC resolves
>   code as `<yy-dir>/<name>/<name>.gml` and SILENTLY compiles empty stubs
>   otherwise (proven by ProcMon + ilspycmd decompile of
>   `GMScript.GetScriptFilename`). Fix: per-script subfolders
>   (`scripts/<N>/<N>.yy + <N>.gml`, bodies copied byte-exact from
>   ported/|todo/); gen_yy_wiring.py + format_2026.py updated + validation
>   asserts every body present. MINI repro passes (TEST_FN_RAN).
> - `draw_lensflare` is an 8-arg real function (23 KB C, unported) but only
>   the re-export stub existed → arity error now that scripts link. Temporary
>   8-param no-op shim in scripts/ported/draw_lensflare.gml (TODO: real port).
> - Boot chain fixes (all VM-parity, YYC was lenient/baked): guarded
>   game_load+music in Filter Creates (game_settings), bool/real conversions
>   in game_load tail (YYGB strict builtins), `globalvar` declarations for 67
>   proven-shared globals (scripts/ported/__fnafn_globals.gml; zero ids use
>   both paths), seeds (delta_factor=1, game_font=[-1,-1], AI levels=0,
>   toggle=0), 5 MCN instance creation codes (animatronic text/AI),
>   script_execute(Setup) for the iRam slot, DebugLog instance removed from
>   MCN room (suspected in a fail-fast; re-add carefully if needed).
> - Game now boots MCN room: Creates → Steps → first Draws; iterating via
>   dialogs (each names the next missing seed). gamerun/ =
>   Temp\1\opencode\gamerun (Runner.exe + FNAFN.win); screenshots via
>   Temp\1\opencode\screen.py; MINI repro at Temp\1\opencode\mini.
> - Remaining ports: Obj_Menu_Options_Preview/Alarm_1 (last of 17 gaps),
>   12 RoomCC + 5 Room_Create functions (instance-code mapping known from
>   data.win ccode refs), draw_lensflare real port, font import.
>
> Original session notes below (old box).

## Where everything is
- Repo: `C:\Users\RDP\Documents\Default Project\kincaid-fnafn-savepoint`, branch `main`,
  remotes `origin` (public savepoint) + `backup` (`tencentfurrys/kincaid-fnafn-vm`, private).
- GameMaker LTS 2026: `C:\Program Files\GameMaker-LTS2026\GameMaker-LTS2026.exe` (user logged in).
- Runtime 2026.0.0.23, Igor:
  `$env:PROGRAMDATA\GameMakerStudio2-LTS2026\Cache\runtimes\runtime-2026.0.0.23\bin\igor\windows\x64\Igor.exe`
- Screenshot tool: `C:\Users\RDP\AppData\Local\Temp\1\opencode\shot.py <pid>` → `game_shot.png` (read it as image).
- Direct game launch: `gamerun\Runner.exe -game FNAFN.win` (FULL filename required; `-game FNAFN` fails).
- Donor APKs (signed, in `~/Downloads`): `kincaid-v202509-FNAFN-vm-dbglog2.apk` = latest device build.

## Commits on main (all pushed to backup unless noted — VERIFY with git log)
Up to `c8fbf56` (APK untrack) pushed. Uncommitted at handoff: event-filename migration
(`fix_event_filenames.py`), OLDTV no-op shims, Debug_Log logger, imports — MUST COMMIT FIRST.

## Current game state (Windows, proven by screenshots)
- Zero-error compile. Game boots to room main loop.
- **BLOCKER: every script-defined global function call fails at runtime**
  (`Variable Obj_X.name not set before reading it`), incl. the oldest ported
  `customfunct_ui_button_detection` and new `dbg_log`. Builtins + literals work.
  Compile binds names fine; failure is runtime-only. `asset_get_index` → -1.
- Proven by bisection (screenshots in session): show_message works; FIRST bare
  script-function name evaluated always dies. Empty-body theory dead (bodied
  shims fail identically). Stale-build theory dead (FRESH123 marker found in binary).
- Prime suspect (UNPROVEN): script .gml bodies not linked into compiled scripts
  (all 37 script assets exist in yyp + on disk + compile clean, but no function
  ever executed). Compare against a MINIMAL project (scaffold ready):
  `C:\Users\RDP\AppData\Local\Temp\1\opencode\mini\` (built by `mkmini.py`;
  1 room + 1 object calling `test_fn()` + 1 script). Compile + run it:
  if MINI FAILS identically → environment/runner issue; if MINI WORKS → diff its
  script .yy/.gml handling vs ours to find the linkage break.
- Related finds: event .gml files REQUIRE `_<num>` suffix (`Create_0.gml`, not
  `Create.gml`) — 180→1 empty events after rename; nested C comments inside
  reference blocks needed sanitizing (`sanitize_reference_comments.py`);
  `instance_number(obj)` takes ONE arg (fixed in Debug Step).

## Device state (Xiaomi)
- v2025.9 donor + VM .win: boots, NO crash = runner accepts 2026 bytecode.
- Black screen + silent + no overlay == same script-call blocker (room Creates die
  before first draw). Next device build must come AFTER the script fix.
- Log access still open: wireless ADB over Tailscale (needs phone IP/port) or
  Shizuku logcat app. In-game overlay logger exists (`Obj_Debug_Log`, triple-tap
  top-left toggles) but never got to draw.

## Next steps in order
1. Commit everything now.
2. Run the MINI repro test above.
3. Fix script linkage → rebuild → screenshot Windows boot (expect menu art + overlay).
4. New donor APK → device test → calibrate (~110 runtime pool consts, `pool-map.json`).
5. Import real shaders/fonts; remove debug objects; in-game calibration room by room.
