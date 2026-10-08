/// @description FNAFN Obj_Night_UI_Power / Create — PORTED from C
// Ground truth: gml_Object_Obj_Night_UI_Power_Create_0
// power_bar_opacity (id 0x1875a) is an ARRAY (same as Draw's 0/1/2 indexing):
//   [0] = [1] = [2] = 0.25 (0x3fd0000000000000), element-write shape.
// Night_power_amount (id 0x18748, global fetch) = 0.
power_bar_opacity[0] = 0.25;
power_bar_opacity[1] = 0.25;
power_bar_opacity[2] = 0.25;
Night_power_amount = 0;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_UI_Power_Create_0(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
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
  
  uStack_38 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043abfb;
  uStack_70 = 0;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18748);
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  plRam0000000140657680 = (longlong *)0x28796;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
  func_0x000140141d00(param_1);
  puVar3 = (undefined8 *)func_0x00014012b840(puVar2,0);
  func_0x000140141d00(*puVar2);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3fd0000000000000;
  func_0x000140141c50(2);
  uStack_70 = 2;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
  func_0x000140141d00(param_1);
  puVar3 = (undefined8 *)func_0x00014012b840(puVar2,1);
  func_0x000140141d00(*puVar2);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3fd0000000000000;
  func_0x000140141c50(2);
  uStack_70 = 3;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
  func_0x000140141d00(param_1);
  puVar3 = (undefined8 *)func_0x00014012b840(puVar2,2);
  func_0x000140141d00(*puVar2);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3fd0000000000000;
  func_0x000140141c50(2);
  uStack_70 = 6;
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
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
