/// @description FNAFN Obj_Filter_Menus / Alarm_1 - PORTED from C
// Ground truth: gml_Object_Obj_Filter_Menus_Alarm_1 (4008 B @0x1400bad10)
// LOW-quality OLD-TV filter preset for menus (sibling Alarm_0 is full;
// Create fires ev_alarm 1 when game_settings[0] == "low"). Byte-identical
// statement skeleton to Obj_Filter_Camera/Alarm_1 (diffed: only the const
// block addresses and television_sharpness differ). All features zeroed
// except television (enabled) and sharpness 0.2.
// Decoded per line (targets in prologue fetch order; slots via
// EXE-REGISTRY.md; exe doubles via exe_strings.py):
//   2. game_lines = display_get_height() formatted [0-arg slot 0x1405c8d30
//      = display_get_height, then helper 0x14001fa10(dst, h, _UNK_14043c448)].
//   5. noise_enabled = 0; 6. noise_pattern = sprite_get_texture(30,
//      <runtime>) [slot 0x1405c8bc0 = sprite_get_texture; exe const
//      0x1405c5018 = 30.0 = sprNoise1].
//   7. noise_magnetude = 0; 8. static_pattern =
//      sprite_get_texture(52,<runtime>) [0x1405c5028 = 52.0 =
//      Spr_Static_Custom]; 9. static_magnetude = 0; 10. static_scale = 0;
//   11. static_offset = 0; 12. dirt_pattern = sprite_get_texture(30,
//      <runtime>); 13. dirt_magnetude = 0; 16-21. composite_* = 0 (x6);
//   24. television_enabled = 1; 25. television_brightness = 0;
//   26. television_contrast = 0; 27. television_saturation = 0.5;
//   28. television_sharpness = 0.2 (0x3fc999999999999a -- the ONE value
//      that differs from the Camera preset, where it is 0);
//   31. chromatic_enabled = 0;
//   32. chromatic_pattern = sprite_get_texture(68,<runtime>)
//      [0x1405c5038 = 68.0 = sprChromatic1]; 33. chromatic_magnetude = 0;
//   36. scanline_enabled = 1; 37. scanline_count = 360.0
//      (0x4076800000000000); 38. scanline_pattern =
//      sprite_get_texture(<runtime>,<runtime>); 39. scanline_magnetude = 0.5;
//   42. tube_enabled = 1; 43. tube_mask = sprite_get_texture(90,<runtime>)
//      [0x1405c5048 = 90.0 = sprMaskWide1]; 44. tube_distortion = 0.15
//      (0x3fc3333333333333).
//   47. script_execute(scr_OLDTVFilter_Setup) [slot 0x1405c8e50; arg =
//      (double)iRam @0x1405c8e70, name-resolves to
//      gml_Script_scr_OLDTVFilter_Setup].
// TODO(calibrate): formatter string _UNK_14043c448; subimg/index runtime
//   consts @0x140656590 (all sprite_get_texture 2nd args + scanline_pattern
//   both args).
game_lines = string(display_get_height()); // TODO(calibrate): formatted via helper 0x14001fa10 with fmt _UNK_14043c448
noise_enabled = 0;
noise_pattern = sprite_get_texture(sprNoise1, 0 /* TODO(calibrate): subimg @0x140656590 */);
noise_magnetude = 0;
static_pattern = sprite_get_texture(Spr_Static_Custom, 0 /* TODO(calibrate): subimg @0x140656590 */);
static_magnetude = 0;
static_scale = 0;
static_offset = 0;
dirt_pattern = sprite_get_texture(sprNoise1, 0 /* TODO(calibrate): subimg @0x140656590 */);
dirt_magnetude = 0;
composite_enabled = 0;
composite_secondpass_enabled = 0;
composite_distortion = 0;
composite_artifact = 0;
composite_fringing = 0;
composite_bleeding = 0;
television_enabled = 1;
television_brightness = 0;
television_contrast = 0;
television_saturation = 0.5;
television_sharpness = 0.2;
chromatic_enabled = 0;
chromatic_pattern = sprite_get_texture(sprChromatic1, 0 /* TODO(calibrate): subimg @0x140656590 */);
chromatic_magnetude = 0;
scanline_enabled = 1;
scanline_count = 360;
scanline_pattern = sprite_get_texture(/* TODO(calibrate): spr @0x140656590 */ 0, /* TODO(calibrate): subimg @0x140656590 */ 0);
scanline_magnetude = 0.5;
tube_enabled = 1;
tube_mask = sprite_get_texture(sprMaskWide1, 0 /* TODO(calibrate): subimg @0x140656590 */);
tube_distortion = 0.15;
script_execute(scr_OLDTVFilter_Setup); // iRam @0x1405c8e70 name-resolves to gml_Script_scr_OLDTVFilter_Setup

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Filter_Menus_Alarm_1  va=0x1400bad10  size=4008 ====

/ * WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Filter_Menus_Alarm_1(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  undefined8 uVar9;
  undefined8 *puVar10;
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
  puStack_68 = &UNK_14043c448;
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
  puStack_150 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18775);
  uVar9 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870e);
  puStack_148 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870c);
  puStack_140 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f9);
  puStack_138 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fb);
  puStack_130 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f8);
  puStack_128 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f6);
  puStack_120 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fa);
  puStack_118 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f7);
  puStack_110 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18781);
  puStack_108 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1877f);
  puStack_100 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18780);
  puVar10 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18782);
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
  *puVar3 = 0;
  uStack_60 = 6;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5018);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140656590);
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
  *puVar5 = 0;
  uStack_60 = 8;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5028);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140656590);
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
  *puVar7 = 0;
  uStack_60 = 10;
  if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar8);
  }
  *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
  *puVar8 = 0;
  uStack_60 = 0xb;
  if ((0x46U >> (*(uint *)((longlong)puStack_150 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_150);
  }
  *(undefined4 *)((longlong)puStack_150 + 0xc) = 0;
  *puStack_150 = 0;
  uStack_60 = 0xc;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c5018);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140656590);
  puStack_80 = &uStack_a8;
  uVar2 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar9,uVar2);
  func_0x000140141c50(1);
  uStack_60 = 0xd;
  if ((0x46U >> (*(uint *)((longlong)puStack_148 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_148);
  }
  *(undefined4 *)((longlong)puStack_148 + 0xc) = 0;
  *puStack_148 = 0;
  uStack_60 = 0x10;
  if ((0x46U >> (*(uint *)((longlong)puStack_140 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_140);
  }
  *(undefined4 *)((longlong)puStack_140 + 0xc) = 0;
  *puStack_140 = 0;
  uStack_60 = 0x11;
  if ((0x46U >> (*(uint *)((longlong)puStack_138 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_138);
  }
  *(undefined4 *)((longlong)puStack_138 + 0xc) = 0;
  *puStack_138 = 0;
  uStack_60 = 0x12;
  if ((0x46U >> (*(uint *)((longlong)puStack_130 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_130);
  }
  *(undefined4 *)((longlong)puStack_130 + 0xc) = 0;
  *puStack_130 = 0;
  uStack_60 = 0x13;
  if ((0x46U >> (*(uint *)((longlong)puStack_128 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_128);
  }
  *(undefined4 *)((longlong)puStack_128 + 0xc) = 0;
  *puStack_128 = 0;
  uStack_60 = 0x14;
  if ((0x46U >> (*(uint *)((longlong)puStack_120 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_120);
  }
  *(undefined4 *)((longlong)puStack_120 + 0xc) = 0;
  *puStack_120 = 0;
  uStack_60 = 0x15;
  if ((0x46U >> (*(uint *)((longlong)puStack_118 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_118);
  }
  *(undefined4 *)((longlong)puStack_118 + 0xc) = 0;
  *puStack_118 = 0;
  uStack_60 = 0x18;
  if ((0x46U >> (*(uint *)((longlong)puStack_110 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_110);
  }
  *(undefined4 *)((longlong)puStack_110 + 0xc) = 0;
  *puStack_110 = 0x3ff0000000000000;
  uStack_60 = 0x19;
  if ((0x46U >> (*(uint *)((longlong)puStack_108 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_108);
  }
  *(undefined4 *)((longlong)puStack_108 + 0xc) = 0;
  *puStack_108 = 0;
  uStack_60 = 0x1a;
  if ((0x46U >> (*(uint *)((longlong)puStack_100 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_100);
  }
  *(undefined4 *)((longlong)puStack_100 + 0xc) = 0;
  *puStack_100 = 0;
  uStack_60 = 0x1b;
  if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar10);
  }
  *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
  *puVar10 = 0x3fe0000000000000;
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
  func_0x00014000bee0(&dStack_b8,0x1405c5038);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140656590);
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
  *puStack_e8 = 0;
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
  func_0x00014000bee0(&dStack_b8,0x140656590);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140656590);
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
  *puStack_d0 = 0x3fe0000000000000;
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
  func_0x00014000bee0(&dStack_b8,0x1405c5048);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140656590);
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
