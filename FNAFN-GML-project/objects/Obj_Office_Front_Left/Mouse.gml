/// @description FNAFN Obj_Office_Front_Left / Mouse_4 — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Left_Mouse_4 (2884 B @0x1400727e0)

// ---- sub-event Mouse_4 — PORTED from C ----
// ground truth: gml_Object_Obj_Office_Front_Left_Mouse_4 (2884 B @0x1400727e0)
// Ported: Obj_Office_Front_Left / Mouse_4
// Guards (C early-exit chain -> combined &&; compare calibration per PORTING.md):
//   layer_get_visible("Office_front") == 1 (funcid slot 0x1405c86b0 =
//     layer_get_visible, arg "Office_front" @0x1405c42f8 via exe_strings.py).
//   mouse_x > 5 && mouse_x < 220 (5.0/220.0 literals; `r<1`-exit = `>`,
//     `r==-1`-only fallthrough = `<`); mouse_y > 230 && mouse_y < 635.
//   sprite_index != 67 (67 = Spr_Office_Front_Left_Alarm_Empty via
//     sprite_names.json; 67.0 literal; `r==0`-exit = `!=`).
// Then toggle ^= 1 (bool flip via func_0x00014012bb70 + ^1, cf. Music_Switch).
// Two-case toggle switch on runtime pool @0x1406559d0/0x1406559e4 + label
// table @0x1406559e0 (TODO(calibrate): outside exe image; mapping below
// assumes 1 -> open, 0 -> close — verify polarity in-game).
//   toggle == 1: if (Night_power_amount >= power_threshold) { fail blip; toggle = 0 }
//     else { door_speed = 0.6; toggle = 1; sprite_index = 34 (Spr_Office_Front_Left_Door);
//       Night_power_amount += 1; directional click }.
//   toggle == 0: door_speed = -0.48; toggle = 0; sprite_index = 34 (Spr_Office_Front_Left_Door);
//     Night_power_amount -= 1; directional click.
// Sounds (exe .data doubles, verified): fail 36.0 @0x1405c4328,
//   open 15.0 @0x1405c4318, close 11.0 @0x1405c4308.
// Trailing audio args are runtime BSS zeros @0x1406559c0 (TODO(calibrate),
// emitted as 0/false per the BSS-zero convention).
// NOTE: global Night_door_left fetch at top is dead in C (slot overwritten
// by the toggle fetch); not emitted. Bare (self,toggle) fetch in the close
// branch is a discarded no-op; not emitted.
if (layer_get_visible("Office_front") == 1
        && mouse_x > 5 && mouse_x < 220
        && mouse_y > 230 && mouse_y < 635
        && sprite_index != 67) {
    toggle ^= 1;
    if (toggle == 1) { // TODO(calibrate): confirm branch polarity (pool @0x1406559d0/0x1406559e4, table @0x1406559e0)
        if (Night_power_amount >= power_threshold) {
            customfunct_audio_play_sound_single(Snd_Office_Lever_Error, 0 /* TODO(calibrate): runtime const @0x1406559c0 */, false /* TODO(calibrate): runtime const @0x1406559c0 */);
            toggle = 0;
        } else {
            door_speed = 0.6;
            toggle = 1;
            sprite_index = 34; // Spr_Office_Front_Left_Door
            Night_power_amount += 1;
            customfunct_audio_play_sound_directional_single(door_emitter, 15, 0 /* TODO(calibrate): runtime const @0x1406559c0 */, false /* TODO(calibrate): runtime const @0x1406559c0 */);
        }
    } else if (toggle == 0) { // TODO(calibrate): same pool
        door_speed = -0.48;
        toggle = 0;
        sprite_index = 34; // Spr_Office_Front_Left_Door
        Night_power_amount -= 1;
        customfunct_audio_play_sound_directional_single(door_emitter, 11, 0 /* TODO(calibrate): runtime const @0x1406559c0 */, false /* TODO(calibrate): runtime const @0x1406559c0 */);
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void gml_Object_Obj_Office_Front_Left_Mouse_4(longlong *param_1,undefined8 param_2)

{
  byte bVar1;
  int iVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  double *pdVar6;
  undefined8 *puVar7;
  longlong lVar8;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_fffffffffffffe88;
  undefined4 uVar10;
  ulonglong uVar9;
  undefined8 **ppuVar11;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
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
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  double dStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uVar10 = (undefined4)((ulonglong)in_stack_fffffffffffffe88 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043b2ff;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  plRam0000000140657680 = param_1;
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18741);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18748);
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_98 = 1;
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  func_0x0001401441e0(&uStack_108,0x1405c42f8);
  ppuVar11 = &puStack_128;
  uVar9 = CONCAT44(uVar10,uRam00000001405c86b0);
  puStack_128 = &uStack_108;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uVar9,ppuVar11);
  uStack_64 = 0;
  dStack_70 = 1.0;
  iVar2 = func_0x00014015be60(uVar5,&dStack_70,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x0001400729c6;
  uStack_98 = 3;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
  uStack_64 = 0;
  dStack_70 = 5.0;
  iVar2 = func_0x00014015be60(&uStack_c8,&dStack_70,uRam00000001405cd9c0,1);
  if (iVar2 < 1) goto code_r0x0001400729c6;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
  uStack_64 = 0;
  dStack_70 = 220.0;
  iVar2 = func_0x00014015be60(&uStack_c8,&dStack_70,uRam00000001405cd9c0,1);
  if ((iVar2 == -2) || (-1 < iVar2)) goto code_r0x0001400729c6;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_b8);
  uStack_64 = 0;
  dStack_70 = 230.0;
  iVar2 = func_0x00014015be60(&uStack_b8,&dStack_70,uRam00000001405cd9c0,1);
  if (iVar2 < 1) goto code_r0x0001400729c6;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_b8);
  uStack_64 = 0;
  dStack_70 = 635.0;
  iVar2 = func_0x00014015be60(&uStack_b8,&dStack_70,uRam00000001405cd9c0,1);
  if ((iVar2 == -2) || (-1 < iVar2)) goto code_r0x0001400729c6;
  uStack_98 = 5;
  func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_90,uVar9 & 0xffffffffffffff00,
                      (ulonglong)ppuVar11 & 0xffffffffffffff00);
  uStack_64 = 0;
  dStack_70 = 67.0;
  iVar2 = func_0x00014015be60(&uStack_90,&dStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) goto code_r0x0001400729c6;
  uStack_98 = 7;
  pdVar6 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
  bVar1 = func_0x00014012bb70(pdVar6);
  if ((0x46U >> (*(uint *)((longlong)pdVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar6);
  }
  *(undefined4 *)((longlong)pdVar6 + 0xc) = 0;
  *pdVar6 = (double)(uint)(bVar1 ^ 1);
  uStack_98 = 8;
  uStack_64 = 0;
  uStack_68 = *(undefined4 *)(pdVar6 + 1);
  dStack_70 = *pdVar6;
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406559f8) &&
     (func_0x0001403f6320(0x1406559f8), iRam00000001406559f8 == -1)) {
    uRam00000001406559dc = 0;
    uRam00000001406559d0 = 0;
    uRam00000001406559f0 = 0x100000000;
    uRam00000001406559e4 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_140073740);
    func_0x0001403f62c0(0x1406559f8);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar2 = func_0x00014015be60(0x1406559d0,&dStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x000140072da3:
    iVar2 = *(int *)(lVar8 * 0x14 + 0x1406559e0);
    if (iVar2 == 1) {
      uStack_98 = 0x10;
      uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1875b);
      iVar2 = func_0x00014015be60(uVar4,uVar5,uRam00000001405cd9c0,1);
      if ((iVar2 == -2) || (-1 < iVar2)) {
        uStack_98 = 0x1a;
        if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_80);
        }
        uStack_80 = 0;
        uStack_78 = 0x500000000;
        func_0x00014000bee0(&uStack_108,0x1405c4328);
        puStack_128 = &uStack_108;
        func_0x00014000bee0(&uStack_f8,0x1406559c0);
        puStack_120 = &uStack_f8;
        func_0x00014000bee0(&uStack_e8,0x1406559c0);
        puStack_118 = &uStack_e8;
        gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_80,3,&puStack_128);
        uStack_98 = 0x1b;
        puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
        if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar3);
        }
        *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
        *puVar3 = 0;
      }
      else {
        uStack_98 = 0x12;
        puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18710);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0x3fe3333333333333;
        uStack_98 = 0x13;
        if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar3);
        }
        *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
        *puVar3 = 0x3ff0000000000000;
        uStack_98 = 0x14;
        if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_90);
        }
        uStack_84 = 0;
        uStack_90 = 0x4041000000000000;
        func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_90);
        uStack_98 = 0x15;
        func_0x00014000bf90(uVar4,1);
        uStack_98 = 0x16;
        if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_80);
        }
        uStack_80 = 0;
        uStack_78 = 0x500000000;
        uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1870f);
        func_0x000140001490(&uStack_108,uVar4);
        puStack_128 = &uStack_108;
        func_0x00014000bee0(&uStack_f8,0x1405c4318);
        puStack_120 = &uStack_f8;
        func_0x00014000bee0(&uStack_e8,0x1406559c0);
        puStack_118 = &uStack_e8;
        func_0x00014000bee0(&uStack_d8,0x1406559c0);
        puStack_110 = &uStack_d8;
        gml_Script_customfunct_audio_play_sound_directional_single
                  (param_1,param_2,&uStack_80,4,&puStack_128);
      }
      uStack_98 = 0x1d;
    }
    else if (iVar2 == 0) {
      uStack_98 = 10;
      (**(code **)(*param_1 + 0x10))(param_1,0x18793);
      puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18710);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0xbfdeb851eb851eb8;
      uStack_98 = 0xb;
      if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar3);
      }
      *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
      *puVar3 = 0;
      uStack_98 = 0xc;
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = 0x4041000000000000;
      func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_90);
      uStack_98 = 0xd;
      uStack_12c = 0;
      uStack_138 = 0x3ff0000000000000;
      func_0x00014000bdb0(uVar4,&uStack_138);
      if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_138);
      }
      uStack_98 = 0xe;
      if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0x500000000;
      uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1870f);
      func_0x000140001490(&uStack_108,uVar4);
      puStack_128 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c4308);
      puStack_120 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x1406559c0);
      puStack_118 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1406559c0);
      puStack_110 = &uStack_d8;
      gml_Script_customfunct_audio_play_sound_directional_single
                (param_1,param_2,&uStack_80,4,&puStack_128);
      uStack_98 = 0xf;
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x1406559e4,&dStack_70,uVar5,0);
    if (iVar2 == 0) {
      lVar8 = 1;
      goto code_r0x000140072da3;
    }
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_70);
  }
code_r0x0001400729c6:
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
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
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
