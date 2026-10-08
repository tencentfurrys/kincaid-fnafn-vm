/// @description FNAFN Obj_Night_Camera_Tablet / PreCreate — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Tablet_PreCreate_0 (195 B @0x1400579d0)
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
// #### gml_Object_Obj_Night_Camera_Tablet_PreCreate_0  va=0x1400579d0  size=195 ====

void gml_Object_Obj_Night_Camera_Tablet_PreCreate_0(undefined8 param_1)

{
  undefined8 uStack_60;
  undefined *puStack_58;
  undefined4 uStack_50;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  uint uStack_1c;
  undefined8 uStack_18;
  
  uStack_18 = 0xfffffffffffffffe;
  puStack_58 = &UNK_14043aaf6 / * "gml_Object_Obj_Night_Camera_Tablet_PreCreate_0" * /;
  uStack_60 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_60;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_1c = 0xffffff;
  uStack_28 = 0;
  uStack_50 = 1;
  uRam0000000140657680 = param_1;
  func_0x000140181be0();
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_28);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  puRam0000000140657668 = (undefined8 *)uStack_60;
  return;
}
END DECOMPILED REFERENCE */
