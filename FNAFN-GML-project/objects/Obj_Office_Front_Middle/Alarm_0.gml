/// @description FNAFN Obj_Office_Front_Middle / Alarm — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Middle_Alarm_0
//   Scr_Camera_Update[0] = irandom_range(3, 5) — array-element write shape
//     (accessor + argc 2); func_0x000140168970(3,5) best-fit irandom_range
//     TODO(prove via disassembly, same helper in AI Alarm/Create).
//   image_index (slot 0x1405c7aa8) = irandom_range(0, 23) (0x17 = 23)
//     via self-write helper.
Scr_Camera_Update[0] = irandom_range(3, 5); // TODO: prove 0x140168970 = irandom_range
image_index = irandom_range(0, 23);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Front_Middle_Alarm_0(longlong *param_1)

{
  undefined8 uVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  uint uStack_94;
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
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043c507;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_a8 = 1;
  uRam0000000140657680 = 0x28795;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  uVar1 = func_0x000140168970(3,5);
  func_0x000140141d00(param_1);
  puVar3 = (undefined8 *)func_0x00014012b840(puVar2,0);
  func_0x000140141d00(*puVar2);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = uVar1;
  func_0x000140141c50(2);
  uStack_a8 = 2;
  uVar1 = func_0x000140168970(0,0x17);
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_44 = 0;
  uStack_50 = uVar1;
  func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_50);
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
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */
