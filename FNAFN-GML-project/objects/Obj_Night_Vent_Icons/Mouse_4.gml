/// @description FNAFN Obj_Night_Vent_Icons / Mouse_4 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Vent_Icons_Mouse_4 (2717 B @0x140095a20)
// Guards: self image_alpha == 0 AND
// layer_get_visible(<const @0x1405c4a18>) == 1 (TODO(calibrate): layer name).
// Five-case switch on self image_index (case consts PROVEN by the guarded
// pool init: 0, 1.0, 2.0, 3.0, 4.0 at @0x140655d30/44/58/6c/80; label table
// @0x140655d40 static — mapping below assumes sequential 0->1, 1->2, ...;
// TODO(calibrate): verify polarity in-game):
//   image_index 0 -> Night_camera_vent_location = 1
//   image_index 1 -> Night_camera_vent_location = 2
//   image_index 2 -> Night_camera_vent_location = 3
//   image_index 3 -> Night_camera_vent_location = 4
//   image_index 4 -> Night_camera_vent_location = 5
// Then:
//   Scr_Camera_Update(<const @0x1405c4a28>);  // 1-arg script call
//   Obj_Night_Camera_Screen.image_yscale = 0;   // object 0x27 = 39
//   Obj_Night_Camera_Screen.image_xscale = 0.65; // 0x3fe4cccccccccccd
//   Obj_Night_Camera_Icons_Select.x = x;        // object 0x14 = 20
//   Obj_Night_Camera_Icons_Select.y = y;
//   customfunct_audio_play_sound_single(<const @0x1405c4a38>,
//       <runtime @0x140655d20>, <runtime @0x140655d20>);
//   customfunct_audio_play_sound_single(<const @0x1405c4a48>,
//       <runtime @0x140655d20>, <runtime @0x140655d20>);
//   (TODO(calibrate): all sound consts.)
if (image_alpha == 0 && layer_get_visible("TODO_calibrate_0x1405c4a18") == 1) {
    switch (image_index) {
        case 0: Night_camera_vent_location = 1; break;  // TODO(calibrate) polarity
        case 1: Night_camera_vent_location = 2; break;
        case 2: Night_camera_vent_location = 3; break;
        case 3: Night_camera_vent_location = 4; break;
        case 4: Night_camera_vent_location = 5; break;
    }
    Scr_Camera_Update("TODO_calibrate_0x1405c4a28");
    Obj_Night_Camera_Screen.image_yscale = 0;
    Obj_Night_Camera_Screen.image_xscale = 0.65;
    Obj_Night_Camera_Icons_Select.x = x;
    Obj_Night_Camera_Icons_Select.y = y;
    customfunct_audio_play_sound_single("TODO_calibrate_0x1405c4a38",
        TODO_calibrate_runtime_0x140655d20, TODO_calibrate_runtime_0x140655d20);
    customfunct_audio_play_sound_single("TODO_calibrate_0x1405c4a48",
        TODO_calibrate_runtime_0x140655d20, TODO_calibrate_runtime_0x140655d20);
}

// ---- sub-event Mouse_4 — PORTED ----
// ground truth: gml_Object_Obj_Night_Vent_Icons_Mouse_4 (2717 B @0x140095a20)
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Vent_Icons_Mouse_4(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  longlong lVar4;
  longlong unaff_GS_OFFSET;
  ulonglong in_stack_fffffffffffffe48;
  undefined4 uVar7;
  undefined8 **ppuVar5;
  ulonglong uVar6;
  ulonglong in_stack_fffffffffffffe50;
  ulonglong uVar8;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
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
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043b96a;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uRam0000000140657680 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873e);
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_68._4_4_ = 0xffffff;
  uStack_70 = 0;
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
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_148,in_stack_fffffffffffffe48,
                      in_stack_fffffffffffffe50 & 0xffffffffffffff00);
  uVar7 = (undefined4)(in_stack_fffffffffffffe48 >> 0x20);
  uStack_74 = 0;
  uStack_80 = 0;
  iVar1 = func_0x00014015be60(&uStack_148,&uStack_80,uRam00000001405cd9c0,0);
  if (iVar1 == 0) goto code_r0x000140096272;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68._0_4_ = 0;
  uStack_68._4_4_ = 5;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c4a18);
  ppuVar5 = &puStack_168;
  uVar6 = CONCAT44(uVar7,uRam00000001405c86b0);
  puStack_168 = &uStack_f8;
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uVar6,ppuVar5);
  uStack_74 = 0;
  uStack_80 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar3,&uStack_80,uRam00000001405cd9c0,0);
  if (iVar1 != 0) goto code_r0x000140096272;
  uStack_88 = 4;
  uVar8 = (ulonglong)ppuVar5 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_c8,uVar6 & 0xffffffffffffff00,
                      uVar8);
  uStack_74 = uStack_bc;
  uStack_78 = uStack_c0;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) == 0) {
    uStack_80 = uStack_c8;
  }
  else {
    func_0x000140096ad0(&uStack_80,&uStack_c8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655d94) &&
     (func_0x0001403f6320(0x140655d94), iRam0000000140655d94 == -1)) {
    uRam0000000140655d3c = 0;
    uRam0000000140655d30 = 0;
    uRam0000000140655d50 = 0x100000000;
    uRam0000000140655d44 = 0x3ff0000000000000;
    uRam0000000140655d64 = 0x200000000;
    uRam0000000140655d58 = 0x4000000000000000;
    uRam0000000140655d78 = 0x300000000;
    uRam0000000140655d6c = 0x4008000000000000;
    uRam0000000140655d8c = 0x400000000;
    uRam0000000140655d80 = 0x4010000000000000;
    func_0x0001403f6668(&DAT_1400969f0);
    func_0x0001403f62c0(0x140655d94);
  }
  uVar3 = uRam00000001405cd9c0;
  lVar4 = 0;
  iVar1 = func_0x00014015be60(0x140655d30,&uStack_80,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140655d44,&uStack_80,uVar3,0);
    if (iVar1 == 0) {
      lVar4 = 1;
      goto code_r0x000140095e3f;
    }
    iVar1 = func_0x00014015be60(0x140655d58,&uStack_80,uVar3,0);
    if (iVar1 == 0) {
      lVar4 = 2;
      goto code_r0x000140095e3f;
    }
    iVar1 = func_0x00014015be60(0x140655d6c,&uStack_80,uVar3,0);
    if (iVar1 == 0) {
      lVar4 = 3;
      goto code_r0x000140095e3f;
    }
    iVar1 = func_0x00014015be60(0x140655d80,&uStack_80,uVar3,0);
    if (iVar1 == 0) {
      lVar4 = 4;
      goto code_r0x000140095e3f;
    }
    goto code_r0x000140095f5f;
  }
code_r0x000140095e3f:
  switch(*(undefined4 *)(lVar4 * 0x14 + 0x140655d40)) {
  case 0:
    uStack_88 = 6;
    if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar2);
    }
    *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
    *puVar2 = 0x3ff0000000000000;
    goto code_r0x000140095f5f;
  case 1:
    uStack_88 = 7;
    if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar2);
    }
    *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
    uVar3 = 0x4000000000000000;
    break;
  case 2:
    uStack_88 = 8;
    if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar2);
    }
    *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
    uVar3 = 0x4008000000000000;
    break;
  case 3:
    uStack_88 = 9;
    if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar2);
    }
    *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
    uVar3 = 0x4010000000000000;
    break;
  case 4:
    uStack_88 = 10;
    if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar2);
    }
    *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
    uVar3 = 0x4014000000000000;
    break;
  default:
    goto code_r0x000140095f5f;
  }
  *puVar2 = uVar3;
code_r0x000140095f5f:
  uStack_88 = 0xc;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_f8,0x1405c4a28);
  ppuVar5 = &puStack_168;
  puStack_168 = &uStack_f8;
  gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_70,1,&puStack_168);
  uStack_88 = 0xd;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  uStack_ac = 0;
  uStack_b8 = 0;
  func_0x00014015fea0(0x27,uRam00000001405c7c08,0x80000000,&uStack_b8);
  uStack_88 = 0xe;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_9c = 0;
  uStack_a8 = 0x3fe4cccccccccccd;
  func_0x00014015fea0(0x27,uRam00000001405c7c18,0x80000000,&uStack_a8);
  uStack_88 = 0xf;
  uVar8 = uVar8 & 0xffffffffffffff00;
  uVar6 = (ulonglong)ppuVar5 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_138,uVar6,uVar8);
  func_0x000140001490(&uStack_128,&uStack_138);
  func_0x00014015fea0(0x14,uRam00000001405c7b78,0x80000000,&uStack_128);
  uStack_88 = 0x10;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_118,uVar6 & 0xffffffffffffff00
                      ,uVar8 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_108,&uStack_118);
  func_0x00014015fea0(0x14,uRam00000001405c7b88,0x80000000,&uStack_108);
  uStack_88 = 0x11;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_f8,0x1405c4a38);
  puStack_168 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x140655d20);
  puStack_160 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140655d20);
  puStack_158 = &uStack_d8;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_168);
  uStack_88 = 0x12;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68._0_4_ = 0;
  uStack_68._4_4_ = 5;
  func_0x00014000bee0(&uStack_f8,0x1405c4a48);
  puStack_168 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x140655d20);
  puStack_160 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140655d20);
  puStack_158 = &uStack_d8;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_168);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
code_r0x000140096272:
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
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
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
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
