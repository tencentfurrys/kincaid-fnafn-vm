/// @description FNAFN Obj_System_Stats_Check / Draw - PORTED from C
// PORTED from C
// Ground truth: gml_Object_Obj_System_Stats_Check_Draw_75 (1997 B @0x14011ab00)
// Decoded (uStack_120 = 1..6,10 are the original GML line markers):
//   line 1: draw_set_halign(fa_left) [func_0x000140175530(0); 0x140175530 is
//     PROVEN draw_set_halign, 0 = fa_left].
//   line 2: draw_set_font(-1) [func_0x000140175520(0xffffffff); 0x140175520
//     is PROVEN draw_set_font; -1 = default font].
//   line 3: if (toggle == 1) [`toggle` (0x18793) 3-way-compared vs 1.0
//     (0x3ff0...); branch taken when result == 0].
//   line 5: draw_text_transformed(32, 32, "fps_real: " + string(fps_real),
//     1, 1, <angle>) [`fps_real` (slot 0x1405c7c88) read via 0x14015ef90,
//     string() = slot 0x1405c8840, prefix "fps_real: " @0x1405c68b8 joined
//     by ADD (0x140005290); draw_text_transformed = slot 0x1405c8ef0 with
//     x/y 32.0/32.0 @0x1405c68d0 and xscale/yscale 1.0/1.0 @0x1405c68e0].
//   line 6: draw_text_transformed(32, 64, "fps: " + string(fps), 1, 1,
//     <angle>) [`fps` (slot 0x1405c7c78), prefix "fps: " @0x1405c68c3,
//     y 64.0 @0x1405c68f0].
// TODO(calibrate): text angle, runtime const @0x140657460 (assumed 0 below).
draw_set_halign(fa_left);
draw_set_font(-1);
if (toggle == 1) {
    draw_text_transformed(32, 32, "fps_real: " + string(fps_real), 1, 1, 0 /* TODO(calibrate): runtime const @0x140657460 */);
    draw_text_transformed(32, 64, "fps: " + string(fps), 1, 1, 0 /* TODO(calibrate): runtime const @0x140657460 */);
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_System_Stats_Check_Draw_75(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puStack_1b8;
  undefined8 *puStack_1b0;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  uint uStack_154;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
  undefined *puStack_128;
  undefined4 uStack_120;
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
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined4 uStack_60;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined4 uStack_50;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_128 = &UNK_14043da8e;
  uStack_130 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_130;
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
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_80._4_4_ = 0xffffff;
  uStack_88 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uStack_154 = 0xffffff;
  uStack_160 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_120 = 1;
  plRam0000000140657680 = param_1;
  func_0x000140175530(0);
  uStack_120 = 2;
  func_0x000140175520(0xffffffff);
  uStack_120 = 3;
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18793);
  uStack_4c = 0;
  uStack_58 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_120 = 5;
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_88 = 0;
    uStack_80 = 0x500000000;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    func_0x00014015ef90(param_1,uRam00000001405c7c88,0x80000000,&uStack_118);
    func_0x000140001490(&uStack_f8,&uStack_118);
    puStack_1b8 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x1405c68d0);
    puStack_1b0 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c68d0);
    puStack_1a8 = &uStack_d8;
    uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uRam00000001405c8840,&puStack_1b8);
    func_0x0001401453a0(&uStack_68,0x1405c68b8);
    uStack_4c = uStack_5c;
    uStack_50 = uStack_60;
    if ((0x46U >> (uStack_5c & 0x1f) & 1) == 0) {
      uStack_58 = uStack_68;
    }
    else {
      func_0x00014011b8f0(&uStack_58,&uStack_68);
    }
    func_0x000140005290(&uStack_58,uVar2);
    func_0x000140001490(&uStack_c8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    puStack_1a0 = &uStack_c8;
    func_0x00014000bee0(&uStack_b8,0x1405c68e0);
    puStack_198 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x1405c68e0);
    puStack_190 = &uStack_a8;
    func_0x00014000bee0(&uStack_98,0x140657460);
    puStack_188 = &uStack_98;
    func_0x0001401445d0(param_1,param_2,&uStack_88,6,uRam00000001405c8ef0,&puStack_1b0);
    uStack_120 = 6;
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_88 = 0;
    uStack_80._0_4_ = 0;
    uStack_80._4_4_ = 5;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    func_0x00014015ef90(param_1,uRam00000001405c7c78,0x80000000,&uStack_108);
    func_0x000140001490(&uStack_f8,&uStack_108);
    puStack_1b8 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x1405c68d0);
    puStack_1b0 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c68f0);
    puStack_1a8 = &uStack_d8;
    uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uRam00000001405c8840,&puStack_1b8);
    func_0x0001401453a0(&uStack_68,0x1405c68c3);
    uStack_4c = uStack_5c;
    uStack_50 = uStack_60;
    if ((0x46U >> (uStack_5c & 0x1f) & 1) == 0) {
      uStack_58 = uStack_68;
    }
    else {
      func_0x00014011b8f0(&uStack_58,&uStack_68);
    }
    func_0x000140005290(&uStack_58,uVar2);
    func_0x000140001490(&uStack_c8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    puStack_1a0 = &uStack_c8;
    func_0x00014000bee0(&uStack_b8,0x1405c68e0);
    puStack_198 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x1405c68e0);
    puStack_190 = &uStack_a8;
    func_0x00014000bee0(&uStack_98,0x140657460);
    puStack_188 = &uStack_98;
    func_0x0001401445d0(param_1,param_2,&uStack_88,6,uRam00000001405c8ef0,&puStack_1b0);
  }
  else {
    uStack_120 = 10;
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_160);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_130;
  return;
}
END DECOMPILED REFERENCE */
