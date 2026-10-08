/// @description FNAFN obj_OLDTVFilter_Tube_Only / Create — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: obj_OLDTVFilter_Tube_Only / Create
script_execute(scr_OLDTVFilter_Settings);
oldtvfilter_enabled = 1;
game_lines = 240;
noise_enabled = 0;
composite_enabled = 0;
television_enabled = 0;
chromatic_enabled = 0;
scanline_enabled = 0;
tube_enabled = 1;
tube_distortion = 0.3;
script_execute(scr_OLDTVFilter_Setup);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_obj_OLDTVFilter_Tube_Only_Create_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 *puVar7;
  undefined8 uVar8;
  undefined8 uVar9;
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
  double *pdStack_d8;
  undefined8 *puStack_d0;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  undefined8 *puStack_a0;
  double dStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_70;
  undefined *puStack_68;
  undefined4 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_68 = &UNK_14043dca8;
  uStack_60 = 0;
  uStack_70 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_70;
  uStack_8c = 0xffffff;
  dStack_98 = 0.0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uRam0000000140657680 = param_1;
  uStack_c0 = param_2;
  uStack_b8 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18750);
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18726);
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874b);
  puVar5 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f9);
  puVar6 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18781);
  puVar7 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f2);
  puStack_b0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18762);
  puStack_a8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18796);
  uVar8 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18797);
  puStack_a0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18795);
  iVar1 = iRam00000001405c8e60;
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
  uStack_60 = 0xb;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_98);
  }
  uStack_8c = 0;
  dStack_98 = (double)iVar1;
  pdStack_d8 = &dStack_98;
  func_0x0001401445d0(uStack_b8,uStack_c0,&uStack_58,1,uRam00000001405c8e50,&pdStack_d8);
  uStack_60 = 0xd;
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0x3ff0000000000000;
  uStack_60 = 0x13;
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x406c000000000000;
  uStack_60 = 0x16;
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_60 = 0x19;
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_60 = 0x1c;
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0;
  uStack_60 = 0x1f;
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0;
  uStack_60 = 0x22;
  if ((0x46U >> (*(uint *)((longlong)puStack_b0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_b0);
  }
  *(undefined4 *)((longlong)puStack_b0 + 0xc) = 0;
  *puStack_b0 = 0;
  uStack_60 = 0x25;
  if ((0x46U >> (*(uint *)((longlong)puStack_a8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_a8);
  }
  *(undefined4 *)((longlong)puStack_a8 + 0xc) = 0;
  *puStack_a8 = 0x3ff0000000000000;
  uStack_60 = 0x26;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_98,0x1405c69a0);
  pdStack_d8 = &dStack_98;
  func_0x00014000bee0(&uStack_88,0x1406575a0);
  puStack_d0 = &uStack_88;
  uVar9 = func_0x0001401445d0(uStack_b8,uStack_c0,&uStack_58,2,uRam00000001405c8bc0,&pdStack_d8);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar8,uVar9);
  func_0x000140141c50(1);
  uStack_60 = 0x27;
  if ((0x46U >> (*(uint *)((longlong)puStack_a0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_a0);
  }
  *(undefined4 *)((longlong)puStack_a0 + 0xc) = 0;
  *puStack_a0 = 0x3fd3333333333333;
  uStack_60 = 0x2a;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  iVar1 = iRam00000001405c8e70;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_98);
  }
  dStack_98 = (double)iVar1;
  uStack_8c = 0;
  pdStack_d8 = &dStack_98;
  func_0x0001401445d0(uStack_b8,uStack_c0,&uStack_58,1,uRam00000001405c8e50,&pdStack_d8);
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
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_70;
  return;
}
END DECOMPILED REFERENCE */