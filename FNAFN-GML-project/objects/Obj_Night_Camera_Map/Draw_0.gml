/// @description FNAFN Obj_Night_Camera_Map / Draw — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Camera_Map / Draw
if (Night_recording == 1) {
    // TODO: func_175550(7, image_index, str, 640.0)
}
draw_set_font(0);
draw_set_halign(fa_center);
draw_text(2303, 239, camera_text);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Camera_Map_Draw_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  double dVar3;
  uint in_stack_fffffffffffffee8;
  ulonglong in_stack_fffffffffffffef0;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 uStack_e8;
  undefined4 uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined *puStack_60;
  undefined4 uStack_58;
  double dStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_60 = &UNK_14043c6e0;
  uStack_58 = 0;
  uStack_68 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_68;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_44 = 0xffffff;
  dStack_50 = 0.0;
  uStack_38 = CONCAT44(0xffffff,(undefined4)uStack_38);
  uStack_40 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_58 = 1;
  uStack_dc = 0;
  uStack_e8 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar2,&uStack_e8,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_58 = 2;
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&dStack_50,
                        in_stack_fffffffffffffee8 & 0xffffff00,
                        in_stack_fffffffffffffef0 & 0xffffffffffffff00);
    dVar3 = dStack_50;
    if ((uStack_44 & 0xffffff) != 0) {
      dVar3 = (double)func_0x00014012d320(&dStack_50);
    }
    func_0x000140175550(param_1,7,(longlong)dVar3,_UNK_14043c6dc,0x44200000);
  }
  uStack_58 = 5;
  func_0x000140175520(0);
  uStack_58 = 6;
  func_0x000140175530(1);
  uStack_58 = 7;
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  uStack_40 = 0;
  uStack_38 = 0x500000000;
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x186ef);
  func_0x00014000bee0(&uStack_98,0x1405c5348);
  puStack_108 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x1405c5358);
  puStack_100 = &uStack_88;
  func_0x000140001490(&uStack_78,uVar2);
  puStack_f8 = &uStack_78;
  func_0x0001401445d0(param_1,param_2,&uStack_40,3,uRam00000001405c8da0,&puStack_108);
  uStack_58 = 9;
  func_0x000140175460(param_1);
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
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_50);
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
  puRam0000000140657668 = (undefined8 *)uStack_68;
  return;
}
END DECOMPILED REFERENCE */