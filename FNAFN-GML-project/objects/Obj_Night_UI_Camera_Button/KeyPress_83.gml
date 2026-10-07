/// @description FNAFN Obj_Night_UI_Camera_Button / KeyPress_83 - PORTED from C
// ---- sub-event KeyPress_83 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Night_UI_Camera_Button_KeyPress_83 (6657 B @0x140069870)
// Decoded, in order (uStack_a0 = GML line markers). Slots per
// EXE-REGISTRY.md: 0x1405c89d0 = layer_set_visible, 0x1405c8e30 =
// audio_emitter_position, 0x1405c8960 = audio_stop_sound, 0x1405c8e40 =
// audio_sound_pitch, 0x1405c8970 = audio_play_sound. Ids per
// builtin_ids.json: 0x1873b Night_camera, 0x186ec button_toggle (array),
// 0x18747 Night_office_rotated, 0x18758 Player_rotation_mode. Objects per
// obj_names.json: 1 = Obj_Office_Camera_Control, 28 =
// Obj_Night_1_5_Bonnie_AI, 34 = Obj_Night_1_5_Foxy_AI, 30 =
// Obj_Night_1_5_Chica_AI, 16 = Obj_Office_Front_Left, 61 =
// Obj_Office_Front_Right (emitter-var ownership per obj_var_ownership.md).
//   1. if (Night_camera != 0) exit (compare-`!= 0` early exit).
//   3. Obj_Office_Camera_Control.x = 3160.0 (0x40a8b00000000000 literal;
//      object-tagged property write 0x14015fea0(1, x-slot)).
//   4. Obj_Office_Camera_Control.fade_alpha (id 0x18718) = 1.0
//      (object-tagged var write 0x140160b90(1, ...)).
//   5. button_toggle[1] ^= 1 (bool flip via func_0x00014012bb70 + ^1, cf.
//      the ported Music_Switch; index 1 via the accessor second arg).
//   6. switch on the button_toggle[1] copy: cases 0 / 1.0 are CERTAIN
//      (pool @0x140655860 = 0 / @0x140655874 = 1.0, values literal in the
//      guarded init). The label table @0x140655870 is runtime, so the
//      case->branch mapping is assumed identity (1 -> on-branch,
//      0 -> off-branch — same convention as the ported Freddy Alarm):
//      case 1 (0x14-0x1f):
//        layer_set_visible("<layer @0x1405c4088>", <rt @0x140655850>);
//        layer_set_visible("<layer @0x1405c4095>", <exe @0x1405c40a8>);
//        audio_emitter_position(Obj_Night_1_5_Bonnie_AI.Bonnie_emitter,
//          <exe @0x1405c40c8>, <exe @0x1405c40b8>, <rt @0x140655850>);
//        audio_emitter_position(Obj_Night_1_5_Foxy_AI.Foxy_emitter,
//          same consts);
//        audio_emitter_position(Obj_Night_1_5_Chica_AI.Chica_emitter,
//          <rt @0x140655850>, <exe @0x1405c40b8>, <rt @0x140655850>);
//        audio_emitter_position(Obj_Office_Front_Left.door_emitter,
//          <exe @0x1405c40e8>, <exe @0x1405c40b8>, <rt @0x140655850>);
//        audio_emitter_position(Obj_Office_Front_Right.door_emitter,
//          <exe @0x1405c40d8>, <exe @0x1405c40b8>, <rt @0x140655850>);
//        Night_office_rotated = 1.0;
//        Obj_Office_Camera_Control.Player_rotation_mode = 2.0.
//      case 0 (0x8-0x12): mirror image — layer consts swapped
//        (("@0x1405c4088", @0x1405c40a8) / ("@0x1405c4095", rt)),
//        Bonnie/Chica first-consts swapped (Bonnie rt, Chica exe),
//        door first-consts swapped (Left @0x1405c40d8, Right @0x1405c40e8),
//        Night_office_rotated = 0.
//   0x23-0x28. audio_stop_sound(<exe @0x1405c40f8>);
//      audio_stop_sound(<exe @0x1405c4108>);
//      audio_stop_sound(<exe @0x1405c4118>);
//      audio_stop_sound(<exe @0x1405c4128>).
//   0x29. _s = irandom_range(1, 4) (func_0x000140168970 best-fit);
//      switch (_s) on 1.0/2.0/3.0/4.0 (pool @0x140655890..@0x1406558cc
//      literal in the guarded init; identity table @0x1406558a0).
//      Jumptable @0x14006ad45 unrecoverable — each branch calls through
//      and returns directly.
//      Fallthrough:
//        0x30. audio_sound_pitch(0, random_range(...)) (uStack_c0 literal
//               0; func_0x000140168cf0 best-fit random_range with .rdata
//               args _UNK_14043b070/_UNK_14043b078).
//        0x31. audio_play_sound(0, <rt @0x140655850>, <rt @0x140655850>).
// TODO(calibrate): toggle-switch table @0x140655870 mapping; layer-name
// strings + numeric consts @0x1405c40xx (below the EXE-CONSTANTS dump
// range — emitted as "TODO_calibrate_..." / 0); runtime consts @0x140655850
// (BSS-zero convention: 0/false below); random_range .rdata args;
// second-switch jumptable bodies — verify in-game.
// Ported: Obj_Night_UI_Camera_Button / KeyPress_83
if (Night_camera != 0) {
    exit;
}
Obj_Office_Camera_Control.x = 3160;
Obj_Office_Camera_Control.fade_alpha = 1;
button_toggle[1] ^= 1;
if (button_toggle[1] == 1) { // TODO(calibrate): table @0x140655870 mapping assumed identity — verify in-game
    layer_set_visible("TODO_calibrate_0x1405c4088", 0 /* TODO(calibrate): runtime const @0x140655850 */);
    layer_set_visible("TODO_calibrate_0x1405c4095", 0 /* TODO(calibrate): exe const @0x1405c40a8 */);
    audio_emitter_position(Obj_Night_1_5_Bonnie_AI.Bonnie_emitter, 0 /* TODO(calibrate): exe const @0x1405c40c8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Night_1_5_Foxy_AI.Foxy_emitter, 0 /* TODO(calibrate): exe const @0x1405c40c8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Night_1_5_Chica_AI.Chica_emitter, 0 /* TODO(calibrate): runtime const @0x140655850 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Office_Front_Left.door_emitter, 0 /* TODO(calibrate): exe const @0x1405c40e8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Office_Front_Right.door_emitter, 0 /* TODO(calibrate): exe const @0x1405c40d8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    Night_office_rotated = 1;
    Obj_Office_Camera_Control.Player_rotation_mode = 2;
} else if (button_toggle[1] == 0) { // TODO(calibrate): same table
    layer_set_visible("TODO_calibrate_0x1405c4088", 0 /* TODO(calibrate): exe const @0x1405c40a8 */);
    layer_set_visible("TODO_calibrate_0x1405c4095", 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Night_1_5_Bonnie_AI.Bonnie_emitter, 0 /* TODO(calibrate): runtime const @0x140655850 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Night_1_5_Foxy_AI.Foxy_emitter, 0 /* TODO(calibrate): runtime const @0x140655850 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Night_1_5_Chica_AI.Chica_emitter, 0 /* TODO(calibrate): exe const @0x1405c40c8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Office_Front_Left.door_emitter, 0 /* TODO(calibrate): exe const @0x1405c40d8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    audio_emitter_position(Obj_Office_Front_Right.door_emitter, 0 /* TODO(calibrate): exe const @0x1405c40e8 */, 0 /* TODO(calibrate): exe const @0x1405c40b8 */, 0 /* TODO(calibrate): runtime const @0x140655850 */);
    Night_office_rotated = 0;
}
audio_stop_sound(0 /* TODO(calibrate): exe const @0x1405c40f8 */);
audio_stop_sound(0 /* TODO(calibrate): exe const @0x1405c4108 */);
audio_stop_sound(0 /* TODO(calibrate): exe const @0x1405c4118 */);
audio_stop_sound(0 /* TODO(calibrate): exe const @0x1405c4128 */);
var _s83 = irandom_range(1, 4);
switch (_s83) {
    case 1: // TODO(calibrate): pool @0x140655890; jumptable branch — verify in-game
        // TODO(calibrate): branch body unrecoverable (jumptable @0x14006ad45); C returns here
        exit;
    case 2: // TODO(calibrate): pool @0x1406558a4
        // TODO(calibrate): branch body unrecoverable; C returns here
        exit;
    case 3: // TODO(calibrate): pool @0x1406558b8
        // TODO(calibrate): branch body unrecoverable; C returns here
        exit;
    case 4: // TODO(calibrate): pool @0x1406558cc
        // TODO(calibrate): branch body unrecoverable; C returns here
        exit;
}
audio_sound_pitch(0, random_range(0, 0)); // TODO(calibrate): random args are .rdata doubles _UNK_14043b070/_UNK_14043b078 — verify in-game
audio_play_sound(0, 0 /* TODO(calibrate): runtime const @0x140655850 */, false /* TODO(calibrate): runtime const @0x140655850 */);
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_UI_Camera_Button_KeyPress_83(longlong *param_1,undefined8 param_2)

