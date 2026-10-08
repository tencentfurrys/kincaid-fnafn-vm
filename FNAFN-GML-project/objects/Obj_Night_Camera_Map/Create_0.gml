/// @description FNAFN Obj_Night_Camera_Map / Create — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Map_Create_0
// camera_text (id 0x186ef) = runtime string const @0x140656790
// TODO(calibrate): guarded-pool string, exe absent.
camera_text = ""; // TODO(calibrate): @0x140656790

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Map_Create_0(longlong *param_1)

{
  longlong lVar1;
  undefined8 uStack_80;
  undefined *puStack_78;
  undefined4 uStack_70;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  uint uStack_1c;
  undefined8 uStack_18;
  
  uStack_18 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043c68c;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_1c = 0xffffff;
  uStack_28 = 0;
  uStack_70 = 2;
  plRam0000000140657680 = param_1;
  lVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x186ef);
  if ((0x46U >> (*(uint *)(lVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar1);
  }
  func_0x0001401441e0(lVar1,0x140656790);
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_28);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
