/// @description FNAFN Obj_Office_Light_Back / Step — PORTED from C
// Ground truth: gml_Object_Obj_Office_Light_Back_Step_0 (2756 B @0x1401105c0)
// Guards (all must hold or the whole step is skipped):
//   Night_office_rotated == 1, Night_camera == 0,
//   layer_get_visible(<const @0x1405c64f0>) == 1
//   (TODO(calibrate): layer name const).
// Flash block:
//   if (input_check(0x11)) {  // TODO(calibrate): func_0x00014018f790(0x11),
//       // single-arg input helper; compare Office_Front_Right/Office_Front_Left
//       // Step which use the same call for their light input
//       if (Obj_Office_Back.sprite_index == 96) {
//           image_alpha = <random helper>(TODO_calibrate_args);  // func_0x000140168cf0
//           if (flash_sound != 1) {
//               customfunct_audio_play_sound_single("TODO_calibrate_0x1405c6508",
//                   TODO_calibrate_runtime_0x1406573a0, TODO_calibrate_runtime_0x1406573a0);
//               flash_sound = 1;
//           }
//       } else {
//           // fall through to the quiet path below
//       }
//   } else {
//   quiet path (also taken when sprite != 96):
//       if (flash_sound != 0) {
//           customfunct_audio_play_sound_single("TODO_calibrate_0x1405c6518",
//               TODO_calibrate_runtime_0x1406573a0, TODO_calibrate_runtime_0x1406573a0);
//           flash_sound = 0;
//       }
//       image_alpha = 0;
//   }
// Back-room frame select (2x2 on Night_bonnie_location / Night_chica_location
// vs string const @0x1405c64fc, TODO(calibrate) location name):
//   bonnie==C && chica!=C -> image_index = 1
//   bonnie==C && chica==C  -> image_index = 2
//   bonnie!=C && chica==C  -> image_index = 3
//   bonnie!=C && chica!=C  -> image_index = 0
if (Night_office_rotated == 1 && Night_camera == 0
        && layer_get_visible("TODO_calibrate_0x1405c64f0") == 1) {
    if (TODO_calibrate_input_0x11 /* func_0x00014018f790(0x11) */) {
        if (Obj_Office_Back.sprite_index == 96) {
            image_alpha = TODO_calibrate_random;  // func_0x000140168cf0(...)
            if (flash_sound != 1) {
                customfunct_audio_play_sound_single("TODO_calibrate_0x1405c6508",
                    TODO_calibrate_runtime_0x1406573a0, TODO_calibrate_runtime_0x1406573a0);
                flash_sound = 1;
            }
        } else {
            if (flash_sound != 0) {
                customfunct_audio_play_sound_single("TODO_calibrate_0x1405c6518",
                    TODO_calibrate_runtime_0x1406573a0, TODO_calibrate_runtime_0x1406573a0);
                flash_sound = 0;
            }
            image_alpha = 0;
        }
    } else {
        if (flash_sound != 0) {
            customfunct_audio_play_sound_single("TODO_calibrate_0x1405c6518",
                TODO_calibrate_runtime_0x1406573a0, TODO_calibrate_runtime_0x1406573a0);
            flash_sound = 0;
        }
        image_alpha = 0;
    }
    var _bl = "TODO_calibrate_0x1405c64fc";
    if (Night_bonnie_location == _bl && Night_chica_location != _bl) {
        image_index = 1;
    }
    if (Night_bonnie_location == _bl && Night_chica_location == _bl) {
        image_index = 2;
    }
    if (Night_bonnie_location != _bl && Night_chica_location == _bl) {
        image_index = 3;
    }
    if (Night_bonnie_location != _bl && Night_chica_location != _bl) {
        image_index = 0;
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Light_Back_Step_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  undefined8 in_stack_fffffffffffffe98;
  undefined4 uVar9;
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
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uVar9 = (undefined4)((ulonglong)in_stack_fffffffffffffe98 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043d7c3;
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
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873a);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873f);
  uVar7 = uRam00000001405cd9c0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_88 = CONCAT44(0xffffff,(undefined4)uStack_88);
  uStack_90 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_a8 = 1;
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar3,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014011083e;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,uVar7,0);
  if (iVar2 != 0) goto code_r0x00014011083e;
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  func_0x0001401441e0(&uStack_e8,0x1405c64f0);
  puStack_118 = &uStack_e8;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_90,1,CONCAT44(uVar9,uRam00000001405c86b0),
                              &puStack_118);
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar7,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014011083e;
  uStack_a8 = 3;
  cVar1 = func_0x00014018f790(0x11);
  if (cVar1 == '\0') {
code_r0x0001401109b3:
    uStack_a8 = 0xe;
    uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x1871a);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar7,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar2 != 0) {
      uStack_a8 = 0x10;
      if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_90 = 0;
      uStack_88 = 0x500000000;
      func_0x00014000bee0(&uStack_e8,0x1405c6518);
      puStack_118 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1406573a0);
      puStack_110 = &uStack_d8;
      func_0x00014000bee0(&uStack_c8,0x1406573a0);
      puStack_108 = &uStack_c8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_90,3,&puStack_118);
      uStack_a8 = 0x11;
      puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1871a);
      if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar8);
      }
      *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
      *puVar8 = 0;
    }
    uStack_a8 = 0x13;
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_94 = 0;
    uStack_a0 = 0;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_a0);
  }
  else {
    func_0x000140144a40(8,uRam00000001405c7be8,0x80000000,&uStack_f8);
    uStack_64 = 0;
    uStack_70 = 0x4058000000000000;
    iVar2 = func_0x00014015be60(&uStack_f8,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar2 != 0) goto code_r0x0001401109b3;
    uStack_a8 = 5;
    uVar7 = func_0x000140168cf0(_UNK_140439ea0,_UNK_140439dd0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_94 = 0;
    uStack_a0 = uVar7;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_a0);
    uStack_a8 = 6;
    uVar7 = (**(code **)(*param_1 + 8))(param_1,0x1871a);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar7,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar2 != 0) {
      uStack_a8 = 8;
      if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_90 = 0;
      uStack_88 = 0x500000000;
      func_0x00014000bee0(&uStack_e8,0x1405c6508);
      puStack_118 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1406573a0);
      puStack_110 = &uStack_d8;
      func_0x00014000bee0(&uStack_c8,0x1406573a0);
      puStack_108 = &uStack_c8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_90,3,&puStack_118);
      uStack_a8 = 9;
      puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1871a);
      if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar8);
      }
      *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
      *puVar8 = 0x3ff0000000000000;
    }
  }
  uStack_a8 = 0x16;
  func_0x0001401453a0(&uStack_70,0x1405c64fc);
  iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar2 == 0) {
    func_0x0001401453a0(&uStack_70,0x1405c64fc);
    iVar2 = func_0x00014015be60(uVar6,&uStack_70,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 != 0) {
      uStack_a8 = 0x18;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80);
    }
  }
  uStack_a8 = 0x1a;
  func_0x0001401453a0(&uStack_70,0x1405c64fc);
  iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar2 == 0) {
    func_0x0001401453a0(&uStack_70,0x1405c64fc);
    iVar2 = func_0x00014015be60(uVar6,&uStack_70,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 == 0) {
      uStack_a8 = 0x1c;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0x4000000000000000;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80);
    }
  }
  uStack_a8 = 0x1e;
  func_0x0001401453a0(&uStack_70,0x1405c64fc);
  iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar2 != 0) {
    func_0x0001401453a0(&uStack_70,0x1405c64fc);
    iVar2 = func_0x00014015be60(uVar6,&uStack_70,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 == 0) {
      uStack_a8 = 0x20;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0x4008000000000000;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80);
    }
  }
  uStack_a8 = 0x22;
  func_0x0001401453a0(&uStack_70,0x1405c64fc);
  iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar2 != 0) {
    func_0x0001401453a0(&uStack_70,0x1405c64fc);
    iVar2 = func_0x00014015be60(uVar6,&uStack_70,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 != 0) {
      uStack_a8 = 0x24;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0;
      func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80);
    }
  }
code_r0x00014011083e:
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
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
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
