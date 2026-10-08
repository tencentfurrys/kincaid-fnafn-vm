/// @description FNAFN Obj_Menu_Main_Title / Alarm_1 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Title_Alarm_1 (455 B @0x1400feb50)
// Byte-identical logic to Obj_Menu_Main_Back_Alarm_1 except the
// random_range upper bound: 0x14043bb48 = 400.0 (not 500.0).
glitching = 0;
Scr_Camera_Update[0] = random_range(5, 400);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Title_Alarm_1(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
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
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043d49a / * "gml_Object_Obj_Menu_Main_Title_Alarm_1" * /;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
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
  uStack_88 = 1;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18729 / * glitching * /);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
  uStack_88 = 3;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5 / * Scr_Camera_Update * /);
  uVar3 = func_0x000140168cf0(_UNK_14043bbb0,_UNK_14043bb48);
  func_0x000140141d00(param_1);
  puVar2 = (undefined8 *)func_0x00014012b840(puVar1,0);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = uVar3;
  func_0x000140141c50(2);
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
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
