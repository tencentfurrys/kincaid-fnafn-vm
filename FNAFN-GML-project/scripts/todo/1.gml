/// @description FNAFN gml_GlobalScript_1 — PORTED from C (YYC re-export stub)
// Ground truth: gml_GlobalScript_1 (388 B @0x14012a0f0)
// A YYC GlobalScript block is a re-export: it calls the runner's id-registration
// path (a fetch on id 0x18705/0x1870b/... in the annotated C) once per script
// defined below it in GameMaker's original script list, counting them in
// uStack_40. No GML statement runs (param_3 return = undefined; no side
// effects). The functions themselves live in their own gml_Script_* files;
// in a from-source GM project these become plain script assets in order:

// Registered script ids: (none)
// This file intentionally contains no executable GML.

/* BEGIN DECOMPILED REFERENCE
// #### gml_GlobalScript_1  va=0x14012a0f0  size=388 ====

undefined8 * gml_GlobalScript_1(undefined8 param_1,undefined8 param_2,undefined8 *param_3)

{
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
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
  undefined8 uStack_28;
  undefined8 uStack_20;
  
  uStack_20 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043debd / * "gml_GlobalScript_1" * /;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
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
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uRam0000000140657680 = param_1;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  uStack_30 = 0;
  uStack_28 = 0x500000000;
  gml_Script___init_global(param_1,param_2,&uStack_30,0,0);
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
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_28._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return param_3;
}
END DECOMPILED REFERENCE */
