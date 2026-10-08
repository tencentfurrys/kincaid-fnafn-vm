# SESSION HANDOFF — resume here (box was dying, state saved 2026-10-08 ~00:40 CUT)

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
