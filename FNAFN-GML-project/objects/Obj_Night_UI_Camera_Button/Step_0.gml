/// @description FNAFN Obj_Night_UI_Camera_Button / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_UI_Camera_Button_Step_0
// Decoded, in order (uStack_d0 = GML line markers). Slots per
// EXE-REGISTRY.md: 0x1405c7bd8 = mouse_y, 0x1405c7bf8 = view_camera,
// 0x1405c7b78 = x, 0x1405c7b88 = y, 0x1405c8cc0 = lerp,
// 0x1405c85c0/0x1405c85d0 = camera_get_view_width/height,
// 0x1405c8ce0 = camera_set_view_pos. Ids per builtin_ids.json:
// 0x1873b Night_camera, 0x1870b delta_factor, 0x18747 Night_office_rotated,
// 0x186ea button_alpha (2-element array, cf. the ported Draw), 0x186ed
// button_y, 0x1872d key_alpha (4-element array), 0x18758
// Player_rotation_mode, 0x18709/0x1870a cx/cy (object 1 =
// Obj_Office_Camera_Control per obj_names.json).
//   1-4. if (mouse_y <= 85.0 (0x4055400000000000 literal; `<=` via the
//      `r < 1`-exit) || Night_camera == 1.0):
//        button_alpha[0] = 1.25 (0x3ff4000000000000; index via the
//          func_0x00014012b840 second arg, cf. the Freddy Alarm port);
//        button_y = lerp(button_y, <exe const @0x1405c3fa0>,
//          0.08 * delta_factor) (0.08 = 0x3fb47ae147ae147b literal; MUL
//          helper 0x1400053f0).
//   6-9. if (mouse_y > 85.0 && Night_camera == 0 (zeroed-RValue compare)):
//        button_alpha[0] = 0.5 (0x3fe0000000000000);
//        button_y = lerp(button_y, <exe const @0x1405c3fb0>,
//          0.08 * delta_factor).
//   0xc-0x12. if (mouse_y > 635.0 (0x4083d80000000000 literal) &&
//      Night_camera == 0) button_alpha[1] = 1.25; else button_alpha[1]
//      = 0.5. (C shape: `<= 635` -> 0.5-block; `> 635` + `camera != 0` ->
//      0.5-block; else 1.25-block.)
//   0x15. x = Obj_Office_Camera_Control.cx (object-tagged read
//      0x140160480(1, 0x18709)) + camera_get_view_width(view_camera) / 2
//      (DIV helper 0x14001f910 by .rdata double _UNK_140439e68 = 2.0 —
//      divsd-verified per the ported Night_Display/Draw; then ADD helper
//      0x140005290).
//   0x16. y = Obj_Office_Camera_Control.cy + camera_get_view_height(
//      view_camera) / 2 (same shape).
//   0x18. if (Night_office_rotated != 0 (zeroed compare)) -> 0x2f-block:
//        key_alpha[0..3] = lerp(key_alpha[i], <lerp target>,
//          0.1 * delta_factor) (0.1 = 0x3fb999999999999a literal) with
//        targets: [0] <rt @0x140655790>, [1] <rt @0x140655790>,
//        [2] <exe const @0x1405c3fe0>, [3] <rt @0x140655790>.
//      else (0x1a): switch (Obj_Office_Camera_Control.Player_rotation_mode)
//        on pool cases 1.0/2.0/3.0 (@0x1406557a0/7b4/7c8; values literal in
//        the guarded init). The label table @0x1406557b0 is runtime, so the
//        case->branch mapping is assumed identity (same convention as the
//        ported Freddy Alarm / Office_Front_Middle Step):
//          case 1 (0x1c-0x20): targets [0] <rt @0x140655790>,
//            [1] <exe @0x1405c3fc0>, [2] <exe @0x1405c3fc0>,
//            [3] <rt @0x140655790>.
//          case 2 (0x21-0x25): targets [0] <exe @0x1405c3fc0>,
//            [1] <exe @0x1405c3fc0>, [2] <rt @0x140655790>,
//            [3] <rt @0x140655790>.
//          case 3 (0x26-0x2a): targets [0] <exe @0x1405c3fd0>,
//            [1] <rt @0x140655790>, [2] <rt @0x140655790>,
//            [3] <exe @0x1405c3fc0>.
//        (Each key_alpha[i] assignment goes through the array-element
//        boilerplate — 1479b0/147990/147980 length/index checks — elided,
//        as in the ported Draw.)
//   0x35. if (Night_camera == 1.0):
//        camera_set_view_pos(view_camera, <exe const @0x1405c3ff0>,
//          <rt @0x140655790>).
// TODO(calibrate): every @0x1405c3xxx exe const (below the EXE-CONSTANTS
// dump range — emitted as 0) and every @0x140655xxx runtime const
// (BSS-zero convention: 0 below); rotation-mode table @0x1406557b0 mapping;
// 0.08/0.1 lerp factors are literals — verify in-game.
// Ported: Obj_Night_UI_Camera_Button / Step_0
if (mouse_y <= 85 || Night_camera == 1) {
    button_alpha[0] = 1.25;
    button_y = lerp(button_y, 0 /* TODO(calibrate): exe const @0x1405c3fa0 */, 0.08 * delta_factor);
}
if (mouse_y > 85 && Night_camera == 0) {
    button_alpha[0] = 0.5;
    button_y = lerp(button_y, 0 /* TODO(calibrate): exe const @0x1405c3fb0 */, 0.08 * delta_factor);
}
if (mouse_y > 635 && Night_camera == 0) {
    button_alpha[1] = 1.25;
} else {
    button_alpha[1] = 0.5;
}
x = Obj_Office_Camera_Control.cx + camera_get_view_width(view_camera) / 2; // TODO(calibrate): /2 via _UNK_140439e68 (= 2.0 per Night_Display/Draw)
y = Obj_Office_Camera_Control.cy + camera_get_view_height(view_camera) / 2; // TODO(calibrate): same divisor
if (Night_office_rotated != 0) {
    key_alpha[0] = lerp(key_alpha[0], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
    key_alpha[1] = lerp(key_alpha[1], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
    key_alpha[2] = lerp(key_alpha[2], 0 /* TODO(calibrate): exe const @0x1405c3fe0 */, 0.1 * delta_factor);
    key_alpha[3] = lerp(key_alpha[3], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
} else {
    switch (Obj_Office_Camera_Control.Player_rotation_mode) {
        case 1: // TODO(calibrate): table @0x1406557b0 mapping assumed identity — verify in-game
            key_alpha[0] = lerp(key_alpha[0], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
            key_alpha[1] = lerp(key_alpha[1], 0 /* TODO(calibrate): exe const @0x1405c3fc0 */, 0.1 * delta_factor);
            key_alpha[2] = lerp(key_alpha[2], 0 /* TODO(calibrate): exe const @0x1405c3fc0 */, 0.1 * delta_factor);
            key_alpha[3] = lerp(key_alpha[3], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
            break;
        case 2: // TODO(calibrate): same table
            key_alpha[0] = lerp(key_alpha[0], 0 /* TODO(calibrate): exe const @0x1405c3fc0 */, 0.1 * delta_factor);
            key_alpha[1] = lerp(key_alpha[1], 0 /* TODO(calibrate): exe const @0x1405c3fc0 */, 0.1 * delta_factor);
            key_alpha[2] = lerp(key_alpha[2], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
            key_alpha[3] = lerp(key_alpha[3], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
            break;
        case 3: // TODO(calibrate): same table
            key_alpha[0] = lerp(key_alpha[0], 0 /* TODO(calibrate): exe const @0x1405c3fd0 */, 0.1 * delta_factor);
            key_alpha[1] = lerp(key_alpha[1], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
            key_alpha[2] = lerp(key_alpha[2], 0 /* TODO(calibrate): runtime const @0x140655790 */, 0.1 * delta_factor);
            key_alpha[3] = lerp(key_alpha[3], 0 /* TODO(calibrate): exe const @0x1405c3fc0 */, 0.1 * delta_factor);
            break;
    }
}
if (Night_camera == 1) {
    camera_set_view_pos(view_camera, 0 /* TODO(calibrate): exe const @0x1405c3ff0 */, 0 /* TODO(calibrate): runtime const @0x140655790 */);
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_UI_Camera_Button_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  longlong *plVar8;
  longlong *plVar9;
  longlong lVar10;
  longlong unaff_GS_OFFSET;
  uint in_stack_fffffffffffffe28;
  uint uVar11;
  undefined8 **in_stack_fffffffffffffe30;
  undefined8 **ppuVar12;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined auStack_198 [12];
  uint uStack_18c;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined auStack_138 [12];
  uint uStack_12c;
  undefined8 uStack_128;
  undefined4 uStack_120;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e0;
  undefined *puStack_d8;
  undefined4 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined auStack_88 [8];
  undefined8 uStack_80;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_d8 = &UNK_14043afa3;
  uStack_d0 = 0;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  plRam0000000140657680 = param_1;
  uStack_c0 = param_2;
  uStack_160 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_c8 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uStack_90 = CONCAT44(0xffffff,(undefined4)uStack_90);
  uStack_98 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_d0 = 1;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_158);
  uVar6 = uRam00000001405cd9c0;
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x4055400000000000;
  iVar1 = func_0x00014015be60(&uStack_158,auStack_88,uRam00000001405cd9c0,1);
  if ((iVar1 == -2) || (0 < iVar1)) {
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uStack_160,auStack_88,uVar6,0);
    if (iVar1 == 0) goto code_r0x000140062ae4;
  }
  else {
code_r0x000140062ae4:
    uStack_d0 = 3;
    plRam0000000140657680 = (longlong *)0x2879c;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
    func_0x000140141d00(param_1);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0x3ff4000000000000;
    func_0x000140141c50(2);
    uStack_d0 = 4;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    uVar6 = (**(code **)(*param_1 + 0x10))(param_1,0x186ed);
    func_0x000140001490(&uStack_118,uVar6);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3fa0);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fb47ae147ae147b;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(auStack_88,uStack_c8);
    func_0x000140001490(&uStack_f8,auStack_88);
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_88);
    }
    in_stack_fffffffffffffe30 = &puStack_b8;
    in_stack_fffffffffffffe28 = uRam00000001405c8cc0;
    puStack_a8 = &uStack_f8;
    uVar7 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,
                                in_stack_fffffffffffffe30);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar6,uVar7);
    func_0x000140141c50(1);
  }
  uStack_d0 = 6;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_158);
  uVar6 = uRam00000001405cd9c0;
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4055400000000000;
  iVar1 = func_0x00014015be60(&uStack_158,auStack_88,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
    iVar1 = func_0x00014015be60(uStack_160,auStack_88,uVar6,0);
    if (iVar1 == 0) {
      uStack_d0 = 8;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
      func_0x000140141d00(param_1);
      puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
      func_0x000140141d00(*puVar4);
      if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar5);
      }
      *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
      *puVar5 = 0x3fe0000000000000;
      func_0x000140141c50(2);
      uStack_d0 = 9;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      uVar6 = (**(code **)(*param_1 + 0x10))(param_1,0x186ed);
      func_0x000140001490(&uStack_118,uVar6);
      puStack_b8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c3fb0);
      uStack_80._4_4_ = 0;
      auStack_88 = (undefined  [8])0x3fb47ae147ae147b;
      puStack_b0 = &uStack_108;
      func_0x0001400053f0(auStack_88,uStack_c8);
      func_0x000140001490(&uStack_f8,auStack_88);
      if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_88);
      }
      in_stack_fffffffffffffe30 = &puStack_b8;
      in_stack_fffffffffffffe28 = uRam00000001405c8cc0;
      puStack_a8 = &uStack_f8;
      uVar7 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,
                                  in_stack_fffffffffffffe30);
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar6,uVar7);
      func_0x000140141c50(1);
    }
  }
  uStack_d0 = 0xc;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_158);
  uVar6 = uRam00000001405cd9c0;
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4083d80000000000;
  iVar1 = func_0x00014015be60(&uStack_158,auStack_88,uRam00000001405cd9c0,1);
  if (iVar1 < 1) {
code_r0x000140062f51:
    uStack_d0 = 0x12;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
    func_0x000140141d00(param_1);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,1);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    uVar6 = 0x3fe0000000000000;
  }
  else {
    _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
    iVar1 = func_0x00014015be60(uStack_160,auStack_88,uVar6,0);
    if (iVar1 != 0) goto code_r0x000140062f51;
    uStack_d0 = 0xe;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
    func_0x000140141d00(param_1);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,1);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    uVar6 = 0x3ff4000000000000;
  }
  *puVar5 = uVar6;
  func_0x000140141c50(2);
  uStack_d0 = 0x15;
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  _auStack_198 = ZEXT816(0);
  func_0x000140160480(1,0x18709,0x80000000,auStack_198,in_stack_fffffffffffffe28 & 0xffffff00,
                      (ulonglong)in_stack_fffffffffffffe30 & 0xffffffffffffff00);
  func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_148);
  func_0x000140001490(&uStack_118,&uStack_148);
  ppuVar12 = &puStack_b8;
  uVar11 = uRam00000001405c85c0;
  puStack_b8 = &uStack_118;
  uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,1,uRam00000001405c85c0,ppuVar12);
  func_0x00014001f910(auStack_138,uVar6,_UNK_140439e68);
  uStack_80._0_4_ = auStack_198._8_4_;
  uStack_80._4_4_ = uStack_18c;
  if ((0x46U >> (uStack_18c & 0x1f) & 1) == 0) {
    auStack_88 = (undefined  [8])auStack_198._0_8_;
  }
  else {
    func_0x000140066c40(auStack_88,auStack_198);
  }
  func_0x000140005290(auStack_88,auStack_138);
  func_0x000140001490(&uStack_180,auStack_88);
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_138);
  }
  func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_180);
  uStack_d0 = 0x16;
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  _auStack_138 = ZEXT816(0);
  func_0x000140160480(1,0x1870a,0x80000000,auStack_138,uVar11 & 0xffffff00,
                      (ulonglong)ppuVar12 & 0xffffffffffffff00);
  func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_148);
  func_0x000140001490(&uStack_118,&uStack_148);
  ppuVar12 = &puStack_b8;
  uVar11 = uRam00000001405c85d0;
  puStack_b8 = &uStack_118;
  uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,1,uRam00000001405c85d0,ppuVar12);
  func_0x00014001f910(&uStack_128,uVar6,_UNK_140439e68);
  uStack_80._0_4_ = auStack_138._8_4_;
  uStack_80._4_4_ = uStack_12c;
  if ((0x46U >> (uStack_12c & 0x1f) & 1) == 0) {
    auStack_88 = (undefined  [8])auStack_138._0_8_;
  }
  else {
    func_0x000140066c40(auStack_88,auStack_138);
  }
  func_0x000140005290(auStack_88,&uStack_128);
  func_0x000140001490(&uStack_170,auStack_88);
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_170);
  uStack_d0 = 0x18;
  _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
  iVar1 = func_0x00014015be60(uVar3,auStack_88,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    uStack_d0 = 0x2f;
    plRam0000000140657680 = (longlong *)0x287a0;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 1) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,0,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x140655790);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(auStack_88,uStack_c8);
    func_0x000140001490(&uStack_f8,auStack_88);
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_88);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,0);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x30;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 2) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,1,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,1);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x140655790);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(auStack_88,uStack_c8);
    func_0x000140001490(&uStack_f8,auStack_88);
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_88);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,1);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x31;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 3) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,2,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,2);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3fe0);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(auStack_88,uStack_c8);
    func_0x000140001490(&uStack_f8,auStack_88);
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_88);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,2);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x32;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 4) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,3,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,3);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x140655790);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(auStack_88,uStack_c8);
    func_0x000140001490(&uStack_f8,auStack_88);
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_88);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,3);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    goto code_r0x000140064d3d;
  }
  uStack_d0 = 0x1a;
  _auStack_88 = ZEXT816(0);
  func_0x000140160480(1,0x18758,0x80000000,auStack_88,uVar11 & 0xffffff00,
                      (ulonglong)ppuVar12 & 0xffffffffffffff00);
  uStack_11c = uStack_80._4_4_;
  uStack_120 = (uint)uStack_80;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) == 0) {
    uStack_128 = auStack_88;
  }
  else {
    func_0x000140066c40(&uStack_128,auStack_88);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406557dc) &&
     (func_0x0001403f6320(0x1406557dc), iRam00000001406557dc == -1)) {
    uRam00000001406557ac = 0;
    uRam00000001406557a0 = 0x3ff0000000000000;
    uRam00000001406557c0 = 0x100000000;
    uRam00000001406557b4 = 0x4000000000000000;
    uRam00000001406557d4 = 0x200000000;
    uRam00000001406557c8 = 0x4008000000000000;
    func_0x0001403f6668(&DAT_140066b90);
    func_0x0001403f62c0(0x1406557dc);
  }
  uVar6 = uRam00000001405cd9c0;
  lVar10 = 0;
  iVar1 = func_0x00014015be60(0x1406557a0,&uStack_128,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x000140063b3b:
    iVar1 = *(int *)(lVar10 * 0x14 + 0x1406557b0);
    if (iVar1 == 2) goto code_r0x000140063c1d;
code_r0x000140063b4c:
    if (iVar1 == 1) {
      uStack_d0 = 0x21;
      plRam0000000140657680 = (longlong *)0x287a0;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
      if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar8);
        if (iVar1 < 1) {
          uVar2 = func_0x000140147990(*plVar8);
          func_0x000140144260(&UNK_140439ca6,0,uVar2);
          plVar9 = (longlong *)0x0;
        }
        else {
          plVar9 = (longlong *)func_0x000140147980(*plVar8,0);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar9 = plVar8;
      }
      func_0x000140001490(&uStack_118,plVar9);
      puStack_b8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c3fc0);
      uStack_64 = 0;
      uStack_70 = 0x3fb999999999999a;
      puStack_b0 = &uStack_108;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x000140001490(&uStack_f8,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      puStack_a8 = &uStack_f8;
      uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012b840(plVar8,0);
      func_0x000140141d00(*plVar8);
      func_0x000140001490(uVar3,uVar6);
      func_0x000140141c50(2);
      uStack_d0 = 0x22;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
      if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar8);
        if (iVar1 < 2) {
          uVar2 = func_0x000140147990(*plVar8);
          func_0x000140144260(&UNK_140439ca6,1,uVar2);
          plVar9 = (longlong *)0x0;
        }
        else {
          plVar9 = (longlong *)func_0x000140147980(*plVar8,1);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar9 = plVar8;
      }
      func_0x000140001490(&uStack_118,plVar9);
      puStack_b8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c3fc0);
      uStack_64 = 0;
      uStack_70 = 0x3fb999999999999a;
      puStack_b0 = &uStack_108;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x000140001490(&uStack_f8,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      puStack_a8 = &uStack_f8;
      uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012b840(plVar8,1);
      func_0x000140141d00(*plVar8);
      func_0x000140001490(uVar3,uVar6);
      func_0x000140141c50(2);
      uStack_d0 = 0x23;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
      if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar8);
        if (iVar1 < 3) {
          uVar2 = func_0x000140147990(*plVar8);
          func_0x000140144260(&UNK_140439ca6,2,uVar2);
          plVar9 = (longlong *)0x0;
        }
        else {
          plVar9 = (longlong *)func_0x000140147980(*plVar8,2);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar9 = plVar8;
      }
      func_0x000140001490(&uStack_118,plVar9);
      puStack_b8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655790);
      uStack_64 = 0;
      uStack_70 = 0x3fb999999999999a;
      puStack_b0 = &uStack_108;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x000140001490(&uStack_f8,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      puStack_a8 = &uStack_f8;
      uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012b840(plVar8,2);
      func_0x000140141d00(*plVar8);
      func_0x000140001490(uVar3,uVar6);
      func_0x000140141c50(2);
      uStack_d0 = 0x24;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
      if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar8);
        if (iVar1 < 4) {
          uVar2 = func_0x000140147990(*plVar8);
          func_0x000140144260(&UNK_140439ca6,3,uVar2);
          plVar9 = (longlong *)0x0;
        }
        else {
          plVar9 = (longlong *)func_0x000140147980(*plVar8,3);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar9 = plVar8;
      }
      func_0x000140001490(&uStack_118,plVar9);
      puStack_b8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655790);
      uStack_64 = 0;
      uStack_70 = 0x3fb999999999999a;
      puStack_b0 = &uStack_108;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x000140001490(&uStack_f8,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      puStack_a8 = &uStack_f8;
      uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012b840(plVar8,3);
      func_0x000140141d00(*plVar8);
      func_0x000140001490(uVar3,uVar6);
      func_0x000140141c50(2);
      uStack_d0 = 0x25;
    }
    else {
      if (iVar1 == 0) {
        uStack_d0 = 0x1c;
        plRam0000000140657680 = (longlong *)0x287a0;
        if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_98);
        }
        uStack_98 = 0;
        uStack_90 = 0x500000000;
        plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
        if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
          func_0x0001401479b0();
          iVar1 = func_0x000140147990(*plVar8);
          if (iVar1 < 1) {
            uVar2 = func_0x000140147990(*plVar8);
            func_0x000140144260(&UNK_140439ca6,0,uVar2);
            plVar9 = (longlong *)0x0;
          }
          else {
            plVar9 = (longlong *)func_0x000140147980(*plVar8,0);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
          plVar9 = plVar8;
        }
        func_0x000140001490(&uStack_118,plVar9);
        puStack_b8 = &uStack_118;
        func_0x00014000bee0(&uStack_108,0x140655790);
        uStack_64 = 0;
        uStack_70 = 0x3fb999999999999a;
        puStack_b0 = &uStack_108;
        func_0x0001400053f0(&uStack_70,uStack_c8);
        func_0x000140001490(&uStack_f8,&uStack_70);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        puStack_a8 = &uStack_f8;
        uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8)
        ;
        func_0x000140141d00(param_1);
        uVar3 = func_0x00014012b840(plVar8,0);
        func_0x000140141d00(*plVar8);
        func_0x000140001490(uVar3,uVar6);
        func_0x000140141c50(2);
        uStack_d0 = 0x1d;
        if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_98);
        }
        uStack_98 = 0;
        uStack_90 = 0x500000000;
        plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
        if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
          func_0x0001401479b0();
          iVar1 = func_0x000140147990(*plVar8);
          if (iVar1 < 2) {
            uVar2 = func_0x000140147990(*plVar8);
            func_0x000140144260(&UNK_140439ca6,1,uVar2);
            plVar9 = (longlong *)0x0;
          }
          else {
            plVar9 = (longlong *)func_0x000140147980(*plVar8,1);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
          plVar9 = plVar8;
        }
        func_0x000140001490(&uStack_118,plVar9);
        puStack_b8 = &uStack_118;
        func_0x00014000bee0(&uStack_108,0x1405c3fc0);
        uStack_64 = 0;
        uStack_70 = 0x3fb999999999999a;
        puStack_b0 = &uStack_108;
        func_0x0001400053f0(&uStack_70,uStack_c8);
        func_0x000140001490(&uStack_f8,&uStack_70);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        puStack_a8 = &uStack_f8;
        uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8)
        ;
        func_0x000140141d00(param_1);
        uVar3 = func_0x00014012b840(plVar8,1);
        func_0x000140141d00(*plVar8);
        func_0x000140001490(uVar3,uVar6);
        func_0x000140141c50(2);
        uStack_d0 = 0x1e;
        if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_98);
        }
        uStack_98 = 0;
        uStack_90 = 0x500000000;
        plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
        if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
          func_0x0001401479b0();
          iVar1 = func_0x000140147990(*plVar8);
          if (iVar1 < 3) {
            uVar2 = func_0x000140147990(*plVar8);
            func_0x000140144260(&UNK_140439ca6,2,uVar2);
            plVar9 = (longlong *)0x0;
          }
          else {
            plVar9 = (longlong *)func_0x000140147980(*plVar8,2);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
          plVar9 = plVar8;
        }
        func_0x000140001490(&uStack_118,plVar9);
        puStack_b8 = &uStack_118;
        func_0x00014000bee0(&uStack_108,0x1405c3fc0);
        uStack_64 = 0;
        uStack_70 = 0x3fb999999999999a;
        puStack_b0 = &uStack_108;
        func_0x0001400053f0(&uStack_70,uStack_c8);
        func_0x000140001490(&uStack_f8,&uStack_70);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        puStack_a8 = &uStack_f8;
        uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8)
        ;
        func_0x000140141d00(param_1);
        uVar3 = func_0x00014012b840(plVar8,2);
        func_0x000140141d00(*plVar8);
        func_0x000140001490(uVar3,uVar6);
        func_0x000140141c50(2);
        uStack_d0 = 0x1f;
        if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_98);
        }
        uStack_98 = 0;
        uStack_90 = 0x500000000;
        plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
        if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
          func_0x0001401479b0();
          iVar1 = func_0x000140147990(*plVar8);
          if (iVar1 < 4) {
            uVar2 = func_0x000140147990(*plVar8);
            func_0x000140144260(&UNK_140439ca6,3,uVar2);
            plVar9 = (longlong *)0x0;
          }
          else {
            plVar9 = (longlong *)func_0x000140147980(*plVar8,3);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
          plVar9 = plVar8;
        }
        func_0x000140001490(&uStack_118,plVar9);
        puStack_b8 = &uStack_118;
        func_0x00014000bee0(&uStack_108,0x140655790);
        uStack_64 = 0;
        uStack_70 = 0x3fb999999999999a;
        puStack_b0 = &uStack_108;
        func_0x0001400053f0(&uStack_70,uStack_c8);
        func_0x000140001490(&uStack_f8,&uStack_70);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        puStack_a8 = &uStack_f8;
        uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8)
        ;
        func_0x000140141d00(param_1);
        uVar3 = func_0x00014012b840(plVar8,3);
        func_0x000140141d00(*plVar8);
        func_0x000140001490(uVar3,uVar6);
        func_0x000140141c50(2);
        uStack_d0 = 0x20;
      }
code_r0x000140064d27:
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x1406557b4,&uStack_128,uVar6,0);
    if (iVar1 == 0) {
      lVar10 = 1;
      goto code_r0x000140063b3b;
    }
    iVar1 = func_0x00014015be60(0x1406557c8,&uStack_128,uVar6,0);
    if (iVar1 != 0) goto code_r0x000140064d27;
    iVar1 = uRam00000001406557d4._4_4_;
    if (uRam00000001406557d4._4_4_ != 2) goto code_r0x000140063b4c;
code_r0x000140063c1d:
    uStack_d0 = 0x26;
    plRam0000000140657680 = (longlong *)0x287a0;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 1) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,0,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3fd0);
    uStack_64 = 0;
    uStack_70 = 0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(&uStack_70,uStack_c8);
    func_0x000140001490(&uStack_f8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,0);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x27;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 2) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,1,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,1);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x140655790);
    uStack_64 = 0;
    uStack_70 = 0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(&uStack_70,uStack_c8);
    func_0x000140001490(&uStack_f8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,1);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x28;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 3) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,2,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,2);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x140655790);
    uStack_64 = 0;
    uStack_70 = 0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(&uStack_70,uStack_c8);
    func_0x000140001490(&uStack_f8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,2);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x29;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    plVar8 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
    if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar8);
      if (iVar1 < 4) {
        uVar2 = func_0x000140147990(*plVar8);
        func_0x000140144260(&UNK_140439ca6,3,uVar2);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar8,3);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar8;
    }
    func_0x000140001490(&uStack_118,plVar9);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3fc0);
    uStack_64 = 0;
    uStack_70 = 0x3fb999999999999a;
    puStack_b0 = &uStack_108;
    func_0x0001400053f0(&uStack_70,uStack_c8);
    func_0x000140001490(&uStack_f8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_a8 = &uStack_f8;
    uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012b840(plVar8,3);
    func_0x000140141d00(*plVar8);
    func_0x000140001490(uVar3,uVar6);
    func_0x000140141c50(2);
    uStack_d0 = 0x2a;
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
code_r0x000140064d3d:
  uStack_d0 = 0x35;
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uStack_160,auStack_88,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_d0 = 0x37;
    if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_98 = 0;
    uStack_90 = 0x500000000;
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_148);
    func_0x000140001490(&uStack_118,&uStack_148);
    puStack_b8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3ff0);
    puStack_b0 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x140655790);
    puStack_a8 = &uStack_f8;
    func_0x0001401445d0(param_1,uStack_c0,&uStack_98,3,uRam00000001405c8ce0,&puStack_b8);
  }
  if ((0x46U >> (uStack_19c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
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
  puRam0000000140657668 = (undefined8 *)uStack_e0;
  return;
}
END DECOMPILED REFERENCE */
