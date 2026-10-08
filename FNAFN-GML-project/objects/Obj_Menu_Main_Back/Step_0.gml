/// @description FNAFN Obj_Menu_Main_Back / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Back_Step_0 (@0x1400b1b70)
// Decoded, in order (uStack_e0 = 2 is the GML line marker):
//   1. global fetch `delta_factor` (id 0x1870b, +8 on the global context).
//   2. read image_alpha (slot uRam00000001405c7b98 — registry name
//      @0x1405c7b90, EXE-REGISTRY.md) via op helper func_0x00014015f1a0;
//      copied (func_0x000140001490) and pushed as lerp argument 1.
//   3. build lerp amount: 0.035 (0x3fa1eb851eb851ec) * delta_factor
//      (func_0x0001400053f0 = MUL op helper, proven shape).
//   4. lerp(image_alpha, <const @0x1405c4be8>, 0.035*delta_factor)
//      (slot uRam00000001405c8cc0 = lerp, registry), result written back
//      into image_alpha (func_0x000140160140).
//   5. const @0x1405c4be8 (exe_strings.py) = double 1.0 → the menu
//      background image fades IN to full alpha at 3.5%/frame (scaled by
//      delta_factor).
image_alpha = lerp(image_alpha, 1, 0.035 * delta_factor);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Back_Step_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  uint in_stack_fffffffffffffee8;
  ulonglong in_stack_fffffffffffffef0;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 uStack_f0;
  undefined *puStack_e8;
  undefined4 uStack_e0;
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
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_e8 = &UNK_14043bbe6;
  uStack_e0 = 0;
  uStack_f0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_f0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uRam0000000140657680 = param_1;
  uVar1 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_e0 = 2;
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_50,
                      in_stack_fffffffffffffee8 & 0xffffff00,
                      in_stack_fffffffffffffef0 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_88,&uStack_50);
  puStack_108 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x1405c4be8);
  uStack_34 = 0;
  uStack_40 = 0x3fa1eb851eb851ec;
  puStack_100 = &uStack_78;
  func_0x0001400053f0(&uStack_40,uVar1);
  func_0x000140001490(&uStack_68,&uStack_40);
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  puStack_f8 = &uStack_68;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_98,3,uRam00000001405c8cc0,&puStack_108);
  func_0x000140001490(&uStack_50,uVar1);
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_50);
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
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  puRam0000000140657668 = (undefined8 *)uStack_f0;
  return;
}
END DECOMPILED REFERENCE */
