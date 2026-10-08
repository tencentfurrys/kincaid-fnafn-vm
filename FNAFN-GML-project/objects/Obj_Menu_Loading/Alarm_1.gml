/// @description FNAFN Obj_Menu_Loading / Alarm_1 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Loading_Alarm_1 (323 B @0x140090fd0)
// var id 0x18733 'Loading' (instance-var path); helper 0x140181c50 =
// event_perform PROVEN (type 2 = ev_alarm, number 0).
Loading = 1;
event_perform(ev_alarm, 0);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Loading_Alarm_1(longlong *param_1,undefined8 param_2)

{
  undefined8 *puVar1;
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
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043b84a / * "gml_Object_Obj_Menu_Loading_Alarm_1" * /;
  uStack_70 = 0;
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
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18733 / * Loading * /);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x3ff0000000000000;
  uStack_70 = 2;
  func_0x000140181c50(param_1,param_2,2,0);
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
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