{
  byte bVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  longlong *plVar5;
  longlong *plVar6;
  double *pdVar7;
  ulonglong uVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  uint uVar10;
  undefined8 **ppuVar11;
  undefined8 uStack_1e8;
  undefined8 uStack_1e0;
  undefined8 uStack_1d8;
  uint uStack_1cc;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined auStack_1a8 [16];
  undefined auStack_198 [16];
  undefined auStack_188 [16];
  undefined auStack_178 [16];
  undefined8 uStack_160;
  ulonglong uStack_158;
  longlong lStack_150;
  undefined4 uStack_148;
  uint uStack_144;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
  undefined4 uStack_128;
  uint uStack_124;
  undefined8 *puStack_120;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined auStack_d8 [8];
  undefined8 uStack_d0;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 *puStack_98;
  undefined8 *puStack_90;
  undefined8 *puStack_88;
  undefined8 *puStack_80;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043b080;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  plRam0000000140657680 = param_1;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  puStack_120 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_1cc = 0xffffff;
  uStack_1d8 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_a0 = 1;
  uStack_158 = (ulonglong)(uint)uStack_158;
  uStack_160 = 0;
  iVar2 = func_0x00014015be60(uVar4,&uStack_160,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014006afdb;
  uStack_a0 = 3;
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  uStack_134 = 0;
  uStack_140 = 0x40a8b00000000000;
  func_0x00014015fea0(1,uRam00000001405c7b78,0x80000000,&uStack_140);
  uStack_a0 = 4;
  uStack_158 = 0;
  uStack_160 = 0x3ff0000000000000;
  func_0x000140160b90(1,0x18718,0x80000000,&uStack_160);
  uStack_a0 = 5;
  plRam0000000140657680 = (longlong *)0x2879d;
  plVar5 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x186ec);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar6 = (longlong *)0x0;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar5,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar6 = plVar5;
  }
  bVar1 = func_0x00014012bb70(plVar6);
  func_0x000140141d00(param_1);
  pdVar7 = (double *)func_0x00014012b840(plVar5,1);
  func_0x000140141d00(*plVar5);
  if ((0x46U >> (*(uint *)((longlong)pdVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar7);
  }
  *(undefined4 *)((longlong)pdVar7 + 0xc) = 0;
  *pdVar7 = (double)(uint)(bVar1 ^ 1);
  func_0x000140141c50(2);
  uStack_a0 = 6;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar5 = (longlong *)0x0;
    }
    else {
      plVar5 = (longlong *)func_0x000140147980(*plVar5,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_144 = *(uint *)((longlong)plVar5 + 0xc);
  uStack_148 = *(undefined4 *)(plVar5 + 1);
  if ((0x46U >> (uStack_144 & 0x1f) & 1) == 0) {
    lStack_150 = *plVar5;
  }
  else {
    func_0x00014006b860(&lStack_150,plVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655888) &&
     (func_0x0001403f6320(0x140655888), iRam0000000140655888 == -1)) {
    uRam000000014065586c = 0;
    uRam0000000140655860 = 0;
    uRam0000000140655880 = 0x100000000;
    uRam0000000140655874 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_14006b700);
    func_0x0001403f62c0(0x140655888);
  }
  uVar4 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar2 = func_0x00014015be60(0x140655860,&lStack_150,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x000140069c67:
    iVar2 = *(int *)(lVar9 * 0x14 + 0x140655870);
    if (iVar2 == 1) {
      uStack_a0 = 0x14;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c4088);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655850);
      puStack_90 = &uStack_108;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uRam00000001405c89d0,&puStack_98);
      uStack_a0 = 0x15;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c4095);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40a8);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c89d0;
      puStack_90 = &uStack_108;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uRam00000001405c89d0,ppuVar11);
      uStack_a0 = 0x17;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      _auStack_d8 = ZEXT816(0);
      func_0x000140160480(0x1c,0x186e7,0x80000000,auStack_d8,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_d8);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40c8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0x18;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_1a8 = ZEXT816(0);
      func_0x000140160480(0x22,0x1871c,0x80000000,auStack_1a8,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_1a8);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40c8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0x19;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_198 = ZEXT816(0);
      func_0x000140160480(0x1e,0x186f1,0x80000000,auStack_198,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_198);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655850);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0x1b;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_188 = ZEXT816(0);
      func_0x000140160480(0x10,0x1870f,0x80000000,auStack_188,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_188);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40e8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0x1c;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_178 = ZEXT816(0);
      func_0x000140160480(0x3d,0x1870f,0x80000000,auStack_178,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_178);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40d8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,&puStack_98);
      uStack_a0 = 0x1e;
      if ((0x46U >> (*(uint *)((longlong)puStack_120 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_120);
      }
      *(undefined4 *)((longlong)puStack_120 + 0xc) = 0;
      *puStack_120 = 0x3ff0000000000000;
      uStack_a0 = 0x1f;
      uStack_1e0 = 0;
      uStack_1e8 = 0x4000000000000000;
      func_0x000140160b90(1,0x18758,0x80000000,&uStack_1e8);
    }
    else if (iVar2 == 0) {
      uStack_a0 = 8;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      (**(code **)(*param_1 + 0x10))(param_1,0x186ec);
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c4088);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40a8);
      puStack_90 = &uStack_108;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uRam00000001405c89d0,&puStack_98);
      uStack_a0 = 9;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c4095);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c89d0;
      puStack_90 = &uStack_108;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uRam00000001405c89d0,ppuVar11);
      uStack_a0 = 0xb;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      _auStack_d8 = ZEXT816(0);
      func_0x000140160480(0x1c,0x186e7,0x80000000,auStack_d8,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_d8);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655850);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0xc;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_1a8 = ZEXT816(0);
      func_0x000140160480(0x22,0x1871c,0x80000000,auStack_1a8,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_1a8);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655850);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0xd;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_198 = ZEXT816(0);
      func_0x000140160480(0x1e,0x186f1,0x80000000,auStack_198,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_198);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40c8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0xf;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_188 = ZEXT816(0);
      func_0x000140160480(0x10,0x1870f,0x80000000,auStack_188,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_188);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40d8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      ppuVar11 = &puStack_98;
      uVar10 = uRam00000001405c8e30;
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,ppuVar11);
      uStack_a0 = 0x10;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      auStack_178 = ZEXT816(0);
      func_0x000140160480(0x3d,0x1870f,0x80000000,auStack_178,uVar10 & 0xffffff00,
                          (ulonglong)ppuVar11 & 0xffffffffffffff00);
      func_0x000140001490(&uStack_118,auStack_178);
      puStack_98 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c40e8);
      puStack_90 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c40b8);
      puStack_88 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655850);
      puStack_80 = &uStack_e8;
      func_0x0001401445d0(param_1,param_2,&uStack_70,4,uRam00000001405c8e30,&puStack_98);
      uStack_a0 = 0x12;
      if ((0x46U >> (*(uint *)((longlong)puStack_120 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_120);
      }
      *(undefined4 *)((longlong)puStack_120 + 0xc) = 0;
      *puStack_120 = 0;
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x140655874,&lStack_150,uVar4,0);
    if (iVar2 == 0) {
      lVar9 = 1;
      goto code_r0x000140069c67;
    }
  }
  uStack_a0 = 0x23;
  uVar4 = func_0x000140168970(1,4);
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  uStack_124 = 0;
  uStack_a0 = 0x24;
  uStack_130 = uVar4;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  uStack_b4 = 0;
  uStack_c0 = 0;
  uStack_a0 = 0x25;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c40f8);
  puStack_98 = &uStack_118;
  func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8960,&puStack_98);
  uStack_a0 = 0x26;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c4108);
  puStack_98 = &uStack_118;
  func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8960,&puStack_98);
  uStack_a0 = 0x27;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c4118);
  puStack_98 = &uStack_118;
  func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8960,&puStack_98);
  uStack_a0 = 0x28;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c4128);
  puStack_98 = &uStack_118;
  func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8960,&puStack_98);
  uStack_a0 = 0x29;
  uStack_d0._0_4_ = uStack_128;
  uStack_d0._4_4_ = uStack_124;
  if ((0x46U >> (uStack_124 & 0x1f) & 1) == 0) {
    auStack_d8 = (undefined  [8])uStack_130;
  }
  else {
    func_0x00014006b860(auStack_d8,&uStack_130);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406558e0) &&
     (func_0x0001403f6320(0x1406558e0), iRam00000001406558e0 == -1)) {
    uRam000000014065589c = 0;
    uRam0000000140655890 = 0x3ff0000000000000;
    uRam00000001406558b0 = 0x100000000;
    uRam00000001406558a4 = 0x4000000000000000;
    uRam00000001406558c4 = 0x200000000;
    uRam00000001406558b8 = 0x4008000000000000;
    uRam00000001406558d8 = 0x300000000;
    uRam00000001406558cc = 0x4010000000000000;
    func_0x0001403f6668(&DAT_14006b790);
    func_0x0001403f62c0(0x1406558e0);
  }
  uVar4 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar2 = func_0x00014015be60(0x140655890,auStack_d8,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x00014006ad25:
    uVar8 = (ulonglong)*(uint *)(lVar9 * 0x14 + 0x1406558a0);
joined_r0x00014006b13c:
    if (uVar8 < 4) {
                    / * WARNING: Could not recover jumptable at 0x00014006ad45. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
      (*(code *)(&UNK_14006b6ec + *(int *)(&UNK_14006b6ec + uVar8 * 4)))();
      return;
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x1406558a4,auStack_d8,uVar4,0);
    if (iVar2 == 0) {
      lVar9 = 1;
      goto code_r0x00014006ad25;
    }
    iVar2 = func_0x00014015be60(0x1406558b8,auStack_d8,uVar4,0);
    if (iVar2 == 0) {
      uVar8 = uRam00000001406558c4 >> 0x20;
      goto joined_r0x00014006b13c;
    }
    iVar2 = func_0x00014015be60(0x1406558cc,auStack_d8,uVar4,0);
    if (iVar2 == 0) {
      uVar8 = uRam00000001406558d8 >> 0x20;
      goto joined_r0x00014006b13c;
    }
  }
  uStack_a0 = 0x30;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  puStack_98 = &uStack_c0;
  uVar4 = func_0x000140168cf0((int)_UNK_14043b070,_UNK_14043b078);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  uStack_fc = 0;
  uStack_108 = uVar4;
  puStack_90 = &uStack_108;
  func_0x0001401445d0(param_1,param_2,&uStack_70,2,uRam00000001405c8e40,&puStack_98);
  uStack_a0 = 0x31;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  puStack_98 = &uStack_c0;
  func_0x00014000bee0(&uStack_108,0x140655850);
  puStack_90 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140655850);
  puStack_88 = &uStack_f8;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8970,&puStack_98);
  if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_d8);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_150);
  }
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
code_r0x00014006afdb:
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d8);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
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
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */

