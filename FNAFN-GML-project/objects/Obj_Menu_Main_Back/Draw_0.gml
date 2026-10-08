/// @description FNAFN Obj_Menu_Main_Back / Draw — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Menu_Main_Back / Draw
var _tex = sprite_get_texture(sprite_index, image_index);
shader_set_uniform_f(shader_get_uniform(0, "u_texel"), texture_get_texel_width(_tex), texture_get_texel_height(_tex)); // TODO shader
shader_set_uniform_f(shader_get_uniform(0, "u_strength"), 4.0);
draw_self();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Back_Draw_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  uint in_stack_fffffffffffffe68;
  ulonglong in_stack_fffffffffffffe70;
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
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_118 = &UNK_14043bc30;
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
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_50._4_4_ = 0xffffff;
  uStack_58 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_110 = 1;
  uRam0000000140657680 = param_1;
  func_0x000140185890(0);
  uStack_110 = 2;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  in_stack_fffffffffffffe70 = in_stack_fffffffffffffe70 & 0xffffffffffffff00;
  in_stack_fffffffffffffe68 = in_stack_fffffffffffffe68 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_98,in_stack_fffffffffffffe68,
                      in_stack_fffffffffffffe70);
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_88,
                      in_stack_fffffffffffffe68 & 0xffffff00,
                      in_stack_fffffffffffffe70 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_108,&uStack_98);
  puStack_188 = &uStack_108;
  func_0x000140001490(&uStack_f8,&uStack_88);
  puStack_180 = &uStack_f8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c8bc0,&puStack_188);
  func_0x000140001490(&uStack_130,uVar1);
  uStack_110 = 3;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x140656008);
  puStack_188 = &uStack_108;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c4bf8);
  puStack_180 = &uStack_f8;
  puStack_178 = &uStack_130;
  puStack_170 = &uStack_130;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c8b10,&puStack_188);
  func_0x000140001490(&uStack_c8,uVar1);
  puStack_168 = &uStack_c8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uRam00000001405c8dc0,&puStack_178);
  func_0x000140001490(&uStack_b8,uVar1);
  puStack_160 = &uStack_b8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uRam00000001405c8dd0,&puStack_170);
  func_0x000140001490(&uStack_a8,uVar1);
  puStack_158 = &uStack_a8;
  func_0x000140185920(3,&puStack_168);
  uStack_110 = 4;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x140656008);
  puStack_188 = &uStack_108;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c4c00);
  puStack_180 = &uStack_f8;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c8b10,&puStack_188);
  func_0x000140001490(&uStack_e8,uVar1);
  puStack_178 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c4c10);
  puStack_170 = &uStack_d8;
  func_0x000140185920(2,&puStack_178);
  uStack_110 = 5;
  func_0x000140175460(param_1);
  uStack_110 = 7;
  func_0x000140185840();
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
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