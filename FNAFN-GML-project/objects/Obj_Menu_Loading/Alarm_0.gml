/// @description FNAFN Obj_Menu_Loading / Alarm_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Loading_Alarm_0 (1013 B @0x1400908d0)
// The load-step alarm: the Step event fires event_perform(ev_alarm, 0)
// whenever Load_Cooldown counts down to <= 0, and this event advances the
// asset load by one. uStack_a0 = 1..10 are GML source-line markers.
//   line 1: bound = array_length(Load_Asset) (slot 0x1405c8ba0) minus 1 —
//     func_0x00014002fc60(dest, src, N) is PROVEN (disassembly: it copies
//     src into dest, converts N to a double, then tail-calls the -= helper
//     0x14000bdb0) => dest = src - N. So the completion test is
//     Load_Increment >= array_length(Load_Asset) - 1 (the LAST index).
//   line 10 (done): fading (id 0x18719) = 1 — starts the Step's fade-out,
//     which ends in room_goto(Room_to_go_to) / instance_destroy().
//   line 3: sprite_prefetch(Load_Asset[Load_Increment]) — slot 0x1405c8f10
//     = sprite_prefetch (registry-confirmed): the whole point of the load
//     loop, one sprite asset per alarm tick.
//   line 4: Load_Increment += 1 (func_0x00014000bf90 = the += helper).
//   line 6: Load_Bar_Timer = 1.5 * sprite_get_number(Load_Asset[
//     Load_Increment]) — 0x3ff8000000000000 = 1.5; the bar timer is
//     rescaled per asset from its subimage count (same shape as Create).
if (Load_Increment >= array_length(Load_Asset) - 1) {
    fading = 1;
} else {
    sprite_prefetch(Load_Asset[Load_Increment]);
    Load_Increment += 1;
    Load_Bar_Timer = 1.5 * sprite_get_number(Load_Asset[Load_Increment]);
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Loading_Alarm_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 *puStack_e8;
  undefined8 *apuStack_e0 [2];
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043b826;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a0 = 1;
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  plRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18732);
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1872f);
  func_0x000140001490(&uStack_98,uVar4);
  puStack_e8 = &uStack_98;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_60,1,uRam00000001405c8ba0,&puStack_e8);
  func_0x00014002fc60(&uStack_50,uVar4,1);
  iVar1 = func_0x00014015be60(uVar3,&uStack_50,uRam00000001405cd9c0,1);
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if (iVar1 == -2 || -1 < iVar1) {
    uStack_a0 = 10;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x3ff0000000000000;
  }
  else {
    uStack_a0 = 3;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18732);
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1872f);
    uVar2 = func_0x00014012cd90(uVar3);
    uVar3 = func_0x00014002fbe0(uVar4,uVar2);
    func_0x000140001490(&uStack_88,uVar3);
    apuStack_e0[0] = &uStack_88;
    func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8f10,apuStack_e0);
    uStack_a0 = 4;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18732);
    func_0x00014000bf90(uVar3,1);
    uStack_a0 = 6;
    if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    uStack_60 = 0;
    uStack_58 = 0x500000000;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18732);
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1872f);
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18731);
    uVar2 = func_0x00014012cd90(uVar3);
    uVar3 = func_0x00014002fbe0(uVar4,uVar2);
    func_0x000140001490(&uStack_98,uVar3);
    puStack_e8 = &uStack_98;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_60,1,uRam00000001405c8c30,&puStack_e8);
    uStack_44 = 0;
    uStack_50 = 0x3ff8000000000000;
    func_0x0001400053f0(&uStack_50,uVar3);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar5,&uStack_50);
    if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_50);
    }
    func_0x000140141c50(1);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
