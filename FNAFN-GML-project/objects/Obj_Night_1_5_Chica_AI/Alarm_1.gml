/// @description FNAFN Obj_Night_1_5_Chica_AI / Alarm_1 - PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Chica_AI_Alarm_1 (5817 B @0x1400a4dc0)
// Chica door/window attack tick; mirrors Bonnie Alarm_1 except the knock
// advances her to stage 3.1 with a 45-tick re-arm (no choose, no [0] = 30
// tail inside the knock). Globals: Night_chica_location (0x1873f),
// Chica_AI_Level (0x186f0), Night_door_right (0x18742),
// Night_door_back (0x18740), Jumpscare (0x1872b). Self: movement (0x18738),
// Time_without_move (0x18792), Chica_emitter (0x186f1), alarm_type (0x186d8).
//   show_debug_message("Chica has an entrance opportunity!")
//     [helper 0x140181c60, usage-decoded; see Bonnie Alarm_1].
//   movement = irandom_range(0, 20) [helper 0x140168970, house best-fit].
//   Gate: location "door"/"window" (string consts @0x1405c4d23/@0x1405c4d28)
//   AND movement < Chica_AI_Level AND Time_without_move <= 0; else
//   Time_without_move -= 1 and done.
//   Location switch (pool @0x140656190..1b8, tags select the leaf).
//   Each leaf runs the knock when its door is CLOSED (== 1), else jumpscare:
//     - leaf A: Night_door_back == 1 -> knock; else jumpscare.
//     - leaf B: Night_door_right == 1 -> knock; else jumpscare.
//     TODO(calibrate): door<->window leaf mapping derived from tags
//     (entry0 "door" tag 0, entry1 "window" tag 1), NOT observed in-game.
//     Knock: alarm_type = 0; Scr_Camera_Update[0] = 45.0 (0x4046800000000000);
//     Night_chica_location = 3.1 (0x4008cccccccccccd); Scr_Camera_Update(39)
//     (script call, 1 arg 39.0 @0x1405c4d38 = with(Obj_Night_Camera_Screen));
//     _s = irandom_range(1, 4); switch (_s) on 1.0/2.0/3.0/4.0 (runtime pools
//     @0x140656220/@0x140656210 sets) -- jumptables @0x1400a6e78/@0x1400a6e40
//     UNRECOVERABLE, each branch returns (house pattern: case exit).
//     Fallthrough: audio_emitter_pitch(Chica_emitter, random_range(0.8,
//     1.15)) [slot 0x1405c8f40; .rdata @0x140439ea0/@0x14043ba80];
//     directional_single(Chica_emitter, 0,
//     loop+priority /* TODO(calibrate): shared runtime const @0x140656180 */).
//     (Unlike Bonnie: NO trailing Scr_Camera_Update[0] = 30 here.)
//     Jumpscare: audio_stop_all() (slot 0x1405c8c10); Jumpscare = "chica"
//     (string const @0x1405c4d2f); room_goto(Rm_Jumpscare) (slot 0x1405c8cb0,
//     7.0 @0x1405c4d48, room_names.json).
//   Tail: if still at "door"/"window", Scr_Camera_Update[1] = 30 (re-arm).
show_debug_message("Chica has an entrance opportunity!");
movement = irandom_range(0, 20);
if (Night_chica_location == "door" || Night_chica_location == "window") {
    var _s = 0;
    if (movement < Chica_AI_Level && Time_without_move <= 0) {
        switch (Night_chica_location) {
            case "window": // TODO(calibrate): leaf mapping derived, see above
                if (Night_door_back == 1) {
                    alarm_type = 0;
                    Scr_Camera_Update[0] = 45;
                    Night_chica_location = 3.1;
                    Scr_Camera_Update(39);
                    _s = irandom_range(1, 4);
                    switch (_s) {
                        case 1: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                        case 2: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                        case 3: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                        case 4: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                    }
                    audio_emitter_pitch(Chica_emitter, random_range(0.8, 1.15)); // TODO(calibrate): .rdata consts, verify in-game
                    customfunct_audio_play_sound_directional_single(Chica_emitter, 0, 0 /* TODO(calibrate): runtime const @0x140656180 (loop) */, 0 /* TODO(calibrate): runtime const @0x140656180 (priority) */);
                } else {
                    audio_stop_all();
                    Jumpscare = "chica";
                    room_goto(Rm_Jumpscare);
                }
                break;
            case "door": // TODO(calibrate): leaf mapping derived, see above
                if (Night_door_right == 1) {
                    alarm_type = 0;
                    Scr_Camera_Update[0] = 45;
                    Night_chica_location = 3.1;
                    Scr_Camera_Update(39);
                    _s = irandom_range(1, 4);
                    switch (_s) {
                        case 1: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                        case 2: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                        case 3: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                        case 4: // TODO(calibrate): jumptable branch - verify in-game
                            exit;
                    }
                    audio_emitter_pitch(Chica_emitter, random_range(0.8, 1.15)); // TODO(calibrate): .rdata consts, verify in-game
                    customfunct_audio_play_sound_directional_single(Chica_emitter, 0, 0 /* TODO(calibrate): runtime const @0x140656180 (loop) */, 0 /* TODO(calibrate): runtime const @0x140656180 (priority) */);
                } else {
                    audio_stop_all();
                    Jumpscare = "chica";
                    room_goto(Rm_Jumpscare);
                }
                break;
        }
    } else {
        Time_without_move -= 1;
    }
}
if (Night_chica_location == "door" || Night_chica_location == "window") {
    Scr_Camera_Update[1] = 30;
}

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Night_1_5_Chica_AI_Alarm_1  va=0x1400a4dc0  size=5817 ====

/ * WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_1_5_Chica_AI_Alarm_1(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  longlong lVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  ulonglong uVar9;
  longlong lVar10;
  longlong unaff_GS_OFFSET;
  undefined8 uVar11;
  undefined8 in_stack_fffffffffffffe68;
  undefined4 uVar13;
  undefined8 **ppuVar12;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  undefined4 uStack_130;
  uint uStack_12c;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c0;
  undefined4 uStack_b8;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uVar13 = (undefined4)((ulonglong)in_stack_fffffffffffffe68 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043bcd4;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  plRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873f);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f0);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18742);
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  lVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872b);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18740);
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_98 = 3;
  func_0x0001401453a0(&uStack_70,0x1405c4d00);
  func_0x000140181c60(&uStack_70);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_98 = 4;
  puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18738);
  uVar11 = func_0x000140168970(0,0x14);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = uVar11;
  uStack_98 = 6;
  func_0x0001401453a0(&uStack_70,0x1405c4d23);
  iVar1 = func_0x00014015be60(puVar2,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar1 != 0) {
    func_0x0001401453a0(&uStack_70,0x1405c4d28);
    iVar1 = func_0x00014015be60(puVar2,&uStack_70,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar1 != 0) goto code_r0x0001400a5ef1;
  }
  uStack_98 = 8;
  uVar11 = (**(code **)(*param_1 + 0x10))(param_1,0x18738);
  iVar1 = func_0x00014015be60(uVar11,uVar3,uRam00000001405cd9c0,1);
  if ((iVar1 == -2) || (-1 < iVar1)) {
code_r0x0001400a513d:
    uStack_98 = 0x46;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    func_0x00014000bdb0(uVar3,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
  }
  else {
    uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18792);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar1 = func_0x00014015be60(uVar3,&uStack_70,uRam00000001405cd9c0,1);
    if ((iVar1 == -2) || (0 < iVar1)) goto code_r0x0001400a513d;
    uStack_98 = 10;
    uStack_12c = *(uint *)((longlong)puVar2 + 0xc);
    uStack_130 = *(undefined4 *)(puVar2 + 1);
    if ((0x46U >> (uStack_12c & 0x1f) & 1) == 0) {
      uStack_138 = *puVar2;
    }
    else {
      func_0x0001400a6e40(&uStack_138,puVar2);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam00000001406561b8) &&
       (func_0x0001403f6320(0x1406561b8), iRam00000001406561b8 == -1)) {
      func_0x0001401453a0(0x140656190,0x1405c4d23);
      uRam00000001406561a0 = 0;
      func_0x0001401453a0(0x1406561a4,0x1405c4d28);
      uRam00000001406561b4 = 1;
      func_0x0001403f6668(&DAT_1400a6c10);
      func_0x0001403f62c0(0x1406561b8);
    }
    uVar3 = uRam00000001405cd9c0;
    lVar10 = 0;
    iVar1 = func_0x00014015be60(0x140656190,&uStack_138,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x0001400a5218:
      iVar1 = *(int *)(lVar10 * 0x14 + 0x1406561a0);
      if (iVar1 == 1) {
        uStack_98 = 0x27;
        uStack_64 = 0;
        uStack_70 = 0x3ff0000000000000;
        iVar1 = func_0x00014015be60(uVar6,&uStack_70,uVar3,0);
        if (iVar1 == 0) {
          uStack_98 = 0x29;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar7);
          }
          *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
          *puVar7 = 0;
          uStack_98 = 0x2a;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          puVar8 = (undefined8 *)func_0x00014012b840(puVar7,0);
          func_0x000140141d00(*puVar7);
          if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar8);
          }
          *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
          *puVar8 = 0x4046800000000000;
          func_0x000140141c50(2);
          uStack_98 = 0x2b;
          if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar2);
          }
          *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
          *puVar2 = 0x4008cccccccccccd;
          uStack_98 = 0x2c;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_108,0x1405c4d38);
          ppuVar12 = &puStack_128;
          puStack_128 = &uStack_108;
          gml_Script_Scr_Camera_Update(param_1,uStack_b0,&uStack_80,1,&puStack_128);
          uVar13 = (undefined4)((ulonglong)ppuVar12 >> 0x20);
          uStack_98 = 0x2e;
          uVar3 = func_0x000140168970(1,4);
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_c0);
          }
          uStack_b4 = 0;
          uStack_98 = 0x2f;
          uStack_c0 = uVar3;
          if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_90);
          }
          uStack_84 = 0;
          uStack_90 = 0;
          uStack_98 = 0x30;
          uStack_68 = uStack_b8;
          uStack_64 = uStack_b4;
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
            uStack_70 = uStack_c0;
          }
          else {
            func_0x0001400a6e40(&uStack_70,&uStack_c0);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140656270) &&
             (func_0x0001403f6320(0x140656270), iRam0000000140656270 == -1)) {
            uRam000000014065622c = 0;
            uRam0000000140656220 = 0x3ff0000000000000;
            uRam0000000140656240 = 0x100000000;
            uRam0000000140656234 = 0x4000000000000000;
            uRam0000000140656254 = 0x200000000;
            uRam0000000140656248 = 0x4008000000000000;
            uRam0000000140656268 = 0x300000000;
            uRam000000014065625c = 0x4010000000000000;
            func_0x0001403f6668(&DAT_1400a6d70);
            func_0x0001403f62c0(0x140656270);
          }
          uVar3 = uRam00000001405cd9c0;
          lVar5 = 0;
          iVar1 = func_0x00014015be60(0x140656220,&uStack_70,uRam00000001405cd9c0,0);
          if (iVar1 == 0) {
code_r0x0001400a6007:
            uVar9 = (ulonglong)*(uint *)(lVar5 * 0x14 + 0x140656230);
joined_r0x0001400a6013:
            if (uVar9 < 4) {
                    / * WARNING: Could not recover jumptable at 0x0001400a6027. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
              (*(code *)(&UNK_1400a6bec + *(int *)(&UNK_1400a6bec + uVar9 * 4)))();
              return;
            }
          }
          else {
            iVar1 = func_0x00014015be60(0x140656234,&uStack_70,uVar3,0);
            uVar9 = uRam0000000140656240;
            if (iVar1 == 0) {
joined_r0x0001400a5b26:
              uVar9 = uVar9 >> 0x20;
              goto joined_r0x0001400a6013;
            }
            iVar1 = func_0x00014015be60(0x140656248,&uStack_70,uVar3,0);
            if (iVar1 == 0) {
              lVar5 = 2;
              goto code_r0x0001400a6007;
            }
            iVar1 = func_0x00014015be60(0x14065625c,&uStack_70,uVar3,0);
            uVar9 = uRam0000000140656268;
            if (iVar1 == 0) goto joined_r0x0001400a5b26;
          }
          uStack_98 = 0x37;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186f1);
          func_0x000140001490(&uStack_108,uVar3);
          puStack_128 = &uStack_108;
          uVar4 = func_0x000140168cf0(_UNK_140439ea0,_UNK_14043ba80);
          puStack_120 = &uStack_f8;
          if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
            func_0x000140001410(puStack_120);
          }
          uStack_ec = 0;
          uStack_f8 = uVar4;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_80,2,CONCAT44(uVar13,uRam00000001405c8f40),
                              &puStack_128);
          uStack_98 = 0x38;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x000140001490(&uStack_108,uVar3);
          puStack_120 = &uStack_90;
          puStack_128 = &uStack_108;
          func_0x00014000bee0(&uStack_e8,0x140656180);
          puStack_118 = &uStack_e8;
          func_0x00014000bee0(&uStack_d8,0x140656180);
          puStack_110 = &uStack_d8;
          gml_Script_customfunct_audio_play_sound_directional_single
                    (param_1,uStack_b0,&uStack_80,4,&puStack_128);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
        }
        else {
          uStack_98 = 0x3d;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar3 = CONCAT44(uVar13,uRam00000001405c8c10);
          func_0x0001401445d0(param_1,uStack_b0,&uStack_80,0,uVar3,0);
          uVar13 = (undefined4)((ulonglong)uVar3 >> 0x20);
          uStack_98 = 0x3e;
          if ((0x46U >> (*(uint *)(lVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(lVar5);
          }
          func_0x0001401441e0(lVar5,0x1405c4d2f);
          uStack_98 = 0x3f;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_108,0x1405c4d48);
          puStack_128 = &uStack_108;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_80,1,CONCAT44(uVar13,uRam00000001405c8cb0),
                              &puStack_128);
        }
        uStack_98 = 0x41;
      }
      else {
        if (iVar1 != 0) goto joined_r0x0001400a6294;
        uStack_98 = 0xc;
        uStack_64 = 0;
        uStack_70 = 0x3ff0000000000000;
        iVar1 = func_0x00014015be60(uVar4,&uStack_70,uVar3,0);
        if (iVar1 == 0) {
          uStack_98 = 0xe;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar7);
          }
          *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
          *puVar7 = 0;
          uStack_98 = 0xf;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          puVar8 = (undefined8 *)func_0x00014012b840(puVar7,0);
          func_0x000140141d00(*puVar7);
          if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar8);
          }
          *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
          *puVar8 = 0x4046800000000000;
          func_0x000140141c50(2);
          uStack_98 = 0x10;
          if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar2);
          }
          *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
          *puVar2 = 0x4008cccccccccccd;
          uStack_98 = 0x11;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_108,0x1405c4d38);
          ppuVar12 = &puStack_128;
          puStack_128 = &uStack_108;
          gml_Script_Scr_Camera_Update(param_1,uStack_b0,&uStack_80,1,&puStack_128);
          uVar13 = (undefined4)((ulonglong)ppuVar12 >> 0x20);
          uStack_98 = 0x13;
          uVar3 = func_0x000140168970(1,4);
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_c0);
          }
          uStack_b4 = 0;
          uStack_98 = 0x14;
          uStack_c0 = uVar3;
          if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_90);
          }
          uStack_84 = 0;
          uStack_90 = 0;
          uStack_98 = 0x15;
          uStack_68 = uStack_b8;
          uStack_64 = uStack_b4;
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
            uStack_70 = uStack_c0;
          }
          else {
            func_0x0001400a6e40(&uStack_70,&uStack_c0);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140656210) &&
             (func_0x0001403f6320(0x140656210), iRam0000000140656210 == -1)) {
            uRam00000001406561cc = 0;
            uRam00000001406561c0 = 0x3ff0000000000000;
            uRam00000001406561e0 = 0x100000000;
            uRam00000001406561d4 = 0x4000000000000000;
            uRam00000001406561f4 = 0x200000000;
            uRam00000001406561e8 = 0x4008000000000000;
            uRam0000000140656208 = 0x300000000;
            uRam00000001406561fc = 0x4010000000000000;
            func_0x0001403f6668(&DAT_1400a6ca0);
            func_0x0001403f62c0(0x140656210);
          }
          uVar3 = uRam00000001405cd9c0;
          lVar5 = 0;
          iVar1 = func_0x00014015be60(0x1406561c0,&uStack_70,uRam00000001405cd9c0,0);
          if (iVar1 == 0) {
code_r0x0001400a5b36:
            uVar9 = (ulonglong)*(uint *)(lVar5 * 0x14 + 0x1406561d0);
joined_r0x0001400a5b42:
            if (uVar9 < 4) {
                    / * WARNING: Could not recover jumptable at 0x0001400a5b56. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
              (*(code *)(&UNK_1400a6bfc + *(int *)(&UNK_1400a6bfc + uVar9 * 4)))();
              return;
            }
          }
          else {
            iVar1 = func_0x00014015be60(0x1406561d4,&uStack_70,uVar3,0);
            uVar9 = uRam00000001406561e0;
            if (iVar1 == 0) {
joined_r0x0001400a5b0e:
              uVar9 = uVar9 >> 0x20;
              goto joined_r0x0001400a5b42;
            }
            iVar1 = func_0x00014015be60(0x1406561e8,&uStack_70,uVar3,0);
            if (iVar1 == 0) {
              lVar5 = 2;
              goto code_r0x0001400a5b36;
            }
            iVar1 = func_0x00014015be60(0x1406561fc,&uStack_70,uVar3,0);
            uVar9 = uRam0000000140656208;
            if (iVar1 == 0) goto joined_r0x0001400a5b0e;
          }
          uStack_98 = 0x1c;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186f1);
          func_0x000140001490(&uStack_108,uVar3);
          puStack_128 = &uStack_108;
          uVar4 = func_0x000140168cf0(_UNK_140439ea0,_UNK_14043ba80);
          puStack_120 = &uStack_f8;
          if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
            func_0x000140001410(puStack_120);
          }
          uStack_ec = 0;
          uStack_f8 = uVar4;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_80,2,CONCAT44(uVar13,uRam00000001405c8f40),
                              &puStack_128);
          uStack_98 = 0x1d;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x000140001490(&uStack_108,uVar3);
          puStack_120 = &uStack_90;
          puStack_128 = &uStack_108;
          func_0x00014000bee0(&uStack_e8,0x140656180);
          puStack_118 = &uStack_e8;
          func_0x00014000bee0(&uStack_d8,0x140656180);
          puStack_110 = &uStack_d8;
          gml_Script_customfunct_audio_play_sound_directional_single
                    (param_1,uStack_b0,&uStack_80,4,&puStack_128);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
        }
        else {
          uStack_98 = 0x22;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar3 = CONCAT44(uVar13,uRam00000001405c8c10);
          func_0x0001401445d0(param_1,uStack_b0,&uStack_80,0,uVar3,0);
          uVar13 = (undefined4)((ulonglong)uVar3 >> 0x20);
          uStack_98 = 0x23;
          if ((0x46U >> (*(uint *)(lVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(lVar5);
          }
          func_0x0001401441e0(lVar5,0x1405c4d2f);
          uStack_98 = 0x24;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_108,0x1405c4d48);
          puStack_128 = &uStack_108;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_80,1,CONCAT44(uVar13,uRam00000001405c8cb0),
                              &puStack_128);
        }
        uStack_98 = 0x26;
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x1406561a4,&uStack_138,uVar3,0);
      if (iVar1 == 0) {
        lVar10 = 1;
        goto code_r0x0001400a5218;
      }
    }
joined_r0x0001400a6294:
    if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_138);
    }
  }
  uStack_98 = 0x48;
  func_0x0001401453a0(&uStack_70,0x1405c4d23);
  iVar1 = func_0x00014015be60(puVar2,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar1 != 0) {
    func_0x0001401453a0(&uStack_70,0x1405c4d28);
    iVar1 = func_0x00014015be60(puVar2,&uStack_70,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar1 != 0) goto code_r0x0001400a5ef1;
  }
  uStack_98 = 0x4a;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  func_0x000140141d00(param_1);
  puVar7 = (undefined8 *)func_0x00014012b840(puVar2,1);
  func_0x000140141d00(*puVar2);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0x403e000000000000;
  func_0x000140141c50(2);
code_r0x0001400a5ef1:
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
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
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
