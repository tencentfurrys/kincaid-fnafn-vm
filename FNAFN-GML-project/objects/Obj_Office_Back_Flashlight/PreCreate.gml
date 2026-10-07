/// @description FNAFN Obj_Office_Back_Flashlight / PreCreate — PORTED from C
// Ground truth: gml_Object_Obj_Office_Back_Flashlight_PreCreate_0 (124 B @0x1400472a0)
// Decoded: one no-argument call to runner service func_0x000140181be0
// with the result discarded — the canonical PreCreate statement
// event_inherited() (no variable fetches, no property writes).
// The generated project has no PreCreate stub files; this file exists
// because dropping a PreCreate that calls event_inherited() would
// break parent PreCreate chaining (GML does not auto-chain Create
// events). Empty original PreCreates elsewhere were left unemitted.
// TODO(calibrate): confirm the object's parent chain in-game; if the
// object has no parent, event_inherited() is a documented no-op.
event_inherited();

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Office_Back_Flashlight_PreCreate_0  va=0x1400472a0  size=124 ====

void gml_Object_Obj_Office_Back_Flashlight_PreCreate_0(undefined8 param_1)

{
  undefined8 uStack_38;
  undefined *puStack_30;
  undefined4 uStack_28;
  undefined8 uStack_20;
  uint uStack_14;
  undefined8 uStack_10;
  
  uStack_10 = 0xfffffffffffffffe;
  puStack_30 = &UNK_14043a72e / * "gml_Object_Obj_Office_Back_Flashlight_PreCreate_0" * /;
  uStack_38 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_38;
  uStack_14 = 0xffffff;
  uStack_20 = 0;
  uStack_28 = 1;
  uRam0000000140657680 = param_1;
  func_0x000140181be0();
  if ((0x46U >> (uStack_14 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_20);
  }
  puRam0000000140657668 = (undefined8 *)uStack_38;
  return;
}
END DECOMPILED REFERENCE */
