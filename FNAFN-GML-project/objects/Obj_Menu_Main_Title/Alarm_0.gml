/// @description FNAFN Obj_Menu_Main_Title / Alarm_0 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Menu_Main_Title / Alarm_0
glitching = 1;
glitch_type = irandom_range(1, 5); // TODO
Scr_Camera_Update[1] = random_range(40, 70);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Main_Title_Alarm_0(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 uStack_100;
  undefined *puStack_f8;
  undefined4 uStack_f0;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_f8 = &UNK_14043d473;
  uStack_100 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_100;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_48 = CONCAT44(0xffffff,(undefined4)uStack_48);
  uStack_50 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_f0 = 1;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18729);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x3ff0000000000000;
  uStack_f0 = 2;
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_50 = 0;
  uStack_48 = 0x500000000;
  uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18728);
  func_0x00014000bee0(&uStack_a8,0x1405c6190);
  puStack_128 = &uStack_a8;
  func_0x00014000bee0(&uStack_98,0x1405c61a0);
  puStack_120 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x1405c61b0);
  puStack_118 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x1405c61c0);
  puStack_110 = &uStack_78;
  func_0x00014000bee0(&uStack_68,0x1405c61d0);
  puStack_108 = &uStack_68;
  uVar3 = func_0x000140168890(&uStack_50,5,&puStack_128);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar2,uVar3);
  func_0x000140141c50(1);
  uStack_f0 = 4;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  uVar2 = func_0x000140168cf0(_UNK_14043bb78,_UNK_14043bb80);
  func_0x000140141d00(param_1);
  puVar4 = (undefined8 *)func_0x00014012b840(puVar1,1);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = uVar2;
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_100;
  return;
}
END DECOMPILED REFERENCE */