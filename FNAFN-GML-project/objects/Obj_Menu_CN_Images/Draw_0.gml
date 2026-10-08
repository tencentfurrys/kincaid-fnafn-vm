/// @description FNAFN Obj_Menu_CN_Images / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Menu_CN_Images_Draw_0 (2104 B @0x1400b91b0)
// Custom-night portrait draw: name plate, self sprite, adjust icon, AI-level
// plate. uStack_b8 = 1..10 are GML line markers. Decoded in order:
//   1. draw_set_font(game_font[0]): game_font = id 0x18725 via the +8
//      runner-global fetch, element [0] via the length-check/index dance
//      (func_0x0001401479b0/7990/7980); 0x140175520 IS draw_set_font by
//      disassembly (see Obj_Menu_Loading/Draw, PORTING.md).
//   2. draw_set_halign(fa_center): func_0x000140175530(1), PROVEN
//      (0=fa_left, 1=fa_center, 2=fa_right).
//   3. draw_set_valign(fa_top): func_0x000140175540(0), contextual pair of
//      the halign helper (0=fa_top, 1=fa_middle, 2=fa_bottom; cf.
//      Obj_Menu_Main_Title/Draw which pairs 175540(1)/175530(1)).
//   4. draw_text_transformed(x, y + 108, animatronic_text, 1, 1, <angle>):
//      x/y read via func_0x00014015f1a0 on slots 0x1405c7b78/0x1405c7b88
//      (registry x/y, two-step rule); y + 0x6c (108) via the PROVEN +=
//      helper func_0x00014000bf90 (see Obj_Menu_CN_Images/Step);
//      animatronic_text = id 0x186e0 (builtin_ids.json);
//      draw_text_transformed = slot 0x1405c8ef0 (registry), 6 args
//      (x, y, string, xscale, yscale, angle); xscale/yscale both
//      @0x1405c4fe0 = 1.0 (exe .data double, verified via exe_strings.py);
//      angle is the runtime-pool const @0x140656548 (outside the exe image):
//      TODO(calibrate) (0 by draw_text_transformed convention).
//   5. draw_self(): func_0x000140175460(param_1) — the with-arg shape, same
//      as Obj_Office_Back/Draw, Obj_Menu_Main_Back/Draw and
//      Obj_Night_Music_Switch/Draw (PORTING.md warns only against batching
//      it with the no-arg shape, not against the draw_self decode).
//   7. draw_set_font(0): func_0x000140175520(0) (cf. Night_Music_Switch/Draw).
//   8. draw_sprite_ext(Spr_Menu_CN_Adjust, 0, x, y, 1, 1, 0, c_white,
//      draw_alpha): helper func_0x0001401755c0; sprite id 0x68 = 104 = SPRT
//      chunk index 104 = Spr_Menu_CN_Adjust (sprite_names.json); subimg 0;
//      x/y are the same x/y slots re-read below; xscale/yscale = 1.0
//      (0x3f800000 float immediates, high halves are ignored padding — cf.
//      Obj_Menu_Night_Display/Draw), rot = 0, colour = 0xffffff = c_white,
//      alpha = draw_alpha (id 0x18712).
//   10. draw_text_transformed(x, y + 44, animatronic_ai_text, 0.95, 0.95,
//      <angle>): same shape with y + 0x2c (44); animatronic_ai_text =
//      id 0x186df; scales @0x1405c4ff0 = 0.95 (exe .data double, verified
//      via exe_strings.py); angle = same runtime @0x140656548:
//      TODO(calibrate).
// No 3D/camera/shader/3D-audio state here — plain 2D menu draw.
draw_set_font(game_font[0]);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_transformed(x, y + 108, animatronic_text, 1, 1, 0 /* TODO(calibrate): runtime const @0x140656548 (angle) */);
draw_self();
draw_set_font(0);
draw_sprite_ext(Spr_Menu_CN_Adjust, 0, x, y, 1, 1, 0, c_white, draw_alpha);
draw_text_transformed(x, y + 44, animatronic_ai_text, 0.95, 0.95, 0 /* TODO(calibrate): same runtime const @0x140656548 (angle) */);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_CN_Images_Draw_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  double *pdVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined4 uVar9;
  undefined4 uVar10;
  double dVar8;
  float fVar11;
  uint in_stack_fffffffffffffe28;
  uint uVar12;
  ulonglong in_stack_fffffffffffffe30;
  undefined8 **ppuVar13;
  ulonglong uVar14;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  uint uStack_154;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
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
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  double dStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined4 uStack_88;
  uint uStack_84;
  undefined8 uStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  
  uStack_70 = 0xfffffffffffffffe;
  puStack_c0 = &UNK_14043c3cb;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
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
  plRam0000000140657680 = param_1;
  uStack_130 = param_2;
  pdVar3 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_a4 = 0xffffff;
  dStack_b0 = 0.0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_98 = CONCAT44(0xffffff,(undefined4)uStack_98);
  uStack_a0 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uStack_154 = 0xffffff;
  uStack_160 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_b8 = 1;
  if (((*(uint *)((longlong)pdVar3 + 0xc) & 0xffffff) == 2) && (*pdVar3 != 0.0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*pdVar3);
    if (0 < iVar1) {
      pdVar3 = (double *)func_0x000140147980(*pdVar3,0);
      uVar12 = *(uint *)((longlong)pdVar3 + 0xc);
      goto joined_r0x0001400b9381;
    }
    uVar2 = func_0x000140147990(*pdVar3);
    pdVar3 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar2);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar12 = *(uint *)((longlong)pdVar3 + 0xc);
joined_r0x0001400b9381:
  if ((uVar12 & 0xffffff) == 0) {
    dVar8 = *pdVar3;
  }
  else {
    dVar8 = (double)func_0x00014012d320(pdVar3);
  }
  func_0x000140175520((longlong)dVar8);
  uStack_b8 = 2;
  func_0x000140175530(1);
  uStack_b8 = 3;
  func_0x000140175540(0);
  uStack_b8 = 4;
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  uStack_a0 = 0;
  uStack_98 = 0x500000000;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186e0);
  in_stack_fffffffffffffe30 = in_stack_fffffffffffffe30 & 0xffffffffffffff00;
  in_stack_fffffffffffffe28 = in_stack_fffffffffffffe28 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_b0,in_stack_fffffffffffffe28,
                      in_stack_fffffffffffffe30);
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_90,
                      in_stack_fffffffffffffe28 & 0xffffff00,
                      in_stack_fffffffffffffe30 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_128,&dStack_b0);
  uStack_74 = uStack_84;
  uStack_78 = uStack_88;
  puStack_1a8 = &uStack_128;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
    uStack_80 = uStack_90;
  }
  else {
    func_0x0001400ba000(&uStack_80,&uStack_90);
  }
  func_0x00014000bf90(&uStack_80,0x6c);
  func_0x000140001490(&uStack_118,&uStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  puStack_1a0 = &uStack_118;
  func_0x000140001490(&uStack_108,uVar4);
  puStack_198 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4fe0);
  puStack_190 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4fe0);
  puStack_188 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140656548);
  ppuVar13 = &puStack_1a8;
  uVar12 = uRam00000001405c8ef0;
  puStack_180 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_130,&uStack_a0,6,uRam00000001405c8ef0,ppuVar13);
  uStack_b8 = 5;
  func_0x000140175460(param_1);
  uStack_b8 = 7;
  func_0x000140175520(0);
  uStack_b8 = 8;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18712);
  uVar14 = (ulonglong)ppuVar13 & 0xffffffffffffff00;
  uVar12 = uVar12 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_b0,uVar12,uVar14);
  uVar14 = uVar14 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_90,uVar12 & 0xffffff00,uVar14)
  ;
  uVar2 = (undefined4)(uVar14 >> 0x20);
  if ((*(uint *)((longlong)puVar5 + 0xc) & 0xffffff) == 0) {
    uVar6 = (undefined4)*puVar5;
    uVar9 = (undefined4)((ulonglong)*puVar5 >> 0x20);
  }
  else {
    uVar4 = func_0x00014012d320(puVar5);
    uVar6 = (undefined4)uVar4;
    uVar9 = (undefined4)((ulonglong)uVar4 >> 0x20);
  }
  if ((uStack_84 & 0xffffff) == 0) {
    uVar7 = (undefined4)uStack_90;
    uVar10 = (undefined4)((ulonglong)uStack_90 >> 0x20);
    dVar8 = dStack_b0;
  }
  else {
    uVar4 = func_0x00014012d320(&uStack_90);
    uVar7 = (undefined4)uVar4;
    uVar10 = (undefined4)((ulonglong)uVar4 >> 0x20);
    dVar8 = dStack_b0;
  }
  dStack_b0 = dVar8;
  if ((uStack_a4 & 0xffffff) != 0) {
    dVar8 = (double)func_0x00014012d320(&dStack_b0);
  }
  fVar11 = (float)(double)CONCAT44(uVar10,uVar7);
  uVar14 = CONCAT44(uVar2,0x3f800000);
  func_0x0001401755c0(param_1,0x68,0,(float)dVar8,fVar11,uVar14,0x3f800000,0,0xffffff,
                      (float)(double)CONCAT44(uVar9,uVar6));
  uStack_b8 = 10;
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  uStack_a0 = 0;
  uStack_98 = 0x500000000;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186df);
  uVar14 = uVar14 & 0xffffffffffffff00;
  uVar12 = (uint)fVar11 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_b0,uVar12,uVar14);
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_90,uVar12 & 0xffffff00,
                      uVar14 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_128,&dStack_b0);
  uStack_74 = uStack_84;
  uStack_78 = uStack_88;
  puStack_1a8 = &uStack_128;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
    uStack_80 = uStack_90;
  }
  else {
    func_0x0001400ba000(&uStack_80,&uStack_90);
  }
  func_0x00014000bf90(&uStack_80,0x2c);
  func_0x000140001490(&uStack_118,&uStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  puStack_1a0 = &uStack_118;
  func_0x000140001490(&uStack_108,uVar4);
  puStack_198 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4ff0);
  puStack_190 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4ff0);
  puStack_188 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140656548);
  puStack_180 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_130,&uStack_a0,6,uRam00000001405c8ef0,&puStack_1a8);
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_160);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_b0);
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
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */
