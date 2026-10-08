/// @description FNAFN Obj_Office_Front_Right / Other — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// ground truth: gml_Object_Obj_Office_Front_Right_Other_5 (504 B @0x1400fa890)
// Ported: Obj_Office_Front_Right / Other
audio_emitter_free(door_emitter);
audio_emitter_free(__init_global); // TODO: 0x186d6 name

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Front_Right_Other_5(longlong *param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 *puStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  
  uStack_38 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043d31c;
  uStack_a8 = 0;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  plRam0000000140657680 = param_1;
  uVar1 = (**(code **)(*param_1 + 8))(param_1,0x1870f);
  func_0x000140001490(&uStack_58,uVar1);
  puStack_a0 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8ec0,&puStack_a0);
  uStack_a8 = 3;
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  uVar1 = (**(code **)(*param_1 + 8))(param_1,0x186d6);
  func_0x000140001490(&uStack_58,uVar1);
  puStack_a0 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8ec0,&puStack_a0);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
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
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */