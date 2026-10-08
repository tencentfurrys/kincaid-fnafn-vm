/// @description FNAFN Obj_Filter_Menus / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Filter_Menus / Step
static_magnetude = lerp(static_magnetude, 0.055, 0.1 * delta_factor);
static_offset += 0.005 * delta_factor;
if (static_offset >= 1) {
    static_offset = 0;
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Filter_Menus_Step_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
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
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043c490;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18775);
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a0 = 3;
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  func_0x000140001490(&uStack_88,uVar2);
  puStack_108 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x1405c5098);
  uStack_44 = 0;
  uStack_50 = 0x3fb999999999999a;
  puStack_100 = &uStack_78;
  func_0x0001400053f0(&uStack_50,uVar3);
  func_0x000140001490(&uStack_68,&uStack_50);
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  puStack_f8 = &uStack_68;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_98,3,uRam00000001405c8cc0,&puStack_108);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar2,uVar5);
  func_0x000140141c50(1);
  uStack_a0 = 5;
  uStack_44 = 0;
  uStack_50 = 0x3f747ae147ae147b;
  func_0x0001400053f0(&uStack_50,uVar3);
  func_0x000140005290(puVar4,&uStack_50);
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_a0 = 6;
  uStack_44 = 0;
  uStack_50 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(puVar4,&uStack_50,uRam00000001405cd9c0,1);
  if (-1 < iVar1) {
    uStack_a0 = 8;
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0;
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */