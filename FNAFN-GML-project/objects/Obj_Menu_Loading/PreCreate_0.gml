/// @description FNAFN Obj_Menu_Loading / PreCreate — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Loading_PreCreate_0 (384 B @0x140093aa0)
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
// #### gml_Object_Obj_Menu_Loading_PreCreate_0  va=0x140093aa0  size=384 ====

void gml_Object_Obj_Menu_Loading_PreCreate_0(longlong *param_1)

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
  puStack_80 = &UNK_14043b8bc / * "gml_Object_Obj_Menu_Loading_PreCreate_0" * /;
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
  func_0x000140181be0();
  uStack_78 = 3;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18760 / * Room_to_go_to * /);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1877d / * Switches_to_room * /);
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
