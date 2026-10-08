/// @description FNAFN Obj_Menu_Main_Back / Alarm_1 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Back_Alarm_1 (455 B @0x14009f750)
// var id 0x18729 'glitching' -> glitching = 0.
// NEW PROVEN HELPER: func_0x000140168cf0 = random_range(a, b) --
// disassembly 0x140168cf0: min/max order, runner RNG, min+rand*(max-min).
// consts 0x14043bbb0 = 5.0, 0x14043bbb8 = 500.0 (read from exe .data).
// 0x186d5 'Scr_Camera_Update' is an ARRAY (PROVEN); element 0 write.
glitching = 0;
Scr_Camera_Update[0] = random_range(5, 500);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Back_Alarm_1(longlong *param_1)

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
  puStack_90 = &UNK_14043bbc0 / * "gml_Object_Obj_Menu_Main_Back_Alarm_1" * /;
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
  uVar3 = func_0x000140168cf0(_UNK_14043bbb0,_UNK_14043bbb8);
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
