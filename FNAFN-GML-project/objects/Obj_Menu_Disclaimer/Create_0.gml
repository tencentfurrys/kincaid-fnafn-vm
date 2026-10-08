/// @description FNAFN Obj_Menu_Disclaimer / Create — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Menu_Disclaimer / Create
surface = -1;
fading = 0;
image_alpha = 0;
for (var i = 0; i < 12; i += 1) { Scr_Camera_Update[i] = -100; }
Scr_Camera_Update[0] = 960;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Disclaimer_Create_0(longlong *param_1)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uStack_f8;
  undefined4 uStack_ec;
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
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043cffc;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0.0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  puRam0000000140657668 = &uStack_98;
  plRam0000000140657680 = param_1;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1877a);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0xbff0000000000000;
  uStack_88 = 2;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_88 = 3;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_74 = 0;
  uStack_80 = 0;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
  uStack_88 = 7;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  dVar1 = _UNK_140439dd0;
  uStack_64 = 0;
  uStack_70 = 0.0;
  while( true ) {
    uStack_ec = 0;
    uStack_f8 = 0x4028000000000000;
    iVar2 = func_0x00014015be60(&uStack_70,&uStack_f8,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_88 = 9;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012cd90(&uStack_70);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,uVar3);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_64 & 0xffffff) {
    case 1:
      uStack_70 = (double)func_0x00014012d320(&uStack_70);
      uStack_70 = uStack_70 + dVar1;
      uStack_64 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_70,&uStack_70);
      break;
    case 7:
      uStack_70 = (double)CONCAT44(uStack_70._4_4_,(int)uStack_70 + 1);
      break;
    case 10:
      uStack_70 = (double)((longlong)uStack_70 + 1);
      break;
    case 0xd:
      uStack_64 = 0;
    case 0:
      uStack_70 = uStack_70 + dVar1;
    }
  }
  uStack_88 = 0xe;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  func_0x000140141d00(param_1);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
  func_0x000140141d00(*puVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x408e000000000000;
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
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