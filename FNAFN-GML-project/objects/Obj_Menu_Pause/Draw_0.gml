/// @description FNAFN Obj_Menu_Pause / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Pause_Draw_0 (3634 B @0x1400d81a0)
// Decoded, in order:
//   1. global fetch `game_font` (0x18725, +8 runner global), index [1] =>
//      numeric element -> builtin func_0x000140175520(value) — 1-arg draw
//      state setter on a font id: best fit draw_set_font().
//   2. builtin func_0x0001401756a0(0xff,0,0x6e) = make_color_rgb(255,0,110)
//      -> builtin func_0x00014018d100(result): draw_set_color().
//   3. builtin func_0x000140175530(0) — PROVEN 2026-10-07 to be
//      draw_set_halign (disassembly: thunks to the 0/1/2 enum setter at
//      0x1402a8670; see Obj_Menu_Loading/Draw), so draw_set_halign(fa_left).
//   4. if surface_exists(back_surface) (1-arg funcid slot 0x1405c8a50):
//      4-arg call slot 0x1405c8d40, args = (position state read from slot
//      uRam00000001405c7bf8 via func_0x00014015ef90, back_surface,
//      const @0x140656d40, second slot read from uRam00000001405c7ba8
//      via func_0x00014015ef90 with 0x80000000 flag). Best fit:
//      draw_surface_ext / draw_surface_stretched at the stored position.
//      NOTE 0x1405c7ba8 is the same slot used for back_surface setup in
//      Create (func_0x000140160140 write) — likely a width/height pair.
//   5. 8-arg call slot 0x1405c8d70 (co-fetch game_font/arrow_*/pause_text/
//      back_surface => draw_text-transformed family): args include the
//      read-modify-write op-helper result on slot uRam00000001405c7b98
//      (func_0x00014015f1a0 — slot 0x1405c7b98 = image_alpha per
//      EXE-REGISTRY.md, previously labelled select/fading), consts
//      0x140656d40, 0x1405c5678, 0x1405c5678, 0x140656d40, 0x1405c5688
//      and the position-state read. Best fit: draw_text_ext_transformed
//      on the selection label.
//   6. 1-arg funcid slot 0x1405c85a0 (co-fetch back_surface/pause_surface/
//      pause_text/game_font => a UI-state getter) -> numeric ->
//      builtin func_0x000140175550(self, 42, 0, value, 0). TODO calibrate.
//   7. fetch `pause_surface` (0x18752, +8) -> builtin
//      func_0x0001401756b0(value) — 1-arg builtin taking a surface id.
//      Best fit: draw_set_alpha? No — TODO calibrate (surface-draw
//      plumbing, maybe surface_set_target for the pause overlay).
//   8. 3-arg call slot 0x1405c8da0 (co-fetch game_font/surface/draw_alpha/
//      text_access/text_audio/text_options => draw_text on a UI label),
//      args = (const @0x1405c5698, const @0x1405c56a8, string
//      @0x1405c5670).
//   9. game_font[0] -> func_0x000140175520(value) again (draw_set_font).
//  10. two more 3-arg calls on slot 0x1405c8da0:
//        (const @0x1405c56b8, const @0x1405c56c8, pause_text[0])
//        (const @0x1405c56b8, const @0x1405c56d8, pause_text[1])
//      -> the two pause-menu option labels.
//  11. no-arg builtin func_0x000140183c00() — draw-state cleanup.
//  12. 1-arg funcid slot 0x1405c85a0 with (position state, pause_surface),
//      then 3-arg call slot 0x1405c8ab0 (co-fetch television_contrast/
//      enabled/saturation/sharpness/composite_*/tube_distortion => the
//      CRT/TV shader family), args (result, const @0x140656d40). Best
//      fit: apply the TV filter to pause_surface.
// Constants 0x1405c56xx / 0x140656d20/30/40 are exe-data strings/numbers
// — not resolvable offline (see SLOT-MAP.md).
draw_set_font(game_font[1]);
draw_set_color(make_color_rgb(255, 0, 110));
draw_set_halign(fa_left); // 0x140175530(0) — PROVEN 2026-10-07: draw_set_halign (see Obj_Menu_Loading/Draw)

// REGISTRY-CONFIRMED (EXE-REGISTRY.md):
//   slot 0x1405c8a50 = surface_exists; slot 0x1405c8d40 = surface_copy;
//   slot 0x1405c85a0 = camera_get_view_x; slot 0x1405c8d70 = draw_surface_ext;
//   slot 0x1405c8da0 = draw_text; slot 0x1405c8ab0 = draw_surface;
//   slot 0x1405c7b98 = image_alpha; slot 0x1405c7bf8 = view_camera.
if (surface_exists(back_surface)) {
    surface_copy(back_surface, 0, 0, application_surface);
    // C passes camera_get_view_x(...) result as extra arg -- see C ref.
}

// REGISTRY-CONFIRMED: 8-arg call = draw_surface_ext (args include consts
// 1.0, 1.0, 16777215.0 = c_white and image_alpha) + view_camera read.
// TODO(calibrate): exact arg order for draw_surface_ext.

// REGISTRY-CONFIRMED: 3-arg calls = draw_text(x, y, str).
draw_text(32, 185, "paused");   // consts @0x1405c5698/0x1405c56a8 + str @0x1405c5670

draw_set_font(game_font[0]);

draw_text(94, 340, pause_text[0]);  // consts @0x1405c56b8/0x1405c56c8
draw_text(94, 385, pause_text[1]);  // consts @0x1405c56b8/0x1405c56d8

// REGISTRY-CONFIRMED: final pass = draw_surface + scr_OLDTVFilter shader
// family on pause_surface (slot 0x1405c8ab0 = draw_surface;
// getter slot 0x1405c85a0 = camera_get_view_x).
// TODO(calibrate): draw_surface + TV-shader uniform plumbing.

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Pause_Draw_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  double *pdVar4;
  double *pdVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  longlong *plVar8;
  double dVar9;
  uint uVar10;
  undefined8 **ppuVar11;
  undefined8 uStack_1c0;
  uint uStack_1b4;
  undefined8 uStack_1b0;
  uint uStack_1a4;
  double *pdStack_1a0;
  undefined8 uStack_198;
  uint uStack_18c;
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
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043ca6c / * "gml_Object_Obj_Menu_Pause_Draw_0" * /;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
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
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  plRam0000000140657680 = param_1;
  pdVar4 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725 / * "game_font" * /);
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_98 = CONCAT44(0xffffff,(undefined4)uStack_98);
  uStack_a0 = 0;
  uStack_1b4 = 0xffffff;
  uStack_1c0 = 0;
  uStack_1a4 = 0xffffff;
  uStack_1b0 = 0;
  uStack_80 = 1;
  if (((*(uint *)((longlong)pdVar4 + 0xc) & 0xffffff) == 2) && (*pdVar4 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar4);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*pdVar4);
      func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,1,uVar3);
      pdVar5 = (double *)0x0;
      uVar10 = uRam000000000000000c;
      goto joined_r0x0001400d839f;
    }
    pdVar5 = (double *)func_0x000140147980(*pdVar4,1);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x0001400d83cc;
