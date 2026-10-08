/// @description FNAFN Obj_Night_1_5_Bonnie_AI / Alarm_1 - PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Bonnie_AI_Alarm_1 (6014 B @0x14009bdc0)
// Bonnie door/window attack tick. Globals: Night_bonnie_location (0x1873a),
// Bonnie_AI_Level (0x186e6), Night_door_left (0x18741),
// Night_door_back (0x18740), Jumpscare (0x1872b). Self: movement (0x18738),
// Time_without_move (0x18792), Bonnie_emitter (0x186e7), alarm_type (0x186d8).
//   show_debug_message("Bonnie has an entrance opportunity!")
//     [helper 0x140181c60, 1 string arg; identity by usage (6 sites, all
//     dev-debug strings: movement/entrance opportunities, "freed menu
//     surfaces", "music cleared"); Foxy's modal show_message uses the
//     different slot-call shape, so this is the non-modal debug print].
//   movement = irandom_range(0, 20) [helper 0x140168970, house best-fit
//     (used in all ported AI files); args (0, 0x14)].
//   Gate (same as ported Bonnie Alarm_0): only when location is "door" or
//   "window" (string consts @0x1405c4b74/@0x1405c4b79) AND
//   movement < Bonnie_AI_Level AND Time_without_move <= 0; else
//   Time_without_move -= 1 and done.
//   Location switch (pool "door"/"window" @0x140655f20..f44, tags select
//   the leaf). Each leaf runs the same knock sequence when its door is
//   CLOSED (== 1), else the jumpscare:
//     - leaf A: Night_door_back == 1 -> knock; else jumpscare.
//     - leaf B: Night_door_left == 1 -> knock; else jumpscare.
//     TODO(calibrate): the door<->window leaf mapping is derived from the
//     guarded-init tags (entry0 "door" tag 0, entry1 "window" tag 1;
//     tag==1 enters leaf A), NOT observed in-game. Swap if backwards.
//     Knock: Night_bonnie_location = choose(1, 1.1) [helper 0x140168890,
//     usage-decoded choose (free argc 2/2/3/5 across 5 random-pick sites)];
//     Scr_Camera_Update(39) (script call, 1 arg 39.0 @0x1405c4ba8 =
//     with(Obj_Night_Camera_Screen)); _s = irandom_range(1, 4);
//     switch (_s) on 1.0/2.0/3.0/4.0 (runtime pools @0x140655fa0/@0x140656000
//     sets; identity tables) -- jumptables @0x14009dcac/@0x14009dcbc
//     UNRECOVERABLE (Ghidra: indirect jump, each branch returns directly),
//     same house pattern as Foxy Alarm_0's _s switch: each case exits.
//     Fallthrough (out-of-range _s, dead for irandom(1,4) but kept
//     faithful): audio_emitter_pitch(Bonnie_emitter, random_range(0.8,
//     1.15)) [slot 0x1405c8f40; .rdata doubles @0x140439ea0/@0x14043ba80];
//     directional_single(Bonnie_emitter, 0,
//     loop+priority /* TODO(calibrate): shared runtime const @0x140655f10,
//     same twice-arg pattern as every directional site */);
//     alarm_type = 0; Scr_Camera_Update[0] = 30.
//     Jumpscare: audio_stop_all() (slot 0x1405c8c10); Jumpscare = "bonnie"
//     (string const @0x1405c4b80); room_goto(Rm_Jumpscare) (slot 0x1405c8cb0,
//     7.0 @0x1405c4bb8, room_names.json).
//   Tail: if still at "door"/"window", Scr_Camera_Update[1] = 30 (re-arm).
show_debug_message("Bonnie has an entrance opportunity!");
movement = irandom_range(0, 20);
if (Night_bonnie_location == "door" || Night_bonnie_location == "window") {
    var _s = 0;
    if (movement < Bonnie_AI_Level && Time_without_move <= 0) {
        switch (Night_bonnie_location) {
            case "window": // TODO(calibrate): leaf mapping derived, see above
                if (Night_door_back == 1) {
                    Night_bonnie_location = choose(1, 1.1);
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
                    audio_emitter_pitch(Bonnie_emitter, random_range(0.8, 1.15)); // TODO(calibrate): .rdata consts, verify in-game
                    customfunct_audio_play_sound_directional_single(Bonnie_emitter, 0, 0 /* TODO(calibrate): runtime const @0x140655f10 (loop) */, 0 /* TODO(calibrate): runtime const @0x140655f10 (priority) */);
                    alarm_type = 0;
                    Scr_Camera_Update[0] = 30;
                } else {
                    audio_stop_all();
                    Jumpscare = "bonnie";
                    room_goto(Rm_Jumpscare);
                }
                break;
            case "door": // TODO(calibrate): leaf mapping derived, see above
                if (Night_door_left == 1) {
                    Night_bonnie_location = choose(1, 1.1);
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
                    audio_emitter_pitch(Bonnie_emitter, random_range(0.8, 1.15)); // TODO(calibrate): .rdata consts, verify in-game
                    customfunct_audio_play_sound_directional_single(Bonnie_emitter, 0, 0 /* TODO(calibrate): runtime const @0x140655f10 (loop) */, 0 /* TODO(calibrate): runtime const @0x140655f10 (priority) */);
                    alarm_type = 0;
                    Scr_Camera_Update[0] = 30;
                } else {
                    audio_stop_all();
                    Jumpscare = "bonnie";
                    room_goto(Rm_Jumpscare);
                }
                break;
        }
    } else {
        Time_without_move -= 1;
    }
}
if (Night_bonnie_location == "door" || Night_bonnie_location == "window") {
    Scr_Camera_Update[1] = 30;
}

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Night_1_5_Bonnie_AI_Alarm_1  va=0x14009bdc0  size=6014 ====

/ * WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_1_5_Bonnie_AI_Alarm_1(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  longlong lVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  ulonglong uVar8;
  undefined8 *puVar9;
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
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
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
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uVar13 = (undefined4)((ulonglong)in_stack_fffffffffffffe68 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043babb;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  plRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873a);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186e6);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18741);
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  lVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872b);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18740);
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_98 = 3;
  func_0x0001401453a0(&uStack_80,0x1405c4b50);
  func_0x000140181c60(&uStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
  func_0x0001401453a0(&uStack_80,0x1405c4b74);
  iVar1 = func_0x00014015be60(puVar2,&uStack_80,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if (iVar1 != 0) {
    func_0x0001401453a0(&uStack_80,0x1405c4b79);
    iVar1 = func_0x00014015be60(puVar2,&uStack_80,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    if (iVar1 != 0) goto code_r0x00014009cf0b;
  }
  uStack_98 = 8;
  uVar11 = (**(code **)(*param_1 + 0x10))(param_1,0x18738);
  iVar1 = func_0x00014015be60(uVar11,uVar3,uRam00000001405cd9c0,1);
  if ((iVar1 == -2) || (-1 < iVar1)) {
code_r0x00014009c140:
    uStack_98 = 0x46;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
    uStack_74 = 0;
    uStack_80 = 0x3ff0000000000000;
    func_0x00014000bdb0(uVar3,&uStack_80);
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
  }
  else {
    uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18792);
    uStack_74 = 0;
    uStack_80 = 0;
    iVar1 = func_0x00014015be60(uVar3,&uStack_80,uRam00000001405cd9c0,1);
    if ((iVar1 == -2) || (0 < iVar1)) goto code_r0x00014009c140;
    uStack_98 = 10;
    uStack_12c = *(uint *)((longlong)puVar2 + 0xc);
    uStack_130 = *(undefined4 *)(puVar2 + 1);
    if ((0x46U >> (uStack_12c & 0x1f) & 1) == 0) {
      uStack_138 = *puVar2;
    }
    else {
      func_0x00014009df00(&uStack_138,puVar2);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam0000000140655f48) &&
       (func_0x0001403f6320(0x140655f48), iRam0000000140655f48 == -1)) {
      func_0x0001401453a0(0x140655f20,0x1405c4b74);
      uRam0000000140655f30 = 0;
      func_0x0001401453a0(0x140655f34,0x1405c4b79);
      uRam0000000140655f44 = 1;
      func_0x0001403f6668(&DAT_14009dcd0);
      func_0x0001403f62c0(0x140655f48);
    }
    uVar3 = uRam00000001405cd9c0;
    lVar10 = 0;
    iVar1 = func_0x00014015be60(0x140655f20,&uStack_138,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x00014009c21b:
      iVar1 = *(int *)(lVar10 * 0x14 + 0x140655f30);
      if (iVar1 == 1) {
        uStack_98 = 0x27;
        uStack_74 = 0;
        uStack_80 = 0x3ff0000000000000;
        iVar1 = func_0x00014015be60(uVar6,&uStack_80,uVar3,0);
        if (iVar1 == 0) {
          uStack_98 = 0x29;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_128,0x1405c4b88);
          puStack_e8 = &uStack_128;
          func_0x00014000bee0(&uStack_118,0x1405c4b98);
          puStack_e0 = &uStack_118;
          uVar3 = func_0x000140168890(&uStack_70,2,&puStack_e8);
          func_0x000140141d00(plRam000000014065e080);
          func_0x000140001490(puVar2,uVar3);
          func_0x000140141c50(1);
          uStack_98 = 0x2a;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_128,0x1405c4ba8);
          ppuVar12 = &puStack_e8;
          puStack_e8 = &uStack_128;
          gml_Script_Scr_Camera_Update(param_1,uStack_b0,&uStack_70,1,&puStack_e8);
          uVar13 = (undefined4)((ulonglong)ppuVar12 >> 0x20);
          uStack_98 = 0x2c;
          uVar3 = func_0x000140168970(1,4);
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_c0);
          }
          uStack_b4 = 0;
          uStack_98 = 0x2d;
          uStack_c0 = uVar3;
          if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_90);
          }
          uStack_84 = 0;
          uStack_90 = 0;
          uStack_98 = 0x2e;
          uStack_78 = uStack_b8;
          uStack_74 = uStack_b4;
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
            uStack_80 = uStack_c0;
          }
          else {
            func_0x00014009df00(&uStack_80,&uStack_c0);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140656000) &&
             (func_0x0001403f6320(0x140656000), iRam0000000140656000 == -1)) {
            uRam0000000140655fbc = 0;
            uRam0000000140655fb0 = 0x3ff0000000000000;
            uRam0000000140655fd0 = 0x100000000;
            uRam0000000140655fc4 = 0x4000000000000000;
            uRam0000000140655fe4 = 0x200000000;
            uRam0000000140655fd8 = 0x4008000000000000;
            uRam0000000140655ff8 = 0x300000000;
            uRam0000000140655fec = 0x4010000000000000;
            func_0x0001403f6668(&DAT_14009de30);
            func_0x0001403f62c0(0x140656000);
          }
          uVar3 = uRam00000001405cd9c0;
          lVar5 = 0;
          iVar1 = func_0x00014015be60(0x140655fb0,&uStack_80,uRam00000001405cd9c0,0);
          if (iVar1 == 0) {
code_r0x00014009d021:
            uVar8 = (ulonglong)*(uint *)(lVar5 * 0x14 + 0x140655fc0);
joined_r0x00014009d02d:
            if (uVar8 < 4) {
                    / * WARNING: Could not recover jumptable at 0x00014009d041. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
              (*(code *)(&UNK_14009dcac + *(int *)(&UNK_14009dcac + uVar8 * 4)))();
              return;
            }
          }
          else {
            iVar1 = func_0x00014015be60(0x140655fc4,&uStack_80,uVar3,0);
            uVar8 = uRam0000000140655fd0;
            if (iVar1 == 0) {
joined_r0x00014009ca95:
              uVar8 = uVar8 >> 0x20;
              goto joined_r0x00014009d02d;
            }
            iVar1 = func_0x00014015be60(0x140655fd8,&uStack_80,uVar3,0);
            if (iVar1 == 0) {
              lVar5 = 2;
              goto code_r0x00014009d021;
            }
            iVar1 = func_0x00014015be60(0x140655fec,&uStack_80,uVar3,0);
            uVar8 = uRam0000000140655ff8;
            if (iVar1 == 0) goto joined_r0x00014009ca95;
          }
          uStack_98 = 0x35;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186e7);
          func_0x000140001490(&uStack_128,uVar3);
          puStack_e8 = &uStack_128;
          uVar4 = func_0x000140168cf0(_UNK_140439ea0,_UNK_14043ba80);
          if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_118);
          }
          uStack_10c = 0;
          uStack_118 = uVar4;
          puStack_e0 = &uStack_118;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_70,2,CONCAT44(uVar13,uRam00000001405c8f40),
                              &puStack_e8);
          uStack_98 = 0x36;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x000140001490(&uStack_128,uVar3);
          puStack_e0 = &uStack_90;
          puStack_e8 = &uStack_128;
          func_0x00014000bee0(&uStack_108,0x140655f10);
          puStack_d8 = &uStack_108;
          func_0x00014000bee0(&uStack_f8,0x140655f10);
          puStack_d0 = &uStack_f8;
          gml_Script_customfunct_audio_play_sound_directional_single
                    (param_1,uStack_b0,&uStack_70,4,&puStack_e8);
          uStack_98 = 0x38;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar7);
          }
          *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
          *puVar7 = 0;
          uStack_98 = 0x39;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          puVar9 = (undefined8 *)func_0x00014012b840(puVar7,0);
          func_0x000140141d00(*puVar7);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar9);
          }
          *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
          *puVar9 = 0x403e000000000000;
          func_0x000140141c50(2);
          if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
        }
        else {
          uStack_98 = 0x3d;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          uVar3 = CONCAT44(uVar13,uRam00000001405c8c10);
          func_0x0001401445d0(param_1,uStack_b0,&uStack_70,0,uVar3,0);
          uVar13 = (undefined4)((ulonglong)uVar3 >> 0x20);
          uStack_98 = 0x3e;
          if ((0x46U >> (*(uint *)(lVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(lVar5);
          }
          func_0x0001401441e0(lVar5,0x1405c4b80);
          uStack_98 = 0x3f;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_128,0x1405c4bb8);
          puStack_e8 = &uStack_128;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,CONCAT44(uVar13,uRam00000001405c8cb0),
                              &puStack_e8);
        }
        uStack_98 = 0x41;
      }
      else {
        if (iVar1 != 0) goto joined_r0x00014009d359;
        uStack_98 = 0xc;
        uStack_74 = 0;
        uStack_80 = 0x3ff0000000000000;
        iVar1 = func_0x00014015be60(uVar4,&uStack_80,uVar3,0);
        if (iVar1 == 0) {
          uStack_98 = 0xe;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_128,0x1405c4b88);
          puStack_e8 = &uStack_128;
          func_0x00014000bee0(&uStack_118,0x1405c4b98);
          puStack_e0 = &uStack_118;
          uVar3 = func_0x000140168890(&uStack_70,2,&puStack_e8);
          func_0x000140141d00(plRam000000014065e080);
          func_0x000140001490(puVar2,uVar3);
          func_0x000140141c50(1);
          uStack_98 = 0xf;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_128,0x1405c4ba8);
          ppuVar12 = &puStack_e8;
          puStack_e8 = &uStack_128;
          gml_Script_Scr_Camera_Update(param_1,uStack_b0,&uStack_70,1,&puStack_e8);
          uVar13 = (undefined4)((ulonglong)ppuVar12 >> 0x20);
          uStack_98 = 0x11;
          uVar3 = func_0x000140168970(1,4);
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_c0);
          }
          uStack_b4 = 0;
          uStack_98 = 0x12;
          uStack_c0 = uVar3;
          if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_90);
          }
          uStack_84 = 0;
          uStack_90 = 0;
          uStack_98 = 0x13;
          uStack_78 = uStack_b8;
          uStack_74 = uStack_b4;
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
            uStack_80 = uStack_c0;
          }
          else {
            func_0x00014009df00(&uStack_80,&uStack_c0);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140655fa0) &&
             (func_0x0001403f6320(0x140655fa0), iRam0000000140655fa0 == -1)) {
            uRam0000000140655f5c = 0;
            uRam0000000140655f50 = 0x3ff0000000000000;
            uRam0000000140655f70 = 0x100000000;
            uRam0000000140655f64 = 0x4000000000000000;
            uRam0000000140655f84 = 0x200000000;
            uRam0000000140655f78 = 0x4008000000000000;
            uRam0000000140655f98 = 0x300000000;
            uRam0000000140655f8c = 0x4010000000000000;
            func_0x0001403f6668(&DAT_14009dd60);
            func_0x0001403f62c0(0x140655fa0);
          }
          uVar3 = uRam00000001405cd9c0;
          lVar5 = 0;
          iVar1 = func_0x00014015be60(0x140655f50,&uStack_80,uRam00000001405cd9c0,0);
          if (iVar1 == 0) {
code_r0x00014009caa5:
            uVar8 = (ulonglong)*(uint *)(lVar5 * 0x14 + 0x140655f60);
joined_r0x00014009cab1:
            if (uVar8 < 4) {
                    / * WARNING: Could not recover jumptable at 0x00014009cac5. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
              (*(code *)(&UNK_14009dcbc + *(int *)(&UNK_14009dcbc + uVar8 * 4)))();
              return;
            }
          }
          else {
            iVar1 = func_0x00014015be60(0x140655f64,&uStack_80,uVar3,0);
            uVar8 = uRam0000000140655f70;
            if (iVar1 == 0) {
joined_r0x00014009ca7d:
              uVar8 = uVar8 >> 0x20;
              goto joined_r0x00014009cab1;
            }
            iVar1 = func_0x00014015be60(0x140655f78,&uStack_80,uVar3,0);
            if (iVar1 == 0) {
              lVar5 = 2;
              goto code_r0x00014009caa5;
            }
            iVar1 = func_0x00014015be60(0x140655f8c,&uStack_80,uVar3,0);
            uVar8 = uRam0000000140655f98;
            if (iVar1 == 0) goto joined_r0x00014009ca7d;
          }
          uStack_98 = 0x1a;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186e7);
          func_0x000140001490(&uStack_128,uVar3);
          puStack_e8 = &uStack_128;
          uVar4 = func_0x000140168cf0(_UNK_140439ea0,_UNK_14043ba80);
          if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_118);
          }
          uStack_10c = 0;
          uStack_118 = uVar4;
          puStack_e0 = &uStack_118;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_70,2,CONCAT44(uVar13,uRam00000001405c8f40),
                              &puStack_e8);
          uStack_98 = 0x1b;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x000140001490(&uStack_128,uVar3);
          puStack_e0 = &uStack_90;
          puStack_e8 = &uStack_128;
          func_0x00014000bee0(&uStack_108,0x140655f10);
          puStack_d8 = &uStack_108;
          func_0x00014000bee0(&uStack_f8,0x140655f10);
          puStack_d0 = &uStack_f8;
          gml_Script_customfunct_audio_play_sound_directional_single
                    (param_1,uStack_b0,&uStack_70,4,&puStack_e8);
          uStack_98 = 0x1d;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar7);
          }
          *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
          *puVar7 = 0;
          uStack_98 = 0x1e;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          puVar9 = (undefined8 *)func_0x00014012b840(puVar7,0);
          func_0x000140141d00(*puVar7);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar9);
          }
          *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
          *puVar9 = 0x403e000000000000;
          func_0x000140141c50(2);
          if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
        }
        else {
          uStack_98 = 0x22;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          uVar3 = CONCAT44(uVar13,uRam00000001405c8c10);
          func_0x0001401445d0(param_1,uStack_b0,&uStack_70,0,uVar3,0);
          uVar13 = (undefined4)((ulonglong)uVar3 >> 0x20);
          uStack_98 = 0x23;
          if ((0x46U >> (*(uint *)(lVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(lVar5);
          }
          func_0x0001401441e0(lVar5,0x1405c4b80);
          uStack_98 = 0x24;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_128,0x1405c4bb8);
          puStack_e8 = &uStack_128;
          func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,CONCAT44(uVar13,uRam00000001405c8cb0),
                              &puStack_e8);
        }
        uStack_98 = 0x26;
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x140655f34,&uStack_138,uVar3,0);
      if (iVar1 == 0) {
        lVar10 = 1;
        goto code_r0x00014009c21b;
      }
    }
joined_r0x00014009d359:
    if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_138);
    }
  }
  uStack_98 = 0x48;
  func_0x0001401453a0(&uStack_80,0x1405c4b74);
  iVar1 = func_0x00014015be60(puVar2,&uStack_80,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if (iVar1 != 0) {
    func_0x0001401453a0(&uStack_80,0x1405c4b79);
    iVar1 = func_0x00014015be60(puVar2,&uStack_80,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    if (iVar1 != 0) goto code_r0x00014009cf0b;
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
code_r0x00014009cf0b:
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
