/// @description FNAFN Obj_Night_Radio_Spinner / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Radio_Spinner_Create_0 (@0x1400e3ec0)
// Decoded, in order (uStack_88 = 2 / 4 are GML line markers):
//   1. image_alpha (slot uRam00000001405c7b98 — registry name @0x1405c7b90,
//      EXE-REGISTRY.md) = 0 via assignment helper func_0x000140160140.
//   2. `turn_speed` (id 0x18799 — builtin_ids.json) = 0 (fetch-then-zero
//      via +0x10 path).
//   3. `turn` (id 0x18798 — builtin_ids.json) = 0.
// => the radio dial spinner starts invisible and not turning; its Step
//    drives `turn` (rotation) and re-reveals alpha.
image_alpha = 0;
turn_speed = 0;
turn = 0;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Radio_Spinner_Create_0(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
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
  puStack_90 = &UNK_14043d39d;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_24 = 0;
  uStack_30 = 0;
  plRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_30);
  uStack_88 = 2;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18799);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
  uStack_88 = 4;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18798);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
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
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_24 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
