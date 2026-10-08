/// @description FNAFN Obj_Menu_Options / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Step_0 (859 B @0x140076c50)
// Decoded, in order (uStack_f0 = 1/3 are GML line markers):
//   0. global fetch `delta_factor` (id 0x1870b, +8 on the runner global).
//   1. line 1: `draw_alpha` (id 0x18712) = lerp(draw_alpha, 1.0, 0.05 *
//      delta_factor) -- args staged into puStack_e8/e0/d8: the current
//      draw_alpha, exe const 0x1405c4530 (= double 1.0), and
//      0x3fa999999999999a (= 0.05) MUL delta_factor; 3-arg call on slot
//      uRam00000001405c8cc0 (REGISTRY-CONFIRMED lerp), result assigned back
//      into draw_alpha.
//   2. line 3: `select_y_final` (id 0x1876e) = lerp(select_y_final,
//      `select_y` (id 0x1876d), 0.5 * delta_factor) -- same 3-arg lerp
//      shape, const 0x3fe0000000000000 = 0.5.
// Reading: ease the menu draw alpha in to full and glide the selector's
// current Y toward the target selection Y each step (delta-scaled).
draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor);
select_y_final = lerp(select_y_final, select_y, 0.5 * delta_factor);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Options_Step_0(longlong *param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uStack_100;
  undefined *puStack_f8;
  undefined4 uStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_f8 = &UNK_14043b3f1;
  uStack_f0 = 0;
  uStack_100 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_100;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  plRam0000000140657680 = param_1;
  uStack_a0 = param_2;
  uVar1 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_f0 = 1;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
  func_0x000140001490(&uStack_98,uVar2);
  puStack_e8 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x1405c4530);
  uStack_4c = 0;
  uStack_58 = 0x3fa999999999999a;
  puStack_e0 = &uStack_88;
  func_0x0001400053f0(&uStack_58,uVar1);
  func_0x000140001490(&uStack_78,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puStack_d8 = &uStack_78;
  uVar3 = func_0x0001401445d0(param_1,uStack_a0,&uStack_68,3,uRam00000001405c8cc0,&puStack_e8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar2,uVar3);
  func_0x000140141c50(1);
  uStack_f0 = 3;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1876e);
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1876d);
  func_0x000140001490(&uStack_98,uVar2);
  puStack_e8 = &uStack_98;
  func_0x000140001490(&uStack_88,uVar3);
  uStack_4c = 0;
  uStack_58 = 0x3fe0000000000000;
  puStack_e0 = &uStack_88;
  func_0x0001400053f0(&uStack_58,uVar1);
  func_0x000140001490(&uStack_78,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puStack_d8 = &uStack_78;
  uVar1 = func_0x0001401445d0(param_1,uStack_a0,&uStack_68,3,uRam00000001405c8cc0,&puStack_e8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar2,uVar1);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
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
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_100;
  return;
}
END DECOMPILED REFERENCE */
