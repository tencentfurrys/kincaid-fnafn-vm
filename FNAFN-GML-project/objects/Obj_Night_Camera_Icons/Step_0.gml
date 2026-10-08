/// @description FNAFN Obj_Night_Camera_Icons / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Camera_Icons / Step_0
// Ground truth: gml_Object_Obj_Night_Camera_Icons_Step_0
// Night_camera_mode (id 0x1873d) gates everything against const @0x1405c52e8
// (func_0x0001401453a0 load); Night_camera_location (id 0x1873c) vs
// image_index + 1 (slot uRam00000001405c7aa8 image_index, EXE-REGISTRY.md; +1
// via compound helper func_0x00014000bf90) selects dim vs bright;
// Night_recording (id 0x18749) feeds a trailing blend switch (all ids via
// builtin_ids.json). Compare `!= 0` -> `!=` (PORTING.md rule).
// TODO(calibrate): mode-gate const @0x1405c52e8, recording case consts
// @0x140656670/@0x140656684 and flag table @0x140656680 (stride 0x14) are
// runtime consts — zeros below are placeholders, calibrate in-game.
// Slots (EXE-REGISTRY.md): image_alpha 0x1405c7b98, image_xscale 0x1405c7c18,
// image_yscale 0x1405c7c08, image_blend 0x1405c7c48. Doubles: 0.6 =
// 0x3fe3333333333333, 0.85 = 0x3feb333333333333, 16777215.0 (c_white) =
// 0x416fffffe0000000, 255.0 = 0x406fe00000000000.
if (Night_camera_mode != 0) { // TODO(calibrate): gate const @0x1405c52e8
    image_alpha = 0;
} else if (Night_camera_location != image_index + 1) {
    // C re-reads image_index and re-tests the same condition when recording
    // != 1 — dead goto (values unchanged), so the dim applies unconditionally.
    image_alpha = 0.6;
    image_xscale = 0.85;
    image_yscale = 0.85;
    image_blend = 16777215; // c_white
} else {
    image_alpha = 1;
    image_xscale = 1;
    image_yscale = 1;
    image_blend = 16777215; // c_white
    // TODO(calibrate): trailing recording switch re-selects image_blend between
    // 16777215 (flag == 1) and 255 (flag == 0) via case consts @0x140656670 /
    // @0x140656684 and table @0x140656680; an unmatched case leaves the white
    // set above. Calibrate case values in-game.
    var _rec_flag = -1;
    if (Night_recording == 0) { // TODO(calibrate): case @0x140656670
        _rec_flag = 1; // TODO(calibrate): table @0x140656680 entry 0
    } else if (Night_recording == 0) { // TODO(calibrate): case @0x140656684
        _rec_flag = 1; // TODO(calibrate): table @0x140656680 entry 1
    }
    if (_rec_flag == 1) {
        image_blend = 16777215;
    } else if (_rec_flag == 0) {
        image_blend = 255;
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Camera_Icons_Step_0(undefined8 param_1)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  longlong lVar5;
  longlong unaff_GS_OFFSET;
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
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  undefined4 uStack_a8;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
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
  puStack_c0 = &UNK_14043c60b;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873c);
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_b8 = 2;
  func_0x0001401453a0(&uStack_60,0x1405c52e8);
  iVar1 = func_0x00014015be60(uVar2,&uStack_60,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if (iVar1 != 0) {
    uStack_b8 = 0x1a;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_74 = 0;
    uStack_80 = 0;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
    goto code_r0x0001400c2ac2;
  }
  uStack_b8 = 4;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_b0,0,0);
  uStack_54 = uStack_a4;
  uStack_58 = uStack_a8;
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) == 0) {
    uStack_60 = uStack_b0;
  }
  else {
    func_0x0001400c31f0(&uStack_60,&uStack_b0);
  }
  func_0x00014000bf90(&uStack_60,1);
  iVar1 = func_0x00014015be60(uVar3,&uStack_60,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if (iVar1 != 0) {
    uStack_b8 = 0x10;
    uStack_54 = 0;
    uStack_60 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(puVar4,&uStack_60,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_b0,0,0);
      uStack_54 = uStack_a4;
      uStack_58 = uStack_a8;
      if ((0x46U >> (uStack_a4 & 0x1f) & 1) == 0) {
        uStack_60 = uStack_b0;
      }
      else {
        func_0x0001400c31f0(&uStack_60,&uStack_b0);
      }
      func_0x00014000bf90(&uStack_60,1);
      iVar1 = func_0x00014015be60(uVar3,&uStack_60,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_60);
      }
      if (iVar1 == 0) goto code_r0x0001400c2ac2;
    }
    uStack_b8 = 0x12;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_74 = 0;
    uStack_80 = 0x3fe3333333333333;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
    uStack_b8 = 0x13;
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_94 = 0;
    uStack_a0 = 0x3feb333333333333;
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_a0);
    uStack_b8 = 0x14;
    if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_84 = 0;
    uStack_90 = 0x3feb333333333333;
    func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_90);
    uStack_b8 = 0x15;
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_64 = 0;
    uStack_70 = 0x416fffffe0000000;
    func_0x000140160140(param_1,uRam00000001405c7c48,0x80000000,&uStack_70);
    goto code_r0x0001400c2ac2;
  }
  uStack_b8 = 6;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_74 = 0;
  uStack_80 = 0x3ff0000000000000;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
  uStack_b8 = 7;
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  uStack_94 = 0;
  uStack_a0 = 0x3ff0000000000000;
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_a0);
  uStack_b8 = 8;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_84 = 0;
  uStack_90 = 0x3ff0000000000000;
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_90);
  uStack_b8 = 9;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_64 = 0;
  uStack_70 = 0x416fffffe0000000;
  func_0x000140160140(param_1,uRam00000001405c7c48,0x80000000,&uStack_70);
  uStack_b8 = 10;
  uStack_54 = *(uint *)((longlong)puVar4 + 0xc);
  uStack_58 = *(undefined4 *)(puVar4 + 1);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) == 0) {
    uStack_60 = *puVar4;
  }
  else {
    func_0x0001400c31f0(&uStack_60,puVar4);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140656698) {
    func_0x0001403f6320(0x140656698);
    if (iRam0000000140656698 == -1) {
      auRam000000014065667c = ZEXT816(0);
      uRam0000000140656670 = 0x3ff0000000000000;
      uRam0000000140656690 = 0x100000000;
      func_0x0001403f6668(&DAT_1400c3160);
      func_0x0001403f62c0(0x140656698);
    }
  }
  uVar2 = uRam00000001405cd9c0;
  lVar5 = 0;
  iVar1 = func_0x00014015be60(0x140656670,&uStack_60,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x0001400c2a4d:
    iVar1 = *(int *)(lVar5 * 0x14 + 0x140656680);
    if (iVar1 == 1) {
      uStack_b8 = 0xd;
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_64 = 0;
      uStack_70 = 0x416fffffe0000000;
      func_0x000140160140(param_1,uRam00000001405c7c48,0x80000000,&uStack_70);
    }
    else if (iVar1 == 0) {
      uStack_b8 = 0xc;
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_64 = 0;
      uStack_70 = 0x406fe00000000000;
      func_0x000140160140(param_1,uRam00000001405c7c48,0x80000000,&uStack_70);
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140656684,&uStack_60,uVar2,0);
    if (iVar1 == 0) {
      lVar5 = 1;
      goto code_r0x0001400c2a4d;
    }
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
code_r0x0001400c2ac2:
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
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */
