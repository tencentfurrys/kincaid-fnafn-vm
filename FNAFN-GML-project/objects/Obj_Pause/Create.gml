/// @description FNAFN Obj_Pause / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Pause_Create_0 (314 B @0x1400c5d60)
// Decoded: single statement — self write (via +0x10 fetch, the
// variable-write path used for instance variables) of `paused`
// (id 0x18754) = 0. Nothing else.
paused = 0;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Pause_Create_0(longlong *param_1)

{
  undefined8 *puVar1;
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
  puStack_80 = &UNK_14043c733 / * "gml_Object_Obj_Pause_Create_0" * /;
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
  uStack_78 = 2;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18754 / * "paused" * /);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
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
