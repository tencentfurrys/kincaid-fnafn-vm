/// @description FNAFN Obj_Office_Back / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Office_Back_Draw_0
// Unconditional shader self-draw (NO game_settings gate, unlike the
// Front_Left/Right/Middle Draws) followed by a warm lensflare pass:
//   <shader setup> (func_0x000140185890(0) — TODO identity, same family as
//   RoundedRoom's 185890(7)/185840() pair; omitted like Main_Back/Draw)
//   var _tex = sprite_get_texture(sprite_index, image_index);
//   (sprite_index/image_index via func_0x00014015f1a0 on slots
//   0x1405c7be8/0x1405c7aa8; 0x1405c8bc0 = sprite_get_texture.)
//   shader_set_uniform_f(shader_get_uniform(SHADER, "u_texel"),
//     texture_get_texel_width(_tex), texture_get_texel_height(_tex));
//   (0x1405c8b10 = shader_get_uniform, 0x1405c8dc0/0x1405c8dd0 =
//   texel_width/height; func_0x000140185920(3, ...) = 3-arg form.)
//   shader_set_uniform_f(shader_get_uniform(SHADER, "u_strength"), V);
//   (func_0x000140185920(2, ...) = 2-arg form.)
//   draw_self();   // func_0x000140175460(param_1)
//   <shader reset> (func_0x000140185840() — TODO identity)
//   draw_set_color($40A0FF);  // func_0x00014018d100 PROVEN draw_set_color
//   (Menu_Pause/Draw); raw C arg 0x40a0ff = warm orange tint — Middle/Draw
//   computes the same pass via make_color_rgb(255, 194, 110)
//   (func_0x0001401756a0 PROVEN make_color_rgb).
//   draw_lensflare(a1..a8);   // direct gml_Script_draw_lensflare 8-arg call
//   draw_set_color(c_white);  // func_0x00014018d100(0xffffff)
// TODO(calibrate): runtime shader id @0x140655760; uniform-name strings
// @0x1405c3e90/@0x1405c3e98; strength const @0x1405c3ea8; the 8
// lensflare consts @0x1405c3eb8/@0x1405c3ec8/@0x1405c3ed8/@0x1405c3ee8
// (x2)/@0x1405c3ef8 (x3) — all below the EXE-CONSTANTS.md dump range.
var _tex = sprite_get_texture(sprite_index, image_index);
shader_set_uniform_f(shader_get_uniform(0, "u_texel"), texture_get_texel_width(_tex), texture_get_texel_height(_tex)); // TODO(calibrate): shader id @0x140655760; uniform @0x1405c3e90
shader_set_uniform_f(shader_get_uniform(0, "u_strength"), 0); // TODO(calibrate): uniform @0x1405c3e98; value @0x1405c3ea8
draw_self();
draw_set_color($40A0FF); // TODO(calibrate): raw C arg 0x40a0ff
draw_lensflare(0, 0, 0, 0, 0, 0, 0, 0); // TODO(calibrate): consts @0x1405c3eb8..@0x1405c3ef8
draw_set_color(c_white);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Back_Draw_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  ulonglong in_stack_fffffffffffffe68;
  undefined4 uVar3;
  undefined8 uVar2;
  ulonglong in_stack_fffffffffffffe70;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
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
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043ae41;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
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
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_50._4_4_ = 0xffffff;
  uStack_58 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uRam0000000140657680 = param_1;
  func_0x000140185890(0);
  uStack_80 = 2;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  in_stack_fffffffffffffe70 = in_stack_fffffffffffffe70 & 0xffffffffffffff00;
  in_stack_fffffffffffffe68 = in_stack_fffffffffffffe68 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_138,in_stack_fffffffffffffe68,
                      in_stack_fffffffffffffe70);
  in_stack_fffffffffffffe68 = in_stack_fffffffffffffe68 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_128,in_stack_fffffffffffffe68,
                      in_stack_fffffffffffffe70 & 0xffffffffffffff00);
  uVar3 = (undefined4)(in_stack_fffffffffffffe68 >> 0x20);
  func_0x000140001490(&uStack_118,&uStack_138);
  puStack_178 = &uStack_118;
  func_0x000140001490(&uStack_108,&uStack_128);
  uVar2 = CONCAT44(uVar3,uRam00000001405c8bc0);
  puStack_170 = &uStack_108;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uVar2,&puStack_178);
  uVar3 = (undefined4)((ulonglong)uVar2 >> 0x20);
  func_0x000140001490(&uStack_188,uVar1);
  uStack_80 = 3;
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
  func_0x00014000bee0(&uStack_118,0x140655760);
  puStack_178 = &uStack_118;
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  func_0x0001401441e0(&uStack_108,0x1405c3e90);
  uVar2 = CONCAT44(uVar3,uRam00000001405c8b10);
  puStack_170 = &uStack_108;
  puStack_168 = &uStack_188;
  puStack_160 = &uStack_188;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uVar2,&puStack_178);
  uVar3 = (undefined4)((ulonglong)uVar2 >> 0x20);
  func_0x000140001490(&uStack_d8,uVar1);
  puStack_158 = &uStack_d8;
  uVar2 = CONCAT44(uVar3,uRam00000001405c8dc0);
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uVar2,&puStack_168);
  uVar3 = (undefined4)((ulonglong)uVar2 >> 0x20);
  func_0x000140001490(&uStack_c8,uVar1);
  puStack_150 = &uStack_c8;
  uVar2 = CONCAT44(uVar3,uRam00000001405c8dd0);
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uVar2,&puStack_160);
  uVar3 = (undefined4)((ulonglong)uVar2 >> 0x20);
  func_0x000140001490(&uStack_b8,uVar1);
  puStack_148 = &uStack_b8;
  func_0x000140185920(3,&puStack_158);
  uStack_80 = 4;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x140655760);
  puStack_178 = &uStack_118;
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  func_0x0001401441e0(&uStack_108,0x1405c3e98);
  puStack_170 = &uStack_108;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,CONCAT44(uVar3,uRam00000001405c8b10),
                              &puStack_178);
  func_0x000140001490(&uStack_f8,uVar1);
  puStack_168 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c3ea8);
  puStack_160 = &uStack_e8;
  func_0x000140185920(2,&puStack_168);
  uStack_80 = 5;
  func_0x000140175460(param_1);
  uStack_80 = 6;
  func_0x000140185840();
  uStack_80 = 8;
  func_0x00014018d100(0x40a0ff);
  uStack_80 = 9;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c3eb8);
  puStack_178 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c3ec8);
  puStack_170 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c3ed8);
  puStack_168 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c3ee8);
  puStack_160 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c3ee8);
  puStack_158 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c3ef8);
  puStack_150 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3ef8);
  puStack_148 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1405c3ef8);
  puStack_140 = &uStack_a8;
  gml_Script_draw_lensflare(param_1,param_2,&uStack_58,8,&puStack_178);
  uStack_80 = 0xb;
  func_0x00014018d100(0xffffff);
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
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
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
