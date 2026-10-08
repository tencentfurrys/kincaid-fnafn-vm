/// @description FNAFN Obj_Night_Camera_Screen_Flash / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Screen_Flash_Create_0 (@0x1400e51a0)
// Decoded, in order (uStack_a0 = 2 / 4 are GML line markers):
//   1. image_alpha (slot uRam00000001405c7b98 — registry name @0x1405c7b90,
//      EXE-REGISTRY.md) = 0 (empty RValue written via the assignment
//      helper func_0x000140160140).
//   2. image_xscale (slot uRam00000001405c7c18 — registry @0x1405c7c10)
//      = 1280 (0x4094000000000000; also confirmed as a constant in
//      EXE-CONSTANTS.md @0x1405c56e0).
//   3. image_yscale (slot uRam00000001405c7c08 — registry @0x1405c7c00)
//      = 720 (0x4086800000000000; EXE-CONSTANTS.md @0x1405c56f0).
// => a full-screen (1280x720) overlay whose visible alpha starts at 0
//    and is lerped up in Step (see Step.gml).
image_alpha = 0;
image_xscale = 1280;
image_yscale = 720;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Screen_Flash_Create_0(undefined8 param_1)

{
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
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
  uint uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  uint uStack_1c;
  undefined8 uStack_18;
  
  uStack_18 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043d702;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_1c = 0xffffff;
  uStack_28 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0;
  uStack_48 = 0;
  uRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_48);
  uStack_a0 = 2;
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  uStack_2c = 0;
  uStack_38 = 0x4094000000000000;
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_38);
  uStack_a0 = 4;
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_28);
  }
  uStack_1c = 0;
  uStack_28 = 0x4086800000000000;
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_28);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
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
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_28);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
