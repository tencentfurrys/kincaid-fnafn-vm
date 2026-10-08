/// @description FNAFN Obj_Menu_Night_Display / Alarm — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Night_Display_Alarm_0 (288 B)
// Single-statement alarm: fade (id 0x18717) = 1.0 (0x3ff0000000000000).
// Direct id-fetch write shape — same as Obj_Night_Time/Alarm_1.
fade = 1;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Night_Display_Alarm_0(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 uStack_68;
  undefined *puStack_60;
  undefined4 uStack_58;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  uint uStack_24;
  undefined8 uStack_20;
  
  uStack_20 = 0xfffffffffffffffe;
  puStack_60 = &UNK_14043ab50;
  uStack_68 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_68;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_24 = 0xffffff;
  uStack_30 = 0;
  uStack_58 = 2;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18717);
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
  puRam0000000140657668 = (undefined8 *)uStack_68;
  return;
}
END DECOMPILED REFERENCE */
