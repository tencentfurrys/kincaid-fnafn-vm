/// @description FNAFN Obj_Night_Radio_Buttons / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Radio_Buttons / Step_0
// Ground truth: gml_Object_Obj_Night_Radio_Buttons_Step_0
// delta_factor (global id 0x1870b, builtin_ids.json) drives all three eases;
// playing (id 0x18759) selects the scale target. Each stage is
// image_xscale = lerp(image_xscale, TARGET, 0.4 * delta_factor) (lerp slot
// uRam00000001405c8cc0, MUL helper func_0x0001400053f0) with image_yscale kept
// equal to image_xscale afterwards (slots uRam00000001405c7c18 image_xscale /
// uRam00000001405c7c08 image_yscale, EXE-REGISTRY.md). Targets are exe consts
// (EXE-CONSTANTS.md): 0x1405c6460 = 1.0, 0x1405c6470 = 0.65, 0x1405c6480 =
// 1.15; 0x3fd999999999999a = 0.4. Compare `== 0` -> `==` (PORTING.md rule).
image_xscale = lerp(image_xscale, 1, 0.4 * delta_factor);
image_yscale = image_xscale;
if (playing == 1) {
    image_xscale = lerp(image_xscale, 0.65, 0.4 * delta_factor);
    image_yscale = image_xscale;
}
if (playing == 0) {
    image_xscale = lerp(image_xscale, 1.15, 0.4 * delta_factor);
    image_yscale = image_xscale;
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Radio_Buttons_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined4 uVar5;
  uint in_stack_fffffffffffffea8;
  uint uVar6;
  ulonglong in_stack_fffffffffffffeb0;
  undefined8 **ppuVar7;
  ulonglong uVar8;
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
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043d67e;
  uStack_a8 = 0;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_a8 = 1;
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,
                      in_stack_fffffffffffffea8 & 0xffffff00,
                      in_stack_fffffffffffffeb0 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_108,&uStack_80);
  puStack_d8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c6460);
  uStack_64 = 0;
  uStack_70 = 0x3fd999999999999a;
  puStack_d0 = &uStack_f8;
  func_0x0001400053f0(&uStack_70,uVar2);
  func_0x000140001490(&uStack_e8,&uStack_70);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  ppuVar7 = &puStack_d8;
  uVar6 = uRam00000001405c8cc0;
  puStack_c8 = &uStack_e8;
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_90,3,uRam00000001405c8cc0,ppuVar7);
  func_0x000140001490(&uStack_80,uVar3);
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_80);
  uStack_a8 = 2;
  uVar8 = (ulonglong)ppuVar7 & 0xffffffffffffff00;
  uVar6 = uVar6 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,uVar6,uVar8);
  func_0x000140001490(&uStack_a0,&uStack_80);
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0);
  uStack_a8 = 4;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18759);
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  uVar5 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar3,&uStack_70,uVar5,0);
  if (iVar1 == 0) {
    uStack_a8 = 6;
    if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_90 = 0;
    uStack_88 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,uVar6 & 0xffffff00,
                        uVar8 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_108,&uStack_80);
    puStack_d8 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c6470);
    uStack_64 = 0;
    uStack_70 = 0x3fd999999999999a;
    puStack_d0 = &uStack_f8;
    func_0x0001400053f0(&uStack_70,uVar2);
    func_0x000140001490(&uStack_e8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    ppuVar7 = &puStack_d8;
    uVar6 = uRam00000001405c8cc0;
    puStack_c8 = &uStack_e8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_90,3,uRam00000001405c8cc0,ppuVar7);
    func_0x000140001490(&uStack_80,uVar4);
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_80);
    uStack_a8 = 7;
    uVar8 = (ulonglong)ppuVar7 & 0xffffffffffffff00;
    uVar6 = uVar6 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,uVar6,uVar8);
    func_0x000140001490(&uStack_a0,&uStack_80);
    func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0);
    uVar5 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_a8 = 9;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar1 = func_0x00014015be60(uVar3,&uStack_70,uVar5,0);
  if (iVar1 == 0) {
    uStack_a8 = 0xb;
    if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_90 = 0;
    uStack_88 = 0x500000000;
    (**(code **)(*param_1 + 8))(param_1,0x18759);
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,uVar6 & 0xffffff00,
                        uVar8 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_108,&uStack_80);
    puStack_d8 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c6480);
    uStack_64 = 0;
    uStack_70 = 0x3fd999999999999a;
    puStack_d0 = &uStack_f8;
    func_0x0001400053f0(&uStack_70,uVar2);
    func_0x000140001490(&uStack_e8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    ppuVar7 = &puStack_d8;
    uVar6 = uRam00000001405c8cc0;
    puStack_c8 = &uStack_e8;
    uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_90,3,uRam00000001405c8cc0,ppuVar7);
    func_0x000140001490(&uStack_80,uVar2);
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_80);
    uStack_a8 = 0xc;
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,uVar6 & 0xffffff00,
                        (ulonglong)ppuVar7 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_a0,&uStack_80);
    func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0);
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
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */
