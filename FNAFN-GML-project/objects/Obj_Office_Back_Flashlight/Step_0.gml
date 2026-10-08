/// @description FNAFN Obj_Office_Back_Flashlight / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Office_Back_Flashlight / Step
x = lerp(x, mouse_x, 0.1 * delta_factor);
y = lerp(y, mouse_y, 0.1 * delta_factor);
x = clamp(x, 0, 1280); // TODO bounds
y = clamp(y, 0, 720);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Back_Flashlight_Step_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  uint in_stack_fffffffffffffed8;
  uint uVar3;
  ulonglong in_stack_fffffffffffffee0;
  undefined8 **ppuVar4;
  undefined8 uStack_110;
  undefined *puStack_108;
  undefined4 uStack_100;
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
  undefined8 *puStack_a8;
  undefined8 *puStack_a0;
  undefined8 *puStack_98;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_108 = &UNK_14043a701;
  uStack_100 = 0;
  uStack_110 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_110;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uRam0000000140657680 = param_1;
  uVar1 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_100 = 1;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_88,
                      in_stack_fffffffffffffed8 & 0xffffff00,
                      in_stack_fffffffffffffee0 & 0xffffffffffffff00);
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_f8);
  func_0x000140001490(&uStack_d8,&uStack_88);
  puStack_a8 = &uStack_d8;
  func_0x000140001490(&uStack_c8,&uStack_f8);
  uStack_5c = 0;
  uStack_68 = 0x3fb999999999999a;
  puStack_a0 = &uStack_c8;
  func_0x0001400053f0(&uStack_68,uVar1);
  func_0x000140001490(&uStack_b8,&uStack_68);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  ppuVar4 = &puStack_a8;
  uVar3 = uRam00000001405c8cc0;
  puStack_98 = &uStack_b8;
  uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8cc0,ppuVar4);
  func_0x000140001490(&uStack_88,uVar2);
  func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_88);
  uStack_100 = 2;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_78,uVar3 & 0xffffff00,
                      (ulonglong)ppuVar4 & 0xffffffffffffff00);
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_e8);
  func_0x000140001490(&uStack_d8,&uStack_78);
  puStack_a8 = &uStack_d8;
  func_0x000140001490(&uStack_c8,&uStack_e8);
  uStack_5c = 0;
  uStack_68 = 0x3fb999999999999a;
  puStack_a0 = &uStack_c8;
  func_0x0001400053f0(&uStack_68,uVar1);
  func_0x000140001490(&uStack_b8,&uStack_68);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  ppuVar4 = &puStack_a8;
  uVar3 = uRam00000001405c8cc0;
  puStack_98 = &uStack_b8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8cc0,ppuVar4);
  func_0x000140001490(&uStack_78,uVar1);
  func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_78);
  uStack_100 = 4;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_88,uVar3 & 0xffffff00,
                      (ulonglong)ppuVar4 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_d8,&uStack_88);
  puStack_a8 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c38a0);
  puStack_a0 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c38b0);
  ppuVar4 = &puStack_a8;
  uVar3 = uRam00000001405c8a00;
  puStack_98 = &uStack_b8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8a00,ppuVar4);
  func_0x000140001490(&uStack_88,uVar1);
  func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_88);
  uStack_100 = 5;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_78,uVar3 & 0xffffff00,
                      (ulonglong)ppuVar4 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_d8,&uStack_78);
  puStack_a8 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c38c0);
  puStack_a0 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c38d0);
  puStack_98 = &uStack_b8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8a00,&puStack_a8);
  func_0x000140001490(&uStack_78,uVar1);
  func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_78);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
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
  puRam0000000140657668 = (undefined8 *)uStack_110;
  return;
}
END DECOMPILED REFERENCE */