/// @description FNAFN Obj_Menu_Options / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Draw_0
// Decoded in order (uStack_80 = GML line markers):
//   1-9. if (!surface_exists(S)) S = surface_create(room_width, room_height)
//      for S in main_surface (id 0x18734), video_surface (0x1879a),
//      audio_surface (0x186e4), pref_surface (0x1875c). surface_exists/
//      surface_create = slots 0x1405c8a50/0x1405c8a60 (EXE-REGISTRY.md);
//      room_width/room_height = slots 0x1405c7b08/0x1405c7b18.
//   0x17. draw_sprite(Spr_Menu_Fade_Overlay, 0, 0, 0): 4-arg helper
//      0x140175550(self, 0x2a, 0, 0, 0); sprite 0x2a = 42 =
//      Spr_Menu_Fade_Overlay (sprite_names.json); same shape as
//      Obj_Menu_Continue/Draw (best-fit draw_sprite).
//   0x18-0x1a. draw_set_alpha(draw_alpha) [0x18712, float setter
//      0x14018d0b0]; draw_set_font(game_font[0]) [global id 0x18725 +
//      index dance]; draw_set_color(colour_pink) [id 0x186f5 via
//      0x14018d100].
//   0x1c. draw_set_alpha(0.5) [float const _UNK_14043b460 = 0.5f].
//   0x1d. draw_rectangle_colour(8, select_y_final, 600, select_y_final + 48,
//      colour_pink x4, <runtime>) [9-arg slot 0x1405c8ee0 = registry
//      draw_rectangle_colour; x1 = 8.0 @0x1405c46a8, x2 = 600.0 @0x1405c46b8,
//      +48 via += helper 0x14000bf90; last arg (outline) is runtime const
//      @0x140655aa0].
//   0x1e. draw_set_alpha(1.0) [float const _UNK_14043b464 = 1.0f].
//   0x20-0x21. draw_set_valign(fa_bottom) [0x140175540(2), cf.
//      Obj_Menu_Loading/Draw] + draw_set_halign(fa_center) [0x140175530(1)].
//   0x22/0x25/0x28/0x2b/0x2e. draw_text_transformed(X, 108, text_options[i],
//      text_scale[i], text_scale[i], <runtime>) [6-arg slot 0x1405c8ef0;
//      X = 94/320/640/960/1186 (@0x1405c46c8/@0x1405c46e8/@0x1405c46f8/
//      @0x1405c4708/@0x1405c4718, exe .data doubles), y = 108.0 @0x1405c46d8,
//      angle is runtime const @0x140655aa0].
//   0x31-0x34. draw_set_valign(fa_top) [175540(0)], draw_set_halign(fa_right)
//      [175530(2)], draw_set_font(0) [175520(0), literal].
//   0x36/0x40/0x4a/0x51. surface_set_target(S) [1-arg 0x1401756b0] then
//      label column draw_text(384, y, text_X[i]) [3-arg slot 0x1405c8da0 =
//      draw_text; x = 384.0 @0x1405c4728; y = 192/256/320/384/448
//      (@0x1405c4738/@0x1405c4748/@0x1405c46e8/@0x1405c4728/@0x1405c4758)]
//      then surface_reset_target() [no-arg 0x140183c00], for S/text =
//      video_surface/text_video[0..4], audio_surface/text_audio[0..1],
//      pref_surface/text_pref[0..1], <id-0x186d1-slot>/text_access[0..4]
//      (the 4th surface reads the instance slot whose registry name is
//      customfunct_ui_button_detection_x — Create seeds it to -1, so
//      confirm the live value in-game).
//   0x5b-0x5f. draw_set_font(game_font[0]); surface_set_target(main_surface);
//      draw_line(<runtime>, 118, 1280, 118) / draw_line(<runtime>, 646, 540,
//      646) / draw_line(740, 646, 1280, 646) [4-arg slot 0x1405c8f00 =
//      draw_line; consts 118.0 @0x1405c4768, 1280.0 @0x1405c4778, 646.0
//      @0x1405c4788, 540.0 @0x1405c4798, 740.0 @0x1405c47a8; x1 of the first
//      two is runtime const @0x140655aa0].
//   0x60-0x62. draw_set_halign(fa_left) [175530(0)];
//      draw_text(1186, 656, text_options[6]) [x @0x1405c4718, y @0x1405c47b8
//      = 656.0]; draw_set_halign(fa_right); draw_set_font(0);
//      draw_text(94, 656, text_options[5]) [x @0x1405c46c8 = 94.0].
//   99-100. surface_reset_target(); draw_surface(main_surface, <runtime>,
//      <runtime>) [slot 0x1405c8ab0; both coords runtime @0x140655aa0].
//   0x67-0x6a. draw_set_halign(fa_right); draw_set_font(0);
//      switch (menu) over "video"/"audio"/"preferences"/"accessibility"
//      (guarded pool @0x140655ab0, exe .data strings @0x1405c4668..80):
//      the 4 case bodies are indirect jumps Ghidra could not recover;
//      non-matching menu falls through to draw_set_font(game_font[0]).
// Reading: the options screen composites four label surfaces plus the main
// surface: tab bar on top, per-tab label columns at x = 384, separator
// lines, and exit/reset-data buttons at the bottom.
// TODO(calibrate): 0x140175550 identity (best-fit draw_sprite);
// draw_rectangle_colour outline + draw_text_transformed angle +
// draw_surface/draw_line runtime consts @0x140655aa0 (likely 0/false);
// draw_set_font(0) literal (default-font index?); 4th label surface
// (id-0x186d1 slot); the 4 menu-switch case bodies (jumptable unrecovered —
// best guess each blits its tab surface, verify in-game).
if (!surface_exists(main_surface)) {
    main_surface = surface_create(room_width, room_height);
}
if (!surface_exists(video_surface)) {
    video_surface = surface_create(room_width, room_height);
}
if (!surface_exists(audio_surface)) {
    audio_surface = surface_create(room_width, room_height);
}
if (!surface_exists(pref_surface)) {
    pref_surface = surface_create(room_width, room_height);
}
draw_sprite(Spr_Menu_Fade_Overlay, 0, 0, 0); // TODO(calibrate): helper 0x140175550 identity best-fit
draw_set_alpha(draw_alpha);
draw_set_font(game_font[0]);
draw_set_color(colour_pink);
draw_set_alpha(0.5); // float const _UNK_14043b460
draw_rectangle_colour(8, select_y_final, 600, select_y_final + 48, colour_pink, colour_pink, colour_pink, colour_pink, false /* TODO(calibrate): runtime const @0x140655aa0 */);
draw_set_alpha(1.0); // float const _UNK_14043b464
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text_transformed(94, 108, text_options[0], text_scale[0], text_scale[0], 0 /* TODO(calibrate): runtime const @0x140655aa0 */);
draw_text_transformed(320, 108, text_options[1], text_scale[1], text_scale[1], 0 /* TODO(calibrate): same */);
draw_text_transformed(640, 108, text_options[2], text_scale[2], text_scale[2], 0 /* TODO(calibrate): same */);
draw_text_transformed(960, 108, text_options[3], text_scale[3], text_scale[3], 0 /* TODO(calibrate): same */);
draw_text_transformed(1186, 108, text_options[4], text_scale[4], text_scale[4], 0 /* TODO(calibrate): same */);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_set_font(0); // TODO(calibrate): literal 0
surface_set_target(video_surface);
draw_text(384, 192, text_video[0]);
draw_text(384, 256, text_video[1]);
draw_text(384, 320, text_video[2]);
draw_text(384, 384, text_video[3]);
draw_text(384, 448, text_video[4]);
surface_reset_target();
surface_set_target(audio_surface);
draw_text(384, 192, text_audio[0]);
draw_text(384, 256, text_audio[1]);
surface_reset_target();
surface_set_target(pref_surface);
draw_text(384, 192, text_pref[0]);
draw_text(384, 256, text_pref[1]);
surface_reset_target();
surface_set_target(customfunct_ui_button_detection_x); // TODO(calibrate): id-0x186d1 slot (Create seeds -1) — verify live surface in-game
draw_text(384, 192, text_access[0]);
draw_text(384, 256, text_access[1]);
draw_text(384, 320, text_access[2]);
draw_text(384, 384, text_access[3]);
draw_text(384, 448, text_access[4]);
surface_reset_target();
draw_set_font(game_font[0]);
surface_set_target(main_surface);
draw_line(0 /* TODO(calibrate): runtime const @0x140655aa0 */, 118, 1280, 118);
draw_line(0 /* TODO(calibrate): same */, 646, 540, 646);
draw_line(740, 646, 1280, 646);
draw_set_halign(fa_left);
draw_text(1186, 656, text_options[6]);
draw_set_halign(fa_right);
draw_set_font(0); // TODO(calibrate): literal 0
draw_text(94, 656, text_options[5]);
surface_reset_target();
draw_surface(main_surface, 0 /* TODO(calibrate): runtime const @0x140655aa0 */, 0 /* TODO(calibrate): same */);
draw_set_halign(fa_right);
draw_set_font(0); // TODO(calibrate): literal 0
switch (menu) {
    case "video": // TODO(calibrate): case body unrecovered (Ghidra jumptable) — likely blits video_surface; verify in-game
        break;
    case "audio": // TODO(calibrate): same — likely blits audio_surface
        break;
    case "preferences": // TODO(calibrate): same — likely blits pref_surface
        break;
    case "accessibility": // TODO(calibrate): same
        break;
    default:
        draw_set_font(game_font[0]);
        break;
}
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Options_Draw_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  double *pdVar6;
  undefined8 *puVar7;
  longlong *plVar8;
  longlong *plVar9;
  longlong lVar10;
  longlong unaff_GS_OFFSET;
  double dVar11;
  undefined8 uStack_240;
  uint uStack_234;
  undefined8 uStack_230;
  uint uStack_224;
  undefined8 uStack_210;
  double *pdStack_1e8;
  double *pdStack_1e0;
  double *pdStack_1d8;
  double *pdStack_1d0;
  double *pdStack_1b8;
  undefined8 uStack_1b0;
  uint uStack_1a4;
  undefined8 uStack_1a0;
  uint uStack_194;
  double *pdStack_190;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  undefined4 uStack_f0;
  uint uStack_ec;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  undefined8 uStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043b468;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_1a4 = 0xffffff;
  uStack_1b0 = 0;
  uStack_194 = 0xffffff;
  uStack_1a0 = 0;
  plRam0000000140657680 = param_1;
  pdStack_190 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_78 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_234 = 0xffffff;
  uStack_240 = 0;
  uStack_224 = 0xffffff;
  uStack_230 = 0;
  uStack_80 = 1;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  pdStack_1b8 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18734);
  func_0x000140001490(&uStack_188,pdStack_1b8);
  puStack_e8 = &uStack_188;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8a50,&puStack_e8);
  cVar2 = func_0x00014012bb70(uVar5);
  if (cVar2 == '\0') {
    uStack_80 = 3;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0;
    uStack_ec = 5;
    pdStack_1b8 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18734);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_1b0);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_1a0);
    func_0x000140001490(&uStack_178,&uStack_1b0);
    puStack_e0 = &uStack_178;
    func_0x000140001490(&uStack_168,&uStack_1a0);
    puStack_d8 = &uStack_168;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_f8,2,uRam00000001405c8a60,&puStack_e0);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdStack_1b8,uVar5);
    func_0x000140141c50(1);
  }
  uStack_80 = 5;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  pdStack_1e8 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1879a);
  func_0x000140001490(&uStack_188,pdStack_1e8);
  puStack_e8 = &uStack_188;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8a50,&puStack_e8);
  cVar2 = func_0x00014012bb70(uVar5);
  if (cVar2 == '\0') {
    uStack_80 = 7;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0;
    uStack_ec = 5;
    pdStack_1e8 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x1879a);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_1b0);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_1a0);
    func_0x00014001f910(&uStack_a0,&uStack_1b0,_UNK_140439e68);
    func_0x000140001490(&uStack_178,&uStack_a0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    puStack_e0 = &uStack_178;
    func_0x000140001490(&uStack_168,&uStack_1a0);
    puStack_d8 = &uStack_168;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_f8,2,uRam00000001405c8a60,&puStack_e0);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdStack_1e8,uVar5);
    func_0x000140141c50(1);
  }
  uStack_80 = 9;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  pdStack_1e0 = (double *)(**(code **)(*param_1 + 8))(param_1,0x186e4);
  func_0x000140001490(&uStack_188,pdStack_1e0);
  puStack_e8 = &uStack_188;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8a50,&puStack_e8);
  cVar2 = func_0x00014012bb70(uVar5);
  if (cVar2 == '\0') {
    uStack_80 = 0xb;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0;
    uStack_ec = 5;
    pdStack_1e0 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x186e4);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_1b0);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_1a0);
    func_0x00014001f910(&uStack_a0,&uStack_1b0,_UNK_140439e68);
    func_0x000140001490(&uStack_178,&uStack_a0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    puStack_e0 = &uStack_178;
    func_0x000140001490(&uStack_168,&uStack_1a0);
    puStack_d8 = &uStack_168;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_f8,2,uRam00000001405c8a60,&puStack_e0);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdStack_1e0,uVar5);
    func_0x000140141c50(1);
  }
  uStack_80 = 0xd;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  pdStack_1d8 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1875c);
  func_0x000140001490(&uStack_188,pdStack_1d8);
  puStack_e8 = &uStack_188;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8a50,&puStack_e8);
  cVar2 = func_0x00014012bb70(uVar5);
  if (cVar2 == '\0') {
    uStack_80 = 0xf;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0;
    uStack_ec = 5;
    pdStack_1d8 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x1875c);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_1b0);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_1a0);
    func_0x00014001f910(&uStack_a0,&uStack_1b0,_UNK_140439e68);
    func_0x000140001490(&uStack_178,&uStack_a0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    puStack_e0 = &uStack_178;
    func_0x000140001490(&uStack_168,&uStack_1a0);
    puStack_d8 = &uStack_168;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_f8,2,uRam00000001405c8a60,&puStack_e0);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdStack_1d8,uVar5);
    func_0x000140141c50(1);
  }
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  pdStack_1d0 = (double *)(**(code **)(*param_1 + 8))(param_1,0x186d1);
  func_0x000140001490(&uStack_188,pdStack_1d0);
  puStack_e8 = &uStack_188;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8a50,&puStack_e8);
  cVar2 = func_0x00014012bb70(uVar5);
  if (cVar2 == '\0') {
    uStack_80 = 0x13;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0;
    uStack_ec = 5;
    pdStack_1d0 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x186d1);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_1b0);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_1a0);
    func_0x00014001f910(&uStack_a0,&uStack_1b0,_UNK_140439e68);
    func_0x000140001490(&uStack_178,&uStack_a0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    puStack_e0 = &uStack_178;
    func_0x000140001490(&uStack_168,&uStack_1a0);
    puStack_d8 = &uStack_168;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_f8,2,uRam00000001405c8a60,&puStack_e0);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdStack_1d0,uVar5);
    func_0x000140141c50(1);
  }
  uStack_80 = 0x17;
  func_0x000140175550(param_1,0x2a,0,0,0);
  uStack_80 = 0x18;
  pdVar6 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18712);
  if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdVar6;
  }
  else {
    dVar11 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x00014018d0b0((float)dVar11);
  pdVar6 = pdStack_190;
  uStack_80 = 0x19;
  if (((*(uint *)((longlong)pdStack_190 + 0xc) & 0xffffff) == 2) && (*pdStack_190 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdStack_190);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*pdStack_190);
      pdVar6 = (double *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
      goto code_r0x00014007e831;
    }
    pdVar6 = (double *)func_0x000140147980(*pdStack_190,0);
    if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) != 0) goto code_r0x00014007e83a;
code_r0x00014007e844:
    dVar11 = *pdVar6;
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
code_r0x00014007e831:
    if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) goto code_r0x00014007e844;
code_r0x00014007e83a:
    dVar11 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x000140175520((longlong)dVar11);
  uStack_80 = 0x1a;
  pdVar6 = (double *)(**(code **)(*param_1 + 8))(param_1,0x186f5);
  if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdVar6;
  }
  else {
    dVar11 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x00014018d100((longlong)dVar11);
  uStack_80 = 0x1c;
  func_0x00014018d0b0(_UNK_14043b460);
  uStack_80 = 0x1d;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  puVar7 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x1876e);
  func_0x00014000bee0(&uStack_188,0x1405c46a8);
  puStack_e8 = &uStack_188;
  func_0x00014002fc60(&uStack_a0,puVar7,0x10);
  func_0x000140001490(&uStack_178,&uStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  puStack_e0 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c46b8);
  puStack_d8 = &uStack_168;
  uStack_94 = *(uint *)((longlong)puVar7 + 0xc);
  uStack_98 = *(undefined4 *)(puVar7 + 1);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
    uStack_a0 = *puVar7;
  }
  else {
    func_0x000140083c80(&uStack_a0,puVar7);
  }
  func_0x00014000bf90(&uStack_a0,0x30);
  func_0x000140001490(&uStack_158,&uStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  puStack_d0 = &uStack_158;
  func_0x000140001490(&uStack_148,pdVar6);
  puStack_c8 = &uStack_148;
  func_0x000140001490(&uStack_138,pdVar6);
  puStack_c0 = &uStack_138;
  func_0x000140001490(&uStack_128,pdVar6);
  puStack_b8 = &uStack_128;
  func_0x000140001490(&uStack_118,pdVar6);
  puStack_b0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x140655aa0);
  puStack_a8 = &uStack_108;
  func_0x0001401445d0(param_1,param_2,&uStack_70,9,uRam00000001405c8ee0,&puStack_e8);
  uStack_80 = 0x1e;
  func_0x00014018d0b0(_UNK_14043b464);
  uStack_80 = 0x20;
  func_0x000140175540(2);
  uStack_80 = 0x21;
  func_0x000140175530(1);
  uStack_80 = 0x22;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878f);
  func_0x00014000bee0(&uStack_188,0x1405c46c8);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46d8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar9,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar9;
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d0 = &uStack_158;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar9);
      plVar9 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar9);
  puStack_c8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140655aa0);
  puStack_c0 = &uStack_138;
  func_0x0001401445d0(param_1,param_2,&uStack_70,6,uRam00000001405c8ef0,&puStack_e8);
  uStack_80 = 0x24;
  func_0x000140175530(1);
  uStack_80 = 0x25;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878f);
  func_0x00014000bee0(&uStack_188,0x1405c46e8);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46d8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar9,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar9;
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d0 = &uStack_158;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar9);
  puStack_c8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140655aa0);
  puStack_c0 = &uStack_138;
  func_0x0001401445d0(param_1,param_2,&uStack_70,6,uRam00000001405c8ef0,&puStack_e8);
  uStack_80 = 0x27;
  func_0x000140175530(1);
  uStack_80 = 0x28;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878f);
  func_0x00014000bee0(&uStack_188,0x1405c46f8);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46d8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,2);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar9,2);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar9;
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d0 = &uStack_158;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,2);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar9);
  puStack_c8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140655aa0);
  puStack_c0 = &uStack_138;
  func_0x0001401445d0(param_1,param_2,&uStack_70,6,uRam00000001405c8ef0,&puStack_e8);
  uStack_80 = 0x2a;
  func_0x000140175530(1);
  uStack_80 = 0x2b;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878f);
  func_0x00014000bee0(&uStack_188,0x1405c4708);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46d8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,3);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar9,3);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar9;
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d0 = &uStack_158;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,3);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar9);
  puStack_c8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140655aa0);
  puStack_c0 = &uStack_138;
  func_0x0001401445d0(param_1,param_2,&uStack_70,6,uRam00000001405c8ef0,&puStack_e8);
  uStack_80 = 0x2d;
  func_0x000140175530(1);
  uStack_80 = 0x2e;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878f);
  func_0x00014000bee0(&uStack_188,0x1405c4718);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46d8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,4);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar9,4);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar9;
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d0 = &uStack_158;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,4);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar9);
  puStack_c8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140655aa0);
  puStack_c0 = &uStack_138;
  func_0x0001401445d0(param_1,param_2,&uStack_70,6,uRam00000001405c8ef0,&puStack_e8);
  uStack_80 = 0x31;
  func_0x000140175540(0);
  uStack_80 = 0x32;
  func_0x000140175530(2);
  uStack_80 = 0x34;
  func_0x000140175520(0);
  uStack_80 = 0x36;
  if ((*(uint *)((longlong)pdStack_1e8 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdStack_1e8;
  }
  else {
    dVar11 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar11);
  uStack_80 = 0x37;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18790);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4738);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x38;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18790);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4748);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x39;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18790);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46e8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,2);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x3a;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18790);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4728);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,3);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x3b;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18790);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4758);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,4);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x3c;
  func_0x000140183c00();
  uStack_80 = 0x40;
  if ((*(uint *)((longlong)pdStack_1e0 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdStack_1e0;
  }
  else {
    dVar11 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar11);
  uStack_80 = 0x41;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18788);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4738);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x42;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18788);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4748);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x46;
  func_0x000140183c00();
  uStack_80 = 0x4a;
  if ((*(uint *)((longlong)pdStack_1d8 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdStack_1d8;
  }
  else {
    dVar11 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar11);
  uStack_80 = 0x4b;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878e);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4738);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x4c;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878e);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4748);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x4d;
  func_0x000140183c00();
  uStack_80 = 0x51;
  if ((*(uint *)((longlong)pdStack_1d0 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdStack_1d0;
  }
  else {
    dVar11 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar11);
  uStack_80 = 0x52;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18786);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4738);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x53;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18786);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4748);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x54;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18786);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c46e8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,2);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x55;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18786);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4728);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,3);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x56;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18786);
  func_0x00014000bee0(&uStack_188,0x1405c4728);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4758);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,4);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x57;
  func_0x000140183c00();
  pdVar6 = pdStack_190;
  uStack_80 = 0x5b;
  if (((*(uint *)((longlong)pdStack_190 + 0xc) & 0xffffff) == 2) && (*pdStack_190 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdStack_190);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*pdStack_190);
      pdVar6 = (double *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
      goto code_r0x000140080680;
    }
    pdVar6 = (double *)func_0x000140147980(*pdStack_190,0);
    if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) != 0) goto code_r0x000140080689;
