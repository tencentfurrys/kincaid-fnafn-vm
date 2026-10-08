/// @description FNAFN Obj_Office_Front_Left / Other — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Left_Other_5 (470 B @0x140073850)
// audio_emitter_free x2 via slot 0x1405c8ec0 (same as Middle/Right).
// Second id 0x186d6 registry-collides as __init_global — true emitter name
// TODO, shared with Front_Right cleanup.
audio_emitter_free(door_emitter);
audio_emitter_free(__init_global); // TODO: id 0x186d6 true name unknown

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Front_Left_Other_5(longlong *param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 *puStack_90;
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
  puStack_a0 = &UNK_14043b328;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
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
  puStack_90 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8ec0,&puStack_90);
  uStack_98 = 3;
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  uVar1 = (**(code **)(*param_1 + 8))(param_1,0x186d6);
  func_0x000140001490(&uStack_58,uVar1);
  puStack_90 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8ec0,&puStack_90);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
