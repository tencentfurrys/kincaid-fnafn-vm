/// @description FNAFN Obj_Menu_Options_Preview / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Preview_Draw_0 (2864 B @0x1400ced50)
// 1. if (!surface_exists(arrow_surface))
//        arrow_surface = surface_create(<builtin @0x1405c7b08>, <builtin @0x1405c7b18>)
//    (registry: room_width / room_height; TODO(calibrate): confirm the two
//    size args in-game — the read helper 0x14015ef90 differs from the usual
//    self-read, so instance-vs-global source is unverified).
// 2. draw_set_font(game_font); draw_set_halign(fa_center)  // 175530(1), PROVEN
// 3. draw_text(<x-derived>, <const @0x1405c5448>, text)
//    (TODO(calibrate): y const and x expression — x passes through the
//    numeric-coercion helper 0x14002fc60 with mode 0xfc).
// 4. surface_set_target(arrow_surface)  // 1756b0(surface)
//    then 4x draw_sprite_ext(Spr_Menu_Radio_Arrows, subimg, x, 218, 0.25, 0.25,
//    0, c_white, 1):
//      subimg 0, x = X + TODO(0xfc); subimg 1, x = X + TODO(0x18);
//      subimg 0, x = X + TODO(0x18); subimg 1, x = X + TODO(0x1e1)
//    (0x435a0000 f32 = 218.0, 0x3e800000 f32 = 0.25, 0x3f800000 = 1.0;
//    TODO(calibrate): exact x offsets — coercion modes 0xfc/0x18/0x1e1.)
// 5. surface_reset_target()  // 183c00(); then draw_self() best-fit for the
//    single-arg draw helper 175460(self) (TODO(calibrate): helper identity).
// 6. draw_surface_ext(arrow_surface, <consts @0x140656c00 x2, @0x1405c5458 x2,
//    @0x140656c00, @0x1405c5468>, arrow_alpha)  // 8-arg slot 0x1405c8d70
//    (TODO(calibrate): pos/scale/rot/colour consts).
// 7. draw_set_halign(fa_left)  // 175530(0).
if (!surface_exists(arrow_surface)) {
    arrow_surface = surface_create(room_width, room_height);  // TODO(calibrate) size args
}
draw_set_font(game_font);
draw_set_halign(fa_center);
draw_text(x /* TODO(calibrate): exact x expr */, TODO_calibrate_0x1405c5448, text);
surface_set_target(arrow_surface);
draw_sprite_ext(Spr_Menu_Radio_Arrows, 0, x /* TODO(calibrate) +off0 */, 218, 0.25, 0.25, 0, c_white, 1);
draw_sprite_ext(Spr_Menu_Radio_Arrows, 1, x /* TODO(calibrate) +off1 */, 218, 0.25, 0.25, 0, c_white, 1);
draw_sprite_ext(Spr_Menu_Radio_Arrows, 0, x /* TODO(calibrate) +off2 */, 218, 0.25, 0.25, 0, c_white, 1);
draw_sprite_ext(Spr_Menu_Radio_Arrows, 1, x /* TODO(calibrate) +off3 */, 218, 0.25, 0.25, 0, c_white, 1);
surface_reset_target();
draw_self();  // TODO(calibrate): single-arg helper func_0x000140175460(self)
draw_surface_ext(arrow_surface, TODO_calibrate_0x140656c00, TODO_calibrate_0x140656c00,
    TODO_calibrate_0x1405c5458, TODO_calibrate_0x1405c5458, TODO_calibrate_0x140656c00,
    TODO_calibrate_0x1405c5468, arrow_alpha);
draw_set_halign(fa_left);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Options_Preview_Draw_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  double *pdVar5;
  double *pdVar6;
  undefined8 uVar7;
  double dVar8;
  uint uVar9;
  undefined8 **ppuVar10;
  ulonglong uVar11;
  undefined8 *puStack_1b8;
  undefined8 *puStack_1b0;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
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
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  double dStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043c845;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
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
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  plRam0000000140657680 = param_1;
  pdVar5 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_80 = 1;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  pdVar6 = (double *)(**(code **)(*param_1 + 8))(param_1,0x186e3);
  func_0x000140001490(&uStack_148,pdVar6);
  ppuVar10 = &puStack_1b8;
  uVar9 = uRam00000001405c8a50;
  puStack_1b8 = &uStack_148;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uRam00000001405c8a50,ppuVar10);
  cVar2 = func_0x00014012bb70(uVar7);
  if (cVar2 == '\0') {
    uStack_80 = 3;
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_a0 = 0;
    uStack_98 = 0;
    uStack_94 = 5;
    pdVar6 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x186e3);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_c0);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_b0);
    func_0x000140001490(&uStack_138,&uStack_c0);
    puStack_1b0 = &uStack_138;
    func_0x000140001490(&uStack_128,&uStack_b0);
    ppuVar10 = &puStack_1b0;
    uVar9 = uRam00000001405c8a60;
    puStack_1a8 = &uStack_128;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_a0,2,uRam00000001405c8a60,ppuVar10);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdVar6,uVar7);
    func_0x000140141c50(1);
  }
  uStack_80 = 5;
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar5);
    if (0 < iVar3) {
      pdVar5 = (double *)func_0x000140147980(*pdVar5,0);
      uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
      goto joined_r0x0001400cf0c3;
    }
    uVar4 = func_0x000140147990(*pdVar5);
    pdVar5 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar4);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x0001400cf0c3:
  if ((uVar1 & 0xffffff) == 0) {
    dVar8 = *pdVar5;
  }
  else {
    dVar8 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x000140175520((longlong)dVar8);
  uStack_80 = 6;
  func_0x000140175530(1);
  uStack_80 = 7;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uVar7 = (**(code **)(*param_1 + 8))(param_1,0x18785);
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_78,uVar9 & 0xffffff00,
                      (ulonglong)ppuVar10 & 0xffffffffffffff00);
  func_0x00014002fc60(&dStack_58,&uStack_78,0xfc);
  func_0x000140001490(&uStack_148,&dStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_58);
  }
  puStack_1b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5448);
  puStack_1b0 = &uStack_138;
  func_0x000140001490(&uStack_128,uVar7);
  ppuVar10 = &puStack_1b8;
  uVar9 = uRam00000001405c8da0;
  puStack_1a8 = &uStack_128;
  func_0x0001401445d0(param_1,param_2,&uStack_68,3,uRam00000001405c8da0,ppuVar10);
  uStack_80 = 8;
  if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) {
    dVar8 = *pdVar6;
  }
  else {
    dVar8 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x0001401756b0((longlong)dVar8);
  uStack_80 = 9;
  uVar11 = (ulonglong)ppuVar10 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_78,uVar9 & 0xffffff00,uVar11);
  uVar4 = (undefined4)(uVar11 >> 0x20);
  func_0x00014002fc60(&dStack_58,&uStack_78,0x18);
  dVar8 = dStack_58;
  if ((uStack_4c & 0xffffff) != 0) {
    dVar8 = (double)func_0x00014012d320(&dStack_58);
  }
  uVar11 = CONCAT44(uVar4,0x3e800000);
  uVar9 = 0x435a0000;
  func_0x0001401755c0(param_1,0x21,0,(float)dVar8,0x435a0000,uVar11,0x3e800000,0,0xffffff,0x3f800000
                     );
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_58);
  }
  uStack_80 = 10;
  uVar11 = uVar11 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_78,uVar9 & 0xffffff00,uVar11);
  uVar4 = (undefined4)(uVar11 >> 0x20);
  func_0x00014002fc60(&dStack_58,&uStack_78,0x1e1);
  dVar8 = dStack_58;
  if ((uStack_4c & 0xffffff) != 0) {
    dVar8 = (double)func_0x00014012d320(&dStack_58);
  }
  uVar11 = CONCAT44(uVar4,0x3e800000);
  uVar9 = 0x435a0000;
  func_0x0001401755c0(param_1,0x21,1,(float)dVar8,0x435a0000,uVar11,0x3e800000,0,0xffffff,0x3f800000
                     );
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_58);
  }
  uStack_80 = 0xb;
  uVar11 = uVar11 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_78,uVar9 & 0xffffff00,uVar11);
  uVar4 = (undefined4)(uVar11 >> 0x20);
  func_0x00014002fc60(&dStack_58,&uStack_78,0x18);
  dVar8 = dStack_58;
  if ((uStack_4c & 0xffffff) != 0) {
    dVar8 = (double)func_0x00014012d320(&dStack_58);
  }
  uVar11 = CONCAT44(uVar4,0x3e800000);
  uVar9 = 0x435a0000;
  func_0x0001401755c0(param_1,0x21,0,(float)dVar8,0x435a0000,uVar11,0x3e800000,0,0xffffff,0x3f800000
                     );
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_58);
  }
  uStack_80 = 0xc;
  uVar11 = uVar11 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_78,uVar9 & 0xffffff00,uVar11);
  uVar4 = (undefined4)(uVar11 >> 0x20);
  func_0x00014002fc60(&dStack_58,&uStack_78,0x1e1);
  if ((uStack_4c & 0xffffff) != 0) {
    dStack_58 = (double)func_0x00014012d320(&dStack_58);
  }
  func_0x0001401755c0(param_1,0x21,1,(float)dStack_58,0x435a0000,CONCAT44(uVar4,0x3e800000),
                      0x3e800000,0,0xffffff,0x3f800000);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_58);
  }
  uStack_80 = 0xd;
  func_0x000140183c00();
  uStack_80 = 0xe;
  func_0x000140175460(param_1);
  uStack_80 = 0xf;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uVar7 = (**(code **)(*param_1 + 8))(param_1,0x186e1);
  func_0x000140001490(&uStack_148,pdVar6);
  puStack_1b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140656c00);
  puStack_1b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x140656c00);
  puStack_1a8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c5458);
  puStack_1a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5458);
  puStack_198 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140656c00);
  puStack_190 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c5468);
  puStack_188 = &uStack_e8;
  func_0x000140001490(&uStack_d8,uVar7);
  puStack_180 = &uStack_d8;
  func_0x0001401445d0(param_1,param_2,&uStack_68,8,uRam00000001405c8d70,&puStack_1b8);
  uStack_80 = 0x11;
  func_0x000140175530(0);
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
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
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