code_r0x000140080693:
    dVar11 = *pdVar6;
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
code_r0x000140080680:
    if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) goto code_r0x000140080693;
code_r0x000140080689:
    dVar11 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x000140175520((longlong)dVar11);
  uStack_80 = 0x5c;
  if ((*(uint *)((longlong)pdStack_1b8 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdStack_1b8;
  }
  else {
    dVar11 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar11);
  uStack_80 = 0x5d;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_188,0x140655aa0);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4768);
  puStack_e0 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c4778);
  puStack_d8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c4768);
  puStack_d0 = &uStack_158;
  func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8f00,&puStack_e8);
  uStack_80 = 0x5e;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_188,0x140655aa0);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4788);
  puStack_e0 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c4798);
  puStack_d8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c4788);
  puStack_d0 = &uStack_158;
  func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8f00,&puStack_e8);
  uStack_80 = 0x5f;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_188,0x1405c47a8);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c4788);
  puStack_e0 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c4778);
  puStack_d8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c4788);
  puStack_d0 = &uStack_158;
  func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8f00,&puStack_e8);
  uStack_80 = 0x60;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  func_0x00014000bee0(&uStack_188,0x1405c4718);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c47b8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 7) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,6,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,6);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x61;
  func_0x000140175530(0);
  uStack_80 = 0x62;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878d);
  func_0x00014000bee0(&uStack_188,0x1405c46c8);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x1405c47b8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_178;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 6) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,5,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,5);
    }
  }
  else {
    puStack_e0 = &uStack_178;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar8);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 99;
  func_0x000140183c00();
  uStack_80 = 100;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_188,pdStack_1b8);
  puStack_e8 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x140655aa0);
  puStack_e0 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x140655aa0);
  puStack_d8 = &uStack_168;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8ab0,&puStack_e8);
  uStack_80 = 0x67;
  func_0x000140175530(2);
  uStack_80 = 0x69;
  func_0x000140175520(0);
  uStack_80 = 0x6a;
  puVar7 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18737);
  uStack_94 = *(uint *)((longlong)puVar7 + 0xc);
  uStack_98 = *(undefined4 *)(puVar7 + 1);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
    uStack_a0 = *puVar7;
  }
  else {
    func_0x000140083c80(&uStack_a0,puVar7);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655b00) &&
     (func_0x0001403f6320(0x140655b00), iRam0000000140655b00 == -1)) {
    uStack_210 = 0x140655ab0;
    func_0x0001401453a0(0x140655ab0,0x1405c4668);
    uRam0000000140655ac0 = 0;
    uStack_210 = 0x140655ac4;
    func_0x0001401453a0(0x140655ac4,0x1405c466e);
    uRam0000000140655ad4 = 1;
    uStack_210 = 0x140655ad8;
    func_0x0001401453a0(0x140655ad8,0x1405c4674);
    uRam0000000140655ae8 = 2;
    uStack_210 = 0x140655aec;
    func_0x0001401453a0(0x140655aec,0x1405c4680);
    uRam0000000140655afc = 3;
    func_0x0001403f6668(&DAT_140083a90);
    func_0x0001403f62c0(0x140655b00);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar10 = 0;
  iVar3 = func_0x00014015be60(0x140655ab0,&uStack_a0,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
code_r0x000140080dc1:
    uVar1 = *(uint *)(lVar10 * 0x14 + 0x140655ac0);
  }
  else {
    iVar3 = func_0x00014015be60(0x140655ac4,&uStack_a0,uVar5,0);
    if (iVar3 == 0) {
      lVar10 = 1;
      goto code_r0x000140080dc1;
    }
    iVar3 = func_0x00014015be60(0x140655ad8,&uStack_a0,uVar5,0);
    uVar1 = uRam0000000140655ae8;
    if ((iVar3 != 0) &&
       (iVar3 = func_0x00014015be60(0x140655aec,&uStack_a0,uVar5,0), uVar1 = uRam0000000140655afc,
       iVar3 != 0)) goto code_r0x0001400829fa;
  }
  if ((ulonglong)uVar1 < 4) {
                    // (Ghidra note) WARNING: Could not recover jumptable at 0x000140080de8. Too many branches
                    // (Ghidra note) WARNING: Treating indirect jump as call
    (*(code *)(&UNK_140083a7c + *(int *)(&UNK_140083a7c + (ulonglong)uVar1 * 4)))();
    return;
  }
code_r0x0001400829fa:
  uStack_80 = 0x8f;
  if (((*(uint *)((longlong)pdStack_190 + 0xc) & 0xffffff) == 2) && (*pdStack_190 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdStack_190);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990();
      pdStack_190 = (double *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      pdStack_190 = (double *)func_0x000140147980(*pdStack_190,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  if ((*(uint *)((longlong)pdStack_190 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdStack_190;
  }
  else {
    dVar11 = (double)func_0x00014012d320();
  }
  func_0x000140175520((longlong)dVar11);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_224 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_230);
  }
  if ((0x46U >> (uStack_234 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_240);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_194 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a0);
  }
  if ((0x46U >> (uStack_1a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b0);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
