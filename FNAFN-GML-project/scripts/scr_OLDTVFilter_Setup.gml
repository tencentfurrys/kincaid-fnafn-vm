/// @description FNAFN gml_GlobalScript_scr_OLDTVFilter_Setup — PORTED from C (YYC re-export stub)
// Ground truth: gml_GlobalScript_scr_OLDTVFilter_Setup (197 B @0x140032cd0)
// A YYC GlobalScript block is a re-export: it calls the runner's id-registration
// path (a fetch on id 0x18705/0x1870b/... in the annotated C) once per script
// defined below it in GameMaker's original script list, counting them in
// uStack_40. No GML statement runs (param_3 return = undefined; no side
// effects). The functions themselves live in their own gml_Script_* files;
// in a from-source GM project these become plain script assets in order:

// Registered script ids: 0x18768 (scr_OLDTVFilter_Setup)
// This file intentionally contains no executable GML.

/* BEGIN DECOMPILED REFERENCE
// #### gml_GlobalScript_scr_OLDTVFilter_Setup  va=0x140032cd0  size=197 ====

undefined8 *
gml_GlobalScript_scr_OLDTVFilter_Setup(longlong *param_1,undefined8 param_2,undefined8 *param_3)

{
  undefined8 uVar1;
  undefined8 uStack_50;
  undefined *puStack_48;
  undefined4 uStack_40;
  undefined auStack_38 [12];
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_48 = &UNK_14043a1b5 / * "gml_GlobalScript_scr_OLDTVFilter_Setup" * /;
  uStack_50 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_50;
  plRam0000000140657680 = param_1;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  uStack_40 = 1;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18768 / * scr_OLDTVFilter_Setup * /);
  func_0x0001401452a0(auStack_38,gml_Script_scr_OLDTVFilter_Setup,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  puRam0000000140657668 = (undefined8 *)uStack_50;
  return param_3;
}
END DECOMPILED REFERENCE */

// BOOT SHIM (calibration track replaces with the real preset applier):
// function-less scripts register no runtime asset entry, breaking script_execute(name).
// The YYC re-export ran no GML, so a no-op callee is faithful.
function scr_OLDTVFilter_Setup() {
    return 0;
}
