/// @description FNAFN obj_OLDTVFilter_PresetBase / Create — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: obj_OLDTVFilter_PresetBase / Create
// Ground truth: gml_Object_obj_OLDTVFilter_PresetBase_Create_0
// Base preset all other filter presets inherit. Same decode shape as the BW
// preset (see obj_OLDTVFilter_BW/Create), plus keep_aspect_ratio = 1
// (id 0x1872c, line 0xd) and dirt_offset = 0 (id 0x1870d, line 0x1e).
// Sprite idx via exe consts: 30 = sprNoise1, 12 = sprStatic1,
// 68 = sprChromatic1, 90 = sprMaskWide1; subimg BSS @0x140655d98.
// NOTE: 0x406c000000000000 = 224.0 exactly.
script_execute(scr_OLDTVFilter_Settings);
oldtvfilter_enabled = 1;
keep_aspect_ratio = 1;
game_lines = 224;
noise_enabled = 1;
noise_pattern = sprite_get_texture(sprNoise1, 0 /* TODO(calibrate): subimg @0x140655d98 (BSS, unreadable offline) */);
noise_magnetude = -0.2;
static_pattern = sprite_get_texture(sprStatic1, 0 /* TODO(calibrate): subimg @0x140655d98 (BSS, unreadable offline) */);
static_magnetude = 0.1;
static_offset = 0;
dirt_pattern = sprite_get_texture(sprNoise1, 0 /* TODO(calibrate): subimg @0x140655d98 (BSS, unreadable offline) */);
dirt_magnetude = 0.35;
dirt_offset = 0;
composite_enabled = 1;
composite_secondpass_enabled = 0;
composite_distortion = 0.25;
composite_artifact = 0.07;
composite_fringing = 0.4;
composite_bleeding = 1;
television_enabled = 1;
television_brightness = 0;
television_contrast = 0.05;
television_saturation = 0.85;
television_sharpness = -1;
chromatic_enabled = 1;
chromatic_pattern = sprite_get_texture(sprChromatic1, 0 /* TODO(calibrate): subimg @0x140655d98 (BSS, unreadable offline) */);
chromatic_magnetude = 0.1;
scanline_enabled = 1;
scanline_count = 224;
scanline_pattern = sprite_get_texture(/* TODO(calibrate): spr @0x140655d98 (BSS) */ 0, /* TODO(calibrate): subimg @0x140655d98 (BSS) */ 0);
scanline_magnetude = 0.5;
tube_enabled = 1;
tube_mask = sprite_get_texture(sprMaskWide1, 0 /* TODO(calibrate): subimg @0x140655d98 (BSS, unreadable offline) */);
tube_distortion = 0.3;
script_execute(scr_OLDTVFilter_Setup);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_obj_OLDTVFilter_PresetBase_Create_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  undefined8 uVar11;
  undefined8 uVar12;
  undefined8 uVar13;
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
  puStack_68 = &UNK_14043b9be;
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
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18750);
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872c);
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18726);
  puVar5 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874b);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874e);
  puVar7 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1874c);
  uVar8 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18776);
  puStack_168 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  puStack_160 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18775);
  uVar9 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870e);
  puStack_158 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870c);
  puStack_150 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870d);
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
  uVar10 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f4);
  puStack_e8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f3);
  puStack_e0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18762);
  puStack_d8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18761);
  uVar11 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18764);
  puStack_d0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18763);
  puStack_c8 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18796);
  uVar12 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18797);
  puStack_c0 = (undefined8 *)
               (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18795);
  iVar1 = iRam00000001405c8e60;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_60 = 10;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_b8);
  }
  uStack_ac = 0;
  dStack_b8 = (double)iVar1;
  pdStack_88 = &dStack_b8;
  func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,1,uRam00000001405c8e50,&pdStack_88);
  uStack_60 = 0xc;
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0x3ff0000000000000;
  uStack_60 = 0xd;
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3ff0000000000000;
  uStack_60 = 0x13;
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x406c000000000000;
  uStack_60 = 0x16;
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3ff0000000000000;
  uStack_60 = 0x17;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c4a58);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655d98);
  puStack_80 = &uStack_a8;
  uVar13 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar6,uVar13);
  func_0x000140141c50(1);
  uStack_60 = 0x18;
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0xbfc999999999999a;
  uStack_60 = 0x19;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c4a68);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655d98);
  puStack_80 = &uStack_a8;
  uVar6 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar8,uVar6);
  func_0x000140141c50(1);
  uStack_60 = 0x1a;
  if ((0x46U >> (*(uint *)((longlong)puStack_168 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_168);
  }
  *(undefined4 *)((longlong)puStack_168 + 0xc) = 0;
  *puStack_168 = 0x3fb999999999999a;
  uStack_60 = 0x1b;
  if ((0x46U >> (*(uint *)((longlong)puStack_160 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_160);
  }
  *(undefined4 *)((longlong)puStack_160 + 0xc) = 0;
  *puStack_160 = 0;
  uStack_60 = 0x1c;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c4a58);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655d98);
  puStack_80 = &uStack_a8;
  uVar6 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar9,uVar6);
  func_0x000140141c50(1);
  uStack_60 = 0x1d;
  if ((0x46U >> (*(uint *)((longlong)puStack_158 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_158);
  }
  *(undefined4 *)((longlong)puStack_158 + 0xc) = 0;
  *puStack_158 = 0x3fd6666666666666;
  uStack_60 = 0x1e;
  if ((0x46U >> (*(uint *)((longlong)puStack_150 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_150);
  }
  *(undefined4 *)((longlong)puStack_150 + 0xc) = 0;
  *puStack_150 = 0;
  uStack_60 = 0x21;
  if ((0x46U >> (*(uint *)((longlong)puStack_148 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_148);
  }
  *(undefined4 *)((longlong)puStack_148 + 0xc) = 0;
  *puStack_148 = 0x3ff0000000000000;
  uStack_60 = 0x22;
  if ((0x46U >> (*(uint *)((longlong)puStack_140 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_140);
  }
  *(undefined4 *)((longlong)puStack_140 + 0xc) = 0;
  *puStack_140 = 0;
  uStack_60 = 0x23;
  if ((0x46U >> (*(uint *)((longlong)puStack_138 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_138);
  }
  *(undefined4 *)((longlong)puStack_138 + 0xc) = 0;
  *puStack_138 = 0x3fd0000000000000;
  uStack_60 = 0x24;
  if ((0x46U >> (*(uint *)((longlong)puStack_130 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_130);
  }
  *(undefined4 *)((longlong)puStack_130 + 0xc) = 0;
  *puStack_130 = 0x3fb1eb851eb851ec;
  uStack_60 = 0x25;
  if ((0x46U >> (*(uint *)((longlong)puStack_128 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_128);
  }
  *(undefined4 *)((longlong)puStack_128 + 0xc) = 0;
  *puStack_128 = 0x3fd999999999999a;
  uStack_60 = 0x26;
  if ((0x46U >> (*(uint *)((longlong)puStack_120 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_120);
  }
  *(undefined4 *)((longlong)puStack_120 + 0xc) = 0;
  *puStack_120 = 0x3ff0000000000000;
  uStack_60 = 0x29;
  if ((0x46U >> (*(uint *)((longlong)puStack_118 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_118);
  }
  *(undefined4 *)((longlong)puStack_118 + 0xc) = 0;
  *puStack_118 = 0x3ff0000000000000;
  uStack_60 = 0x2a;
  if ((0x46U >> (*(uint *)((longlong)puStack_110 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_110);
  }
  *(undefined4 *)((longlong)puStack_110 + 0xc) = 0;
  *puStack_110 = 0;
  uStack_60 = 0x2b;
  if ((0x46U >> (*(uint *)((longlong)puStack_108 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_108);
  }
  *(undefined4 *)((longlong)puStack_108 + 0xc) = 0;
  *puStack_108 = 0x3fa999999999999a;
  uStack_60 = 0x2c;
  if ((0x46U >> (*(uint *)((longlong)puStack_100 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_100);
  }
  *(undefined4 *)((longlong)puStack_100 + 0xc) = 0;
  *puStack_100 = 0x3feb333333333333;
  uStack_60 = 0x2d;
  if ((0x46U >> (*(uint *)((longlong)puStack_f8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_f8);
  }
  *(undefined4 *)((longlong)puStack_f8 + 0xc) = 0;
  *puStack_f8 = 0xbff0000000000000;
  uStack_60 = 0x30;
  if ((0x46U >> (*(uint *)((longlong)puStack_f0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_f0);
  }
  *(undefined4 *)((longlong)puStack_f0 + 0xc) = 0;
  *puStack_f0 = 0x3ff0000000000000;
  uStack_60 = 0x31;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c4a78);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655d98);
  puStack_80 = &uStack_a8;
  uVar6 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar10,uVar6);
  func_0x000140141c50(1);
  uStack_60 = 0x32;
  if ((0x46U >> (*(uint *)((longlong)puStack_e8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_e8);
  }
  *(undefined4 *)((longlong)puStack_e8 + 0xc) = 0;
  *puStack_e8 = 0x3fb999999999999a;
  uStack_60 = 0x35;
  if ((0x46U >> (*(uint *)((longlong)puStack_e0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_e0);
  }
  *(undefined4 *)((longlong)puStack_e0 + 0xc) = 0;
  *puStack_e0 = 0x3ff0000000000000;
  uStack_60 = 0x36;
  if ((0x46U >> (*(uint *)((longlong)puStack_d8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_d8);
  }
  *(undefined4 *)((longlong)puStack_d8 + 0xc) = 0;
  *puStack_d8 = 0x406c000000000000;
  uStack_60 = 0x37;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x140655d98);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655d98);
  puStack_80 = &uStack_a8;
  uVar6 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar11,uVar6);
  func_0x000140141c50(1);
  uStack_60 = 0x38;
  if ((0x46U >> (*(uint *)((longlong)puStack_d0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_d0);
  }
  *(undefined4 *)((longlong)puStack_d0 + 0xc) = 0;
  *puStack_d0 = 0x3fe0000000000000;
  uStack_60 = 0x3b;
  if ((0x46U >> (*(uint *)((longlong)puStack_c8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_c8);
  }
  *(undefined4 *)((longlong)puStack_c8 + 0xc) = 0;
  *puStack_c8 = 0x3ff0000000000000;
  uStack_60 = 0x3c;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&dStack_b8,0x1405c4a88);
  pdStack_88 = &dStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655d98);
  puStack_80 = &uStack_a8;
  uVar6 = func_0x0001401445d0(uStack_90,uStack_98,&uStack_58,2,uRam00000001405c8bc0,&pdStack_88);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(uVar12,uVar6);
  func_0x000140141c50(1);
  uStack_60 = 0x3d;
  if ((0x46U >> (*(uint *)((longlong)puStack_c0 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puStack_c0);
  }
  *(undefined4 *)((longlong)puStack_c0 + 0xc) = 0;
  *puStack_c0 = 0x3fd3333333333333;
  uStack_60 = 0x40;
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
