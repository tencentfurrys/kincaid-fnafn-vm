/// @description FNAFN Obj_Filter_Menus / Alarm_0 — PORTED from C
// Ground truth: gml_Object_Obj_Filter_Menus_Alarm_0 (4019 B @0x1400bbff0)
// Low-quality OLD-TV filter preset (see Obj_Filter_Menus/Create which fires
// ev_alarm 1 when game_settings[0] == "low"; mirrors Obj_Filter_Camera/Alarm
// with smaller magnitudes). All ids via builtin_ids.json; slots via
// EXE-REGISTRY.md. Deltas vs the Camera preset are the point of this event.
// Decoded, in order (uStack_60 = GML line markers):
//   2. game_lines = display_get_height() formatted [0-arg slot 0x1405c8d30
//      + helper 0x14001fa10(dst, h, _UNK_14043c440)].
//   5. noise_enabled = 1; 6. noise_pattern = sprite_get_texture(<exe>,
//      <runtime>) [slot 0x1405c8bc0; exe const @0x1405c5058, runtime
//      @0x1406565a0]; 7. noise_magnetude = 0.025 (0x3f9999999999999a, vs
//      0.03 camera); 8. static_pattern = sprite_get_texture(@0x1405c5068,
//      @0x1406565a0); 9. static_magnetude = 0.1 (vs 0.05); 10.
//      static_scale = 1; 11. static_offset = 0.025 (vs 0.1); 12.
//      dirt_pattern = sprite_get_texture(@0x1405c5058,@0x1406565a0); 13.
//      dirt_magnetude = 0.2 (vs 0.1); 16-19. composite_enabled = 1;
//      composite_secondpass_enabled = 1; composite_distortion = 0.5 (vs 1);
//      composite_artifact = 0.4 (vs 0.3); 20-21. composite_fringing = 0.5;
//      composite_bleeding = 0.5 (vs 1); 24-28. television_enabled = 1;
//      television_brightness = 0; television_contrast = 0;
//      television_saturation = 0.5; television_sharpness = 0.2
//      (0x3fc999999999999a, vs 0); 31. chromatic_enabled = 0; 32.
//      chromatic_pattern = sprite_get_texture(@0x1405c5078,@0x1406565a0);
//   33. chromatic_magnetude = 0.1; 36-37. scanline_enabled = 1;
//      scanline_count = 360; 38. scanline_pattern =
//      sprite_get_texture(<runtime>,<runtime>); 39. scanline_magnetude =
//      0.4 (0x3fd999999999999a, vs 0.5); 42-43. tube_enabled = 1; tube_mask
//      = sprite_get_texture(@0x1405c5088,@0x1406565a0); 44. tube_distortion
//      = 0.15; 47. script_execute(<idx>) [slot 0x1405c8e50, arg =
//      (double)iRam @0x1405c8e70].
// TODO(calibrate): formatter _UNK_14043c440; sprite exe consts @0x1405c5058/
//   @0x1405c5068/@0x1405c5078/@0x1405c5088 (below exe image — by analogy
//   with the camera preset: 30/52/68/90 = sprNoise1/Spr_Static_Custom/
//   sprChromatic1/sprMaskWide1, verify in-game); runtime consts
//   @0x1406565a0 (all 2nd args + scanline both args); script index
//   iRam @0x1405c8e70.
game_lines = string(display_get_height()); // TODO(calibrate): formatted via helper 0x14001fa10 with fmt _UNK_14043c440
noise_enabled = 1;
noise_pattern = sprite_get_texture(sprNoise1, 0 /* TODO(calibrate): subimg @0x1406565a0 */); // SPRT 30, exe const @0x1405c5058
noise_magnetude = 0.025;
static_pattern = sprite_get_texture(Spr_Static_Custom, 0 /* TODO(calibrate): subimg @0x1406565a0 */); // SPRT 52, exe const @0x1405c5068
static_magnetude = 0.1;
static_scale = 1;
static_offset = 0.025;
dirt_pattern = sprite_get_texture(sprNoise1, 0 /* TODO(calibrate): subimg @0x1406565a0 */); // SPRT 30, exe const @0x1405c5058
dirt_magnetude = 0.2;
composite_enabled = 1;
composite_secondpass_enabled = 1;
composite_distortion = 0.5;
composite_artifact = 0.4;
composite_fringing = 0.5;
composite_bleeding = 0.5;
television_enabled = 1;
television_brightness = 0;
television_contrast = 0;
television_saturation = 0.5;
television_sharpness = 0.2;
chromatic_enabled = 0;
chromatic_pattern = sprite_get_texture(sprChromatic1, 0 /* TODO(calibrate): subimg @0x1406565a0 */); // SPRT 68, exe const @0x1405c5078
chromatic_magnetude = 0.1;
scanline_enabled = 1;
scanline_count = 360;
scanline_pattern = sprite_get_texture(/* TODO(calibrate): spr @0x1406565a0 */ 0, /* TODO(calibrate): subimg @0x1406565a0 */ 0);
scanline_magnetude = 0.4;
tube_enabled = 1;
tube_mask = sprite_get_texture(sprMaskWide1, 0 /* TODO(calibrate): subimg @0x1406565a0 */); // SPRT 90, exe const @0x1405c5088
tube_distortion = 0.15;
script_execute(/* TODO(calibrate): index iRam @0x1405c8e70 */ 0);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Filter_Menus_Alarm_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  undefined8 *puVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
  undefined8 uVar14;
  undefined8 uStack_1a0;
  uint uStack_194;
  undefined8 uStack_190;
  uint uStack_184;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 uStack_170;
  uint uStack_164;
  undefined auStack_160 [12];
  uint uStack_154;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  double dStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined8 uStack_90;
  double *pdStack_88;
  undefined8 *puStack_80;
  undefined8 uStack_70;
  undefined *puStack_68;
  undefined4 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_68 = &UNK_14043c46c;
  uStack_60 = 0;
  uStack_70 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_70;
  uStack_ac = 0xffffff;
  dStack_b8 = 0.0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uRam0000000140657680 = param_1;
  uStack_98 = param_2;
  uStack_90 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18726);
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874b);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874e);
  puVar5 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874c);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18776);
  puVar7 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  puVar8 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18777);
  puVar9 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18775);
  uVar10 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870e);
  puStack_150 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870c);
  puStack_148 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f9);
  puStack_140 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fb);
  puStack_138 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f8);
  puStack_130 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f6);
  puStack_128 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fa);
  puStack_120 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f7);
  puStack_118 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18781);
  puStack_110 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1877f);
  puStack_108 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18780);
  puStack_100 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18782);
  puStack_f8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18783);
  puStack_f0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f2);
  uVar11 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f4);
  puStack_e8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f3);
  puStack_e0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18762);
  puStack_d8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18761);
  uVar12 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18764);
  puStack_d0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18763);
  puStack_c8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18796);
  uVar13 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18797);
  puStack_c0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18795);
  uStack_194 = 0xffffff;
  uStack_1a0 = 0;
  uStack_184 = 0xffffff;
  uStack_190 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uStack_60 = 2;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  uVar14 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,0,uRam00000001405c8d30,0);
  func_0x00014001fa10(auStack_160,uVar14,_UNK_14043c440);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar2,auStack_160);
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_160);
  }
  func_0x000140141c50(1);
  uStack_60 = 5;
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3ff0000000000000;
  uStack_60 = 6;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5058);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1406565a0);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar4,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 7;
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3f9999999999999a;
  uStack_60 = 8;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5068);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1406565a0);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar6,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 9;
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0x3fb999999999999a;
  uStack_60 = 10;
  if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar8);
  }
  *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
  *puVar8 = 0x3ff0000000000000;
  uStack_60 = 0xb;
  if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar9);
  }
  *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
  *puVar9 = 0x3f9999999999999a;
  uStack_60 = 0xc;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5058);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1406565a0);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar10,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 0xd;
  if ((0x46U >> (*(uint *)((longlong)puStack_150 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_150);
  }
  *(undefined4 *)((longlong)puStack_150 + 0xc) = 0;
  *puStack_150 = 0x3fc999999999999a;
  uStack_60 = 0x10;
  if ((0x46U >> (*(uint *)((longlong)puStack_148 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_148);
  }
  *(undefined4 *)((longlong)puStack_148 + 0xc) = 0;
  *puStack_148 = 0x3ff0000000000000;
  uStack_60 = 0x11;
  if ((0x46U >> (*(uint *)((longlong)puStack_140 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_140);
  }
  *(undefined4 *)((longlong)puStack_140 + 0xc) = 0;
  *puStack_140 = 0x3ff0000000000000;
  uStack_60 = 0x12;
  if ((0x46U >> (*(uint *)((longlong)puStack_138 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_138);
  }
  *(undefined4 *)((longlong)puStack_138 + 0xc) = 0;
  *puStack_138 = 0x3fe0000000000000;
  uStack_60 = 0x13;
  if ((0x46U >> (*(uint *)((longlong)puStack_130 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_130);
  }
  *(undefined4 *)((longlong)puStack_130 + 0xc) = 0;
  *puStack_130 = 0x3fd999999999999a;
  uStack_60 = 0x14;
  if ((0x46U >> (*(uint *)((longlong)puStack_128 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_128);
  }
  *(undefined4 *)((longlong)puStack_128 + 0xc) = 0;
  *puStack_128 = 0x3fe0000000000000;
  uStack_60 = 0x15;
  if ((0x46U >> (*(uint *)((longlong)puStack_120 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_120);
  }
  *(undefined4 *)((longlong)puStack_120 + 0xc) = 0;
  *puStack_120 = 0x3fe0000000000000;
  uStack_60 = 0x18;
  if ((0x46U >> (*(uint *)((longlong)puStack_118 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_118);
  }
  *(undefined4 *)((longlong)puStack_118 + 0xc) = 0;
  *puStack_118 = 0x3ff0000000000000;
  uStack_60 = 0x19;
  if ((0x46U >> (*(uint *)((longlong)puStack_110 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_110);
  }
  *(undefined4 *)((longlong)puStack_110 + 0xc) = 0;
  *puStack_110 = 0;
  uStack_60 = 0x1a;
  if ((0x46U >> (*(uint *)((longlong)puStack_108 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_108);
  }
  *(undefined4 *)((longlong)puStack_108 + 0xc) = 0;
  *puStack_108 = 0;
  uStack_60 = 0x1b;
  if ((0x46U >> (*(uint *)((longlong)puStack_100 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_100);
  }
  *(undefined4 *)((longlong)puStack_100 + 0xc) = 0;
  *puStack_100 = 0x3fe0000000000000;
  uStack_60 = 0x1c;
  if ((0x46U >> (*(uint *)((longlong)puStack_f8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_f8);
  }
  *(undefined4 *)((longlong)puStack_f8 + 0xc) = 0;
  *puStack_f8 = 0x3fc999999999999a;
  uStack_60 = 0x1f;
  if ((0x46U >> (*(uint *)((longlong)puStack_f0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_f0);
  }
  *(undefined4 *)((longlong)puStack_f0 + 0xc) = 0;
  *puStack_f0 = 0;
  uStack_60 = 0x20;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5078);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1406565a0);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar11,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 0x21;
  if ((0x46U >> (*(uint *)((longlong)puStack_e8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_e8);
  }
  *(undefined4 *)((longlong)puStack_e8 + 0xc) = 0;
  *puStack_e8 = 0x3fb999999999999a;
  uStack_60 = 0x24;
  if ((0x46U >> (*(uint *)((longlong)puStack_e0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_e0);
  }
  *(undefined4 *)((longlong)puStack_e0 + 0xc) = 0;
  *puStack_e0 = 0x3ff0000000000000;
  uStack_60 = 0x25;
  if ((0x46U >> (*(uint *)((longlong)puStack_d8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_d8);
  }
  *(undefined4 *)((longlong)puStack_d8 + 0xc) = 0;
  *puStack_d8 = 0x4076800000000000;
  uStack_60 = 0x26;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1406565a0);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1406565a0);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar12,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 0x27;
  if ((0x46U >> (*(uint *)((longlong)puStack_d0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_d0);
  }
  *(undefined4 *)((longlong)puStack_d0 + 0xc) = 0;
  *puStack_d0 = 0x3fd999999999999a;
  uStack_60 = 0x2a;
  if ((0x46U >> (*(uint *)((longlong)puStack_c8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_c8);
  }
  *(undefined4 *)((longlong)puStack_c8 + 0xc) = 0;
  *puStack_c8 = 0x3ff0000000000000;
  uStack_60 = 0x2b;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5088);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1406565a0);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar13,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 0x2c;
  if ((0x46U >> (*(uint *)((longlong)puStack_c0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_c0);
  }
  *(undefined4 *)((longlong)puStack_c0 + 0xc) = 0;
  *puStack_c0 = 0x3fc3333333333333;
  uStack_60 = 0x2f;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  iVar1 = iRam00000001405c8e70;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_b8);
  }
  dStack_b8 = (double)iVar1;
  uStack_ac = 0;
  pdStack_88 = &dStack_b8;
  func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,1,uRam00000001405c8e50,&pdStack_88);
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
  }
  if ((0x46U >> (uStack_184 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_190);
  }
  if ((0x46U >> (uStack_194 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a0);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_70;
  return;
}
END DECOMPILED REFERENCE */
