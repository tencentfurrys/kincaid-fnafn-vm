/// @description FNAFN Obj_Menu_CN_Images / Mouse — PORTED from C
// Ground truth: gml_Object_Obj_Menu_CN_Images_Mouse_4 (2444 B @0x1400b8270)
// Custom-night AI adjust clicks: left/right of (x, y) steps
// animatronic_ai_text (id 0x186df) down/up, clamped 0..20, then a 5-way
// image_index switch fans out to the per-animatronic handlers.
// Decoded, in order (uStack_88 = GML line markers):
//   1. if (mouse_x < x) (slots 0x1405c7bc8 mouse_x via 0x14015ef90,
//      0x1405c7b78 x via 0x14015f1a0; `<` via `r < 0` per PORTING.md):
//        if (animatronic_ai_text > 0):
//          customfunct_audio_play_sound_single(Snd_Menu_Adjust_Down, <runtime>, <runtime>)
//            (16.0 = exe const @0x1405c4fc0 verified; priority/loop are
//            runtime const @0x1406564d0);
//          animatronic_ai_text -= 1 (-= helper func_0x00014000bdb0, 1.0).
//   9. if (mouse_x > x) (`>` via `0 < r`):
//        if (animatronic_ai_text < 20) (20.0 = 0x4034000000000000 literal):
//          customfunct_audio_play_sound_single(Snd_Menu_Adjust_Up, <runtime>, <runtime>)
//            (21.0 = exe const @0x1405c4fd0 verified; same runtime const);
//          animatronic_ai_text += 1 (+= helper func_0x00014000bf90).
//   0x12. switch (image_index) (slot 0x1405c7aa8) on runtime-pool cases
//      0/1.0/2.0/3.0/4.0 (@0x1406564e0/f4/508/51c/530; guarded init).
//      Jumptable @0x1400b903c unrecoverable — each matched branch calls
//      through and returns directly.
// TODO(calibrate): priority/loop runtime const @0x1406564d0 and the
// image_index switch pool @0x140656544 (both outside the mapped exe image)
// plus the jumptable branch bodies — verify in-game.
// 1 sub-event(s): Mouse_4  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_4 — PORTED ----
// ground truth: gml_Object_Obj_Menu_CN_Images_Mouse_4 (2444 B @0x1400b8270)
// Ported: Obj_Menu_CN_Images / Mouse_4
if (mouse_x < x) {
    if (animatronic_ai_text > 0) {
        customfunct_audio_play_sound_single(Snd_Menu_Adjust_Down, 0, false); // TODO(calibrate): priority/loop are runtime const @0x1406564d0
        animatronic_ai_text -= 1;
    }
}
if (mouse_x > x) {
    if (animatronic_ai_text < 20) {
        customfunct_audio_play_sound_single(Snd_Menu_Adjust_Up, 0, false); // TODO(calibrate): priority/loop are runtime const @0x1406564d0
        animatronic_ai_text += 1;
    }
}
switch (image_index) {
    case 0: // TODO(calibrate): runtime pool @0x1406564e0; jumptable branch — verify in-game
        // TODO(calibrate): branch body unrecoverable (jumptable @0x1400b903c); C returns here
        break;
    case 1: // TODO(calibrate): runtime pool @0x1406564f4
        // TODO(calibrate): branch body unrecoverable; C returns here
        break;
    case 2: // TODO(calibrate): runtime pool @0x140656508
        // TODO(calibrate): branch body unrecoverable; C returns here
        break;
    case 3: // TODO(calibrate): runtime pool @0x14065651c
        // TODO(calibrate): branch body unrecoverable; C returns here
        break;
    case 4: // TODO(calibrate): runtime pool @0x140656530
        // TODO(calibrate): branch body unrecoverable; C returns here
        break;
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_CN_Images_Mouse_4(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  longlong lVar5;
  longlong unaff_GS_OFFSET;
  ulonglong in_stack_fffffffffffffe88;
  undefined8 **ppuVar6;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
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
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043c3a5;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1871d);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186e6);
  (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f0);
  (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1871b);
  (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18735);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_88 = 1;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
  ppuVar6 = (undefined8 **)(in_stack_fffffffffffffe88 & 0xffffffffffffff00);
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_b8,ppuVar6,0,uVar2,uVar3);
  iVar1 = func_0x00014015be60(&uStack_c8,&uStack_b8,uRam00000001405cd9c0,1);
  if ((iVar1 != -2) && (iVar1 < 0)) {
    uStack_88 = 3;
    uVar2 = (**(code **)(*param_1 + 8))(param_1,0x186df);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_70,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uStack_88 = 5;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      func_0x00014000bee0(&uStack_f8,0x1405c4fc0);
      puStack_158 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x1406564d0);
      puStack_150 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1406564d0);
      ppuVar6 = &puStack_158;
      puStack_148 = &uStack_d8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_80,3,ppuVar6);
      uStack_88 = 6;
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x186df);
      uStack_64 = 0;
      uStack_70 = 0x3ff0000000000000;
      func_0x00014000bdb0(uVar2,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
    }
  }
  uStack_88 = 9;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
  ppuVar6 = (undefined8 **)((ulonglong)ppuVar6 & 0xffffffffffffff00);
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_b8,ppuVar6,0);
  iVar1 = func_0x00014015be60(&uStack_c8,&uStack_b8,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    uStack_88 = 0xb;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x186df);
    uStack_64 = 0;
    uStack_70 = 0x4034000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_70,uRam00000001405cd9c0,1);
    if ((iVar1 != -2) && (iVar1 < 0)) {
      uStack_88 = 0xd;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      func_0x00014000bee0(&uStack_f8,0x1405c4fd0);
      puStack_158 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x1406564d0);
      puStack_150 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1406564d0);
      ppuVar6 = &puStack_158;
      puStack_148 = &uStack_d8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_80,3,ppuVar6);
      uStack_88 = 0xe;
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x186df);
      func_0x00014000bf90(uVar2,1);
    }
  }
  uStack_88 = 0x12;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_a8,
                      (ulonglong)ppuVar6 & 0xffffffffffffff00,0);
  uStack_64 = uStack_9c;
  uStack_68 = uStack_a0;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) == 0) {
    uStack_70 = uStack_a8;
  }
  else {
    func_0x0001400b9130(&uStack_70,&uStack_a8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656544) &&
     (func_0x0001403f6320(0x140656544), iRam0000000140656544 == -1)) {
    uRam00000001406564ec = 0;
    uRam00000001406564e0 = 0;
    uRam0000000140656500 = 0x100000000;
    uRam00000001406564f4 = 0x3ff0000000000000;
    uRam0000000140656514 = 0x200000000;
    uRam0000000140656508 = 0x4000000000000000;
    uRam0000000140656528 = 0x300000000;
    uRam000000014065651c = 0x4008000000000000;
    uRam000000014065653c = 0x400000000;
    uRam0000000140656530 = 0x4010000000000000;
    func_0x0001403f6668(&DAT_1400b9050);
    func_0x0001403f62c0(0x140656544);
  }
  uVar2 = uRam00000001405cd9c0;
  lVar5 = 0;
  iVar1 = func_0x00014015be60(0x1406564e0,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x0001400b889a:
    uVar4 = (ulonglong)*(uint *)(lVar5 * 0x14 + 0x1406564f0);
  }
  else {
    iVar1 = func_0x00014015be60(0x1406564f4,&uStack_70,uVar2,0);
    if (iVar1 == 0) {
      lVar5 = 1;
      goto code_r0x0001400b889a;
    }
    iVar1 = func_0x00014015be60(0x140656508,&uStack_70,uVar2,0);
    if (iVar1 == 0) {
      uVar4 = uRam0000000140656514 >> 0x20;
    }
    else {
      iVar1 = func_0x00014015be60(0x14065651c,&uStack_70,uVar2,0);
      if (iVar1 == 0) {
        uVar4 = uRam0000000140656528 >> 0x20;
      }
      else {
        iVar1 = func_0x00014015be60(0x140656530,&uStack_70,uVar2,0);
        if (iVar1 != 0) goto code_r0x0001400b89d0;
        uVar4 = uRam000000014065653c >> 0x20;
      }
    }
  }
  if (uVar4 < 5) {
                    / * WARNING: Could not recover jumptable at 0x0001400b88ba. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
    (*(code *)(&UNK_1400b903c + *(int *)(&UNK_1400b903c + uVar4 * 4)))();
    return;
  }
code_r0x0001400b89d0:
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
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
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
