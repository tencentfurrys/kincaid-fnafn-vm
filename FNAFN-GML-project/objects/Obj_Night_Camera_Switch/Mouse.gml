/// @description FNAFN Obj_Night_Camera_Switch / Mouse — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_7  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_7 — PORTED ----
// ground truth: gml_Object_Obj_Night_Camera_Switch_Mouse_7 (2465 B @0x1400a89b0)
// Decoded, in order (uStack_98 = GML line markers):
//   1. if (layer_get_visible("Camera_HUD") != 1) exit
//      ("Camera_HUD" = @0x1405c4d60; slot 0x1405c86b0 = layer_get_visible;
//      `!=` via the `compare != 0` early-out).
//   3. if (image_alpha != 1) exit (slot 0x1405c7b98, 1.0 literal).
//   3. toggle = toggle ^ 1 (id 0x18793; bool-conv XOR 1, same shape as
//      Obj_Pause/KeyPress_27 paused toggle).
//   two-case switch on toggle (cases runtime @0x1406562d0/0x1406562e4,
//      labels @0x1406562e0 stride 0x14, per PORTING.md two-case rule):
//     toggle == 1: Night_camera_mode = "cameras" (@0x1405c4d6b);
//        Obj_Night_Camera_Map (obj 44, tag 0x2c).sprite_index = 82
//        (82 = SPRT Spr_Night_Camera_Map); image_index = 1.
//     toggle == 0: Night_camera_mode = "vents" (@0x1405c4d73);
//        Obj_Night_Camera_Map.sprite_index = 84
//        (84 = SPRT Spr_Night_Vent_Map); image_index = 0.
//     (sprite_index = slot 0x1405c7be8 via object-tagged 0x14015fea0;
//     image_index = slot 0x1405c7aa8 via self 0x140160140.)
//   0xf. Scr_Camera_Update(39) (direct gml_Script call; 39.0 = @0x1405c4d80).
//   0x10. Obj_Night_Camera_Screen (obj 39, tag 0x27).image_yscale = 0;
//        .image_xscale = 0.65 (0x3fe4cccccccccccd; slots 0x1405c7c08/c18).
//   0x12/0x13. Obj_Night_Camera_Icons_Select (obj 20, tag 0x14).x = 0;
//        .y = 0 (slots 0x1405c7b78 = x, 0x1405c7b88 = y per PORTING.md).
//   0x14. customfunct_audio_play_sound_single(Snd_Camera_Click, <runtime>, <runtime>)
//        (48.0 = @0x1405c4d90; other args runtime @0x1406562c0 x2).
// TODO(calibrate): toggle case/label pool @0x14065xxxx (mapping above
// assumes toggle==1 -> cameras like the Create-seeded toggle=1 initial
// view; prove via the guarded pool init); audio priority/loop runtime
// const @0x1406562c0 (x2) — verify in-game.
// Ported: Obj_Night_Camera_Switch / Mouse_7
if (layer_get_visible("Camera_HUD") == 1) {
    if (image_alpha == 1) {
        toggle = toggle ^ 1;
        if (toggle == 1) { // TODO(calibrate): runtime pool @0x1406562d0/@0x1406562e4/@0x1406562e0 mapping — verify in-game
            Night_camera_mode = "cameras";
            Obj_Night_Camera_Map.sprite_index = 82; // Spr_Night_Camera_Map
            image_index = 1;
        } else if (toggle == 0) {
            Night_camera_mode = "vents";
            Obj_Night_Camera_Map.sprite_index = 84; // Spr_Night_Vent_Map
            image_index = 0;
        }
        Scr_Camera_Update(39);
        Obj_Night_Camera_Screen.image_yscale = 0;
        Obj_Night_Camera_Screen.image_xscale = 0.65;
        Obj_Night_Camera_Icons_Select.x = 0;
        Obj_Night_Camera_Icons_Select.y = 0;
        customfunct_audio_play_sound_single(Snd_Camera_Click, 0, 0); // TODO(calibrate): 2nd/3rd args are runtime const @0x1406562c0
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void gml_Object_Obj_Night_Camera_Switch_Mouse_7(longlong *param_1,undefined8 param_2)

{
  byte bVar1;
  int iVar2;
  longlong lVar3;
  undefined8 uVar4;
  double *pdVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_fffffffffffffe58;
  undefined4 uVar8;
  ulonglong uVar7;
  undefined8 **ppuVar9;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  double dStack_b8;
  undefined4 uStack_b0;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uVar8 = (undefined4)((ulonglong)in_stack_fffffffffffffe58 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043bdab;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  plRam0000000140657680 = param_1;
  lVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
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
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_98 = 1;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  func_0x0001401441e0(&uStack_128,0x1405c4d60);
  ppuVar9 = &puStack_198;
  uVar7 = CONCAT44(uVar8,uRam00000001405c86b0);
  puStack_198 = &uStack_128;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uVar7,ppuVar9);
  uStack_ac = 0;
  dStack_b8 = 1.0;
  iVar2 = func_0x00014015be60(uVar4,&dStack_b8,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x0001400a9184;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_138,uVar7 & 0xffffffffffffff00
                      ,(ulonglong)ppuVar9 & 0xffffffffffffff00);
  uStack_ac = 0;
  dStack_b8 = 1.0;
  iVar2 = func_0x00014015be60(&uStack_138,&dStack_b8,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x0001400a9184;
  uStack_98 = 3;
  pdVar5 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
  bVar1 = func_0x00014012bb70(pdVar5);
  if ((0x46U >> (*(uint *)((longlong)pdVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar5);
  }
  *(undefined4 *)((longlong)pdVar5 + 0xc) = 0;
  *pdVar5 = (double)(uint)(bVar1 ^ 1);
  uStack_98 = 4;
  uStack_ac = 0;
  uStack_b0 = *(undefined4 *)(pdVar5 + 1);
  dStack_b8 = *pdVar5;
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam00000001406562f8) {
    func_0x0001403f6320(0x1406562f8);
    if (iRam00000001406562f8 == -1) {
      uRam00000001406562dc = 0;
      uRam00000001406562d0 = 0;
      uRam00000001406562f0 = 0x100000000;
      uRam00000001406562e4 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_1400a9830);
      func_0x0001403f62c0(0x1406562f8);
    }
  }
  uVar4 = uRam00000001405cd9c0;
  lVar6 = 0;
  iVar2 = func_0x00014015be60(0x1406562d0,&dStack_b8,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x0001400a8d13:
    iVar2 = *(int *)(lVar6 * 0x14 + 0x1406562e0);
    if (iVar2 == 1) {
      uStack_98 = 10;
      if ((0x46U >> (*(uint *)(lVar3 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(lVar3);
      }
      func_0x0001401441e0(lVar3,0x1405c4d73);
      uStack_98 = 0xb;
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = 0x4055000000000000;
      func_0x00014015fea0(0x2c,uRam00000001405c7be8,0x80000000,&uStack_90);
      uStack_98 = 0xc;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80);
    }
    else if (iVar2 == 0) {
      uStack_98 = 6;
      (**(code **)(*param_1 + 0x10))(param_1,0x18793);
      if ((0x46U >> (*(uint *)(lVar3 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(lVar3);
      }
      func_0x0001401441e0(lVar3,0x1405c4d6b);
      uStack_98 = 7;
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = 0x4054800000000000;
      func_0x00014015fea0(0x2c,uRam00000001405c7be8,0x80000000,&uStack_90);
      uStack_98 = 8;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80);
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x1406562e4,&dStack_b8,uVar4,0);
    if (iVar2 == 0) {
      lVar6 = 1;
      goto code_r0x0001400a8d13;
    }
  }
  uStack_98 = 0xf;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_128,0x1405c4d80);
  puStack_198 = &uStack_128;
  gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_70,1,&puStack_198);
  uStack_98 = 0x10;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  uStack_ec = 0;
  uStack_f8 = 0;
  func_0x00014015fea0(0x27,uRam00000001405c7c08,0x80000000,&uStack_f8);
  uStack_98 = 0x11;
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_dc = 0;
  uStack_e8 = 0x3fe4cccccccccccd;
  func_0x00014015fea0(0x27,uRam00000001405c7c18,0x80000000,&uStack_e8);
  uStack_98 = 0x12;
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  uStack_cc = 0;
  uStack_d8 = 0;
  func_0x00014015fea0(0x14,uRam00000001405c7b78,0x80000000,&uStack_d8);
  uStack_98 = 0x13;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  uStack_bc = 0;
  uStack_c8 = 0;
  func_0x00014015fea0(0x14,uRam00000001405c7b88,0x80000000,&uStack_c8);
  uStack_98 = 0x14;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_128,0x1405c4d90);
  puStack_198 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1406562c0);
  puStack_190 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1406562c0);
  puStack_188 = &uStack_108;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_198);
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_b8);
  }
code_r0x0001400a9184:
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
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
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
