/// @description FNAFN Obj_Night_Time / Alarm_0 - PORTED from C
// ---- sub-event Alarm_0 (split from Alarm.gml) ----
// Ground truth: gml_Object_Obj_Night_Time_Alarm_0 (1335 B @0x140089f10)
// Fires when the Scr_Camera_Update[0] hour-timer expires. uStack_68 =
// 1..0xe are GML source-line markers.
//   line 1: time += 1 (func_0x00014000bf90 = the += op helper, proven in
//     Obj_Menu_Continue/KeyPress)
//   line 2: if (time >= 6) — compare against 6.0 (0x4018000000000000):
//     the night ends at 6 AM.
//     line 13: instance_create_layer(640, 360, "Night_end", 36) — the args
//       are the .data double @0x1405c48b8 = 640.0, @0x1405c48c8 = 360.0,
//       the string @0x1405c48a8 = "Night_end" and @0x1405c48d8 = 36.0 =
//       Obj_Night_Shift_End (obj_names.json) — hand off to the night-end
//       controller at screen center.
//     line 14: audio_stop_all() (slot 0x1405c8c10, registry-confirmed)
//   else (still before 6 AM):
//     line 4: fading = 0 (dims the clock — see Step's lerp branches)
//     line 5/6: image_xscale = image_yscale = 0.65 (0x3fe4cccccccccccd)
//     line 7: Scr_Camera_Update[1] = 300 (0x4072c000000000000) — arm the
//       secondary timer; its expiry raises Alarm_1 (fading = 1)
//     line 9: Scr_Camera_Update[0] = 3600 (0x40ac200000000000) — re-arm
//       the hour-timer for the next hour
time += 1;
if (time >= 6) {
    instance_create_layer(640, 360, "Night_end", Obj_Night_Shift_End);
    audio_stop_all();
} else {
    fading = 0;
    image_xscale = 0.65;
    image_yscale = 0.65;
    Scr_Camera_Update[1] = 300;
    Scr_Camera_Update[0] = 3600;
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Time_Alarm_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
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
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined *puStack_70;
  undefined4 uStack_68;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_70 = &UNK_14043b5d0;
  uStack_78 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_78;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_38._4_4_ = 0xffffff;
  uStack_40 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_68 = 1;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18791);
  func_0x00014000bf90(uVar2,1);
  uStack_68 = 2;
  uStack_ec = 0;
  uStack_f8 = 0x4018000000000000;
  iVar1 = func_0x00014015be60(uVar2,&uStack_f8,uRam00000001405cd9c0,1);
  if ((iVar1 == -2) || (-1 < iVar1)) {
    uStack_68 = 0xd;
    if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_40);
    }
    uStack_40 = 0;
    uStack_38 = 0x500000000;
    func_0x00014000bee0(&uStack_b8,0x1405c48b8);
    puStack_118 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x1405c48c8);
    puStack_110 = &uStack_a8;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    func_0x0001401441e0(&uStack_98,0x1405c48a8);
    puStack_108 = &uStack_98;
    func_0x00014000bee0(&uStack_88,0x1405c48d8);
    puStack_100 = &uStack_88;
    func_0x0001401445d0(param_1,param_2,&uStack_40,4,uRam00000001405c8d90,&puStack_118);
    uStack_68 = 0xe;
    if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_40);
    }
    uStack_40 = 0;
    uStack_38._0_4_ = 0;
    uStack_38._4_4_ = 5;
    func_0x0001401445d0(param_1,param_2,&uStack_40,0,uRam00000001405c8c10,0);
  }
  else {
    uStack_68 = 4;
    (**(code **)(*param_1 + 0x10))(param_1,0x18791);
    puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18719);
    if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar3);
    }
    *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
    *puVar3 = 0;
    uStack_68 = 5;
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    uStack_54 = 0;
    uStack_60 = 0x3fe4cccccccccccd;
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_60);
    uStack_68 = 6;
    if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_50);
    }
    uStack_44 = 0;
    uStack_50 = 0x3fe4cccccccccccd;
    func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_50);
    uStack_68 = 7;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar4 = (undefined8 *)func_0x00014012b840(puVar3,1);
    func_0x000140141d00(*puVar3);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0x4072c00000000000;
    func_0x000140141c50(2);
    uStack_68 = 9;
    puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar4 = (undefined8 *)func_0x00014012b840(puVar3,0);
    func_0x000140141d00(*puVar3);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0x40ac200000000000;
    func_0x000140141c50(2);
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
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
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
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_78;
  return;
}
END DECOMPILED REFERENCE */

