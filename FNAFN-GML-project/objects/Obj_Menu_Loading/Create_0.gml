/// @description FNAFN Obj_Menu_Loading / Create — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Loading_Create_0 (1531 B @0x14008ff60)
// The loading-screen controller, part 1. uStack_98 = 3..0x17 are GML source
// line markers. Decoded in order:
//   line 3: Loading (id 0x18733) = 0
//   line 5: Load_Asset (id 0x1872f — an ARRAY) [0] = 0. Array-element write
//     shape: fetch array, func_0x00014012b840(array, index) = the element
//     accessor, then a plain store (same shape as Scr_Camera_Update[i]).
//   line 6: Load_Increment (0x18732) = 0
//   line 7: Load_Cooldown (0x18731) = 0
//   line 7b: Load_Bar_Timer (0x18730) = 2 * sprite_get_number(Load_Asset[
//     Load_Increment]). Slot 0x1405c8c30 = sprite_get_number (registry),
//     the index is Load_Increment read via func_0x00014012cd90, MUL helper
//     0x1400053f0 (2.0 = 0x4000000000000000), result stored into the
//     fetched Load_Bar_Timer slot.
//   lines 12-14: for (var i = 0; i < 12; i += 1) Scr_Camera_Update[i] = -100
//     — the standard for-loop shape (bound 0x4028000000000000 = 12.0;
//     0xc059000000000000 = -100.0 is the "disabled timer" sentinel, the
//     same convention as Obj_Night_Time/Create).
//   line 18: spinner_angle (0x18772) = 0
//   line 20: alpha (0x186da) = 0
//   line 21: fading (0x18719) = 0
//   line 23: Scr_Camera_Update[1] = 250 (0x406f400000000000) — arms timer
//     1; the Step event counts it down by delta_factor and fires
//     event_perform(ev_alarm, 1) when it expires.
Loading = 0;
Load_Asset[0] = 0;
Load_Increment = 0;
Load_Cooldown = 0;
Load_Bar_Timer = 2 * sprite_get_number(Load_Asset[Load_Increment]);
for (var i = 0; i < 12; i += 1) {
    Scr_Camera_Update[i] = -100;
}
spinner_angle = 0;
alpha = 0;
fading = 0;
Scr_Camera_Update[1] = 250;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Loading_Create_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  undefined4 uVar2;
  int iVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 *puStack_f0;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043b801;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0.0;
  uStack_88 = CONCAT44(0xffffff,(undefined4)uStack_88);
  uStack_90 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  puRam0000000140657668 = &uStack_a8;
  plRam0000000140657680 = param_1;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18733);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_98 = 3;
  plRam0000000140657680 = (longlong *)0x28781;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1872f);
  func_0x000140141d00(param_1);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
  func_0x000140141d00(*puVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  func_0x000140141c50(2);
  uStack_98 = 5;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18732);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_98 = 6;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18731);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_98 = 7;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  uVar6 = (**(code **)(*param_1 + 8))(param_1,0x1872f);
  uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18730);
  uVar2 = func_0x00014012cd90(puVar4);
  uVar6 = func_0x00014002fbe0(uVar6,uVar2);
  func_0x000140001490(&uStack_b8,uVar6);
  puStack_f0 = &uStack_b8;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_90,1,uRam00000001405c8c30,&puStack_f0);
  uStack_74 = 0;
  uStack_80 = 0x4000000000000000;
  func_0x0001400053f0(&uStack_80,uVar6);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar7,&uStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  func_0x000140141c50(1);
  uStack_98 = 0xc;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  dVar1 = _UNK_140439dd0;
  uStack_64 = 0;
  uStack_70 = 0.0;
  while( true ) {
    uStack_74 = 0;
    uStack_80 = 0x4028000000000000;
    iVar3 = func_0x00014015be60(&uStack_70,&uStack_80,uRam00000001405cd9c0,1);
    if ((iVar3 == -2) || (-1 < iVar3)) break;
    uStack_98 = 0xe;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar2 = func_0x00014012cd90(&uStack_70);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,uVar2);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0xc059000000000000;
    func_0x000140141c50(2);
    (**(code **)(*param_1 + 0x10))(param_1,0x18732);
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
  uStack_98 = 0x12;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18772);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_98 = 0x14;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186da);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_98 = 0x15;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_98 = 0x17;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  func_0x000140141d00(param_1);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar4,1);
  func_0x000140141d00(*puVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x406f400000000000;
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
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
