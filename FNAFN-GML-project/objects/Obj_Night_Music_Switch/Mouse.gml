/// @description FNAFN Obj_Night_Music_Switch / Mouse_7 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Music_Switch_Mouse_7 (2540 B @0x1400f5360)
// Event 7 = Mouse Button Released family (middle button).
// Guards: layer_get_visible(layer_name) == 1 AND self image_alpha == 1,
// where layer_name = string const @0x1405c5f48 (TODO(calibrate): resolve via
// exe_strings.py; exe image needed).
// Then toggle ^= 1 (bool flip via func_0x00014012bb70 + ^1).
// Two-case switch on toggle (case consts @0x140656f70 = 0 and @0x140656f84 = 1.0,
// PROVEN by the guarded pool init; label table @0x140656f80 static):
// mapping below assumes table routes 0 -> first branch, 1 -> second
// (TODO(calibrate): verify branch polarity in-game).
//   toggle == 0 branch: Night_camera_mode = <const @0x1405c5f5b>,
//     Obj_Night_Camera_Map.sprite_index = 62, self image_index = 0,
//     Obj_Night_Camera_Icons_Select.image_alpha = 0,
//     Obj_Night_Radio_Buttons.image_alpha = 1,
//     Obj_Night_Radio_Spinner.image_alpha = 1, text_alpha = 1.
//   toggle == 1 branch: Night_camera_mode = <const @0x1405c5f53>,
//     Obj_Night_Camera_Map.sprite_index = 82, self image_index = 1,
//     Obj_Night_Camera_Icons_Select.image_alpha = 1,
//     Obj_Night_Radio_Buttons.image_alpha = 0,
//     Obj_Night_Radio_Spinner.image_alpha = 0, text_alpha = 0.
// (Object indices: 0x2c = 44 = Obj_Night_Camera_Map, 0x14 = 20 =
// Obj_Night_Camera_Icons_Select, 0x40 = 64 = Obj_Night_Radio_Buttons,
// 0x3e = 62 = Obj_Night_Radio_Spinner, per obj_names.json.)
// Tail: customfunct_audio_play_sound_single(<const @0x1405c5f68>,
// <runtime @0x140656f60>, <runtime @0x140656f60>) (TODO(calibrate) args).
// NOTE: the bare `(self, 0x18793)` fetch at line-marker 6 is a discarded
// toggle read (no-op); not emitted.
if (layer_get_visible("TODO_calibrate_0x1405c5f48") == 1 && image_alpha == 1) {
    toggle ^= 1;
    if (toggle == 0) {
        // TODO(calibrate): confirm this branch pairs with toggle == 0.
        Night_camera_mode = "TODO_calibrate_0x1405c5f5b";
        Obj_Night_Camera_Map.sprite_index = 62;
        image_index = 0;
        Obj_Night_Camera_Icons_Select.image_alpha = 0;
        Obj_Night_Radio_Buttons.image_alpha = 1;
        Obj_Night_Radio_Spinner.image_alpha = 1;
        text_alpha = 1;
    } else if (toggle == 1) {
        // TODO(calibrate): confirm this branch pairs with toggle == 1.
        Night_camera_mode = "TODO_calibrate_0x1405c5f53";
        Obj_Night_Camera_Map.sprite_index = 82;
        image_index = 1;
        Obj_Night_Camera_Icons_Select.image_alpha = 1;
        Obj_Night_Radio_Buttons.image_alpha = 0;
        Obj_Night_Radio_Spinner.image_alpha = 0;
        text_alpha = 0;
    }
    customfunct_audio_play_sound_single("TODO_calibrate_0x1405c5f68", TODO_calibrate_runtime_0x140656f60, TODO_calibrate_runtime_0x140656f60);
}

// ---- sub-event Mouse_7 — PORTED ----
// ground truth: gml_Object_Obj_Night_Music_Switch_Mouse_7 (2540 B @0x1400f5360)
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Music_Switch_Mouse_7(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  uint uVar2;
  longlong lVar3;
  undefined8 uVar4;
  double *pdVar5;
  undefined8 *puVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_fffffffffffffe68;
  undefined4 uVar9;
  ulonglong uVar8;
  undefined8 **ppuVar10;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
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
  undefined8 uStack_e0;
  double dStack_d8;
  undefined4 uStack_d0;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined *puStack_70;
  undefined4 uStack_68;
  undefined8 uStack_60;
  
  uVar9 = (undefined4)((ulonglong)in_stack_fffffffffffffe68 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_70 = &UNK_14043d21d;
  uStack_68 = 0;
  uStack_78 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_78;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  plRam0000000140657680 = param_1;
  lVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_68 = 1;
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  func_0x0001401441e0(&uStack_118,0x1405c5f48);
  ppuVar10 = &puStack_188;
  uVar8 = CONCAT44(uVar9,uRam00000001405c86b0);
  puStack_188 = &uStack_118;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,uVar8,ppuVar10);
  uStack_cc = 0;
  dStack_d8 = 1.0;
  iVar1 = func_0x00014015be60(uVar4,&dStack_d8,uRam00000001405cd9c0,0);
  if (iVar1 != 0) goto code_r0x0001400f5b95;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_128,uVar8 & 0xffffffffffffff00
                      ,(ulonglong)ppuVar10 & 0xffffffffffffff00);
  uStack_cc = 0;
  dStack_d8 = 1.0;
  iVar1 = func_0x00014015be60(&uStack_128,&dStack_d8,uRam00000001405cd9c0,0);
  if (iVar1 != 0) goto code_r0x0001400f5b95;
  uStack_68 = 3;
  pdVar5 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
  uVar2 = func_0x00014012bb70(pdVar5);
  if ((0x46U >> (*(uint *)((longlong)pdVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar5);
  }
  *(undefined4 *)((longlong)pdVar5 + 0xc) = 0;
  *pdVar5 = (double)((uVar2 ^ 1) & 0xff);
  uStack_68 = 4;
  uStack_cc = 0;
  uStack_d0 = *(undefined4 *)(pdVar5 + 1);
  dStack_d8 = *pdVar5;
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140656f98) {
    func_0x0001403f6320(0x140656f98);
    if (iRam0000000140656f98 == -1) {
      uRam0000000140656f7c = 0;
      uRam0000000140656f70 = 0;
      uRam0000000140656f90 = 0x100000000;
      uRam0000000140656f84 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_1400f61e0);
      func_0x0001403f62c0(0x140656f98);
    }
  }
  uVar4 = uRam00000001405cd9c0;
  lVar7 = 0;
  iVar1 = func_0x00014015be60(0x140656f70,&dStack_d8,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x0001400f5690:
    iVar1 = *(int *)(lVar7 * 0x14 + 0x140656f80);
    if (iVar1 == 1) {
      uStack_68 = 0xe;
      if ((0x46U >> (*(uint *)(lVar3 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(lVar3);
      }
      func_0x0001401441e0(lVar3,0x1405c5f5b);
      uStack_68 = 0xf;
      if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_c8);
      }
      uStack_bc = 0;
      uStack_c8 = 0x404f000000000000;
      func_0x00014015fea0(0x2c,uRam00000001405c7be8,0x80000000,&uStack_c8);
      uStack_68 = 0x10;
      if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b8);
      }
      uStack_ac = 0;
      uStack_b8 = 0;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_b8);
      uStack_68 = 0x11;
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      uStack_9c = 0;
      uStack_a8 = 0;
      func_0x00014015fea0(0x14,uRam00000001405c7b98,0x80000000,&uStack_a8);
      uStack_68 = 0x12;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0x3ff0000000000000;
      func_0x00014015fea0(0x40,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_68 = 0x13;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0x3ff0000000000000;
      func_0x00014015fea0(0x3e,uRam00000001405c7b98,0x80000000,&uStack_88);
      uStack_68 = 0x14;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18787);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x3ff0000000000000;
    }
    else if (iVar1 == 0) {
      uStack_68 = 6;
      (**(code **)(*param_1 + 0x10))(param_1,0x18793);
      if ((0x46U >> (*(uint *)(lVar3 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(lVar3);
      }
      func_0x0001401441e0(lVar3,0x1405c5f53);
      uStack_68 = 7;
      if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_c8);
      }
      uStack_bc = 0;
      uStack_c8 = 0x4054800000000000;
      func_0x00014015fea0(0x2c,uRam00000001405c7be8,0x80000000,&uStack_c8);
      uStack_68 = 8;
      if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b8);
      }
      uStack_ac = 0;
      uStack_b8 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_b8);
      uStack_68 = 9;
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      uStack_9c = 0;
      uStack_a8 = 0x3ff0000000000000;
      func_0x00014015fea0(0x14,uRam00000001405c7b98,0x80000000,&uStack_a8);
      uStack_68 = 10;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x40,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_68 = 0xb;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0;
      func_0x00014015fea0(0x3e,uRam00000001405c7b98,0x80000000,&uStack_88);
      uStack_68 = 0xc;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18787);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0;
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140656f84,&dStack_d8,uVar4,0);
    if (iVar1 == 0) {
      lVar7 = 1;
      goto code_r0x0001400f5690;
    }
  }
  uStack_68 = 0x17;
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c5f68);
  puStack_188 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x140656f60);
  puStack_180 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140656f60);
  puStack_178 = &uStack_f8;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_e8,3,&puStack_188);
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_d8);
  }
code_r0x0001400f5b95:
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
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
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
  puRam0000000140657668 = (undefined8 *)uStack_78;
  return;
}
END DECOMPILED REFERENCE */
