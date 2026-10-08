/// @description FNAFN Obj_Night_Camera_Tablet / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Tablet_Step_0 (3201 B @0x1400568e0)
// Globals fetched: Night_camera (0x1873b), composite_distortion (0x186f8),
//   composite_artifact (0x186f6), static_magnetude (0x18774).
// Decoded, in order (uStack_78 = GML line markers):
//   1. customfunct_image_speed_delta(Tablet_Sprite_Speed) [self id 0x1877e].
//   2. x (slot 0x1405c7b78) = Obj_Office_Camera_Control.cx [object 1, var
//      0x18709 via 0x140160480/0x140160140]; 3. y (slot 0x1405c7b88) =
//      Obj_Office_Camera_Control.cy [object 1, var 0x1870a].
//   5. if (Tablet_Sprite_Speed == 0.99) [0x3fefae147ae147ae, ==0]:
//      if (image_index [slot 0x1405c7aa8 via 0x14015f1a0] > 9.0
//      [0x4022000000000000, 0<r]):
//        7. Obj_Night_UI_Camera_Button (object 11=0xb).button_index = 1
//           [0x140160b90(0xb,0x186eb)].
//        8. instance_deactivate_object(<const>) [slot 0x1405c8bf0, 1 arg].
//        9. Night_camera = 1.
//        10-12. layer_set_visible(<layer>,<flag>) x3 [slot 0x1405c89d0].
//        13. camera_set_view_pos(view_camera [slot 0x1405c7bf8],<const>,
//           <runtime>) [slot 0x1405c8ce0].
//        14. composite_distortion = 15.0; 15. composite_artifact = 10.0;
//           16. static_magnetude = 1.25.
//        17. Scr_Camera_Update(<const>); 18. if (!audio_is_playing(<snd>)
//           [slot 0x1405c8db0]) customfunct_audio_play_sound_single(...).
//        22-23. Obj_Night_Camera_Screen (object 39=0x27).image_yscale = 0
//           [slot 0x1405c7c08 via 0x14015fea0]; .image_xscale = 0.65
//           [slot 0x1405c7c18, 0x3fe4cccccccccccd].
//        24. instance_destroy() [0x14017c070, PROVEN].
//   26. if (Tablet_Sprite_Speed == -0.99) [0xbfefae147ae147ae]:
//      if (image_index < 1.0) [r<0, -2 = incomparable] instance_destroy().
// TODO(calibrate): all 0x1405c3dxx layer/sound consts (below exe image) and
//   runtime consts @0x140655580 (layer flags / camera pos / audio
//   priority+loop). Object indices 1/11/39 via obj_names.json are firm.
customfunct_image_speed_delta(Tablet_Sprite_Speed);
x = Obj_Office_Camera_Control.cx;
y = Obj_Office_Camera_Control.cy;
if (Tablet_Sprite_Speed == 0.99) {
    if (image_index > 9) {
        Obj_Night_UI_Camera_Button.button_index = 1;
        instance_deactivate_object(/* TODO(calibrate): const @0x1405c3db0 */ 0);
        Night_camera = 1;
        layer_set_visible(/* TODO(calibrate): layer @0x1405c3d88 */ "TODO_layer", /* TODO(calibrate): flag @0x1405c3dc0 */ 1);
        layer_set_visible(/* TODO(calibrate): layer @0x1405c3d93 */ "TODO_layer", /* TODO(calibrate): flag @0x140655580 */ 1);
        layer_set_visible(/* TODO(calibrate): layer @0x1405c3da0 */ "TODO_layer", /* TODO(calibrate): flag @0x140655580 */ 1);
        camera_set_view_pos(view_camera, /* TODO(calibrate): const @0x1405c3dd0 */ 0, /* TODO(calibrate): const @0x140655580 */ 0);
        composite_distortion = 15;
        composite_artifact = 10;
        static_magnetude = 1.25;
        Scr_Camera_Update(/* TODO(calibrate): const @0x1405c3de0 */ 0);
        if (!audio_is_playing(/* TODO(calibrate): snd @0x1405c3df0 */ 0)) {
            customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c3df0 */ 0, /* TODO(calibrate): const @0x1405c3dc0 */ 0, false);
        }
        Obj_Night_Camera_Screen.image_yscale = 0;
        Obj_Night_Camera_Screen.image_xscale = 0.65;
        instance_destroy();
    }
}
if (Tablet_Sprite_Speed == -0.99) {
    if (image_index < 1) {
        instance_destroy();
    }
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Tablet_Step_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined8 **ppuVar9;
  ulonglong uVar10;
  undefined8 **ppuVar11;
  ulonglong in_stack_fffffffffffffe50;
  undefined auStack_1a8 [16];
  undefined auStack_198 [16];
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
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
  undefined8 uStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  undefined8 *puStack_a0;
  undefined8 uStack_98;
  ulonglong uStack_90;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043aacc;
  uStack_78 = 0;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  plRam0000000140657680 = param_1;
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f8);
  puStack_148 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f6);
  puStack_140 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_c0 = CONCAT44(0xffffff,(undefined4)uStack_c0);
  uStack_c8 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_78 = 1;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1877e);
  func_0x000140001490(&uStack_128,uVar5);
  ppuVar9 = &puStack_b8;
  puStack_b8 = &uStack_128;
  gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_70,1,ppuVar9);
  uStack_78 = 2;
  auStack_1a8 = ZEXT816(0);
  in_stack_fffffffffffffe50 = in_stack_fffffffffffffe50 & 0xffffffffffffff00;
  uVar10 = (ulonglong)ppuVar9 & 0xffffffffffffff00;
  func_0x000140160480(1,0x18709,0x80000000,auStack_1a8,uVar10,in_stack_fffffffffffffe50);
  func_0x000140001490(&uStack_178,auStack_1a8);
  func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_178);
  uStack_78 = 3;
  auStack_198 = ZEXT816(0);
  ppuVar9 = (undefined8 **)(in_stack_fffffffffffffe50 & 0xffffffffffffff00);
  ppuVar11 = (undefined8 **)(uVar10 & 0xffffffffffffff00);
  func_0x000140160480(1,0x1870a,0x80000000,auStack_198,ppuVar11,ppuVar9);
  func_0x000140001490(&uStack_168,auStack_198);
  func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_168);
  uStack_78 = 5;
  uStack_90 = (ulonglong)(uint)uStack_90;
  uStack_98 = 0x3fefae147ae147ae;
  uVar7 = (undefined4)uRam00000001405cd9c0;
  uVar8 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
  iVar2 = func_0x00014015be60(uVar5,&uStack_98,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1877e);
    ppuVar9 = (undefined8 **)((ulonglong)ppuVar9 & 0xffffffffffffff00);
    ppuVar11 = (undefined8 **)((ulonglong)ppuVar11 & 0xffffffffffffff00);
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_138,ppuVar11,ppuVar9);
    uStack_90 = uStack_90 & 0xffffffff;
    uStack_98 = 0x4022000000000000;
    uVar7 = (undefined4)uRam00000001405cd9c0;
    uVar8 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    iVar2 = func_0x00014015be60(&uStack_138,&uStack_98,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      uStack_78 = 7;
      uStack_90 = 0;
      uStack_98 = 0x3ff0000000000000;
      func_0x000140160b90(0xb,0x186eb,0x80000000,&uStack_98);
      uVar7 = (undefined4)((ulonglong)ppuVar11 >> 0x20);
      uStack_78 = 8;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_128,0x1405c3db0);
      uVar6 = CONCAT44(uVar7,uRam00000001405c8bf0);
      puStack_b8 = &uStack_128;
      func_0x0001401445d0(param_1,param_2,&uStack_70,1,uVar6,&puStack_b8);
      uVar7 = (undefined4)((ulonglong)uVar6 >> 0x20);
      uStack_78 = 9;
      if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar3);
      }
      *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
      *puVar3 = 0x3ff0000000000000;
      uStack_78 = 10;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_128);
      }
      func_0x0001401441e0(&uStack_128,0x1405c3d88);
      puStack_b8 = &uStack_128;
      func_0x00014000bee0(&uStack_118,0x1405c3dc0);
      uVar6 = CONCAT44(uVar7,uRam00000001405c89d0);
      puStack_b0 = &uStack_118;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uVar6,&puStack_b8);
      uVar7 = (undefined4)((ulonglong)uVar6 >> 0x20);
      uStack_78 = 0xb;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_128);
      }
      func_0x0001401441e0(&uStack_128,0x1405c3d93);
      puStack_b8 = &uStack_128;
      func_0x00014000bee0(&uStack_118,0x140655580);
      uVar6 = CONCAT44(uVar7,uRam00000001405c89d0);
      puStack_b0 = &uStack_118;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uVar6,&puStack_b8);
      uVar7 = (undefined4)((ulonglong)uVar6 >> 0x20);
      uStack_78 = 0xc;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_128);
      }
      func_0x0001401441e0(&uStack_128,0x1405c3da0);
      puStack_b8 = &uStack_128;
      func_0x00014000bee0(&uStack_118,0x140655580);
      uVar6 = CONCAT44(uVar7,uRam00000001405c89d0);
      puStack_b0 = &uStack_118;
      func_0x0001401445d0(param_1,param_2,&uStack_70,2,uVar6,&puStack_b8);
      uVar7 = (undefined4)((ulonglong)uVar6 >> 0x20);
      uStack_78 = 0xd;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_158);
      func_0x000140001490(&uStack_128,&uStack_158);
      puStack_b8 = &uStack_128;
      func_0x00014000bee0(&uStack_118,0x1405c3dd0);
      puStack_b0 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x140655580);
      puStack_a8 = &uStack_108;
      func_0x0001401445d0(param_1,param_2,&uStack_70,3,CONCAT44(uVar7,uRam00000001405c8ce0),
                          &puStack_b8);
      uStack_78 = 0xe;
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x402e000000000000;
      uStack_78 = 0xf;
      if ((0x46U >> (*(uint *)((longlong)puStack_148 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_148);
      }
      *(undefined4 *)((longlong)puStack_148 + 0xc) = 0;
      *puStack_148 = 0x4024000000000000;
      uStack_78 = 0x10;
      if ((0x46U >> (*(uint *)((longlong)puStack_140 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_140);
      }
      *(undefined4 *)((longlong)puStack_140 + 0xc) = 0;
      *puStack_140 = 0x3ff4000000000000;
      uStack_78 = 0x11;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_128,0x1405c3de0);
      ppuVar9 = &puStack_b8;
      puStack_b8 = &uStack_128;
      gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_70,1,ppuVar9);
      uVar7 = (undefined4)((ulonglong)ppuVar9 >> 0x20);
      uStack_78 = 0x12;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_128,0x1405c3df0);
      ppuVar9 = &puStack_b8;
      ppuVar11 = (undefined8 **)CONCAT44(uVar7,uRam00000001405c8db0);
      puStack_b8 = &uStack_128;
      uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,ppuVar11,ppuVar9);
      cVar1 = func_0x00014012bb70(uVar6);
      if (cVar1 == '\0') {
        uStack_78 = 0x14;
        if ((0x46U >> (uStack_c0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_c8);
        }
        uStack_c8 = 0;
        uStack_c0 = 0x500000000;
        func_0x00014000bee0(&uStack_118,0x1405c3df0);
        puStack_b0 = &uStack_118;
        func_0x00014000bee0(&uStack_108,0x1405c3dc0);
        puStack_a8 = &uStack_108;
        func_0x00014000bee0(&uStack_f8,0x1405c3dc0);
        ppuVar11 = &puStack_b0;
        puStack_a0 = &uStack_f8;
        gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_c8,3,ppuVar11);
      }
      uStack_78 = 0x16;
      if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_e8);
      }
      uStack_dc = 0;
      uStack_e8 = 0;
      func_0x00014015fea0(0x27,uRam00000001405c7c08,0x80000000,&uStack_e8);
      uStack_78 = 0x17;
      if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_d8);
      }
      uStack_cc = 0;
      uStack_d8 = 0x3fe4cccccccccccd;
      func_0x00014015fea0(0x27,uRam00000001405c7c18,0x80000000,&uStack_d8);
      uStack_78 = 0x18;
      func_0x00014017c070(param_1,param_2,0,0);
      uVar7 = (undefined4)uRam00000001405cd9c0;
      uVar8 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    }
  }
  uStack_78 = 0x1a;
  uStack_90 = uStack_90 & 0xffffffff;
  uStack_98 = 0xbfefae147ae147ae;
  iVar2 = func_0x00014015be60(uVar5,&uStack_98,CONCAT44(uVar8,uVar7),0);
  if (iVar2 == 0) {
    (**(code **)(*param_1 + 8))(param_1,0x1877e);
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_138,
                        (ulonglong)ppuVar11 & 0xffffffffffffff00,
                        (ulonglong)ppuVar9 & 0xffffffffffffff00);
    uStack_90 = uStack_90 & 0xffffffff;
    uStack_98 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(&uStack_138,&uStack_98,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_78 = 0x1c;
      func_0x00014017c070(param_1,param_2,0,0);
    }
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_c0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
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
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */
