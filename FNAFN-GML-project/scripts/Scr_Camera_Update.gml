/// @description FNAFN script Scr_Camera_Update - PORTED from C
// PORTED from C
// Ground truth: gml_Script_Scr_Camera_Update (large; ~1276 lines of C in the
// reference block below).
// Decoded (uStack_b0 = 0..0xae are the original GML line markers):
//   The script takes an optional target (every known call site passes 1 arg,
//   e.g. object 39 = Obj_Night_Camera_Screen, const 39.0 @0x1405c4ba8) and
//   runs its whole body as with (target) { ... } [helpers 0x140144bd0/
//   51f0/49f0 over argument0; the no-arg default *0x1405c3000 is 0.0 in the
//   file image — TODO(calibrate), never observed]. The leading
//   func_0x000140144b20(own-slot) is script-entry boilerplate (no GML).
//   line 5: if (Night_camera_mode == "cameras") [global 0x1873d vs const
//     "cameras" @0x1405c35a0].
//   line 8: 12-way dispatch on Night_camera_location (global 0x1873c) ==
//     0..11 [compare chain vs pool @0x140655110, whose init pairs decode to
//     doubles 0.0..11.0; label table @0x140655120 is identity — verified
//     from its (0,N) init pairs — so match order = case number].
//     Per case (sprite ids are SPRT indices via sprite_names.json):
//     - case 0 (line 10): no-op.
//     - case 1 (lines 12-21): sprite_index = Spr_Night_Camera_Room_1 (20);
//       Obj_Night_Camera_Map.camera_text (0x186ef on object 44) =
//       "-BONNIE'S STAGE-" [@0x1405c35b0]; Night_bonnie_location (0x1873a)
//       == 1.0/1.1/1.2 [pool @0x140655210/224/238; table @0x140655220 =
//       identity verified] -> image_index 0/1/2, else 3.
//     - case 2 (24-32): sprite Spr_Night_Camera_Room_2 (53);
//       "-FREDDY'S STAGE-" [@0x1405c35d0]; Night_freddy_location (0x18744)
//       == 2.0/2.1 [pool @0x140655250/264; table @0x140655260 identity] ->
//       image_index 0/1, else 2.
//     - case 3 (35-44): sprite Spr_Night_Camera_Room_3 (32);
//       "-CHICA'S STAGE-" [@0x1405c35f0]; Night_chica_location (0x1873f)
//       == 3.0/3.1/3.2 -> image_index 0/1/2, else 3.
//     - case 4 (47-56): sprite Spr_Night_Camera_Room_4 (31);
//       "-FOXY'S COVE-" [@0x1405c3600]; Night_foxy_location (0x18743)
//       == 4.0/4.1/4.2 -> image_index 0/1/2, else 3.
//     - case 5 (59-70): sprite Spr_Night_Camera_Room_5 (63);
//       "-MANGLE'S HIDEOUT" [@0x1405c3610]; Night_mangle_location (0x18745)
//       == 5.0/5.1/5.2/5.3 [pool @0x140655300/314/328/33c; table
//       @0x140655310] -> image_index 0/1/2/3, else 4.
//     - case 6 (73-91): sprite Spr_Night_Camera_Room_6 (65);
//       "-LEFT HALLWAY B" [@0x1405c3630]; nested ifs over
//       Night_bonnie_location == 6 / Night_freddy_location == 6
//       [6.0 = 0x4018...]: bonnie-only -> 1, both -> 3, freddy-only -> 2,
//       neither -> 0 (i.e. image_index = (bonnie==6) + 2*(freddy==6)).
//     - case 7 (94-96): sprite Spr_Night_Camera_Room_7 (22);
//       "-STORAGE-" [@0x1405c3640]; nothing else.
//     - case 8 (99-117): sprite Spr_Night_Camera_Room_8 (98);
//       "-RIGHT HALLWAY B-" [@0x1405c3650]; nested ifs over
//       Night_chica_location == 8 / Night_freddy_location == 8
//       [8.0 = 0x4020...]: chica-only -> 1, both -> 3, freddy-only -> 2,
//       neither -> 0.
//     - case 9 (121-128): sprite Spr_Night_Camera_Room_9 (94);
//       "-BATHROOM-" [@0x1405c3662]; if (Night_freddy_location == 9.0)
//       [@0x140655360] image_index = 1 else 0.
//     - case 10 (131-138): sprite Spr_Night_Camera_Room_10 (10);
//       "-LEFT HALLWAY A-" [@0x1405c3670]; if (Night_bonnie_location ==
//       10.0) [@0x140655380] image_index = 1 else 0.
//     - case 11 (141-148): sprite Spr_Night_Camera_Room_11 (80);
//       "-RIGHT HALLWAY A-" [@0x1405c3690]; if (Night_chica_location ==
//       11.0) [@0x1406553a0] image_index = 1 else 0.
//     (The fractional location literals 1.1/1.2/2.1/... in GML compile to
//     exactly the pool doubles, verified by IEEE decode.)
//   line 153 (0x99): if (Night_camera_mode == "vents") [const "vents"
//     @0x1405c36a2]; 5-way dispatch on Night_camera_vent_location (0x1873e)
//     == 1..5 [pool @0x1406553c0 = 1.0..5.0; table @0x1406553d0 identity
//     verified] -> sprite_index = Spr_Vent_Cam_1 (36) / Spr_Vent_Cam_2 (79)
//     / Spr_Vent_Cam_3 (21) / Spr_Vent_Cam_4 (13) / Spr_Vent_Cam_5 (48).
//   line 164 (0xa4): if (game_settings[0] == "full") [global 0x18727,
//     array-index [0] shape, const "full" @0x1405c36a8] {
//         composite_distortion = 15; composite_bleeding = 10;
//         static_magnetude = 0.75; }
//     else if (instance_exists(Obj_Camera_Static)) [0x17 = 23] {
//         Obj_Camera_Static.image_alpha = 1; } [object-tagged write
//     0x14015fea0(0x17, slot 0x1405c7b98), value 1.0].
// TODO(calibrate): no-arg with-target default (*0x1405c3000); switch-table
//   identity for the outer 12-way table (verified for the inner tables from
//   pool init; outer assumed same shape — in-game check: each camera room
//   shows its own sprite/text).
function Scr_Camera_Update(target) {
    // With-target = argument0 when the caller passes one (all known call
    // sites do: object 39 = Obj_Night_Camera_Screen).
    with (target) {
        if (Night_camera_mode == "cameras") {
            if (Night_camera_location == 0) {
                // line 10: no-op.
            } else if (Night_camera_location == 1) {
                sprite_index = Spr_Night_Camera_Room_1; // SPRT 20
                Obj_Night_Camera_Map.camera_text = "-BONNIE'S STAGE-";
                if (Night_bonnie_location == 1) {
                    image_index = 0;
                } else if (Night_bonnie_location == 1.1) {
                    image_index = 1;
                } else if (Night_bonnie_location == 1.2) {
                    image_index = 2;
                } else {
                    image_index = 3;
                }
            } else if (Night_camera_location == 2) {
                sprite_index = Spr_Night_Camera_Room_2; // SPRT 53
                Obj_Night_Camera_Map.camera_text = "-FREDDY'S STAGE-";
                if (Night_freddy_location == 2) {
                    image_index = 0;
                } else if (Night_freddy_location == 2.1) {
                    image_index = 1;
                } else {
                    image_index = 2;
                }
            } else if (Night_camera_location == 3) {
                sprite_index = Spr_Night_Camera_Room_3; // SPRT 32
                Obj_Night_Camera_Map.camera_text = "-CHICA'S STAGE-";
                if (Night_chica_location == 3) {
                    image_index = 0;
                } else if (Night_chica_location == 3.1) {
                    image_index = 1;
                } else if (Night_chica_location == 3.2) {
                    image_index = 2;
                } else {
                    image_index = 3;
                }
            } else if (Night_camera_location == 4) {
                sprite_index = Spr_Night_Camera_Room_4; // SPRT 31
                Obj_Night_Camera_Map.camera_text = "-FOXY'S COVE-";
                if (Night_foxy_location == 4) {
                    image_index = 0;
                } else if (Night_foxy_location == 4.1) {
                    image_index = 1;
                } else if (Night_foxy_location == 4.2) {
                    image_index = 2;
                } else {
                    image_index = 3;
                }
            } else if (Night_camera_location == 5) {
                sprite_index = Spr_Night_Camera_Room_5; // SPRT 63
                Obj_Night_Camera_Map.camera_text = "-MANGLE'S HIDEOUT";
                if (Night_mangle_location == 5) {
                    image_index = 0;
                } else if (Night_mangle_location == 5.1) {
                    image_index = 1;
                } else if (Night_mangle_location == 5.2) {
                    image_index = 2;
                } else if (Night_mangle_location == 5.3) {
                    image_index = 3;
                } else {
                    image_index = 4;
                }
            } else if (Night_camera_location == 6) {
                sprite_index = Spr_Night_Camera_Room_6; // SPRT 65
                Obj_Night_Camera_Map.camera_text = "-LEFT HALLWAY B";
                if (Night_bonnie_location == 6) {
                    if (Night_freddy_location == 6) {
                        image_index = 3;
                    } else {
                        image_index = 1;
                    }
                } else if (Night_freddy_location == 6) {
                    image_index = 2;
                } else {
                    image_index = 0;
                }
            } else if (Night_camera_location == 7) {
                sprite_index = Spr_Night_Camera_Room_7; // SPRT 22
                Obj_Night_Camera_Map.camera_text = "-STORAGE-";
            } else if (Night_camera_location == 8) {
                sprite_index = Spr_Night_Camera_Room_8; // SPRT 98
                Obj_Night_Camera_Map.camera_text = "-RIGHT HALLWAY B-";
                if (Night_chica_location == 8) {
                    if (Night_freddy_location == 8) {
                        image_index = 3;
                    } else {
                        image_index = 1;
                    }
                } else if (Night_freddy_location == 8) {
                    image_index = 2;
                } else {
                    image_index = 0;
                }
            } else if (Night_camera_location == 9) {
                sprite_index = Spr_Night_Camera_Room_9; // SPRT 94
                Obj_Night_Camera_Map.camera_text = "-BATHROOM-";
                if (Night_freddy_location == 9) {
                    image_index = 1;
                } else {
                    image_index = 0;
                }
            } else if (Night_camera_location == 10) {
                sprite_index = Spr_Night_Camera_Room_10; // SPRT 10
                Obj_Night_Camera_Map.camera_text = "-LEFT HALLWAY A-";
                if (Night_bonnie_location == 10) {
                    image_index = 1;
                } else {
                    image_index = 0;
                }
            } else if (Night_camera_location == 11) {
                sprite_index = Spr_Night_Camera_Room_11; // SPRT 80
                Obj_Night_Camera_Map.camera_text = "-RIGHT HALLWAY A-";
                if (Night_chica_location == 11) {
                    image_index = 1;
                } else {
                    image_index = 0;
                }
            }
        }
        if (Night_camera_mode == "vents") {
            if (Night_camera_vent_location == 1) {
                sprite_index = Spr_Vent_Cam_1; // SPRT 36
            } else if (Night_camera_vent_location == 2) {
                sprite_index = Spr_Vent_Cam_2; // SPRT 79
            } else if (Night_camera_vent_location == 3) {
                sprite_index = Spr_Vent_Cam_3; // SPRT 21
            } else if (Night_camera_vent_location == 4) {
                sprite_index = Spr_Vent_Cam_4; // SPRT 13
            } else if (Night_camera_vent_location == 5) {
                sprite_index = Spr_Vent_Cam_5; // SPRT 48
            }
        }
        if (game_settings[0] == "full") {
            composite_distortion = 15;
            composite_bleeding = 10;
            static_magnetude = 0.75;
        } else if (instance_exists(Obj_Camera_Static)) {
            Obj_Camera_Static.image_alpha = 1;
        }
    }
    // (C returns its preset 0 RValue; no GML return needed.)
}

// Decompiled C reference (exact machine-level semantics):
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

undefined8 *
gml_Script_Scr_Camera_Update
          (undefined8 param_1,undefined8 param_2,undefined8 *param_3,int param_4,undefined8 *param_5
          )

{
  undefined8 uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  uint uVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  undefined8 *puVar9;
  undefined8 *puVar10;
  longlong *plVar11;
  longlong lVar12;
  longlong *plVar13;
  undefined *puVar14;
  longlong unaff_GS_OFFSET;
  undefined4 uVar15;
  undefined auStack_188 [16];
  longlong lStack_178;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 uStack_138;
  undefined8 *puStack_130;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 uStack_100;
  undefined4 uStack_f8;
  uint uStack_f4;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined auStack_d8 [8];
  undefined8 uStack_d0;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined auStack_a8 [8];
  undefined8 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  
  uStack_70 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043a467;
  uStack_b0 = 0;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uRam0000000140657680 = param_1;
  puStack_140 = param_3;
  uStack_f0 = param_2;
  uStack_88 = param_1;
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  puVar7 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873c);
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  puVar8 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873a);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  puVar9 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18744);
  puStack_168 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873f);
  puStack_150 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18743);
  puStack_148 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18745);
  puVar10 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873e);
  plVar11 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  puStack_118 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f8);
  puStack_110 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f6);
  puStack_108 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  *(undefined4 *)((longlong)puStack_140 + 0xc) = 5;
  *puStack_140 = 0;
  func_0x000140144b20(uRam00000001405c98f0);
  uStack_b0 = 3;
  if (param_4 < 1) {
    puVar14 = &DAT_1405c3000;
  }
  else {
    puVar14 = (undefined *)*param_5;
  }
  puStack_160 = puVar7;
  puStack_158 = puVar10;
  iVar3 = func_0x000140144bd0(auStack_188,&uStack_88,&uStack_f0,puVar14);
  if (0 < iVar3) {
    do {
      uStack_b0 = 5;
      func_0x0001401453a0(auStack_d8,0x1405c35a0);
      iVar3 = func_0x00014015be60(uVar6,auStack_d8,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_d8);
      }
      puVar7 = puStack_168;
      if (iVar3 == 0) {
        uStack_b0 = 8;
        uStack_f4 = *(uint *)((longlong)puStack_160 + 0xc);
        uStack_f8 = *(undefined4 *)(puStack_160 + 1);
        if ((0x46U >> (uStack_f4 & 0x1f) & 1) == 0) {
          uStack_100 = *puStack_160;
        }
        else {
          func_0x000140040070(&uStack_100);
        }
        if ((*(int *)(*(longlong *)
                       (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
             iRam0000000140655200) && (func_0x0001403f6320(0x140655200), iRam0000000140655200 == -1)
           ) {
          uRam000000014065511c = 0;
          uRam0000000140655110 = 0;
          uRam0000000140655130 = 0x100000000;
          uRam0000000140655124 = 0x3ff0000000000000;
          uRam0000000140655144 = 0x200000000;
          uRam0000000140655138 = 0x4000000000000000;
          uRam0000000140655158 = 0x300000000;
          uRam000000014065514c = 0x4008000000000000;
          uRam000000014065516c = 0x400000000;
          uRam0000000140655160 = 0x4010000000000000;
          uRam0000000140655180 = 0x500000000;
          uRam0000000140655174 = 0x4014000000000000;
          uRam0000000140655194 = 0x600000000;
          uRam0000000140655188 = 0x4018000000000000;
          uRam00000001406551a8 = 0x700000000;
          uRam000000014065519c = 0x401c000000000000;
          uRam00000001406551bc = 0;
          uRam00000001406551b0 = 0x4020000000000000;
          uRam00000001406551c0 = 8;
          uRam00000001406551d0 = 0x900000000;
          uRam00000001406551c4 = 0x4022000000000000;
          uRam00000001406551e4 = 0xa00000000;
          uRam00000001406551d8 = 0x4024000000000000;
          uRam00000001406551f8 = 0xb00000000;
          uRam00000001406551ec = 0x4026000000000000;
          func_0x0001403f6668(&DAT_14003f810);
          func_0x0001403f62c0(0x140655200);
        }
        uVar1 = uRam00000001405cd9c0;
        iVar3 = func_0x00014015be60(0x140655110,&uStack_100,uRam00000001405cd9c0,0);
        if (iVar3 != 0) {
          iVar3 = func_0x00014015be60(0x140655124,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 1;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x140655138,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 2;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x14065514c,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 3;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x140655160,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 4;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x140655174,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 5;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x140655188,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 6;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x14065519c,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 7;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x1406551b0,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 8;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x1406551c4,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 9;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x1406551d8,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 10;
            goto code_r0x00014003cbe2;
          }
          iVar3 = func_0x00014015be60(0x1406551ec,&uStack_100,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 0xb;
            goto code_r0x00014003cbe2;
          }
          goto joined_r0x00014003d412;
        }
        lVar12 = 0;
code_r0x00014003cbe2:
        switch(*(undefined4 *)(lVar12 * 0x14 + 0x140655120)) {
        case 0:
          uStack_b0 = 10;
          if ((0x46U >> (uStack_f4 & 0x1f) & 1) == 0) goto code_r0x00014003e832;
          goto code_r0x00014003e829;
        case 1:
          uStack_b0 = 0xc;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4034000000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0xd;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c35b0);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0xe;
          uStack_a0._0_4_ = *(undefined4 *)(puVar8 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puVar8 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puVar8;
          }
          else {
            func_0x000140040070(auStack_a8,puVar8);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam000000014065524c) &&
             (func_0x0001403f6320(0x14065524c), iRam000000014065524c == -1)) {
            uRam000000014065521c = 0;
            uRam0000000140655210 = 0x3ff0000000000000;
            uRam0000000140655230 = 0x100000000;
            uRam0000000140655224 = 0x3ff199999999999a;
            uRam0000000140655244 = 0x200000000;
            uRam0000000140655238 = 0x3ff3333333333333;
            func_0x0001403f6668(&DAT_14003f9a0);
            func_0x0001403f62c0(0x14065524c);
          }
          uVar1 = uRam00000001405cd9c0;
          iVar3 = func_0x00014015be60(0x140655210,auStack_a8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            lVar12 = 0;
code_r0x00014003e1dd:
            iVar3 = *(int *)(lVar12 * 0x14 + 0x140655220);
            if (iVar3 == 2) {
              uStack_b0 = 0x12;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4000000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else if (iVar3 == 1) {
              uStack_b0 = 0x11;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else {
              if (iVar3 != 0) goto code_r0x00014003e27d;
              uStack_b0 = 0x10;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
          }
          else {
            iVar3 = func_0x00014015be60(0x140655224,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 1;
              goto code_r0x00014003e1dd;
            }
            iVar3 = func_0x00014015be60(0x140655238,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 2;
              goto code_r0x00014003e1dd;
            }
code_r0x00014003e27d:
            uStack_b0 = 0x13;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x4008000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x15;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 2:
          uStack_b0 = 0x18;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x404a800000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x19;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c35d0);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x1a;
          uStack_a0._0_4_ = *(undefined4 *)(puVar9 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puVar9 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puVar9;
          }
          else {
            func_0x000140040070(auStack_a8,puVar9);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140655278) &&
             (func_0x0001403f6320(0x140655278), iRam0000000140655278 == -1)) {
            uRam000000014065525c = 0;
            uRam0000000140655250 = 0x4000000000000000;
            uRam0000000140655270 = 0x100000000;
            uRam0000000140655264 = 0x4000cccccccccccd;
            func_0x0001403f6668(&DAT_14003fa50);
            func_0x0001403f62c0(0x140655278);
          }
          uVar1 = uRam00000001405cd9c0;
          iVar3 = func_0x00014015be60(0x140655250,auStack_a8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            lVar12 = 0;
code_r0x00014003dee9:
            iVar3 = *(int *)(lVar12 * 0x14 + 0x140655260);
            if (iVar3 == 1) {
              uStack_b0 = 0x1d;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else {
              if (iVar3 != 0) goto code_r0x00014003df80;
              uStack_b0 = 0x1c;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
          }
          else {
            iVar3 = func_0x00014015be60(0x140655264,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 1;
              goto code_r0x00014003dee9;
            }
code_r0x00014003df80:
            uStack_b0 = 0x1e;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x4000000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x20;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 3:
          uStack_b0 = 0x23;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4040000000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x24;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c35f0);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x25;
          uStack_a0._0_4_ = *(undefined4 *)(puVar7 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puVar7 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puVar7;
          }
          else {
            func_0x000140040070(auStack_a8,puVar7);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam00000001406552bc) &&
             (func_0x0001403f6320(0x1406552bc), iRam00000001406552bc == -1)) {
            uRam000000014065528c = 0;
            uRam0000000140655280 = 0x4008000000000000;
            uRam00000001406552a0 = 0x100000000;
            uRam0000000140655294 = 0x4008cccccccccccd;
            uRam00000001406552b4 = 0x200000000;
            uRam00000001406552a8 = 0x400999999999999a;
            func_0x0001403f6668(&DAT_14003fae0);
            func_0x0001403f62c0(0x1406552bc);
          }
          uVar1 = uRam00000001405cd9c0;
          iVar3 = func_0x00014015be60(0x140655280,auStack_a8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            lVar12 = 0;
code_r0x00014003e2e0:
            iVar3 = *(int *)(lVar12 * 0x14 + 0x140655290);
            if (iVar3 == 2) {
              uStack_b0 = 0x29;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4000000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else if (iVar3 == 1) {
              uStack_b0 = 0x28;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else {
              if (iVar3 != 0) goto code_r0x00014003e380;
              uStack_b0 = 0x27;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
          }
          else {
            iVar3 = func_0x00014015be60(0x140655294,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 1;
              goto code_r0x00014003e2e0;
            }
            iVar3 = func_0x00014015be60(0x1406552a8,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 2;
              goto code_r0x00014003e2e0;
            }
code_r0x00014003e380:
            uStack_b0 = 0x2a;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x4008000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x2c;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 4:
          uStack_b0 = 0x2f;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x403f000000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x30;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c3600);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x31;
          uStack_a0._0_4_ = *(undefined4 *)(puStack_150 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puStack_150 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puStack_150 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puStack_150;
          }
          else {
            func_0x000140040070(auStack_a8);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam00000001406552fc) &&
             (func_0x0001403f6320(0x1406552fc), iRam00000001406552fc == -1)) {
            uRam00000001406552cc = 0;
            uRam00000001406552c0 = 0x4010000000000000;
            uRam00000001406552e0 = 0x100000000;
            uRam00000001406552d4 = 0x4010666666666666;
            uRam00000001406552f4 = 0x200000000;
            uRam00000001406552e8 = 0x4010cccccccccccd;
            func_0x0001403f6668(&DAT_14003fb90);
            func_0x0001403f62c0(0x1406552fc);
          }
          uVar1 = uRam00000001405cd9c0;
          iVar3 = func_0x00014015be60(0x1406552c0,auStack_a8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            lVar12 = 0;
code_r0x00014003e3e3:
            iVar3 = *(int *)(lVar12 * 0x14 + 0x1406552d0);
            if (iVar3 == 2) {
              uStack_b0 = 0x35;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4000000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else if (iVar3 == 1) {
              uStack_b0 = 0x34;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
            else {
              if (iVar3 != 0) goto code_r0x00014003e483;
              uStack_b0 = 0x33;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
          }
          else {
            iVar3 = func_0x00014015be60(0x1406552d4,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 1;
              goto code_r0x00014003e3e3;
            }
            iVar3 = func_0x00014015be60(0x1406552e8,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 2;
              goto code_r0x00014003e3e3;
            }
code_r0x00014003e483:
            uStack_b0 = 0x36;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x4008000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x38;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 5:
          uStack_b0 = 0x3b;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x404f800000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x3c;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c3610);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x3d;
          uStack_a0._0_4_ = *(undefined4 *)(puStack_148 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puStack_148 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puStack_148 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puStack_148;
          }
          else {
            func_0x000140040070(auStack_a8);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140655350) &&
             (func_0x0001403f6320(0x140655350), iRam0000000140655350 == -1)) {
            uRam000000014065530c = 0;
            uRam0000000140655300 = 0x4014000000000000;
            uRam0000000140655320 = 0x100000000;
            uRam0000000140655314 = 0x4014666666666666;
            uRam0000000140655334 = 0x200000000;
            uRam0000000140655328 = 0x4014cccccccccccd;
            uRam0000000140655348 = 0x300000000;
            uRam000000014065533c = 0x4015333333333333;
            func_0x0001403f6668(&DAT_14003fc40);
            func_0x0001403f62c0(0x140655350);
          }
          uVar1 = uRam00000001405cd9c0;
          iVar3 = func_0x00014015be60(0x140655300,auStack_a8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            lVar12 = 0;
code_r0x00014003e782:
            switch(*(undefined4 *)(lVar12 * 0x14 + 0x140655310)) {
            case 0:
              uStack_b0 = 0x3f;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              break;
            case 1:
              uStack_b0 = 0x40;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              break;
            case 2:
              uStack_b0 = 0x41;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4000000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              break;
            case 3:
              uStack_b0 = 0x42;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4008000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              break;
            default:
              goto code_r0x00014003c136;
            }
          }
          else {
            iVar3 = func_0x00014015be60(0x140655314,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 1;
              goto code_r0x00014003e782;
            }
            iVar3 = func_0x00014015be60(0x140655328,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 2;
              goto code_r0x00014003e782;
            }
            iVar3 = func_0x00014015be60(0x14065533c,auStack_a8,uVar1,0);
            if (iVar3 == 0) {
              lVar12 = 3;
              goto code_r0x00014003e782;
            }
code_r0x00014003c136:
            uStack_b0 = 0x43;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x4010000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x46;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 6:
          uStack_b0 = 0x49;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4050400000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x4a;
          _auStack_a8 = ZEXT816(0);
          func_0x0001401441e0(auStack_a8,0x1405c3630);
          func_0x000140160b90(0x2c,0x186ef,0x80000000);
          uVar1 = uRam00000001405cd9c0;
          uStack_b0 = 0x4b;
          uStack_d0._4_4_ = 0;
          auStack_d8 = (undefined  [8])0x4018000000000000;
          uVar4 = (undefined4)uRam00000001405cd9c0;
          uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
          iVar3 = func_0x00014015be60(puVar8,auStack_d8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4018000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,uVar1,0);
            if (iVar3 != 0) {
              uStack_b0 = 0x4d;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              uVar4 = (undefined4)uRam00000001405cd9c0;
              uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
            }
          }
          uStack_b0 = 0x4f;
          uStack_d0._4_4_ = 0;
          uStack_d0._0_4_ = SUB124(_auStack_d8,8);
          auStack_d8 = (undefined  [8])0x4018000000000000;
          iVar3 = func_0x00014015be60(puVar8,auStack_d8,CONCAT44(uVar15,uVar4),0);
          if (iVar3 == 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4018000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,CONCAT44(uVar15,uVar4),0);
            if (iVar3 == 0) {
              uStack_b0 = 0x51;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4008000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              uVar4 = (undefined4)uRam00000001405cd9c0;
              uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
            }
          }
          uStack_b0 = 0x53;
          uStack_d0._4_4_ = 0;
          uStack_d0._0_4_ = SUB124(_auStack_d8,8);
          auStack_d8 = (undefined  [8])0x4018000000000000;
          iVar3 = func_0x00014015be60(puVar8,auStack_d8,CONCAT44(uVar15,uVar4),0);
          if (iVar3 != 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4018000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,CONCAT44(uVar15,uVar4),0);
            if (iVar3 == 0) {
              uStack_b0 = 0x55;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4000000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              uVar4 = (undefined4)uRam00000001405cd9c0;
              uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
            }
          }
          uStack_b0 = 0x57;
          uStack_d0._4_4_ = 0;
          uStack_d0._0_4_ = SUB124(_auStack_d8,8);
          auStack_d8 = (undefined  [8])0x4018000000000000;
          iVar3 = func_0x00014015be60(puVar8,auStack_d8,CONCAT44(uVar15,uVar4),0);
          if (iVar3 != 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4018000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,CONCAT44(uVar15,uVar4),0);
            if (iVar3 != 0) {
              uStack_b0 = 0x59;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
          }
          uStack_b0 = 0x5b;
          break;
        case 7:
          uStack_b0 = 0x5e;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4036000000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x5f;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c3640);
          func_0x000140160b90(0x2c,0x186ef,0x80000000);
          uStack_b0 = 0x60;
          break;
        case 8:
          uStack_b0 = 99;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4058800000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 100;
          _auStack_a8 = ZEXT816(0);
          func_0x0001401441e0(auStack_a8,0x1405c3650);
          func_0x000140160b90(0x2c,0x186ef,0x80000000);
          uVar1 = uRam00000001405cd9c0;
          uStack_b0 = 0x65;
          uStack_d0._4_4_ = 0;
          auStack_d8 = (undefined  [8])0x4020000000000000;
          uVar4 = (undefined4)uRam00000001405cd9c0;
          uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
          uStack_138 = uVar6;
          iVar3 = func_0x00014015be60(puVar7,auStack_d8,uRam00000001405cd9c0,0);
          if (iVar3 == 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4020000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,uVar1,0);
            if (iVar3 != 0) {
              uStack_b0 = 0x67;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x3ff0000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              uVar4 = (undefined4)uRam00000001405cd9c0;
              uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
            }
          }
          uStack_b0 = 0x69;
          uStack_d0._4_4_ = 0;
          uStack_d0._0_4_ = SUB124(_auStack_d8,8);
          auStack_d8 = (undefined  [8])0x4020000000000000;
          puStack_130 = puVar8;
          iVar3 = func_0x00014015be60(puVar7,auStack_d8,CONCAT44(uVar15,uVar4),0);
          uVar6 = uStack_138;
          if (iVar3 == 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4020000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,CONCAT44(uVar15,uVar4),0);
            uVar6 = uStack_138;
            if (iVar3 == 0) {
              uStack_b0 = 0x6b;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4008000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              uVar4 = (undefined4)uRam00000001405cd9c0;
              uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
            }
          }
          uStack_b0 = 0x6d;
          uStack_d0._4_4_ = 0;
          uStack_d0._0_4_ = SUB124(_auStack_d8,8);
          auStack_d8 = (undefined  [8])0x4020000000000000;
          iVar3 = func_0x00014015be60(puVar7,auStack_d8,CONCAT44(uVar15,uVar4),0);
          puVar8 = puStack_130;
          if (iVar3 != 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4020000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,CONCAT44(uVar15,uVar4),0);
            puVar8 = puStack_130;
            if (iVar3 == 0) {
              uStack_b0 = 0x6f;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0x4000000000000000;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
              uVar4 = (undefined4)uRam00000001405cd9c0;
              uVar15 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
            }
          }
          uStack_b0 = 0x71;
          uStack_d0._4_4_ = 0;
          uStack_d0._0_4_ = SUB124(_auStack_d8,8);
          auStack_d8 = (undefined  [8])0x4020000000000000;
          iVar3 = func_0x00014015be60(puVar7,auStack_d8,CONCAT44(uVar15,uVar4),0);
          if (iVar3 != 0) {
            uStack_d0._4_4_ = 0;
            auStack_d8 = (undefined  [8])0x4020000000000000;
            iVar3 = func_0x00014015be60(puVar9,auStack_d8,CONCAT44(uVar15,uVar4),0);
            if (iVar3 != 0) {
              uStack_b0 = 0x73;
              if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_80);
              }
              uStack_74 = 0;
              uStack_80 = 0;
              func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
            }
          }
          uStack_b0 = 0x75;
          break;
        case 9:
          uStack_b0 = 0x79;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4057800000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x7a;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c3662);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x7b;
          uStack_a0._0_4_ = *(undefined4 *)(puVar9 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puVar9 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puVar9;
          }
          else {
            func_0x000140040070(auStack_a8,puVar9);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140655374) &&
             (func_0x0001403f6320(0x140655374), iRam0000000140655374 == -1)) {
            uRam000000014065536c = 0;
            uRam0000000140655360 = 0x4022000000000000;
            func_0x0001403f6668(&DAT_14003fd10);
            func_0x0001403f62c0(0x140655374);
          }
          uVar5 = func_0x00014015be60(0x140655360,auStack_a8,uRam00000001405cd9c0,0);
          if ((uVar5 | uRam000000014065536c._4_4_) == 0) {
            uStack_b0 = 0x7d;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x3ff0000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          else {
            uStack_b0 = 0x7e;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x80;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 10:
          uStack_b0 = 0x83;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4024000000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x84;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c3670);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x85;
          uStack_a0._0_4_ = *(undefined4 *)(puVar8 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puVar8 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puVar8;
          }
          else {
            func_0x000140040070(auStack_a8,puVar8);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam0000000140655394) &&
             (func_0x0001403f6320(0x140655394), iRam0000000140655394 == -1)) {
            uRam000000014065538c = 0;
            uRam0000000140655380 = 0x4024000000000000;
            func_0x0001403f6668(&DAT_14003fd70);
            func_0x0001403f62c0(0x140655394);
          }
          uVar5 = func_0x00014015be60(0x140655380,auStack_a8,uRam00000001405cd9c0,0);
          if ((uVar5 | uRam000000014065538c._4_4_) == 0) {
            uStack_b0 = 0x87;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x3ff0000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          else {
            uStack_b0 = 0x88;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x8a;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
          break;
        case 0xb:
          uStack_b0 = 0x8d;
          if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_98);
          }
          uStack_8c = 0;
          uStack_98 = 0x4054000000000000;
          func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000,&uStack_98);
          uStack_b0 = 0x8e;
          _auStack_d8 = ZEXT816(0);
          func_0x0001401441e0(auStack_d8,0x1405c3690);
          func_0x000140160b90(0x2c,0x186ef,0x80000000,auStack_d8);
          uStack_b0 = 0x8f;
          uStack_a0._0_4_ = *(undefined4 *)(puVar7 + 1);
          uStack_a0._4_4_ = *(uint *)((longlong)puVar7 + 0xc);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) == 0) {
            auStack_a8 = (undefined  [8])*puVar7;
          }
          else {
            func_0x000140040070(auStack_a8,puVar7);
          }
          if ((*(int *)(*(longlong *)
                         (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
               iRam00000001406553b4) &&
             (func_0x0001403f6320(0x1406553b4), iRam00000001406553b4 == -1)) {
            uRam00000001406553ac = 0;
            uRam00000001406553a0 = 0x4026000000000000;
            func_0x0001403f6668(&DAT_14003fdd0);
            func_0x0001403f62c0(0x1406553b4);
          }
          uVar5 = func_0x00014015be60(0x1406553a0,auStack_a8,uRam00000001405cd9c0,0);
          if ((uVar5 | uRam00000001406553ac._4_4_) == 0) {
            uStack_b0 = 0x91;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0x3ff0000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          else {
            uStack_b0 = 0x92;
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_74 = 0;
            uStack_80 = 0;
            func_0x000140160140(uStack_88,uRam00000001405c7aa8,0x80000000);
          }
          uStack_b0 = 0x94;
          if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(auStack_a8);
          }
        }
joined_r0x00014003d412:
        if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
code_r0x00014003e829:
          func_0x000140001410(&uStack_100);
        }
      }
code_r0x00014003e832:
      uStack_b0 = 0x99;
      func_0x0001401453a0(auStack_d8,0x1405c36a2);
      iVar3 = func_0x00014015be60(uVar6,auStack_d8,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_d8);
      }
      if (iVar3 == 0) {
        uStack_b0 = 0x9b;
        uStack_d0._0_4_ = *(undefined4 *)(puStack_158 + 1);
        uStack_d0._4_4_ = *(uint *)((longlong)puStack_158 + 0xc);
        if ((0x46U >> (*(uint *)((longlong)puStack_158 + 0xc) & 0x1f) & 1) == 0) {
          auStack_d8 = (undefined  [8])*puStack_158;
        }
        else {
          func_0x000140040070(auStack_d8);
        }
        if ((*(int *)(*(longlong *)
                       (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
             iRam0000000140655424) && (func_0x0001403f6320(0x140655424), iRam0000000140655424 == -1)
           ) {
          uRam00000001406553cc = 0;
          uRam00000001406553c0 = 0x3ff0000000000000;
          uRam00000001406553e0 = 0x100000000;
          uRam00000001406553d4 = 0x4000000000000000;
          uRam00000001406553f4 = 0x200000000;
          uRam00000001406553e8 = 0x4008000000000000;
          uRam0000000140655408 = 0x300000000;
          uRam00000001406553fc = 0x4010000000000000;
          uRam000000014065541c = 0x400000000;
          uRam0000000140655410 = 0x4014000000000000;
          func_0x0001403f6668(&DAT_14003fe30);
          func_0x0001403f62c0(0x140655424);
        }
        uVar1 = uRam00000001405cd9c0;
        iVar3 = func_0x00014015be60(0x1406553c0,auStack_d8,uRam00000001405cd9c0,0);
        if (iVar3 == 0) {
          lVar12 = 0;
code_r0x00014003e980:
          switch(*(undefined4 *)(lVar12 * 0x14 + 0x1406553d0)) {
          case 0:
            uStack_b0 = 0x9d;
            if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_98);
            }
            uStack_8c = 0;
            uStack_98 = 0x4042000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000);
            break;
          case 1:
            uStack_b0 = 0x9e;
            if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_98);
            }
            uStack_8c = 0;
            uStack_98 = 0x4053c00000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000);
            break;
          case 2:
            uStack_b0 = 0x9f;
            if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_98);
            }
            uStack_8c = 0;
            uStack_98 = 0x4035000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000);
            break;
          case 3:
            uStack_b0 = 0xa0;
            if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_98);
            }
            uStack_8c = 0;
            uStack_98 = 0x402a000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000);
            break;
          case 4:
            uStack_b0 = 0xa1;
            if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_98);
            }
            uStack_8c = 0;
            uStack_98 = 0x4048000000000000;
            func_0x000140160140(uStack_88,uRam00000001405c7be8,0x80000000);
          }
        }
        else {
          iVar3 = func_0x00014015be60(0x1406553d4,auStack_d8,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 1;
            goto code_r0x00014003e980;
          }
          iVar3 = func_0x00014015be60(0x1406553e8,auStack_d8,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 2;
            goto code_r0x00014003e980;
          }
          iVar3 = func_0x00014015be60(0x1406553fc,auStack_d8,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 3;
            goto code_r0x00014003e980;
          }
          iVar3 = func_0x00014015be60(0x140655410,auStack_d8,uVar1,0);
          if (iVar3 == 0) {
            lVar12 = 4;
            goto code_r0x00014003e980;
          }
        }
        if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(auStack_d8);
        }
      }
      uStack_b0 = 0xa4;
      func_0x0001401453a0(auStack_d8,0x1405c36a8);
      if (((*(uint *)((longlong)plVar11 + 0xc) & 0xffffff) == 2) && (*plVar11 != 0)) {
        func_0x0001401479b0();
        iVar3 = func_0x000140147990(*plVar11);
        if (iVar3 < 1) {
          uVar4 = func_0x000140147990(*plVar11);
          func_0x000140144260(&UNK_140439ca6,0,uVar4);
          plVar13 = (longlong *)0x0;
        }
        else {
          plVar13 = (longlong *)func_0x000140147980(*plVar11,0);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar13 = plVar11;
      }
      iVar3 = func_0x00014015be60(plVar13,auStack_d8,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_d8);
      }
      if (iVar3 == 0) {
        uStack_b0 = 0xa6;
        if ((0x46U >> (*(uint *)((longlong)puStack_118 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puStack_118);
        }
        *(undefined4 *)((longlong)puStack_118 + 0xc) = 0;
        *puStack_118 = 0x402e000000000000;
        uStack_b0 = 0xa7;
        if ((0x46U >> (*(uint *)((longlong)puStack_110 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puStack_110);
        }
        *(undefined4 *)((longlong)puStack_110 + 0xc) = 0;
        *puStack_110 = 0x4024000000000000;
        uStack_b0 = 0xa8;
        if ((0x46U >> (*(uint *)((longlong)puStack_108 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puStack_108);
        }
        *(undefined4 *)((longlong)puStack_108 + 0xc) = 0;
        *puStack_108 = 0x3fe8000000000000;
      }
      else {
        uStack_b0 = 0xac;
        cVar2 = func_0x00014017c0e0(uStack_88,uStack_f0,0x17);
        if (cVar2 != '\0') {
          uStack_b0 = 0xae;
          if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_e8);
          }
          uStack_dc = 0;
          uStack_e8 = 0x3ff0000000000000;
          func_0x00014015fea0(0x17,uRam00000001405c7b98,0x80000000);
        }
      }
      cVar2 = func_0x0001401451f0(auStack_188,&uStack_88,&uStack_f0);
    } while (cVar2 != '\0');
  }
  func_0x0001401449f0(auStack_188,&uStack_88,&uStack_f0);
  if (lStack_178 != 0) {
    func_0x00014012ec70();
    lStack_178 = 0;
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return puStack_140;
}
END DECOMPILED REFERENCE */
