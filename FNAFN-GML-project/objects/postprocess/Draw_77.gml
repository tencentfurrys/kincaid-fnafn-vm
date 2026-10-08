/// @description FNAFN postprocess / Draw — PORTED from C
// Ground truth: gml_Object_postprocess_Draw_77 (2418 B @0x1400ab180)
// Decoded, in order (uStack_a0 = GML line markers):
//   2. draw_enable_alphablend(<runtime @0x140656310>) (id 0x18713;
//      1-arg funcid call shape 0x140144700).
//   4. var _pos = application_get_position() (slot 0x1405c8f60, 0 args).
//   if (fxaa_on) (id 0x18722):
//     7. (shader setup 0x140185890(0) omitted like Office_Back/Draw —
//        TODO identity.)
//     8. var _tex = surface_get_texture(application_surface)
//        (application_surface slot 0x1405c7ba8; slot 0x1405c8f70).
//     9. shader_set_uniform_f(shader_get_uniform(SHADER, "u_texel"),
//        texture_get_texel_width(_tex), texture_get_texel_height(_tex));
//        ("u_texel" = @0x1405c4db8; SHADER runtime @0x140656310;
//        3-arg 185920 form.)
//     10. shader_set_uniform_f(shader_get_uniform(SHADER, "u_strength"),
//        fxaa_strength); (id 0x18723; "u_strength" = @0x1405c4dc0;
//        SHADER runtime @0x140656310; 2-arg form.)
//   0xd. draw_surface(application_surface, _pos[0], _pos[1])
//        (slot 0x1405c8ab0; _pos[0]/[1] via the array-bounds/accessor
//        shape with "index out of bounds" / "not an array" guards).
//   0xf. draw_enable_alphablend(true) (1.0 = @0x1405c4dd0).
//   if (fxaa_on) shader_reset(); (0x140185840 best-fit; the C only
//     re-fetches draw_enable_alphablend/fxaa_on around it.)
// TODO(calibrate): shader id + first alphablend arg runtime const
// @0x140656310 (not in the mapped exe image); func_0x000140185890 /
// func_0x000140185840 best-fit shader_set/shader_reset — prove via
// disassembly; verify in-game.
// Ported: postprocess / Draw_77
draw_enable_alphablend(false); // TODO(calibrate): arg is runtime const @0x140656310
var _pos = application_get_position();
if (fxaa_on) {
    var _tex = surface_get_texture(application_surface);
    shader_set_uniform_f(shader_get_uniform(0, "u_texel"), texture_get_texel_width(_tex), texture_get_texel_height(_tex)); // TODO(calibrate): shader id runtime const @0x140656310
    shader_set_uniform_f(shader_get_uniform(0, "u_strength"), fxaa_strength); // TODO(calibrate): shader id runtime const @0x140656310
}
draw_surface(application_surface, _pos[0], _pos[1]);
draw_enable_alphablend(true);
if (fxaa_on) {
    shader_reset(); // TODO(calibrate): func_0x000140185840 best-fit shader_reset
}
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// ground truth: gml_Object_postprocess_Draw_77 (2418 B @0x1400ab180)
/* BEGIN DECOMPILED REFERENCE
void gml_Object_postprocess_Draw_77(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  longlong *plVar6;
  longlong *plVar7;
  undefined4 uVar9;
  undefined8 uVar8;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  undefined8 uStack_180;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
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
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  longlong lStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043bed5;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
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
  uStack_5c = 0xffffff;
  lStack_68 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_80 = CONCAT44(0xffffff,(undefined4)uStack_80);
  uStack_88 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_a0 = 2;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plRam0000000140657680 = param_1;
  uStack_188 = (**(code **)(*param_1 + 8))(param_1,0x18713);
  func_0x00014000bee0(&uStack_128,0x140656310);
  uVar4 = uStack_188;
  puStack_168 = &uStack_128;
  func_0x000140144700(param_1,param_2,&uStack_58,1,uStack_188,&puStack_168);
  uVar9 = (undefined4)((ulonglong)uVar4 >> 0x20);
  uStack_a0 = 4;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  uVar5 = CONCAT44(uVar9,uRam00000001405c8f60);
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,0,uVar5,0);
  uVar9 = (undefined4)((ulonglong)uVar5 >> 0x20);
  plVar7 = &lStack_68;
  func_0x000140001490(plVar7,uVar4);
  uStack_180 = (**(code **)(*param_1 + 8))(param_1,0x18722);
  cVar1 = func_0x00014012bb70(uStack_180);
  if (cVar1 != '\0') {
    uStack_a0 = 7;
    func_0x000140185890(0);
    uStack_a0 = 8;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_98);
    func_0x000140001490(&uStack_128,&uStack_98);
    uVar5 = CONCAT44(uVar9,uRam00000001405c8f70);
    puStack_168 = &uStack_128;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uVar5,&puStack_168);
    uVar9 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_178,uVar4);
    uStack_a0 = 9;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
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
    func_0x00014000bee0(&uStack_128,0x140656310);
    puStack_168 = &uStack_128;
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    func_0x0001401441e0(&uStack_118,0x1405c4db8);
    uVar5 = CONCAT44(uVar9,uRam00000001405c8b10);
    puStack_160 = &uStack_118;
    puStack_158 = &uStack_178;
    puStack_150 = &uStack_178;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uVar5,&puStack_168);
    uVar9 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_e8,uVar4);
    uVar5 = CONCAT44(uVar9,uRam00000001405c8dc0);
    puStack_148 = &uStack_e8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,uVar5,&puStack_158);
    uVar9 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_d8,uVar4);
    uVar5 = CONCAT44(uVar9,uRam00000001405c8dd0);
    puStack_140 = &uStack_d8;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uVar5,&puStack_150);
    uVar9 = (undefined4)((ulonglong)uVar5 >> 0x20);
    func_0x000140001490(&uStack_c8,uVar4);
    puStack_138 = &uStack_c8;
    func_0x000140185920(3,&puStack_148);
    uStack_a0 = 10;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18723);
    func_0x00014000bee0(&uStack_128,0x140656310);
    puStack_168 = &uStack_128;
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    func_0x0001401441e0(&uStack_118,0x1405c4dc0);
    uVar8 = CONCAT44(uVar9,uRam00000001405c8b10);
    puStack_160 = &uStack_118;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_58,2,uVar8,&puStack_168);
    uVar9 = (undefined4)((ulonglong)uVar8 >> 0x20);
    func_0x000140001490(&uStack_108,uVar5);
    puStack_158 = &uStack_108;
    func_0x000140001490(&uStack_f8,uVar4);
    puStack_150 = &uStack_f8;
    func_0x000140185920(2,&puStack_158);
  }
  uStack_a0 = 0xd;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_98);
  func_0x000140001490(&uStack_128,&uStack_98);
  puStack_168 = &uStack_128;
  if (((uStack_5c & 0xffffff) == 2) && (lStack_68 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(lStack_68);
    if (iVar2 < 1) {
      uVar3 = func_0x000140147990(lStack_68);
      plVar6 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(lStack_68,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar6 = &lStack_68;
  }
  func_0x000140001490(&uStack_118,plVar6);
  puStack_160 = &uStack_118;
  if (((uStack_5c & 0xffffff) == 2) && (lStack_68 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(lStack_68);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(lStack_68);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar7 = (longlong *)0x0;
    }
    else {
      plVar7 = (longlong *)func_0x000140147980(lStack_68,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_108,plVar7);
  puStack_158 = &uStack_108;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,CONCAT44(uVar9,uRam00000001405c8ab0),&puStack_168
                     );
  uStack_a0 = 0xf;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_128,0x1405c4dd0);
  puStack_168 = &uStack_128;
  func_0x000140144700(param_1,param_2,&uStack_58,1,uStack_188,&puStack_168);
  cVar1 = func_0x00014012bb70(uStack_180);
  if (cVar1 != '\0') {
    uStack_a0 = 0x12;
    (**(code **)(*param_1 + 8))(param_1,0x18713);
    (**(code **)(*param_1 + 8))(param_1,0x18722);
    func_0x000140185840();
  }
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  if ((0x46U >> (uStack_19c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_68);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
