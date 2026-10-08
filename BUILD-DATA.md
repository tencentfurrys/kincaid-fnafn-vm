# BUILD-DATA: getting runnable game data out of this project

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
On first load the IDE relinks resources; expect one manual fix:
- Multi-sub-event files (`Alarm.gml` with Alarm_0+Alarm_1, `Mouse.gml`
  with Mouse_53+Mouse_54, etc. - 12 files total) share one .gml across
  several event entries. Split each sub-event into its own IDE event;
  the `// ---- sub-event <Type>_<N>` headers mark the cut points.
  (Scripts need NO manual step: gen_yy_wiring.py already copies the
  canonical bodies into scripts/<Name>/<Name>.gml beside each .yy.)

## (c) Build an executable / APK
- Windows: Build -> Create Executable. Output next to the project is a
  new `data.win` + runner exe - the rebuilt FNAFN.
- Android: requires the Android (YYC) export module plus SDK/NDK, already
  on this box at `C:\Android\android-sdk`. Set them in
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
