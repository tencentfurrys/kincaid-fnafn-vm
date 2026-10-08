/// @description FNAFN Obj_Night_1_5_Freddy_AI / Alarm_1 - PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_1 (2194 B @0x1400d2340)
// Freddy movement tick. Globals: Night_freddy_location (0x18744),
// Last_location (0x1872e). Self: Freddy_emitter (0x1871f),
// Freddy_warning_x (0x18720), Freddy_warning_y (0x18721).
//   Night_freddy_location = choose(6, 8, 9) [helper 0x140168890, argc 3
//     over exe consts 6.0/8.0/9.0 @0x1405c54d8/e8/f8; identity = choose by
//     usage (free argc 2/2/3/5 across 5 sites, all random-pick contexts:
//     menu glitch choose(1,2), Bonnie choose(1,1.1), title choose(2,3,4,5))].
//   if (Night_freddy_location == Last_location): Scr_Camera_Update[1] = 0.5
//     (0x3fe0000000000000; Freddy stays put) and done.
//   else: Scr_Camera_Update[2] = random_range(900, 1100) [helper 0x140168cf0
//     PROVEN random_range; .rdata consts @0x14043c8f8/@0x14043c900];
//     Scr_Camera_Update(39) (script call, 1 arg 39.0 @0x1405c5508 =
//     with(Obj_Night_Camera_Screen)); laugh on the emitter:
//     directional_single(Freddy_emitter, Snd_Freddy_Alarm /* 4.0 @0x1405c5518,
//     sound_names.json */, loop /* TODO(calibrate): rt @0x140656c90 */,
//     1.0 /* priority @0x1405c5528 */);
//     warning-marker position per new location (switch vs pool 6.0/8.0/9.0,
//     guarded-init tags 0/1/2 select the leaf; .rdata/file-image doubles,
//     no calibration needed):
//       6 -> (2146, 530); 8 -> (2496, 486); 9 -> (2465, 571).
//     Last_location = Night_freddy_location.
// NOTE: locations 6/8/9 are the same gate as Freddy Alarm_2's jumpscare
// check (Alarm_2 fires when the attack lands from those stages).
Night_freddy_location = choose(6, 8, 9);
if (Night_freddy_location == Last_location) {
    Scr_Camera_Update[1] = 0.5;
} else {
    Scr_Camera_Update[2] = random_range(900, 1100);
    Scr_Camera_Update(39);
    customfunct_audio_play_sound_directional_single(Freddy_emitter, Snd_Freddy_Alarm, 0 /* TODO(calibrate): runtime const @0x140656c90 (loop) */, 1);
    switch (Night_freddy_location) {
        case 6:
            Freddy_warning_x = 2146;
            Freddy_warning_y = 530;
            break;
        case 8:
            Freddy_warning_x = 2496;
            Freddy_warning_y = 486;
            break;
        case 9:
            Freddy_warning_x = 2465;
            Freddy_warning_y = 571;
            break;
    }
    Last_location = Night_freddy_location;
}

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_1  va=0x1400d2340  size=2194 ====

/ * WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_1(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 uStack_120;
  uint uStack_114;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined4 uStack_90;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043c908;
  uStack_78 = 0;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  plRam0000000140657680 = param_1;
  uStack_e0 = param_2;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18744);
  uStack_114 = 0xffffff;
  uStack_120 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_78 = 1;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_d8,0x1405c54d8);
  puStack_148 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c54e8);
  puStack_140 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c54f8);
  puStack_138 = &uStack_b8;
  uVar3 = func_0x000140168890(&uStack_70,3,&puStack_148);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(puVar2,uVar3);
  func_0x000140141c50(1);
  uStack_78 = 2;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1872e);
  iVar1 = func_0x00014015be60(puVar2,uVar3,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_78 = 0x18;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar4 = (undefined8 *)func_0x00014012b840(puVar2,1);
    func_0x000140141d00(*puVar2);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0x3fe0000000000000;
    func_0x000140141c50(2);
    goto joined_r0x0001400d277a;
  }
  uStack_78 = 5;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  uVar3 = func_0x000140168cf0(_UNK_14043c8f8,_UNK_14043c900);
  func_0x000140141d00(param_1);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar4,2);
  func_0x000140141d00(*puVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = uVar3;
  func_0x000140141c50(2);
  uStack_78 = 6;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_d8,0x1405c5508);
  puStack_148 = &uStack_d8;
  gml_Script_Scr_Camera_Update(param_1,uStack_e0,&uStack_70,1,&puStack_148);
  uStack_78 = 7;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1871f);
  func_0x000140001490(&uStack_d8,uVar3);
  puStack_148 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5518);
  puStack_140 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x140656c90);
  puStack_138 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1405c5528);
  puStack_130 = &uStack_a8;
  gml_Script_customfunct_audio_play_sound_directional_single
            (param_1,uStack_e0,&uStack_70,4,&puStack_148);
  uStack_78 = 8;
  uStack_8c = *(uint *)((longlong)puVar2 + 0xc);
  uStack_90 = *(undefined4 *)(puVar2 + 1);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) == 0) {
    uStack_98 = *puVar2;
  }
  else {
    func_0x0001400d2f90(&uStack_98,puVar2);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656cdc) &&
     (func_0x0001403f6320(0x140656cdc), iRam0000000140656cdc == -1)) {
    uRam0000000140656cac = 0;
    uRam0000000140656ca0 = 0x4018000000000000;
    uRam0000000140656cc0 = 0x100000000;
    uRam0000000140656cb4 = 0x4020000000000000;
    uRam0000000140656cd4 = 0x200000000;
    uRam0000000140656cc8 = 0x4022000000000000;
    func_0x0001403f6668(&DAT_1400d2ee0);
    func_0x0001403f62c0(0x140656cdc);
  }
  uVar3 = uRam00000001405cd9c0;
  lVar6 = 0;
  iVar1 = func_0x00014015be60(0x140656ca0,&uStack_98,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x0001400d282c:
    iVar1 = *(int *)(lVar6 * 0x14 + 0x140656cb0);
    if (iVar1 == 2) {
code_r0x0001400d297c:
      uStack_78 = 0x10;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18720);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x40a3420000000000;
      uStack_78 = 0x11;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18721);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x4081d80000000000;
    }
    else {
code_r0x0001400d283d:
      if (iVar1 == 1) {
        uStack_78 = 0xd;
        puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18720);
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x40a3800000000000;
        uStack_78 = 0xe;
        puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18721);
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x407e600000000000;
      }
      else if (iVar1 == 0) {
        uStack_78 = 10;
        puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18720);
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x40a0c40000000000;
        uStack_78 = 0xb;
        puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18721);
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x4080900000000000;
      }
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140656cb4,&uStack_98,uVar3,0);
    if (iVar1 == 0) {
      lVar6 = 1;
      goto code_r0x0001400d282c;
    }
    iVar1 = func_0x00014015be60(0x140656cc8,&uStack_98,uVar3,0);
    if (iVar1 == 0) {
      iVar1 = uRam0000000140656cd4._4_4_;
      if (uRam0000000140656cd4._4_4_ != 2) goto code_r0x0001400d283d;
      goto code_r0x0001400d297c;
    }
  }
  uStack_78 = 0x14;
  uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1872e);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar3,puVar2);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
joined_r0x0001400d277a:
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_120);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
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
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */
