/// @description FNAFN Obj_Night_Time / Alarm_1 - PORTED from C
// ---- sub-event Alarm_1 (split from Alarm.gml) ----
// Ground truth: gml_Object_Obj_Night_Time_Alarm_1 (288 B @0x140089cf0)
// Present in the annotated C but emitted by no generated file (the
// generator only writes Alarm_0 as "Alarm.gml" — the same numbering gap
// fill_keymouse_stubs.py fixed for Key/Mouse). Fires when the
// Scr_Camera_Update[1] secondary timer expires (armed by Alarm_0):
//   line 2: fading = 1 (0x3ff0000000000000) — fade the clock back to full
//     brightness (Step's fading == 1 lerp branch)
fading = 1;

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Night_Time_Alarm_1  va=0x140089cf0  size=288 ====

void gml_Object_Obj_Night_Time_Alarm_1(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 uStack_78;
  undefined *puStack_70;
  undefined4 uStack_68;
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
  puStack_70 = &UNK_14043b5ae / * "gml_Object_Obj_Night_Time_Alarm_1" * /;
  uStack_78 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_78;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_24 = 0xffffff;
  uStack_30 = 0;
  uStack_68 = 2;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719 / * fading * /);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x3ff0000000000000;
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
  puRam0000000140657668 = (undefined8 *)uStack_78;
  return;
}
END DECOMPILED REFERENCE */
