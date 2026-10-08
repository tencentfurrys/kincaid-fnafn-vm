/// @description FNAFN Obj_Night_Music_Switch / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Music_Switch / Step_0
// Ground truth: gml_Object_Obj_Night_Music_Switch_Step_0
// First half: Night_recording (global id 0x18749, builtin_ids.json) selects
// image_alpha (slot uRam00000001405c7b98, EXE-REGISTRY.md) through a runtime
// flag table (TLS-guarded jump-table prologue; case consts @0x140656f30 /
// @0x140656f44, int table @0x140656f40 stride 0x14). C logic: sel = (rec == V0)
// ? 0 : (rec == V1) ? 1 : none; if a case matched, image_alpha = (flag == 1)
// ? 1.0 (0x3ff0000000000000) : (flag == 0) ? 0.5 (0x3fe0000000000000) :
// unchanged. Compare `!= 0` -> `!=` (PORTING.md rule).
// TODO(calibrate): V0, V1 and the flag table are 0x14065xxxx runtime consts —
// zeros below are placeholders, calibrate the case values in-game.
// Second half: toggle (id 0x18793) eases x (slot uRam00000001405c7b78, name at
// 0x1405c7b70 per PORTING.md two-step rule) toward a per-state target:
// x = lerp(x, TARGET, 0.5 * delta_factor) (lerp slot uRam00000001405c8cc0, MUL
// helper func_0x0001400053f0; 0x3fe0000000000000 = 0.5; delta_factor = global
// id 0x1870b). Two separate `==` ifs, not else-branches (matches C).
// TODO(calibrate): targets @0x1405c5f28 (toggle == 0) / @0x1405c5f38
// (toggle == 1) sit outside the mapped image — zeros below are placeholders.
var _rec_flag = -1;
if (Night_recording == 0) { // TODO(calibrate): case value @0x140656f30
    _rec_flag = 1; // TODO(calibrate): actually int table @0x140656f40 entry 0
} else if (Night_recording == 0) { // TODO(calibrate): case value @0x140656f44
    _rec_flag = 1; // TODO(calibrate): actually int table @0x140656f40 entry 1
}
if (_rec_flag == 1) {
    image_alpha = 1;
} else if (_rec_flag == 0) {
    image_alpha = 0.5;
}
if (toggle == 0) {
    x = lerp(x, 0, 0.5 * delta_factor); // TODO(calibrate): target @0x1405c5f28
}
if (toggle == 1) {
    x = lerp(x, 0, 0.5 * delta_factor); // TODO(calibrate): target @0x1405c5f38
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Music_Switch_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined4 uVar7;
  uint in_stack_fffffffffffffea8;
  undefined8 **in_stack_fffffffffffffeb0;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
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
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043d1f4;
  uStack_a8 = 0;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  plRam0000000140657680 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_a8 = 1;
  uStack_94 = *(uint *)((longlong)puVar2 + 0xc);
  uStack_98 = *(undefined4 *)(puVar2 + 1);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
    uStack_a0 = *puVar2;
  }
  else {
    func_0x0001400f52e0(&uStack_a0,puVar2);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140656f58) {
    func_0x0001403f6320(0x140656f58);
    if (iRam0000000140656f58 == -1) {
      auRam0000000140656f3c = ZEXT816(0);
      uRam0000000140656f30 = 0x3ff0000000000000;
      uRam0000000140656f50 = 0x100000000;
      func_0x0001403f6668(&DAT_1400f5250);
      func_0x0001403f62c0(0x140656f58);
    }
  }
  uVar7 = (undefined4)uRam00000001405cd9c0;
  lVar6 = 0;
  iVar1 = func_0x00014015be60(0x140656f30,&uStack_a0,uVar7,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140656f44,&uStack_a0,uVar7,0);
    if (iVar1 != 0) goto code_r0x0001400f48af;
    lVar6 = 1;
  }
  iVar1 = *(int *)(lVar6 * 0x14 + 0x140656f40);
  if (iVar1 == 1) {
    uStack_a8 = 4;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_74 = 0;
    uStack_80 = 0x3ff0000000000000;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
  }
  else if (iVar1 == 0) {
    uStack_a8 = 3;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_74 = 0;
    uStack_80 = 0x3fe0000000000000;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
  }
code_r0x0001400f48af:
  uStack_a8 = 7;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18793);
  uStack_54 = 0;
  uStack_60 = 0;
  uVar7 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar4,&uStack_60,uVar7,0);
  if (iVar1 == 0) {
    uStack_a8 = 9;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,
                        in_stack_fffffffffffffea8 & 0xffffff00,
                        (ulonglong)in_stack_fffffffffffffeb0 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_e8,&uStack_90);
    puStack_148 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c5f28);
    uStack_54 = 0;
    uStack_60 = 0x3fe0000000000000;
    puStack_140 = &uStack_d8;
    func_0x0001400053f0(&uStack_60,uVar3);
    func_0x000140001490(&uStack_c8,&uStack_60);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    in_stack_fffffffffffffeb0 = &puStack_148;
    in_stack_fffffffffffffea8 = uRam00000001405c8cc0;
    puStack_138 = &uStack_c8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8cc0,
                                in_stack_fffffffffffffeb0);
    func_0x000140001490(&uStack_90,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_90);
    uVar7 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_a8 = 0xb;
  uStack_54 = 0;
  uStack_60 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar4,&uStack_60,uVar7,0);
  if (iVar1 == 0) {
    uStack_a8 = 0xd;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    (**(code **)(*param_1 + 8))(param_1,0x18793);
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,
                        in_stack_fffffffffffffea8 & 0xffffff00,
                        (ulonglong)in_stack_fffffffffffffeb0 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_e8,&uStack_90);
    puStack_148 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c5f38);
    uStack_54 = 0;
    uStack_60 = 0x3fe0000000000000;
    puStack_140 = &uStack_d8;
    func_0x0001400053f0(&uStack_60,uVar3);
    func_0x000140001490(&uStack_c8,&uStack_60);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    puStack_138 = &uStack_c8;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8cc0,&puStack_148);
    func_0x000140001490(&uStack_90,uVar3);
    func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */
