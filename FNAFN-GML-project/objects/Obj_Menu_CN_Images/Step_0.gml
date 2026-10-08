/// @description FNAFN Obj_Menu_CN_Images / Step — PORTED from C
// Ground truth: gml_Object_Obj_Menu_CN_Images_Step_0 (1958 B @0x1400b72c0)
// Hover-fade for the custom-night portrait: a 5-arg box test around (x, y)
// picks the lerp target for draw_alpha (id 0x18712; Create seeds 0).
//   x/y read via func_0x00014015f1a0 on slots 0x1405c7b78/0x1405c7b88
//   (registry x/y, two-step rule). Box corners via the PROVEN op helpers:
//   func_0x00014002fc60(dest, src, N) = dest = src - N (disassembly; see
//   Obj_Menu_Loading/Draw) and func_0x00014000bf90 = +=, N = 0x58 = 88.
//   customfunct_ui_button_detection(x - 88, y - 88, x + 88, y + 88, C)
//   returns 1 inside (mouse_x > x1 && mouse_x < x2 + x_offset && ...);
//   the 3-way compare against 1.0 takes the hover branch on == 0.
//   Both branches: draw_alpha = lerp(draw_alpha, target, 0.15 * delta)
//   (0x3fc3333333333333 = 0.15 via MUL helper func_0x0001400053f0 with
//   delta_factor id 0x1870b; lerp = slot 0x1405c8cc0, registry; direct
//   +0x10 id-fetch write to draw_alpha). Hover target = 1.0 (exe .data
//   @0x1405c4fb0, verified); away target = runtime-pool const @0x1406564c0
//   — the SAME pool const feeds the button-box 5th arg: TODO(calibrate)
//   both (outside the exe image).
if (customfunct_ui_button_detection(x - 88, y - 88, x + 88, y + 88, 0 /* TODO(calibrate): runtime const @0x1406564c0 (box x-offset) */) == 1) {
    draw_alpha = lerp(draw_alpha, 1, 0.15 * delta_factor);
} else {
    draw_alpha = lerp(draw_alpha, 0 /* TODO(calibrate): runtime const @0x1406564c0 (fade-out target) */, 0.15 * delta_factor);
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_CN_Images_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  ulonglong in_stack_fffffffffffffe48;
  undefined8 **ppuVar4;
  undefined4 uVar5;
  ulonglong in_stack_fffffffffffffe50;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 uStack_168;
  undefined *puStack_160;
  undefined4 uStack_158;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
  uint uStack_124;
  undefined8 uStack_120;
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
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined4 uStack_80;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined4 uStack_50;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_160 = &UNK_14043c380;
  uStack_158 = 0;
  uStack_168 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_168;
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
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  plRam0000000140657680 = param_1;
  uStack_120 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_90 = CONCAT44(0xffffff,(undefined4)uStack_90);
  uStack_98 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_158 = 1;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  in_stack_fffffffffffffe50 = in_stack_fffffffffffffe50 & 0xffffffffffffff00;
  in_stack_fffffffffffffe48 = in_stack_fffffffffffffe48 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_88,in_stack_fffffffffffffe48,
                      in_stack_fffffffffffffe50);
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_78,
                      in_stack_fffffffffffffe48 & 0xffffffffffffff00,
                      in_stack_fffffffffffffe50 & 0xffffffffffffff00);
  func_0x00014002fc60(&uStack_58,&uStack_88,0x58);
  func_0x000140001490(&uStack_118,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puStack_1a8 = &uStack_118;
  func_0x00014002fc60(&uStack_58,&uStack_78,0x58);
  func_0x000140001490(&uStack_108,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_4c = uStack_7c;
  uStack_50 = uStack_80;
  puStack_1a0 = &uStack_108;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) == 0) {
    uStack_58 = uStack_88;
  }
  else {
    func_0x0001400b81f0(&uStack_58,&uStack_88);
  }
  func_0x00014000bf90(&uStack_58,0x58);
  func_0x000140001490(&uStack_f8,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_4c = uStack_6c;
  uStack_50 = uStack_70;
  puStack_198 = &uStack_f8;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
    uStack_58 = uStack_78;
  }
  else {
    func_0x0001400b81f0(&uStack_58,&uStack_78);
  }
  func_0x00014000bf90(&uStack_58,0x58);
  func_0x000140001490(&uStack_e8,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puStack_190 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406564c0);
  ppuVar4 = &puStack_1a8;
  puStack_188 = &uStack_d8;
  uVar2 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,&puStack_1a8);
  uVar5 = (undefined4)((ulonglong)ppuVar4 >> 0x20);
  uStack_4c = 0;
  uStack_58 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_158 = 3;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
    func_0x000140001490(&uStack_c8,uVar2);
    puStack_180 = &uStack_c8;
    func_0x00014000bee0(&uStack_b8,0x1405c4fb0);
    uStack_4c = 0;
    uStack_58 = 0x3fc3333333333333;
    puStack_178 = &uStack_b8;
    func_0x0001400053f0(&uStack_58,uStack_120);
    func_0x000140001490(&uStack_a8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_170 = &uStack_a8;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_98,3,CONCAT44(uVar5,uRam00000001405c8cc0),
                                &puStack_180);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar2,uVar3);
  }
  else {
    uStack_158 = 7;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
    func_0x000140001490(&uStack_118,uVar2);
    puStack_1a8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1406564c0);
    uStack_4c = 0;
    uStack_58 = 0x3fc3333333333333;
    puStack_1a0 = &uStack_108;
    func_0x0001400053f0(&uStack_58,uStack_120);
    func_0x000140001490(&uStack_f8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_198 = &uStack_f8;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,CONCAT44(uVar5,uRam00000001405c8cc0),
                                &puStack_1a8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar2,uVar3);
  }
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
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
  puRam0000000140657668 = (undefined8 *)uStack_168;
  return;
}
END DECOMPILED REFERENCE */
