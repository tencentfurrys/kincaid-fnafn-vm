/// @description FNAFN Obj_Office_Front_Middle / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Middle_Draw_0
// Gated shader self-draw (unlike Obj_Office_Back/Draw which is
// unconditional) followed by a warm lensflare pass:
//   if (game_settings[4] == "on") (id 0x18727; index 4 via the
//     array-bounds/accessor shape; "on" = exe const @0x1405c5270):
//     var _tex = sprite_get_texture(sprite_index, image_index);
//     (sprite_index/image_index via func_0x00014015f1a0 on slots
//     0x1405c7be8/0x1405c7aa8; 0x1405c8bc0 = sprite_get_texture.)
//     shader_set_uniform_f(shader_get_uniform(SHADER, "u_texel"),
//       texture_get_texel_width(_tex), texture_get_texel_height(_tex));
//     ("u_texel" = @0x1405c5273; 0x1405c8b10 = shader_get_uniform,
//     0x1405c8dc0/0x1405c8dd0 = texel_width/height; 3-arg 185920 form.)
//     shader_set_uniform_f(shader_get_uniform(SHADER, "u_strength"), 3);
//     ("u_strength" = @0x1405c527b; 3.0 = @0x1405c5288; 2-arg form.)
//     draw_self(); // func_0x000140175460(param_1)
//   else draw_self();
//   (func_0x000140185890(0) setup / func_0x000140185840() reset omitted
//   like Obj_Office_Back/Draw and Obj_Menu_Main_Back/Draw — TODO identity.)
//   draw_set_color(make_color_rgb(255, 194, 110));
//     (func_0x0001401756a0 PROVEN make_color_rgb; func_0x00014018d100
//     PROVEN draw_set_color per Obj_Menu_Pause/Draw.)
//   draw_lensflare(1914, -5, 200, 4, 4, 5, 5, 5);
//     (direct gml_Script_draw_lensflare 8-arg call; consts @0x1405c5298
//     =1914.0, @0x1405c52a8=-5.0, @0x1405c52b8=200.0, @0x1405c52c8=4.0 (x2),
//     @0x1405c52d8=5.0 (x3).)
//   draw_set_color(c_white); // 0xffffff
// TODO(calibrate): shader id runtime const @0x140656660 (both uniform
// lookups) — verify in-game.
// Ported: Obj_Office_Front_Middle / Draw
if (game_settings[4] == "on") {
    var _tex = sprite_get_texture(sprite_index, image_index);
    shader_set_uniform_f(shader_get_uniform(0, "u_texel"), texture_get_texel_width(_tex), texture_get_texel_height(_tex)); // TODO(calibrate): shader id runtime const @0x140656660
    shader_set_uniform_f(shader_get_uniform(0, "u_strength"), 3); // TODO(calibrate): shader id runtime const @0x140656660
    draw_self();
} else {
    draw_self();
}
draw_set_color(make_color_rgb(255, 194, 110));
draw_lensflare(1914, -5, 200, 4, 4, 5, 5, 5);
draw_set_color(c_white);
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Front_Middle_Draw_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  undefined8 uVar4;
  ulonglong in_stack_fffffffffffffe38;
  undefined8 uVar5;
  ulonglong in_stack_fffffffffffffe40;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined auStack_198 [12];
  uint uStack_18c;
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
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined *puStack_68;
  undefined4 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_68 = &UNK_14043c5b2;
  uStack_60 = 0;
  uStack_70 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_70;
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
  uRam0000000140657680 = param_1;
  plVar3 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_88 = CONCAT44(0xffffff,(undefined4)uStack_88);
  uStack_90 = 0;
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_60 = 1;
  func_0x0001401453a0(auStack_198,0x1405c5270);
  if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar3);
    if (iVar1 < 5) {
      uVar2 = func_0x000140147990(*plVar3);
      func_0x000140144260(&UNK_140439ca6,4,uVar2);
      plVar3 = (longlong *)0x0;
    }
    else {
      plVar3 = (longlong *)func_0x000140147980(*plVar3,4);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  iVar1 = func_0x00014015be60(plVar3,auStack_198,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_198);
  }
  if (iVar1 == 0) {
    uStack_60 = 2;
    func_0x000140185890(0);
    uStack_60 = 4;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
    in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffffffffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_138,
                        in_stack_fffffffffffffe38,in_stack_fffffffffffffe40);
    in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffffffffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_128,
                        in_stack_fffffffffffffe38,in_stack_fffffffffffffe40 & 0xffffffffffffff00);
    uVar2 = (undefined4)(in_stack_fffffffffffffe38 >> 0x20);
    func_0x000140001490(&uStack_118,&uStack_138);
    puStack_178 = &uStack_118;
    func_0x000140001490(&uStack_108,&uStack_128);
    uVar5 = CONCAT44(uVar2,uRam00000001405c8bc0);
    puStack_170 = &uStack_108;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uVar5,&puStack_178);
    uVar2 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_188,uVar4);
    uStack_60 = 5;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_90 = 0;
    uStack_88 = 0x500000000;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014000bee0(&uStack_118,0x140656660);
    puStack_178 = &uStack_118;
    if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    func_0x0001401441e0(&uStack_108,0x1405c5273);
    uVar5 = CONCAT44(uVar2,uRam00000001405c8b10);
    puStack_170 = &uStack_108;
    puStack_168 = &uStack_188;
    puStack_160 = &uStack_188;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uVar5,&puStack_178);
    uVar2 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_d8,uVar4);
    uVar5 = CONCAT44(uVar2,uRam00000001405c8dc0);
    puStack_158 = &uStack_d8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_90,1,uVar5,&puStack_168);
    uVar2 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_c8,uVar4);
    uVar5 = CONCAT44(uVar2,uRam00000001405c8dd0);
    puStack_150 = &uStack_c8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uVar5,&puStack_160);
    uVar2 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_b8,uVar4);
    puStack_148 = &uStack_b8;
    func_0x000140185920(3,&puStack_158);
    uStack_60 = 6;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    func_0x00014000bee0(&uStack_118,0x140656660);
    puStack_178 = &uStack_118;
    if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    func_0x0001401441e0(&uStack_108,0x1405c527b);
    puStack_170 = &uStack_108;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,CONCAT44(uVar2,uRam00000001405c8b10),
                                &puStack_178);
    func_0x000140001490(&uStack_f8,uVar4);
    puStack_168 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x1405c5288);
    puStack_160 = &uStack_e8;
    func_0x000140185920(2,&puStack_168);
    uStack_60 = 7;
    func_0x000140175460(param_1);
    uStack_60 = 8;
    func_0x000140185840();
  }
  else {
    uStack_60 = 0xc;
    func_0x000140175460(param_1);
  }
  uStack_60 = 0xf;
  uVar2 = func_0x0001401756a0(0xff,0xc2,0x6e);
  func_0x00014018d100(uVar2);
  uStack_60 = 0x10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c5298);
  puStack_178 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c52a8);
  puStack_170 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c52b8);
  puStack_168 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c52c8);
  puStack_160 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c52c8);
  puStack_158 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c52d8);
  puStack_150 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c52d8);
  puStack_148 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1405c52d8);
  puStack_140 = &uStack_a8;
  gml_Script_draw_lensflare(param_1,param_2,&uStack_58,8,&puStack_178);
  uStack_60 = 0x12;
  func_0x00014018d100(0xffffff);
  if ((0x46U >> (uStack_19c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
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
  puRam0000000140657668 = (undefined8 *)uStack_70;
  return;
}
END DECOMPILED REFERENCE */
