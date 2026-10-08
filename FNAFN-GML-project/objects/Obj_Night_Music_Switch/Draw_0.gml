/// @description FNAFN Obj_Night_Music_Switch / Draw — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Music_Switch / Draw
draw_set_font(0);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_colour(2305, 410, "track #" + string(selection), c_white, c_white, c_white, c_white, text_alpha);
draw_self();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Music_Switch_Draw_0(longlong *param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
  uint uStack_124;
  undefined8 uStack_120;
  undefined *puStack_118;
  undefined4 uStack_110;
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
  uint uStack_7c;
  undefined8 uStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined4 uStack_40;
  uint uStack_3c;
  undefined8 uStack_38;
  
  uStack_38 = 0xfffffffffffffffe;
  puStack_118 = &UNK_14043d247;
  uStack_110 = 0;
  uStack_120 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_120;
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
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_60._4_4_ = 0xffffff;
  uStack_68 = 0;
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  plRam0000000140657680 = param_1;
  func_0x000140175520(0);
  uStack_110 = 2;
  func_0x000140175530(1);
  uStack_110 = 3;
  func_0x00014018d100(0xffffff);
  uStack_110 = 4;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  uVar1 = (**(code **)(*param_1 + 8))(param_1,0x1876f);
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18787);
  func_0x000140001490(&uStack_108,uVar1);
  puStack_198 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5f80);
  puStack_190 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c5f90);
  puStack_188 = &uStack_e8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8840,&puStack_198);
  func_0x0001401453a0(&uStack_78,0x1405c5f78);
  uStack_3c = uStack_6c;
  uStack_40 = uStack_70;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
    uStack_48 = uStack_78;
  }
  else {
    func_0x0001400f6b90(&uStack_48,&uStack_78);
  }
  func_0x000140005290(&uStack_48,uVar1);
  func_0x000140001490(&uStack_d8,&uStack_48);
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puStack_180 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5fa0);
  puStack_178 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c5fa0);
  puStack_170 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1405c5fa0);
  puStack_168 = &uStack_a8;
  func_0x00014000bee0(&uStack_98,0x1405c5fa0);
  puStack_160 = &uStack_98;
  func_0x000140001490(&uStack_88,uVar2);
  puStack_158 = &uStack_88;
  func_0x0001401445d0(param_1,param_2,&uStack_68,8,uRam00000001405c8fe0,&puStack_190);
  uStack_110 = 6;
  func_0x000140175460(param_1);
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
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
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  puRam0000000140657668 = (undefined8 *)uStack_120;
  return;
}
END DECOMPILED REFERENCE */