/// @description FNAFN Obj_Menu_Warning / Alarm_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Warning_Alarm_0 (441 B @0x1401129f0)
// Byte-identical logic to Obj_Menu_Disclaimer_Alarm_0 (same size, same
// constants, same call sequence -- the mirror holds).
// Variable note: write goes through the INSTANCE-VARIABLE path (fetch id
// 0x18719 via *param_1+0x10, then *puVar1 = 1.0) -> custom variable
// `fading` (builtin_ids.json 0x18719); NOT built-in slot 0x1405c7b98,
// which EXE-REGISTRY.md names image_alpha (old note conflated the two).
// Ghidra ordering: the 300.0 store appears AFTER the call in the C
// (store-after-call artefact); it may belong to the NEXT operation.
fading = 1;
Scr_Camera_Update();
// TODO(calibrate): fast-path call with argument 300 - likely a timer/alarm
// or transition speed; confirm before enabling.
// builtin_name(300);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Warning_Alarm_0(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  uint uStack_24;
  undefined8 uStack_20;
  
  uStack_20 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043d8c4;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_24 = 0xffffff;
  uStack_30 = 0;
  uStack_78 = 1;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x3ff0000000000000;
  uStack_78 = 3;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  func_0x000140141d00(param_1);
  puVar2 = (undefined8 *)func_0x00014012b840(puVar1,1);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0x4069000000000000;
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_24 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */