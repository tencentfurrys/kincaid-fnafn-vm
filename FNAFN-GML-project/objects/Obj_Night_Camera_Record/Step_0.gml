/// @description FNAFN Obj_Night_Camera_Record / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Camera_Record / Step_0
// Ground truth: gml_Object_Obj_Night_Camera_Record_Step_0
// Globals Night_camera_location (0x1873c) and Night_recording (0x18749,
// builtin_ids.json). The record lamp only tracks the mouse on camera pages
// 6/8/9 (0x4018000000000000/0x4020000000000000/0x4022000000000000); elsewhere
// image_alpha = 0.1 (0x3fb999999999999a). Hover box is strict (same convention
// as customfunct_ui_button_detection): mouse_x in (x, x + 237 * image_xscale),
// mouse_y in (y, y + 54 * image_yscale) — 237.0 = 0x406da00000000000, 54.0 =
// 0x404b000000000000 via MUL helper func_0x0001400053f0 + ADD helper
// func_0x000140005290. C sets 0.95 (0x3fee666666666666) both when hovered and
// when unhovered-but-recording == 1; only unhovered + recording != 1 dims to
// 0.6 (0x3fe3333333333333) — collapsed to one condition below.
// Slots (EXE-REGISTRY.md): image_alpha 0x1405c7b98, mouse_x 0x1405c7bc8,
// x 0x1405c7b78, mouse_y 0x1405c7bd8, y 0x1405c7b88, image_xscale 0x1405c7c18,
// image_yscale 0x1405c7c08. Compare `!= 0` -> `!=`, `< 1` -> `<=` (PORTING.md).
if ((Night_camera_location == 6) || (Night_camera_location == 8) || (Night_camera_location == 9)) {
    var _hover = (mouse_x > x) && (mouse_x < x + 237 * image_xscale) && (mouse_y > y) && (mouse_y < y + 54 * image_yscale);
    if (_hover || (Night_recording == 1)) {
        image_alpha = 0.95;
    } else {
        image_alpha = 0.6;
    }
} else {
    image_alpha = 0.1;
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Record_Step_0(undefined8 param_1)

{
  undefined8 uVar1;
  int iVar2;
  undefined8 uVar3;
  undefined8 uVar4;
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
  undefined *puStack_f0;
  undefined4 uStack_e8;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  undefined4 uStack_88;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  undefined4 uStack_58;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_f0 = &UNK_14043dc24;
  uStack_e8 = 0;
  uStack_f8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_f8;
  uRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873c);
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uVar1 = uRam00000001405cd9c0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_e8 = 1;
  uStack_54 = 0;
  uStack_60 = 0x4018000000000000;
  iVar2 = func_0x00014015be60(uVar3,&uStack_60,uRam00000001405cd9c0,0);
  if (iVar2 != 0) {
    uStack_54 = 0;
    uStack_60 = 0x4020000000000000;
    iVar2 = func_0x00014015be60(uVar3,&uStack_60,uVar1,0);
    if (iVar2 != 0) {
      uStack_54 = 0;
      uStack_60 = 0x4022000000000000;
      iVar2 = func_0x00014015be60(uVar3,&uStack_60,uVar1,0);
      if (iVar2 != 0) {
        uStack_e8 = 0xe;
        uStack_74 = 0;
        uStack_80 = 0x3fb999999999999a;
        func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
        goto code_r0x0001401208ba;
      }
    }
  }
  uStack_e8 = 3;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c0);
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_a0,0,0);
  iVar2 = func_0x00014015be60(&uStack_c0,&uStack_a0,uRam00000001405cd9c0,1);
  if (iVar2 < 1) {
code_r0x000140120d3d:
    uStack_54 = 0;
    uStack_60 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar4,&uStack_60,uRam00000001405cd9c0,0);
    if (iVar2 != 0) {
      uStack_e8 = 9;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0x3fe3333333333333;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
      goto code_r0x0001401208ba;
    }
  }
  else {
    func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c0);
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_a0,0,0);
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_e0,0,0);
    uStack_64 = 0;
    uStack_70 = 0x406da00000000000;
    func_0x0001400053f0(&uStack_70,&uStack_e0);
    uStack_54 = uStack_94;
    uStack_58 = uStack_98;
    if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
      uStack_60 = uStack_a0;
    }
    else {
      func_0x000140121560(&uStack_60,&uStack_a0);
    }
    func_0x000140005290(&uStack_60,&uStack_70);
    iVar2 = func_0x00014015be60(&uStack_c0,&uStack_60,uRam00000001405cd9c0,1);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 == -2 || -1 < iVar2) goto code_r0x000140120d3d;
    func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_b0);
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_90,0,0);
    iVar2 = func_0x00014015be60(&uStack_b0,&uStack_90,uRam00000001405cd9c0,1);
    if (iVar2 < 1) goto code_r0x000140120d3d;
    func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_b0);
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_90,0,0);
    func_0x00014015f1a0(param_1,uRam00000001405c7c08,0x80000000,&uStack_d0,0,0);
    uStack_64 = 0;
    uStack_70 = 0x404b000000000000;
    func_0x0001400053f0(&uStack_70,&uStack_d0);
    uStack_54 = uStack_84;
    uStack_58 = uStack_88;
    if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
      uStack_60 = uStack_90;
    }
    else {
      func_0x000140121560(&uStack_60,&uStack_90);
    }
    func_0x000140005290(&uStack_60,&uStack_70);
    iVar2 = func_0x00014015be60(&uStack_b0,&uStack_60,uRam00000001405cd9c0,1);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 == -2 || -1 < iVar2) goto code_r0x000140120d3d;
  }
  uStack_e8 = 5;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_74 = 0;
  uStack_80 = 0x3fee666666666666;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
code_r0x0001401208ba:
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
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  puRam0000000140657668 = (undefined8 *)uStack_f8;
  return;
}
END DECOMPILED REFERENCE */
