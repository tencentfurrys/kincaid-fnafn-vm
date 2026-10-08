/// @description FNAFN Obj_Jumpscare / Create - PORTED from C
// PORTED from C
// Ground truth: gml_Object_Obj_Jumpscare_Create_0 (4781 B @0x1401251e0)
// Decoded (uStack_a0 = 0..0x2a are the original GML line markers):
//   lines 3-5: for (var i = 0; i < 12; i += 1) { Scr_Camera_Update[i] = -100; }
//     [counter loop vs bound 12.0 (0x4028...); id 0x186d5 is the
//     12-element Scr_Camera_Update ARRAY (PORTING.md); element write
//     -100.0 (0xc059...)].
//   line 9: image_alpha = 1; [slot 0x1405c7b98]
//   line 10: Animation_end = 0; [0x186de]
//   line 11: stopped = 0; [0x18778]
//   lines 12-38: switch (Jumpscare) [global 0x1872b] over "freddy" /
//     "bonnie" / "chica" / "foxy" / "mangle" [consts @0x1405c69f0..0x1405c6a09
//     via exe_strings.py; label table @0x1406575e0 is runtime, assumed
//     identity]. The case bodies sit behind the jumptable @0x140126a1c
//     (targets 0x140125762/5ef8/5b4a/d21/973, inside this same function;
//     Ghidra did not recover the structure, so the bodies below were
//     disassembled directly from FNAFN.exe with capstone):
//     - freddy (lines 14-18): image_alpha = 0 [slot 0x1405c7b98, zeroed
//       RValue]; Scr_Camera_Update[0] = irandom_range(180, 300)
//       [func_0x000140168970(0xb4, 0x12c) — disassembled: integer-range
//       random returning double, i.e. irandom_range]; sprite_index = -1
//       [slot 0x1405c7be8, 0xbff0...]; audio_play_sound(Snd_Freddy_Power_Out,
//       <rt>, <rt>) [sound 32 via sound_names.json SOND index; slot
//       0x1405c8970 = audio_play_sound, const 32.0 @0x1405c6a18].
//     - bonnie (lines 19-23): sprite_index = Spr_Jumpscare_Bonnie_1 (77)
//       [0x40534...]; image_index = 0 [slot 0x1405c7aa8, zeroed RValue];
//       audio_play_sound(Snd_Jumpscare_Bonnie_1, <rt>, <rt>) [sound 24
//       @0x1405c6a28, SOND index];
//       Animation_end = 92 [0x40570...].
//     - chica (lines 24-28): sprite_index = Spr_Jumpscare_Chica_1 (44);
//       image_index = 0; audio_play_sound(Snd_Jumpscare_Chica_1, <rt>, <rt>)
//       [sound 42 @0x1405c6a38, SOND index];
//       Animation_end = 85 [0x40554...].
//     - foxy (lines 29-33): sprite_index = Spr_Jumpscare_Foxy (8);
//       image_index = 0; audio_play_sound(Snd_Jumpscare_Foxy, <rt>, <rt>)
//       [sound 39 @0x1405c6a48, SOND index];
//       Animation_end = 97 [0x40584...].
//     - mangle (lines 34-38): sprite_index = Spr_Jumpscare_Mangle (93);
//       image_index = 0; audio_play_sound(Snd_Jumpscare_Mangle, <rt>, <rt>)
//       [sound 9 @0x1405c6a58, SOND index];
//       Animation_end = 142 [0x4061c...].
//     (sprite ids are SPRT chunk indices via sprite_names.json; sound ids
//     are SOND chunk indices via sound_names.json — proven by matching
//     jumpscare sprite/sound pairs above.)
//   lines 40-42: if (Night_camera == 1) [global 0x1873b vs 1.0] {
//       instance_create_layer(<x>, <y>, "UI", Obj_Game_Over_Tablet); }
//     [slot 0x1405c8d90, 4 args: x/y = runtime const @0x1406575c0 (twice),
//     layer "UI" @0x1405c6a10, obj const 38.0 @0x1405c6a68 -> object 38 =
//     Obj_Game_Over_Tablet].
// TODO(calibrate): audio_play_sound priority/loop args (runtime @0x1406575c0,
//   assumed 10/false below); instance_create_layer x/y (same const, assumed
//   0, 0); switch label-table identity; freddy sprite_index = -1 (no sprite).
for (var i = 0; i < 12; i += 1) {
    Scr_Camera_Update[i] = -100;
}
image_alpha = 1;
Animation_end = 0;
stopped = 0;
switch (Jumpscare) {
    case "freddy":
        image_alpha = 0;
        Scr_Camera_Update[0] = irandom_range(180, 300);
        sprite_index = -1;
        audio_play_sound(Snd_Freddy_Power_Out, 10 /* TODO(calibrate): runtime @0x1406575c0 */, false /* TODO(calibrate): runtime @0x1406575c0 */); // SOND 32
        break;
    case "bonnie":
        sprite_index = Spr_Jumpscare_Bonnie_1; // SPRT 77
        image_index = 0;
        audio_play_sound(Snd_Jumpscare_Bonnie_1, 10 /* TODO(calibrate) */, false /* TODO(calibrate) */); // SOND 24
        Animation_end = 92;
        break;
    case "chica":
        sprite_index = Spr_Jumpscare_Chica_1; // SPRT 44
        image_index = 0;
        audio_play_sound(Snd_Jumpscare_Chica_1, 10 /* TODO(calibrate) */, false /* TODO(calibrate) */); // SOND 42
        Animation_end = 85;
        break;
    case "foxy":
        sprite_index = Spr_Jumpscare_Foxy; // SPRT 8
        image_index = 0;
        audio_play_sound(Snd_Jumpscare_Foxy, 10 /* TODO(calibrate) */, false /* TODO(calibrate) */); // SOND 39
        Animation_end = 97;
        break;
    case "mangle":
        sprite_index = Spr_Jumpscare_Mangle; // SPRT 93
        image_index = 0;
        audio_play_sound(Snd_Jumpscare_Mangle, 10 /* TODO(calibrate) */, false /* TODO(calibrate) */); // SOND 9
        Animation_end = 142;
        break;
}
if (Night_camera == 1) {
    instance_create_layer(0 /* TODO(calibrate): runtime @0x1406575c0 */, 0 /* TODO(calibrate): runtime @0x1406575c0 */, "UI", Obj_Game_Over_Tablet);
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Jumpscare_Create_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  double dVar2;
  undefined8 uVar3;
  int iVar4;
  undefined4 uVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  undefined8 *puVar9;
  longlong lVar10;
  longlong unaff_GS_OFFSET;
  undefined8 uStack_1c8;
  undefined4 uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
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
  undefined8 uStack_110;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 uStack_e8;
  undefined4 uStack_e0;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined8 uStack_70;
  longlong *plStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043dd5a;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0.0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  plRam0000000140657680 = param_1;
  uStack_d8 = param_2;
  plStack_68 = param_1;
  puVar6 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872b);
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uVar7 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_a0 = 3;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  dVar2 = _UNK_140439dd0;
  uStack_b4 = 0;
  uStack_c0 = 0.0;
  while( true ) {
    uStack_1bc = 0;
    uStack_1c8 = 0x4028000000000000;
    iVar4 = func_0x00014015be60(&uStack_c0,&uStack_1c8,uRam00000001405cd9c0,1);
    if ((iVar4 == -2) || (-1 < iVar4)) break;
    uStack_a0 = 5;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar8 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186d5);
    func_0x000140141d00(plStack_68);
    uVar5 = func_0x00014012cd90(&uStack_c0);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar8,uVar5);
    func_0x000140141d00(*puVar8);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_b4 & 0xffffff) {
    case 1:
      uStack_c0 = (double)func_0x00014012d320(&uStack_c0);
      uStack_c0 = uStack_c0 + dVar2;
      uStack_b4 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_c0,&uStack_c0);
      break;
    case 7:
      uStack_c0 = (double)CONCAT44(uStack_c0._4_4_,(int)uStack_c0 + 1);
      break;
    case 10:
      uStack_c0 = (double)((longlong)uStack_c0 + 1);
      break;
    case 0xd:
      uStack_b4 = 0;
    case 0:
      uStack_c0 = uStack_c0 + dVar2;
    }
  }
  uStack_a0 = 9;
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  uStack_c4 = 0;
  uStack_d0 = 0x3ff0000000000000;
  func_0x000140160140(plStack_68,uRam00000001405c7b98,0x80000000,&uStack_d0);
  uStack_a0 = 10;
  puVar8 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186de);
  if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar8);
  }
  *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
  *puVar8 = 0;
  uStack_a0 = 0xb;
  puVar8 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18778);
  if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar8);
  }
  *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
  *puVar8 = 0;
  uStack_a0 = 0xc;
  uStack_dc = *(uint *)((longlong)puVar6 + 0xc);
  uStack_e0 = *(undefined4 *)(puVar6 + 1);
  if ((0x46U >> (uStack_dc & 0x1f) & 1) == 0) {
    uStack_e8 = *puVar6;
  }
  else {
    func_0x000140126b50(&uStack_e8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140657634) &&
     (func_0x0001403f6320(0x140657634), iRam0000000140657634 == -1)) {
    uStack_110 = 0x1406575d0;
    func_0x0001401453a0(0x1406575d0,0x1405c69f0);
    uRam00000001406575e0 = 0;
    uStack_110 = 0x1406575e4;
    func_0x0001401453a0(0x1406575e4,0x1405c69f7);
    uRam00000001406575f4 = 1;
    uStack_110 = 0x1406575f8;
    func_0x0001401453a0(0x1406575f8,0x1405c69fe);
    uRam0000000140657608 = 2;
    uStack_110 = 0x14065760c;
    func_0x0001401453a0(0x14065760c,0x1405c6a04);
    uRam000000014065761c = 3;
    uStack_110 = 0x140657620;
    func_0x0001401453a0(0x140657620,0x1405c6a09);
    uRam0000000140657630 = 4;
    func_0x0001403f6668(&DAT_140126a70);
    func_0x0001403f62c0(0x140657634);
  }
  uVar3 = uRam00000001405cd9c0;
  lVar10 = 0;
  iVar4 = func_0x00014015be60(0x1406575d0,&uStack_e8,uRam00000001405cd9c0,0);
  if (iVar4 == 0) {
code_r0x000140125740:
    uVar1 = *(uint *)(lVar10 * 0x14 + 0x1406575e0);
  }
  else {
    iVar4 = func_0x00014015be60(0x1406575e4,&uStack_e8,uVar3,0);
    if (iVar4 == 0) {
      lVar10 = 1;
      goto code_r0x000140125740;
    }
    iVar4 = func_0x00014015be60(0x1406575f8,&uStack_e8,uVar3,0);
    uVar1 = uRam0000000140657608;
    if (((iVar4 != 0) &&
        (iVar4 = func_0x00014015be60(0x14065760c,&uStack_e8,uVar3,0), uVar1 = uRam000000014065761c,
        iVar4 != 0)) &&
       (iVar4 = func_0x00014015be60(0x140657620,&uStack_e8,uVar3,0), uVar1 = uRam0000000140657630,
       iVar4 != 0)) goto code_r0x0001401260ca;
  }
  if ((ulonglong)uVar1 < 5) {
                    // (Ghidra note) WARNING: Could not recover jumptable at 0x000140125760. Too many branches
                    // (Ghidra note) WARNING: Treating indirect jump as call
    (*(code *)(&UNK_140126a1c + *(int *)(&UNK_140126a1c + (ulonglong)uVar1 * 4)))();
    return;
  }
code_r0x0001401260ca:
  uStack_a0 = 0x28;
  uStack_1bc = 0;
  uStack_1c8 = 0x3ff0000000000000;
  iVar4 = func_0x00014015be60(uVar7,&uStack_1c8,uRam00000001405cd9c0,0);
  if (iVar4 == 0) {
    uStack_a0 = 0x2a;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    func_0x00014000bee0(&uStack_158,0x1406575c0);
    puStack_108 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1406575c0);
    puStack_100 = &uStack_148;
    if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_138);
    }
    func_0x0001401441e0(&uStack_138,0x1405c6a10);
    puStack_f8 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c6a68);
    puStack_f0 = &uStack_128;
    func_0x0001401445d0(plStack_68,uStack_d8,&uStack_78,4,uRam00000001405c8d90,&puStack_108);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
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
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
