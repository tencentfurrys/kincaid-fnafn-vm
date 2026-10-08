# BACKUP GUIDE — kincaid-fnafn-vm (private backup of the FNAFN VM project)

Public savepoint: `tencentfurrys/kincaid-fnafn-savepoint` (origin).
This private repo (`backup` remote): full history + LFS + the bootable
`output/FNAFN/FNAFN.win`. Excluded by `.gitignore` (regenerable):
`output/` (other files), `out/` (extracted assets), `kincaid-v202509-FNAFN-vm-donor*.apk*`.

## 1. Repo map

| Path | What |
|---|---|
| `FNAFN-GML-project/` | GameMaker project (289 resources: 77 objects, 37 scripts, 9 rooms, 109 sprites, 57 sounds). Open `FNAFN.yyp` in GM IDE. |
| `fnafn/binaries/` | Original YYC build: `data.win` (326 MB, NO code), `FNAFN.exe` (decoder source), `options.ini`, `ram.dll`. |
| `kincaid/binaries/` | Donor APKs: `Kincaid-universal-v1.0.apk` (2.6.1-era), `kincaid-v2025.9-INPUTFIX.apk`, `kincaid-v2025.9-wolf-andbear-stage-fixed.apk`, signing key `kincaid/opencode-debug.jks` (storepass/keypass `opencode`, alias `opencode` — see `kincaid/KINCAID-HANDOFF-V2.txt`). |
| `output/FNAFN/FNAFN.win` | **Bootable artifact**: VM build (CODE+VARI), zero GML errors, boots to menu main loop on Windows. Rebuild: section 3. |
| `*.json` maps | `sprite_names` (109), `sound_names` (57), `room_names` (9), `obj_names` (77), `builtin_ids` (425), `pool-map` (521 pool addrs: 255 exact-exe / 266 runtime-only). |
| Docs | `PORTING.md` (decode patterns + breakthroughs), `PROGRESS.md` (session log), `BUILD-DATA.md` (build steps), `ASSETS-SCAFFOLD.md` (placeholders), `ASSET-EXTRACT-NOTES.md` (formats). |

## 2. Pipeline scripts (run in this order for a fresh checkout)

1. `python3 sound_names.py` → SOND sound index→name (57).
2. `python3 room_instances.py` → fills 9 rooms (86 instances).
3. Script wiring: bodies live canonical in `scripts/ported|todo/*.gml`;
   `python3 gen_yy_wiring.py` copies each into `scripts/<Name>/<Name>.gml`
   beside its `scripts/<Name>/<Name>.yy` (per-script subfolders are REQUIRED:
   GMSC resolves code as `<yy-dir>/<name>/<name>.gml` and SILENTLY compiles
   an empty stub otherwise -- flat siblings do not link, proven 2026-10-08).
   Re-run gen_yy_wiring.py after editing any ported/|todo/ body.
4. `python3 split_combined_events.py` → splits multi-sub-event files (idempotent; fixes its own MULTILINE bug era).
5. `python3 sanitize_reference_comments.py` → neutralizes nested C comments (168 files; else 12 GML errors).
6. `python3 gen_yy_wiring.py` → regenerates all 297 `.yy` + `FNAFN.yyp` (runs `format_2026.py` internally; VALIDATION OK). Preserves room instances.
7. Igor VM build (section 3).

## 3. VM compile (GameMaker LTS 2026, `C:\Program Files\GameMaker-LTS2026`)

Needs: IDE login (license), runtime `2026.0.0.23` in `%PROGRAMDATA%\GameMakerStudio2-LTS2026\Cache\runtimes`.

```powershell
$igor="$env:PROGRAMDATA\GameMakerStudio2-LTS2026\Cache\runtimes\runtime-2026.0.0.23\bin\igor\windows\x64\Igor.exe"
$proj="<repo>\FNAFN-GML-project\FNAFN.yyp"; $rt="<...>\runtime-2026.0.0.23"
& $igor --project="$proj" --runtimePath="$rt" -r=VM --cache="<tmp>\gmcache" --temp="<tmp>\gmtemp" --config=Default --uf="$env:APPDATA\GameMakerStudio2-LTS2026" -j=4 Windows Compile
& $igor ...same... Windows Run   # boots Rm_Menu_Custom_Night; .win lands in output/FNAFN/
```

`Windows Package` currently exits after LOAD AND LINK without emitting — use Compile/Run.
Known schema gotchas (all handled): `$`/`%Name` tags, alphabetical keys, `eventNum` (not `eventSubtype`), `instanceCreationOrder`, yyp id-refs + RoomOrderNodes, PreCreate events dropped from `.yy` (compiler has no type-14 slot; files kept on disk).

## 4. Donor APK (device test)

```powershell
python3 build_vm_donor_apk.py   # v2025.9 runner + output/FNAFN/FNAFN.win → unsigned APK, asserts only game.droid differs
zipalign -f -p 4 unsigned aligned; apksigner sign --ks kincaid/opencode-debug.jks --ks-pass pass:opencode --key-pass pass:opencode --ks-key-alias opencode
apksigner verify signed.apk
```

Install: uninstall existing Kincaid first (different cert), `adb install`, read logcat. Expected outcomes: menu boot (white boxes/silence) / load crash (paste tombstone) / hang. Fallbacks if bytecode rejected: other v2025.9 donor → 2.6.1 donor → compile with older runtime.

## 5. Status and next work

Done: 351 unique ports, 66 audio calls named, SOND/SPRT/ROOM/OBJT/AUDO/TXTR/TPAG decoded, `asset_extract.py` → `out/assets` (429 PNGs, 54 audio) — REGENERATE with that script (excluded from backup).
Placeholders live: 109 white-box sprites, silent WAVs, ~110 runtime-only pool consts, 3 external sounds (`Snd_Loading`, `Snd_Menu_Theme`, `Snd_Menu_Theme_Radio`), no shaders/fonts resources, 12 manual IDE splits documented in BUILD-DATA.md.
Next: import real art/audio → rebuild → new donor → room-by-room calibration against the exe (pool-map.json marks the 110 runtime addrs).

## 6. Secrets

No tokens/keys are stored in this repo. The backup PAT used for the initial push was single-use (revoke after use). Signing key password documented in `kincaid/KINCAID-HANDOFF-V2.txt`.
