/// @description FNAFN Obj_Night_1_5_Foxy_AI / Alarm_1 - PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Foxy_AI_Alarm_1 (1415 B @0x1400aea80)
// Globals: Night_foxy_location (0x18743), Night_door_left (0x18741),
// Jumpscare (0x1872b). Self: Foxy_emitter (0x1871c), door_wait_count (0x18711).
// Outer gate: only acts when Night_foxy_location == "hallway" (string const
// @0x1405c4e58 via loader 0x1401453a0; compare helper 0x14015be60, == 0 is
// equal); otherwise no-op (no outer else in C).
// Inner: if (Night_door_left == 1) the left door is CLOSED in time -- Foxy
// bangs on it (attack thwarted): Scr_Camera_Update[0] = 45.0 (timer re-arm),
// Night_foxy_location = 4.0 (knocked back to stage 4), Scr_Camera_Update(39)
// (script call, 1 arg 39.0 @0x1405c4e68 = with(Obj_Night_Camera_Screen)),
// directional_single(Foxy_emitter, Snd_Foxy_Door /* 43.0 @0x1405c4e78 */,
// loop+priority /* TODO(calibrate): shared runtime const @0x1406563f8,
// pool-map.json has no entry yet */), door_wait_count = 170.0 (grace timer;
// Step_0 jumpscares if the door is OPENED (== 0) while it runs).
// Else (door open): audio_stop_all() (slot 0x1405c8c10, 0 args),
// Jumpscare = "foxy" (string const @0x1405c4e60), room_goto(Rm_Jumpscare)
// (slot 0x1405c8cb0, 7.0 @0x1405c4e88, room_names.json).
// Door semantics cross-checked: Foxy Step_0 shows Night_door_left == 0
// (open) during door_wait_count -> "Jumpscared by Foxy!".
if (Night_foxy_location == "hallway") {
    if (Night_door_left == 1) {
        Scr_Camera_Update[0] = 45;
        Night_foxy_location = 4;
        Scr_Camera_Update(39);
        customfunct_audio_play_sound_directional_single(Foxy_emitter, Snd_Foxy_Door, 0 /* TODO(calibrate): runtime const @0x1406563f8 (loop) */, 0 /* TODO(calibrate): runtime const @0x1406563f8 (priority) */);
        door_wait_count = 170;
    } else {
        audio_stop_all();
        Jumpscare = "foxy";
        room_goto(Rm_Jumpscare);
    }
}

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Night_1_5_Foxy_AI_Alarm_1  va=0x1400aea80  size=1415 ====

void gml_Object_Obj_Night_1_5_Foxy_AI_Alarm_1(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  longlong lVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 in_stack_fffffffffffffed8;
  undefined4 uVar7;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 uStack_f8;
  uint uStack_ec;
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
  undefined *puStack_60;
  undefined4 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uVar7 = (undefined4)((ulonglong)in_stack_fffffffffffffed8 >> 0x20);
  uStack_40 = 0xfffffffffffffffe;
  puStack_60 = &UNK_14043bf81;
  uStack_58 = 0;
  uStack_68 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_68;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  plRam0000000140657680 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18743);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18741);
  lVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872b);
  uStack_48 = CONCAT44(0xffffff,(undefined4)uStack_48);
  uStack_50 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_58 = 2;
  func_0x0001401453a0(&uStack_b8,0x1405c4e58);
  iVar1 = func_0x00014015be60(puVar2,&uStack_b8,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if (iVar1 == 0) {
    uStack_58 = 4;
    uStack_ac = 0;
    uStack_b8 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_b8,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_58 = 6;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      puVar6 = (undefined8 *)func_0x00014012b840(puVar5,0);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4046800000000000;
      func_0x000140141c50(2);
      uStack_58 = 7;
      if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar2);
      }
      *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
      *puVar2 = 0x4010000000000000;
      uStack_58 = 8;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      func_0x00014000bee0(&uStack_a8,0x1405c4e68);
      puStack_118 = &uStack_a8;
      gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_50,1,&puStack_118);
      uStack_58 = 9;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1871c);
      func_0x000140001490(&uStack_a8,uVar3);
      puStack_118 = &uStack_a8;
      func_0x00014000bee0(&uStack_98,0x1405c4e78);
      puStack_110 = &uStack_98;
      func_0x00014000bee0(&uStack_88,0x1406563f8);
      puStack_108 = &uStack_88;
      func_0x00014000bee0(&uStack_78,0x1406563f8);
      puStack_100 = &uStack_78;
      gml_Script_customfunct_audio_play_sound_directional_single
                (param_1,param_2,&uStack_50,4,&puStack_118);
      uStack_58 = 10;
      puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18711);
      if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar2);
      }
      *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
      *puVar2 = 0x4065400000000000;
    }
    else {
      uStack_58 = 0xe;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      uVar3 = CONCAT44(uVar7,uRam00000001405c8c10);
      func_0x0001401445d0(param_1,param_2,&uStack_50,0,uVar3,0);
      uVar7 = (undefined4)((ulonglong)uVar3 >> 0x20);
      uStack_58 = 0xf;
      if ((0x46U >> (*(uint *)(lVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(lVar4);
      }
      func_0x0001401441e0(lVar4,0x1405c4e60);
      uStack_58 = 0x10;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      func_0x00014000bee0(&uStack_a8,0x1405c4e88);
      puStack_118 = &uStack_a8;
      func_0x0001401445d0(param_1,param_2,&uStack_50,1,CONCAT44(uVar7,uRam00000001405c8cb0),
                          &puStack_118);
    }
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
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
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
  puRam0000000140657668 = (undefined8 *)uStack_68;
  return;
}
END DECOMPILED REFERENCE */
