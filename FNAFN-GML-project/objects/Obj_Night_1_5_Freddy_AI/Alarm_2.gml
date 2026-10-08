/// @description FNAFN Obj_Night_1_5_Freddy_AI / Alarm_2 — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_2 (748 B @0x1400d3010)
// Globals: Night_freddy_location (0x18744), Jumpscare (0x1872b).
// Three-way gate: proceed only when Night_freddy_location is 6.0, 8.0 or
// 9.0 (0x4018/0x4020/0x4022 doubles; each compare func_0x00014015be60
// with '!= 0' -> != constant; fall-through = jumpscare triggers).
// slot 0x1405c8c10 = audio_stop_all (0 args).
// string const @0x1405c5538 = "freddy" (inline .data).
// numeric const @0x1405c5540 = 7.0 -> room 7 = Rm_Jumpscare.
if (Night_freddy_location == 6 || Night_freddy_location == 8 || Night_freddy_location == 9) {
    audio_stop_all();
    Jumpscare = "freddy";
    room_goto(Rm_Jumpscare);
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_2(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  longlong lVar3;
  undefined4 uVar4;
  undefined8 *puStack_d8;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_60;
  undefined4 uStack_54;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043c933 / * "gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_2" * /;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18744 / * Night_freddy_location * /);
  lVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872b / * Jumpscare * /);
  uStack_48 = CONCAT44(0xffffff,(undefined4)uStack_48);
  uStack_50 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_80 = 1;
  uStack_54 = 0;
  uStack_60 = 0x4018000000000000;
  uVar4 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar2,&uStack_60,uVar4,0);
  if (iVar1 != 0) {
    uStack_54 = 0;
    uStack_60 = 0x4020000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_60,uVar4,0);
    if (iVar1 != 0) {
      uStack_54 = 0;
      uStack_60 = 0x4022000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_60,uVar4,0);
      if (iVar1 != 0) goto code_r0x0001400d3280;
    }
  }
  uStack_80 = 3;
  uStack_50 = 0;
  uStack_48 = 0x500000000;
  func_0x0001401445d0(param_1,param_2,&uStack_50,0,uRam00000001405c8c10,0);
  uStack_80 = 4;
  if ((0x46U >> (*(uint *)(lVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar3);
  }
  func_0x0001401441e0(lVar3,0x1405c5538);
  uStack_80 = 5;
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_50 = 0;
  uStack_48 = 0x500000000;
  func_0x00014000bee0(&uStack_78,0x1405c5540);
  puStack_d8 = &uStack_78;
  func_0x0001401445d0(param_1,param_2,&uStack_50,1,uRam00000001405c8cb0,&puStack_d8);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
code_r0x0001400d3280:
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
