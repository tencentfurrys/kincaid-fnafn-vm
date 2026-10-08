/// @description FNAFN Obj_Night_Time / Create — PORTED from C
// Ground truth: gml_Object_Obj_Night_Time_Create_0 (1186 B @0x1400895a0)
// uStack_a8 = 4..0x12 are GML source-line markers; dVar1 = 1.0 is the
// loop's typed-increment constant (_UNK_140439dd0).
//   line 4: for (var i = 0; i < 12; i += 1) Scr_Camera_Update[i] = -100;
//     disables all 12 hour-timers (0x4028000000000000 = 12.0,
//     0xc059000000000000 = -100; same array-write shape as
//     Obj_Night_Shift_End/Create — the -100 sentinel this object's Step
//     tests for).
//   line 10: fading = 1
//   line 11/12: image_xscale = image_yscale = 0.65 (0x3fe4cccccccccccd)
//   line 13: image_alpha = 0
//   line 15: time = -1 (0xbff0000000000000) — clock subimage, "not started"
//   line 18: Scr_Camera_Update[0] = 1800 (0x409c200000000000) — arm the
//     first hour-timer; its expiry raises Alarm_0 (the hour-tick).
for (var i = 0; i < 12; i += 1) {
    Scr_Camera_Update[i] = -100;
}
fading = 1;
image_xscale = 0.65;
image_yscale = 0.65;
image_alpha = 0;
time = -1;
Scr_Camera_Update[0] = 1800;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Time_Create_0(longlong *param_1)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uStack_108;
  undefined4 uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
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
  
  dVar1 = _UNK_140439dd0;
  uStack_60 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043b58b;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_a8 = 4;
  uStack_64 = 0;
  uStack_70 = 0.0;
  plRam0000000140657680 = param_1;
  while( true ) {
    uStack_fc = 0;
    uStack_108 = 0x4028000000000000;
    iVar2 = func_0x00014015be60(&uStack_70,&uStack_108,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_a8 = 6;
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
  uStack_a8 = 10;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x3ff0000000000000;
  uStack_a8 = 0xb;
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  uStack_94 = 0;
  uStack_a0 = 0x3fe4cccccccccccd;
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_a0);
  uStack_a8 = 0xc;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_84 = 0;
  uStack_90 = 0x3fe4cccccccccccd;
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_90);
  uStack_a8 = 0xd;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_74 = 0;
  uStack_80 = 0;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
  uStack_a8 = 0xf;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18791);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0xbff0000000000000;
  uStack_a8 = 0x12;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  func_0x000140141d00(param_1);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
  func_0x000140141d00(*puVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x409c200000000000;
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
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
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */
