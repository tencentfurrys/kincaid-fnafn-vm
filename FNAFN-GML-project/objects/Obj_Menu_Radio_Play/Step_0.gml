/// @description FNAFN Obj_Menu_Radio_Play / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Menu_Radio_Play / Step
image_xscale = lerp(image_xscale, 1, 0.3 * delta_factor);
image_yscale = image_xscale;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Radio_Play_Step_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  uint in_stack_fffffffffffffed8;
  uint uVar2;
  ulonglong in_stack_fffffffffffffee0;
  undefined8 **ppuVar3;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 uStack_100;
  undefined *puStack_f8;
  undefined4 uStack_f0;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_f8 = &UNK_14043cf84;
  uStack_f0 = 0;
  uStack_100 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_100;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uRam0000000140657680 = param_1;
  uVar1 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_f0 = 1;
  uStack_a8 = 0;
  uStack_a0 = 0x500000000;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_40,
                      in_stack_fffffffffffffed8 & 0xffffff00,
                      in_stack_fffffffffffffee0 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_98,&uStack_40);
  puStack_118 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x1405c5cf8);
  uStack_44 = 0;
  uStack_50 = 0x3fd3333333333333;
  puStack_110 = &uStack_88;
  func_0x0001400053f0(&uStack_50,uVar1);
  func_0x000140001490(&uStack_78,&uStack_50);
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  ppuVar3 = &puStack_118;
  uVar2 = uRam00000001405c8cc0;
  puStack_108 = &uStack_78;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,ppuVar3);
  func_0x000140001490(&uStack_40,uVar1);
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_40);
  uStack_f0 = 3;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_40,uVar2 & 0xffffff00,
                      (ulonglong)ppuVar3 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_60,&uStack_40);
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_60);
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
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
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