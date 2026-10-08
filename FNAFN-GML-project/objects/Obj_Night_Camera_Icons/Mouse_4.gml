/// @description FNAFN Obj_Night_Camera_Icons / Mouse_4 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Icons_Mouse_4 (3783 B @0x1400c3270)

// ---- sub-event Mouse_4 — PORTED from C ----
// ground truth: gml_Object_Obj_Night_Camera_Icons_Mouse_4 (3783 B @0x1400c3270)
// Ported: Obj_Night_Camera_Icons / Mouse_4
// Guards (C early-exit chain -> combined &&; compare calibration per PORTING.md):
//   image_alpha != 0 (slot 0x1405c7b98 = image_alpha via 0x14015f1a0 READ;
//     `r==0`-exit = `!=`).
//   layer_get_visible("Camera_HUD") == 1 (funcid slot 0x1405c86b0 =
//     layer_get_visible, arg "Camera_HUD" @0x1405c52f0 via exe_strings.py).
//   Night_recording == 0 (id 0x18749; `r!=0`-exit = `==`).
// Then switch (image_index) (slot 0x1405c7aa8 = image_index via 0x14015f1a0)
// on runtime-pool cases 1.0..10.0 (@0x1406566b0/0x1406566c4/0x1406566d8/
// @0x1406566ec/@0x140656700/@0x140656714/@0x140656728/@0x14065673c/
// @0x140656750/@0x140656764/@0x140656778; guarded init shows
// 1.0 = 0x3ff0000000000000 through 10.0 = 0x4024000000000000 — outside the
// mapped exe image). Each matched case jumps to its handler and returns
// directly (Ghidra: "Could not recover jumptable", indirect jump treated
// as call), so branch bodies are unrecoverable from this block.
// Fallthrough / default (image_index unmatched, uVar5 >= 0xb): the 0x12
// block below — fully ported:
//   Scr_Camera_Update(39) (script call, exe const 39.0 @0x1405c5300);
//   Obj_Night_Camera_Screen.image_yscale = 0 (0x27 = 39 = Screen via
//     obj_names.json, slot 0x1405c7c08) and .image_xscale = 0.65
//     (0x3fe4cccccccccccd, slot 0x1405c7c18);
//   Obj_Night_Camera_Icons_Select.x = x and .y = y (0x14 = 20 = Select;
//     self x/y slots 0x1405c7b78/0x1405c7b88 via 0x14015f1a0, dotted writes
//     per the object-tagged helper rule);
//   click blips 1.0 @0x1405c5310 and 48.0 @0x1405c5320 via
//     customfunct_audio_play_sound_single (trailing args @0x1406566a0).
// TODO(calibrate): switch case values @0x1406566b0... and every case-branch
// body (jumptable @0x1400c469c) plus trailing audio args @0x1406566a0 —
// all outside the exe image; verify in-game.
if (image_alpha != 0
        && layer_get_visible("Camera_HUD") == 1
        && Night_recording == 0) {
    switch (image_index) {
        case 1: // TODO(calibrate): runtime pool @0x1406566b0; branch body unrecoverable (jumptable @0x1400c469c)
            exit;
        case 2: // TODO(calibrate): runtime pool @0x1406566c4
            exit;
        case 3: // TODO(calibrate): runtime pool @0x1406566d8
            exit;
        case 4: // TODO(calibrate): runtime pool @0x1406566ec
            exit;
        case 5: // TODO(calibrate): runtime pool @0x140656700
            exit;
        case 6: // TODO(calibrate): runtime pool @0x140656714
            exit;
        case 7: // TODO(calibrate): runtime pool @0x140656728
            exit;
        case 8: // TODO(calibrate): runtime pool @0x14065673c
            exit;
        case 9: // TODO(calibrate): runtime pool @0x140656764
            exit;
        case 10: // TODO(calibrate): runtime pool @0x140656778
            exit;
        default:
            Scr_Camera_Update(39);
            Obj_Night_Camera_Screen.image_yscale = 0;
            Obj_Night_Camera_Screen.image_xscale = 0.65;
            Obj_Night_Camera_Icons_Select.x = x;
            Obj_Night_Camera_Icons_Select.y = y;
            customfunct_audio_play_sound_single(Snd_Camera_Change, 0 /* TODO(calibrate): runtime const @0x1406566a0 */, false /* TODO(calibrate): runtime const @0x1406566a0 */);
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate): runtime const @0x1406566a0 */, false /* TODO(calibrate): runtime const @0x1406566a0 */);
            break;
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Camera_Icons_Mouse_4(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  int iVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  ulonglong uVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  ulonglong in_stack_fffffffffffffe48;
  undefined4 uVar8;
  undefined8 **ppuVar7;
  ulonglong in_stack_fffffffffffffe50;
  ulonglong uVar9;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  uint uStack_17c;
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
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined4 uStack_c0;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043c634;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873c);
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_78._4_4_ = 0xffffff;
  uStack_80 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_88 = 2;
  in_stack_fffffffffffffe48 = in_stack_fffffffffffffe48 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_168,in_stack_fffffffffffffe48,
                      in_stack_fffffffffffffe50 & 0xffffffffffffff00);
  uVar8 = (undefined4)(in_stack_fffffffffffffe48 >> 0x20);
  uStack_64 = 0;
  uStack_70 = 0;
  iVar2 = func_0x00014015be60(&uStack_168,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) goto code_r0x0001400c3e28;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78._0_4_ = 0;
  uStack_78._4_4_ = 5;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c52f0);
  ppuVar7 = &puStack_118;
  uVar5 = CONCAT44(uVar8,uRam00000001405c86b0);
  puStack_118 = &uStack_f8;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uVar5,ppuVar7);
  uVar1 = uRam00000001405cd9c0;
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x0001400c3e28;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar2 = func_0x00014015be60(uVar3,&uStack_70,uVar1,0);
  if (iVar2 != 0) goto code_r0x0001400c3e28;
  uStack_88 = 4;
  uVar9 = (ulonglong)ppuVar7 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_c8,uVar5 & 0xffffffffffffff00,
                      uVar9);
  uStack_64 = uStack_bc;
  uStack_68 = uStack_c0;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) == 0) {
    uStack_70 = uStack_c8;
  }
  else {
    func_0x0001400c4850(&uStack_70,&uStack_c8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam000000014065678c) &&
     (func_0x0001403f6320(0x14065678c), iRam000000014065678c == -1)) {
    uRam00000001406566bc = 0;
    uRam00000001406566b0 = 0;
    uRam00000001406566d0 = 0x100000000;
    uRam00000001406566c4 = 0x3ff0000000000000;
    uRam00000001406566e4 = 0x200000000;
    uRam00000001406566d8 = 0x4000000000000000;
    uRam00000001406566f8 = 0x300000000;
    uRam00000001406566ec = 0x4008000000000000;
    uRam000000014065670c = 0x400000000;
    uRam0000000140656700 = 0x4010000000000000;
    uRam0000000140656720 = 0x500000000;
    uRam0000000140656714 = 0x4014000000000000;
    uRam0000000140656734 = 0x600000000;
    uRam0000000140656728 = 0x4018000000000000;
    uRam0000000140656748 = 0x700000000;
    uRam000000014065673c = 0x401c000000000000;
    uRam000000014065675c = 0;
    uRam0000000140656750 = 0x4020000000000000;
    uRam0000000140656760 = 8;
    uRam0000000140656770 = 0x900000000;
    uRam0000000140656764 = 0x4022000000000000;
    uRam0000000140656784 = 0xa00000000;
    uRam0000000140656778 = 0x4024000000000000;
    func_0x0001403f6668(&DAT_1400c46d0);
    func_0x0001403f62c0(0x14065678c);
  }
  uVar3 = uRam00000001405cd9c0;
  lVar6 = 0;
  iVar2 = func_0x00014015be60(0x1406566b0,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x0001400c3882:
    uVar5 = (ulonglong)*(uint *)(lVar6 * 0x14 + 0x1406566c0);
joined_r0x0001400c380e:
    if (uVar5 < 0xb) {
                    / * WARNING: Could not recover jumptable at 0x0001400c38a3. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
      (*(code *)(&UNK_1400c469c + *(int *)(&UNK_1400c469c + uVar5 * 4)))();
      return;
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x1406566c4,&uStack_70,uVar3,0);
    uVar5 = uRam00000001406566d0;
    if (iVar2 == 0) {
joined_r0x0001400c382b:
      uVar5 = uVar5 >> 0x20;
      goto joined_r0x0001400c380e;
    }
    iVar2 = func_0x00014015be60(0x1406566d8,&uStack_70,uVar3,0);
    if (iVar2 == 0) {
      uVar5 = uRam00000001406566e4 >> 0x20;
      goto joined_r0x0001400c380e;
    }
    iVar2 = func_0x00014015be60(0x1406566ec,&uStack_70,uVar3,0);
    if (iVar2 == 0) {
      uVar5 = uRam00000001406566f8 >> 0x20;
      goto joined_r0x0001400c380e;
    }
    iVar2 = func_0x00014015be60(0x140656700,&uStack_70,uVar3,0);
    uVar5 = uRam000000014065670c;
    if (iVar2 == 0) {
joined_r0x0001400c380e:
      uVar5 = uVar5 >> 0x20;
      goto joined_r0x0001400c380e;
    }
    iVar2 = func_0x00014015be60(0x140656714,&uStack_70,uVar3,0);
    uVar5 = uRam0000000140656720;
    if ((iVar2 == 0) ||
       (iVar2 = func_0x00014015be60(0x140656728,&uStack_70,uVar3,0), uVar5 = uRam0000000140656734,
       iVar2 == 0)) goto joined_r0x0001400c382b;
    iVar2 = func_0x00014015be60(0x14065673c,&uStack_70,uVar3,0);
    uVar5 = uRam0000000140656748;
    if (iVar2 == 0) goto joined_r0x0001400c380e;
    iVar2 = func_0x00014015be60(0x140656750,&uStack_70,uVar3,0);
    if (iVar2 == 0) {
      uVar5 = (ulonglong)uRam0000000140656760;
      goto joined_r0x0001400c380e;
    }
    iVar2 = func_0x00014015be60(0x140656764,&uStack_70,uVar3,0);
    if (iVar2 == 0) {
      lVar6 = 9;
      goto code_r0x0001400c3882;
    }
    iVar2 = func_0x00014015be60(0x140656778,&uStack_70,uVar3,0);
    uVar5 = uRam0000000140656784;
    if (iVar2 == 0) goto joined_r0x0001400c382b;
  }
  uStack_88 = 0x12;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  func_0x00014000bee0(&uStack_f8,0x1405c5300);
  ppuVar7 = &puStack_118;
  puStack_118 = &uStack_f8;
  gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_80,1,ppuVar7);
  uStack_88 = 0x13;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  uStack_ac = 0;
  uStack_b8 = 0;
  func_0x00014015fea0(0x27,uRam00000001405c7c08,0x80000000,&uStack_b8);
  uStack_88 = 0x14;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_9c = 0;
  uStack_a8 = 0x3fe4cccccccccccd;
  func_0x00014015fea0(0x27,uRam00000001405c7c18,0x80000000,&uStack_a8);
  uStack_88 = 0x15;
  uVar9 = uVar9 & 0xffffffffffffff00;
  uVar5 = (ulonglong)ppuVar7 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_158,uVar5,uVar9);
  func_0x000140001490(&uStack_148,&uStack_158);
  func_0x00014015fea0(0x14,uRam00000001405c7b78,0x80000000,&uStack_148);
  uStack_88 = 0x16;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_138,uVar5 & 0xffffffffffffff00
                      ,uVar9 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_128,&uStack_138);
  func_0x00014015fea0(0x14,uRam00000001405c7b88,0x80000000,&uStack_128);
  uStack_88 = 0x17;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  func_0x00014000bee0(&uStack_f8,0x1405c5310);
  puStack_118 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1406566a0);
  puStack_110 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406566a0);
  puStack_108 = &uStack_d8;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_80,3,&puStack_118);
  uStack_88 = 0x18;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78._0_4_ = 0;
  uStack_78._4_4_ = 5;
  func_0x00014000bee0(&uStack_f8,0x1405c5320);
  puStack_118 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1406566a0);
  puStack_110 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406566a0);
  puStack_108 = &uStack_d8;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_80,3,&puStack_118);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
code_r0x0001400c3e28:
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  if ((0x46U >> (uStack_19c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
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
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
