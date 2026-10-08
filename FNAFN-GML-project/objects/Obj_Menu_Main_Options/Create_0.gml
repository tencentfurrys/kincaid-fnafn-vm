/// @description FNAFN Obj_Menu_Main_Options / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Options_Create_0 (@0x1400a9120)
// Decoded (uStack_b8 = 3 is the GML line marker):
//   1. image_xscale (slot uRam00000001405c7c18 — registry name @0x1405c7c10,
//      EXE-REGISTRY.md) = 1.2 (0x3ff3333333333333) via assignment helper
//      func_0x000140160140.
//   2. image_yscale (slot uRam00000001405c7c08 — registry @0x1405c7c00)
//      = 1.2 (0x3ff3333333333333).
// => menu options button art rendered 20% larger than its sprite base
//    size. The rest is RValue destructor noise + self-context push/pop.
image_xscale = 1.2;
image_yscale = 1.2;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Options_Create_0(undefined8 param_1)

{
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
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
  puStack_c0 = &UNK_14043de02;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
  uStack_24 = 0xffffff;
  uStack_30 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0;
  uStack_40 = 0x3ff3333333333333;
  uRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_40);
  uStack_b8 = 3;
  if ((0x46U >> (uStack_24 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  uStack_24 = 0;
  uStack_30 = 0x3ff3333333333333;
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_30);
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
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_24 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */
