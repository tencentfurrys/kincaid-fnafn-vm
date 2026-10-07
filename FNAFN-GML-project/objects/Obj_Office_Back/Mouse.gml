/// @description FNAFN Obj_Office_Back / Mouse_4 — PORTED from C
// Ground truth: gml_Object_Obj_Office_Back_Mouse_4 (3100 B @0x14005dab0)
// Globals fetched: Night_door_back (0x18740), Night_power_amount (0x18748).
// Decoded guards, in order (uStack_88 = GML line markers):
//   1. image_alpha (slot 0x1405c7b98 via 0x14015f1a0) == 1 else exit
//      [compare(...,1.0,flag 0), r != 0 -> exit].
//   layer_get_visible(<layer>) == 1 else exit [slot 0x1405c86b0, 1 arg].
//   mouse_x in (1820,1880) else exit [slot 0x1405c7bc8 via 0x14015ef90;
//     compare >1820 (r<1 -> exit) and <1880 (r==-2 or r>-1 -> exit)].
//   mouse_y in (495,547) else exit [slot 0x1405c7bd8; same compare shape].
//   builtin 0x14018f790(0x11=17) truthy -> exit (TODO calibrate: kind of
//     input check — 0x11 is VK_CONTROL; likely keyboard_check or
//     mouse_check_button family; verify in-game).
//   toggle (id 0x18793, +0x10 self) = !toggle [bool via 0x14012bb70 ^ 1].
//   switch on toggle via runtime consts @0x140655730/@0x140655744 and table
//     @0x140655740 (0x14065xxxx, TODO calibrate; values are 0/1 by shape):
//     case 1 (door closing): if (Night_power_amount >= power_threshold
//     [id 0x1875b]) { door_speed (0x18710) = 0.66 (0x3fe51eb851eb851f);
//     sound; sprite_index (slot 0x1405c7be8) = 101 =
//     Spr_Office_Back_Close; Night_door_back = 1; Night_power_amount += 1
//     (0x14000bf90); sound; } else { deny sound; toggle = 0; }
//     case 0 (door opening): door_speed = -0.66; sound; sprite_index =
//     Spr_Office_Back_Close (101); Night_door_back = 0;
//     Night_power_amount -= 1 (0x14000bdb0); sound.
// Sounds are exe consts @0x1405c3e40/0x1405c3e50/0x1405c3e60/0x1405c3e70/
//   0x1405c3e80 with vol/pitch runtime const @0x140655720 (TODO calibrate).

// ---- sub-event Mouse_4 — PORTED from C ----
if (image_alpha != 1) exit;
if (layer_get_visible(/* TODO(calibrate): layer name const @0x1405c3e30 */ "TODO_layer") != 1) exit;
if (mouse_x <= 1820) exit;
if (mouse_x >= 1880) exit;
if (mouse_y <= 495) exit;
if (mouse_y >= 547) exit;
if (/* TODO(calibrate): func_0x00014018f790(0x11) */ false) exit;
toggle = !toggle;
if (toggle == 1 /* TODO(calibrate): const @0x140655730 */) {
    if (Night_power_amount >= power_threshold) {
        door_speed = 0.66;
        customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c3e60 */ 0, 0, false);
        sprite_index = Spr_Office_Back_Close; // 101.0
        Night_door_back = 1;
        Night_power_amount += 1;
        customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c3e70 */ 0, 0, false);
    } else {
        customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c3e80 */ 0, 0, false);
        toggle = 0;
    }
} else if (toggle == 0 /* TODO(calibrate): const @0x140655744 */) {
    door_speed = -0.66;
    customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c3e40 */ 0, 0, false);
    sprite_index = Spr_Office_Back_Close; // 101.0
    Night_door_back = 0;
    Night_power_amount -= 1;
    customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c3e50 */ 0, 0, false);
}
// ground truth: gml_Object_Obj_Office_Back_Mouse_4 (3100 B @0x14005dab0)
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Office_Back_Mouse_4(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  uint uVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  double *pdVar7;
  undefined8 *puVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  ulonglong in_stack_fffffffffffffe98;
  undefined4 uVar10;
  ulonglong in_stack_fffffffffffffea0;
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
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 *puStack_b8;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  double dStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043ae1e;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  plRam0000000140657680 = param_1;
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18740);
  uVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18748);
  uStack_68._4_4_ = 0xffffff;
  uStack_70 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_88 = 1;
  in_stack_fffffffffffffe98 = in_stack_fffffffffffffe98 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_128,in_stack_fffffffffffffe98,
                      in_stack_fffffffffffffea0 & 0xffffffffffffff00);
  uVar10 = (undefined4)(in_stack_fffffffffffffe98 >> 0x20);
  uStack_74 = 0;
  dStack_80 = 1.0;
  iVar2 = func_0x00014015be60(&uStack_128,&dStack_80,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014005dd03;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68._0_4_ = 0;
  uStack_68._4_4_ = 5;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c3e30);
  puStack_c8 = &uStack_f8;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,CONCAT44(uVar10,uRam00000001405c86b0),
                              &puStack_c8);
  uStack_74 = 0;
  dStack_80 = 1.0;
  iVar2 = func_0x00014015be60(uVar6,&dStack_80,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014005dd03;
  uStack_88 = 3;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_118);
  uStack_74 = 0;
  dStack_80 = 1820.0;
  iVar2 = func_0x00014015be60(&uStack_118,&dStack_80,uRam00000001405cd9c0,1);
  if (iVar2 < 1) goto code_r0x00014005dd03;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_118);
  uStack_74 = 0;
  dStack_80 = 1880.0;
  iVar2 = func_0x00014015be60(&uStack_118,&dStack_80,uRam00000001405cd9c0,1);
  if ((iVar2 == -2) || (-1 < iVar2)) goto code_r0x00014005dd03;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_108);
  uStack_74 = 0;
  dStack_80 = 495.0;
  iVar2 = func_0x00014015be60(&uStack_108,&dStack_80,uRam00000001405cd9c0,1);
  if (iVar2 < 1) goto code_r0x00014005dd03;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_108);
  uStack_74 = 0;
  dStack_80 = 547.0;
  iVar2 = func_0x00014015be60(&uStack_108,&dStack_80,uRam00000001405cd9c0,1);
  if ((iVar2 == -2) || (-1 < iVar2)) goto code_r0x00014005dd03;
  uStack_88 = 5;
  cVar1 = func_0x00014018f790(0x11);
  if (cVar1 != '\0') goto code_r0x00014005dd03;
  uStack_88 = 7;
  pdVar7 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
  uVar3 = func_0x00014012bb70(pdVar7);
  if ((0x46U >> (*(uint *)((longlong)pdVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar7);
  }
  *(undefined4 *)((longlong)pdVar7 + 0xc) = 0;
  *pdVar7 = (double)((uVar3 ^ 1) & 0xff);
  uStack_88 = 8;
  uStack_74 = 0;
  uStack_78 = *(undefined4 *)(pdVar7 + 1);
  dStack_80 = *pdVar7;
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655758) &&
     (func_0x0001403f6320(0x140655758), iRam0000000140655758 == -1)) {
    uRam000000014065573c = 0;
    uRam0000000140655730 = 0;
    uRam0000000140655750 = 0x100000000;
    uRam0000000140655744 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_14005eac0);
    func_0x0001403f62c0(0x140655758);
  }
  uVar6 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar2 = func_0x00014015be60(0x140655730,&dStack_80,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x00014005e06c:
    iVar2 = *(int *)(lVar9 * 0x14 + 0x140655740);
    if (iVar2 == 1) {
      uStack_88 = 0x11;
      uVar6 = (**(code **)(*param_1 + 8))(param_1,0x1875b);
      iVar2 = func_0x00014015be60(uVar5,uVar6,uRam00000001405cd9c0,1);
      if ((iVar2 == -2) || (-1 < iVar2)) {
        uStack_88 = 0x1c;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68._0_4_ = 0;
        uStack_68._4_4_ = 5;
        func_0x00014000bee0(&uStack_f8,0x1405c3e80);
        puStack_c8 = &uStack_f8;
        func_0x00014000bee0(&uStack_e8,0x140655720);
        puStack_c0 = &uStack_e8;
        func_0x00014000bee0(&uStack_d8,0x140655720);
        puStack_b8 = &uStack_d8;
        gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_c8);
        uStack_88 = 0x1d;
        puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0;
      }
      else {
        uStack_88 = 0x13;
        puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18710);
        if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar8);
        }
        *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
        *puVar8 = 0x3fe51eb851eb851f;
        uStack_88 = 0x14;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68 = 0x500000000;
        func_0x00014000bee0(&uStack_f8,0x1405c3e60);
        puStack_c8 = &uStack_f8;
        func_0x00014000bee0(&uStack_e8,0x140655720);
        puStack_c0 = &uStack_e8;
        func_0x00014000bee0(&uStack_d8,0x140655720);
        puStack_b8 = &uStack_d8;
        gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_c8);
        uStack_88 = 0x15;
        if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_a8);
        }
        uStack_9c = 0;
        uStack_a8 = 0x4059400000000000;
        func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_a8);
        uStack_88 = 0x16;
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x3ff0000000000000;
        uStack_88 = 0x17;
        func_0x00014000bf90(uVar5,1);
        uStack_88 = 0x18;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68._0_4_ = 0;
        uStack_68._4_4_ = 5;
        func_0x00014000bee0(&uStack_f8,0x1405c3e70);
        puStack_c8 = &uStack_f8;
        func_0x00014000bee0(&uStack_e8,0x140655720);
        puStack_c0 = &uStack_e8;
        func_0x00014000bee0(&uStack_d8,0x140655720);
        puStack_b8 = &uStack_d8;
        gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_c8);
      }
      uStack_88 = 0x1f;
    }
    else if (iVar2 == 0) {
      uStack_88 = 10;
      (**(code **)(*param_1 + 0x10))(param_1,0x18793);
      puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18710);
      if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar8);
      }
      *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
      *puVar8 = 0xbfe51eb851eb851f;
      uStack_88 = 0xb;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_f8,0x1405c3e40);
      puStack_c8 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655720);
      puStack_c0 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x140655720);
      puStack_b8 = &uStack_d8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_c8);
      uStack_88 = 0xc;
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      uStack_9c = 0;
      uStack_a8 = 0x4059400000000000;
      func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_a8);
      uStack_88 = 0xd;
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0;
      uStack_88 = 0xe;
      uStack_12c = 0;
      uStack_138 = 0x3ff0000000000000;
      func_0x00014000bdb0(uVar5,&uStack_138);
      if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_138);
      }
      uStack_88 = 0xf;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      func_0x00014000bee0(&uStack_f8,0x1405c3e50);
      puStack_c8 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655720);
      puStack_c0 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x140655720);
      puStack_b8 = &uStack_d8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,&puStack_c8);
      uStack_88 = 0x10;
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x140655744,&dStack_80,uVar6,0);
    if (iVar2 == 0) {
      lVar9 = 1;
      goto code_r0x00014005e06c;
    }
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_80);
  }
code_r0x00014005dd03:
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
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
