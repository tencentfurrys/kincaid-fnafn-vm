/// @description FNAFN Obj_Office_Front_Left / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Left_Draw_0
// Shader-gated self draw, same shape as Obj_Menu_Main_Back/Draw (whose
// port this mirrors):
//   if (game_settings[4] == <graphics toggle>) {
//       <shader setup> (func_0x000140185890(0) — TODO identity, same
//       family as RoundedRoom's 185890(7)/185840() shader set/reset pair;
//       omitted here like Main_Back/Draw)
//       var _tex = sprite_get_texture(sprite_index, image_index);
//       (sprite_index/image_index read via func_0x00014015f1a0 on slots
//       0x1405c7be8/0x1405c7aa8; 0x1405c8bc0 = sprite_get_texture.)
//       shader_set_uniform_f(shader_get_uniform(SHADER, "u_texel"),
//         texture_get_texel_width(_tex), texture_get_texel_height(_tex));
//       (slots 0x1405c8b10 = shader_get_uniform, 0x1405c8dc0/0x1405c8dd0 =
//       texel_width/height; func_0x000140185920(3, ...) = 3-arg
//       shader_set_uniform_f.)
//       shader_set_uniform_f(shader_get_uniform(SHADER, "u_strength"), V);
//       (func_0x000140185920(2, ...) = 2-arg form.)
//       draw_self();   // func_0x000140175460(param_1)
//       <shader reset> (func_0x000140185840() — TODO identity, pair of above)
//   } else {
//       draw_self();
//   }
// The game_settings[4] element access (id 0x18727, index 4, bounds-checked
// < 5) is 3-way-compared for equality (== 0) against the exe-string const
// @0x1405c4338 — the graphics/shader toggle (cf. game_settings[0] !=
// "disabled" in Transition/Create).
// TODO(calibrate): runtime shader id @0x140655a00; uniform-name strings
// @0x1405c433b/@0x1405c4343 (same position as Right's u_texel/u_strength
// pair); strength value const @0x1405c4350; toggle string @0x1405c4338 —
// all below the EXE-CONSTANTS.md dump range.
if (game_settings[4] == "enabled") { // TODO(calibrate): exe-string const @0x1405c4338
    var _tex = sprite_get_texture(sprite_index, image_index);
    shader_set_uniform_f(shader_get_uniform(0, "u_texel"), texture_get_texel_width(_tex), texture_get_texel_height(_tex)); // TODO(calibrate): shader id @0x140655a00; uniform @0x1405c433b
    shader_set_uniform_f(shader_get_uniform(0, "u_strength"), 0); // TODO(calibrate): uniform @0x1405c4343; value @0x1405c4350
    draw_self();
} else {
    draw_self();
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Front_Left_Draw_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  undefined8 uVar4;
  uint in_stack_fffffffffffffe58;
  ulonglong in_stack_fffffffffffffe60;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined auStack_148 [12];
  uint uStack_13c;
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
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
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
  puStack_88 = &UNK_14043b351;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
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
  uRam0000000140657680 = param_1;
  plVar3 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_80 = 1;
  func_0x0001401453a0(auStack_148,0x1405c4338);
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
  iVar1 = func_0x00014015be60(plVar3,auStack_148,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_148);
  }
  if (iVar1 == 0) {
    uStack_80 = 2;
    func_0x000140185890(0);
    uStack_80 = 4;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    in_stack_fffffffffffffe60 = in_stack_fffffffffffffe60 & 0xffffffffffffff00;
    in_stack_fffffffffffffe58 = in_stack_fffffffffffffe58 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_b0,in_stack_fffffffffffffe58
                        ,in_stack_fffffffffffffe60);
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_a0,
                        in_stack_fffffffffffffe58 & 0xffffff00,
                        in_stack_fffffffffffffe60 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_128,&uStack_b0);
    puStack_198 = &uStack_128;
    func_0x000140001490(&uStack_118,&uStack_a0);
    puStack_190 = &uStack_118;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c8bc0,&puStack_198);
    func_0x000140001490(&uStack_138,uVar4);
    uStack_80 = 5;
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
    func_0x00014000bee0(&uStack_128,0x140655a00);
    puStack_198 = &uStack_128;
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    func_0x0001401441e0(&uStack_118,0x1405c433b);
    puStack_190 = &uStack_118;
    puStack_188 = &uStack_138;
    puStack_180 = &uStack_138;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c8b10,&puStack_198);
    func_0x000140001490(&uStack_e8,uVar4);
    puStack_178 = &uStack_e8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uRam00000001405c8dc0,&puStack_188);
    func_0x000140001490(&uStack_d8,uVar4);
    puStack_170 = &uStack_d8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uRam00000001405c8dd0,&puStack_180);
    func_0x000140001490(&uStack_c8,uVar4);
    puStack_168 = &uStack_c8;
    func_0x000140185920(3,&puStack_178);
    uStack_80 = 6;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    func_0x00014000bee0(&uStack_128,0x140655a00);
    puStack_198 = &uStack_128;
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    func_0x0001401441e0(&uStack_118,0x1405c4343);
    puStack_190 = &uStack_118;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c8b10,&puStack_198);
    func_0x000140001490(&uStack_108,uVar4);
    puStack_188 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c4350);
    puStack_180 = &uStack_f8;
    func_0x000140185920(2,&puStack_188);
    uStack_80 = 7;
    func_0x000140175460(param_1);
    uStack_80 = 8;
    func_0x000140185840();
  }
  else {
    uStack_80 = 0xc;
    func_0x000140175460(param_1);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
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
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
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
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