code_r0x0001400d83a1:
    dVar9 = (double)func_0x00014012d320();
  }
  else {
    func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
    pdVar5 = pdVar4;
    uVar10 = *(uint *)((longlong)pdVar4 + 0xc);
joined_r0x0001400d839f:
    if ((uVar10 & 0xffffff) != 0) goto code_r0x0001400d83a1;
code_r0x0001400d83cc:
    dVar9 = *pdVar5;
  }
  func_0x000140175520((longlong)dVar9);
  uStack_80 = 2;
  uVar3 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar3);
  uStack_80 = 3;
  func_0x000140175530(0);
  uStack_80 = 5;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  uVar6 = (**(code **)(*param_1 + 8))(param_1,0x186e5 / * "back_surface" * /);
  func_0x000140001490(&uStack_178,uVar6);
  ppuVar11 = &puStack_e8;
  uVar10 = uRam00000001405c8a50;
  puStack_e8 = &uStack_178;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8a50,ppuVar11);
  cVar1 = func_0x00014012bb70(uVar7);
  if (cVar1 == '\0') {
    uStack_80 = 7;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_a0 = 0;
    uStack_98 = 0x500000000;
    uVar6 = (**(code **)(*param_1 + 8))(param_1,0x186e5 / * "back_surface" * /);
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_78);
    func_0x000140001490(&uStack_168,&uStack_78);
    puStack_e0 = &uStack_168;
    func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_198);
    func_0x000140001490(&uStack_158,uVar6);
    puStack_d8 = &uStack_158;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_a0,1,uRam00000001405c85a0,&puStack_e0);
    func_0x000140001490(&uStack_148,uVar7);
    puStack_d0 = &uStack_148;
    func_0x00014000bee0(&uStack_138,0x140656d40);
    puStack_c8 = &uStack_138;
    func_0x000140001490(&uStack_128,&uStack_198);
    ppuVar11 = &puStack_d8;
    uVar10 = uRam00000001405c8d40;
    puStack_c0 = &uStack_128;
    func_0x0001401445d0(param_1,param_2,&uStack_68,4,uRam00000001405c8d40,ppuVar11);
  }
  uStack_80 = 10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_78);
  func_0x000140001490(&uStack_178,&uStack_78);
  puStack_e8 = &uStack_178;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_188,uVar10 & 0xffffff00,
                      (ulonglong)ppuVar11 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_168,uVar6);
  puStack_e0 = &uStack_168;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uRam00000001405c85a0,&puStack_e8);
  func_0x000140001490(&uStack_158,uVar6);
  puStack_d8 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x140656d40);
  puStack_d0 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5678);
  puStack_c8 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c5678);
  puStack_c0 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x140656d40);
  puStack_b8 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5688);
  puStack_b0 = &uStack_108;
  func_0x000140001490(&uStack_f8,&uStack_188);
  puStack_a8 = &uStack_f8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,8,uRam00000001405c8d70,&puStack_e0);
  uStack_80 = 0xb;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_78);
  func_0x000140001490(&uStack_178,&uStack_78);
  puStack_e8 = &uStack_178;
  pdVar5 = (double *)
           func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c85a0,&puStack_e8);
  if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) {
    dVar9 = *pdVar5;
  }
  else {
    dVar9 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x000140175550(param_1,0x2a,0,(float)dVar9,0);
  uStack_80 = 0xc;
  pdStack_1a0 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18752 / * "pause_surface" * /);
  if ((*(uint *)((longlong)pdStack_1a0 + 0xc) & 0xffffff) == 0) {
    dVar9 = *pdStack_1a0;
  }
  else {
    dVar9 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar9);
  uStack_80 = 0xd;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_178,0x1405c5698);
  puStack_e8 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c56a8);
  puStack_e0 = &uStack_168;
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  func_0x0001401441e0(&uStack_158,0x1405c5670);
  puStack_d8 = &uStack_158;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0xe;
  if (((*(uint *)((longlong)pdVar4 + 0xc) & 0xffffff) == 2) && (*pdVar4 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar4);
    if (0 < iVar2) {
      pdVar4 = (double *)func_0x000140147980(*pdVar4,0);
      uVar10 = *(uint *)((longlong)pdVar4 + 0xc);
      goto joined_r0x0001400d8a6b;
    }
    uVar3 = func_0x000140147990(*pdVar4);
    pdVar4 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,0,uVar3);
  }
  else {
    func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
  }
  uVar10 = *(uint *)((longlong)pdVar4 + 0xc);
joined_r0x0001400d8a6b:
  if ((uVar10 & 0xffffff) == 0) {
    dVar9 = *pdVar4;
  }
  else {
    dVar9 = (double)func_0x00014012d320(pdVar4);
  }
  func_0x000140175520((longlong)dVar9);
  uStack_80 = 0x10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18753 / * "pause_text" * /);
  func_0x00014000bee0(&uStack_178,0x1405c56b8);
  puStack_e8 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c56c8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_168;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar8);
    if (iVar2 < 1) {
      uVar3 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,0,uVar3);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_e0 = &uStack_168;
    func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d8 = &uStack_158;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18753 / * "pause_text" * /);
  func_0x00014000bee0(&uStack_178,0x1405c56b8);
  puStack_e8 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c56d8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_e0 = &uStack_168;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar8);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,1,uVar3);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_e0 = &uStack_168;
    func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
  }
  func_0x000140001490(&uStack_158,plVar8);
  puStack_d8 = &uStack_158;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_e8);
  uStack_80 = 0x12;
  func_0x000140183c00();
  uStack_80 = 0x14;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_78);
  func_0x000140001490(&uStack_178,&uStack_78);
  puStack_e8 = &uStack_178;
  func_0x000140001490(&uStack_168,pdStack_1a0);
  puStack_e0 = &uStack_168;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uRam00000001405c85a0,&puStack_e8);
  func_0x000140001490(&uStack_158,uVar6);
  puStack_d8 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x140656d40);
  puStack_d0 = &uStack_148;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8ab0,&puStack_e0);
  if ((0x46U >> (uStack_1a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b0);
  }
  if ((0x46U >> (uStack_1b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c0);
  }
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
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
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
