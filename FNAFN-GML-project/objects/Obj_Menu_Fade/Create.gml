/// @description FNAFN Obj_Menu_Fade / Create_0 — PORTED from C (rebuilt 2026-10-01)
// Ground truth: gml_Object_Obj_Menu_Fade_Create_0 (293 B @0x14006bad0)
// Decoded (uStack_70 = 2 is the GML line marker): one assignment write
// (helper func_0x000140160140) of 1.0 (0x3ff0000000000000) into slot
// uRam00000001405c7b98.
// CORRECTION vs the old port: EXE-REGISTRY.md's name-pointer rule proves
// slot 0x1405c7b98 = image_alpha (name @0x1405c7b90), NOT `fading` (the
// old "proven fading" note conflated variable id 0x18719 with the slot it
// feeds). The fade overlay therefore fades its own image_alpha, which the
// Step/Draw events below read back consistently.
image_alpha = 1;

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Menu_Fade_Create_0  va=0x14006bad0  size=293 ====

void gml_Object_Obj_Menu_Fade_Create_0(undefined8 param_1)

{
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
  puStack_78 = &UNK_14043b0e4 / * "gml_Object_Obj_Menu_Fade_Create_0" * /;
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
  uStack_70 = 2;
  uStack_1c = 0;
  uStack_28 = 0x3ff0000000000000;
  uRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_28);
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
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_28);
  }
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
