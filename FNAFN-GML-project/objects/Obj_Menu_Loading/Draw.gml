/// @description FNAFN Obj_Menu_Loading / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Loading_Draw_75 (2887 B @0x140092560)
// The loading screen: rotating spinner + "n/m" progress label, both pinned
// near the bottom of the screen. uStack_108 = 1..9 are GML source-line
// markers. Decoded in order:
//   line 1: make_color_rgb(225, 0, 220) — func_0x0001401756a0(r,g,b)
//     (PROVEN in Obj_Menu_Pause/Draw). 0xe1=225, 0xdc=220. Computed once
//     and reused as c1..c4, so it is a local in the port.
//   line 2: func_0x000140175520(0) = draw_set_font(0). DISASSEMBLY-CONFIRMED
//     2026-10-07: 0x140175520 thunks to 0x1402a8630, which validates the id
//     via the resource check and stores it (else -1) — exactly draw_set_font.
//   lines 3-4: func_0x000140175530(1) / 0x140175540(1) = the two draw
//     ALIGNMENT setters — DISASSEMBLY-CONFIRMED: both thunk to tiny routines
//     that map 0/1/2 to 0/1/2 written into two adjacent enum dwords in the
//     draw state (@0x140891fb0 / @0x140891fb4). They sit in the runner's
//     table immediately after draw_set_font, matching the manual order
//     draw_set_font / draw_set_halign / draw_set_valign, and the (1,1) then
//     (0,0) set/reset mirrors the manual's fa_center/fa_middle example:
//       0x140175530 = draw_set_halign (0=fa_left, 1=fa_center, 2=fa_right)
//       0x140175540 = draw_set_valign (0=fa_top, 1=fa_middle, 2=fa_bottom)
//     (halign-vs-valign assignment is by table order; TODO(calibrate) if a
//     reader of the two dwords is ever found.)
//   line 5: draw_sprite_ext(Spr_Menu_Loading_Spinner, 0, 80, y, 1, 1,
//     spinner_angle, c_white, alpha). Sprite id 0xe = 14 = SPRT chunk index
//     14 (sprite_names.json). x = the f32 const at 0x14043b894 = 80.0
//     (stored in .rdata 4 bytes before this function's profiler-name
//     string). y = surface_get_height(application_surface) - 84:
//     application_surface = slot 0x1405c7ba8 read via the property-read
//     helper, surface_get_height = slot 0x1405c8af0, and the subtract-
//     constant helper func_0x00014002fc60(dest, src, N) = dest = src - N
//     (PROVEN by disassembly: copies src, converts N, tail-calls the -=
//     helper). N = 0x54 = 84.
//   line 6: draw_text_transformed_colour(84, surface_get_height(
//     application_surface) - 84, <string>, 0.7, 0.7, <angle>, _col, _col,
//     _col, _col, alpha). ARGUMENT ORDER NOTE (PROVEN 2026-10-07): the
//     manual's signature is draw_text_transformed_colour(x, y, string,
//     xscale, yscale, angle, c1, c2, c3, c4, alpha) — the string is THIRD,
//     not first. This was cross-checked against three call sites
//     (this one, Obj_Night_Music_Switch/Draw draw_text_colour, and
//     Obj_Menu_Options/Draw draw_text_transformed) and the instance_create_
//     layer arg-chain convention (the call performer 0x1401445d0 collects
//     args ascending from the head pointer, so head[0] is arg1).
//     The string = string(Load_Increment) + "/" + string(array_length(
//     Load_Asset) - 1) — the "/" string const @0x1405c49a8 plus two string()
//     calls (slot 0x1405c8840) joined by the ADD helper 0x140005290 (= +
//     for strings). 0.7 = the double @0x1405c49c0; the angle is runtime
//     pool const @0x140655d00 (TODO(calibrate)).
//   lines 7-9: draw_set_halign(fa_left) + draw_set_valign(fa_top) — the
//     state reset (0x140175530(0) / 0x140175540(0)).
var _col = make_color_rgb(225, 0, 220);
draw_set_font(0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_ext(Spr_Menu_Loading_Spinner, 0, 80, surface_get_height(application_surface) - 84, 1, 1, spinner_angle, c_white, alpha);
draw_text_transformed_colour(84, surface_get_height(application_surface) - 84, string(Load_Increment) + "/" + string(array_length(Load_Asset) - 1), 0.7, 0.7, 0 /* TODO(calibrate): runtime const @0x140655d00 (text angle) */, _col, _col, _col, _col, alpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_Loading_Draw_75(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  int iVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  double *pdVar6;
  undefined4 uVar7;
  undefined4 uVar8;
  undefined8 uVar9;
  undefined4 uVar11;
  undefined4 uVar12;
  double dVar10;
  undefined8 **ppuVar13;
  undefined4 uVar14;
  undefined8 *puStack_298;
  undefined8 *puStack_290;
  undefined8 *puStack_288;
  undefined8 *puStack_280;
  undefined8 *puStack_278;
  undefined8 *puStack_270;
  undefined8 *puStack_268;
  undefined8 *puStack_260;
  undefined8 *puStack_258;
  undefined8 *puStack_250;
  double *pdStack_248;
  double *pdStack_240;
  double *pdStack_238;
  double *pdStack_230;
  undefined8 *puStack_228;
  undefined auStack_218 [12];
  uint uStack_20c;
  undefined8 uStack_208;
  uint uStack_1fc;
  undefined8 uStack_1f8;
  uint uStack_1ec;
  undefined8 uStack_1e8;
  uint uStack_1dc;
  undefined8 uStack_1d8;
  uint uStack_1cc;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  undefined *puStack_110;
  undefined4 uStack_108;
  undefined8 uStack_100;
  uint uStack_f4;
  double dStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  double dStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  undefined8 uStack_88;
  double dStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  
  uStack_70 = 0xfffffffffffffffe;
  puStack_110 = &UNK_14043b898;
  uStack_118 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_118;
  uStack_1fc = 0xffffff;
  uStack_208 = 0;
  uStack_1ec = 0xffffff;
  uStack_1f8 = 0;
  uStack_1dc = 0xffffff;
  uStack_1e8 = 0;
  uStack_1cc = 0xffffff;
  uStack_1d8 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_e4 = 0xffffff;
  dStack_f0 = 0.0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_88 = CONCAT44(0xffffff,(undefined4)uStack_88);
  uStack_90 = 0;
  uStack_d8 = CONCAT44(0xffffff,(undefined4)uStack_d8);
  uStack_e0 = 0;
  uStack_c8 = CONCAT44(0xffffff,(undefined4)uStack_c8);
  uStack_d0 = 0;
  uStack_b8 = CONCAT44(0xffffff,(undefined4)uStack_b8);
  uStack_c0 = 0;
  uStack_a8 = CONCAT44(0xffffff,(undefined4)uStack_a8);
  uStack_b0 = 0;
  uStack_108 = 1;
  plRam0000000140657680 = param_1;
  iVar2 = func_0x0001401756a0(0xe1,0,0xdc);
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_f0);
  }
  uStack_e4 = 0;
  dStack_f0 = (double)iVar2;
  uStack_108 = 2;
  func_0x000140175520(0);
  uStack_108 = 3;
  func_0x000140175530(1);
  uStack_108 = 4;
  func_0x000140175540(1);
  uStack_108 = 5;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  puVar3 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18772);
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x186da);
  func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_100);
  func_0x000140001490(&uStack_208,&uStack_100);
  puStack_298 = &uStack_208;
  if ((*(uint *)((longlong)puVar4 + 0xc) & 0xffffff) == 0) {
    uVar7 = (undefined4)*puVar4;
    uVar11 = (undefined4)((ulonglong)*puVar4 >> 0x20);
    uVar1 = *(uint *)((longlong)puVar3 + 0xc);
  }
  else {
    uVar9 = func_0x00014012d320(puVar4);
    uVar7 = (undefined4)uVar9;
    uVar11 = (undefined4)((ulonglong)uVar9 >> 0x20);
    uVar1 = *(uint *)((longlong)puVar3 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    uVar8 = (undefined4)*puVar3;
    uVar12 = (undefined4)((ulonglong)*puVar3 >> 0x20);
  }
  else {
    uVar9 = func_0x00014012d320(puVar3);
    uVar8 = (undefined4)uVar9;
    uVar12 = (undefined4)((ulonglong)uVar9 >> 0x20);
  }
  ppuVar13 = &puStack_298;
  uVar9 = func_0x0001401445d0(param_1,param_2,&uStack_90,1,uRam00000001405c8af0,&puStack_298);
  uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
  func_0x00014002fc60(&dStack_80,uVar9,0x54);
  dVar10 = dStack_80;
  if ((uStack_74 & 0xffffff) != 0) {
    dVar10 = (double)func_0x00014012d320(&dStack_80);
  }
  func_0x0001401755c0(param_1,0xe,0,_UNK_14043b894,(float)dVar10,CONCAT44(uVar14,0x3f800000),
                      0x3f800000,(float)(double)CONCAT44(uVar12,uVar8),0xffffff,
                      (float)(double)CONCAT44(uVar11,uVar7));
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_80);
  }
  uStack_108 = 6;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  uStack_e0 = 0;
  uStack_d8 = 0x500000000;
  if ((0x46U >> (uStack_c8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  uStack_d0 = 0;
  uStack_c8 = 0x500000000;
  if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  uStack_c0 = 0;
  uStack_b8 = 0x500000000;
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  uStack_b0 = 0;
  uStack_a8 = 0x500000000;
  uVar9 = (**(code **)(*param_1 + 8))(param_1,0x18732);
  uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1872f);
  func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_100);
  func_0x000140001490(&uStack_208,&uStack_100);
  puStack_298 = &uStack_208;
  func_0x000140001490(&uStack_1f8,uVar9);
  puStack_290 = &uStack_1f8;
  func_0x000140001490(&uStack_1e8,uVar5);
  puStack_288 = &uStack_1e8;
  uVar9 = func_0x0001401445d0(param_1,param_2,&uStack_b0,1,uRam00000001405c8ba0,&puStack_288);
  func_0x00014002fc60(&dStack_80,uVar9,1);
  func_0x000140001490(&uStack_1d8,&dStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_80);
  }
  puStack_280 = &uStack_1d8;
  func_0x00014000bee0(&uStack_1c8,0x1405c49b0);
  puStack_278 = &uStack_1c8;
  uVar9 = func_0x0001401445d0(param_1,param_2,&uStack_e0,1,uRam00000001405c8af0,&puStack_298);
  func_0x00014002fc60(&dStack_80,uVar9,0x54);
  func_0x000140001490(&uStack_1b8,&dStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_80);
  }
  puStack_270 = &uStack_1b8;
  uVar9 = func_0x0001401445d0(param_1,param_2,&uStack_c0,1,uRam00000001405c8840,&puStack_280);
  func_0x0001401453a0(auStack_218,0x1405c49a8);
  pdVar6 = (double *)
           func_0x0001401445d0(param_1,param_2,&uStack_d0,1,uRam00000001405c8840,&puStack_290);
  uStack_94 = *(uint *)((longlong)pdVar6 + 0xc);
  uStack_98 = *(undefined4 *)(pdVar6 + 1);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
    dStack_a0 = *pdVar6;
  }
  else {
    func_0x000140093a20(&dStack_a0,pdVar6);
  }
  func_0x000140005290(&dStack_a0,auStack_218);
  uStack_74 = uStack_94;
  uStack_78 = uStack_98;
  if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
    dStack_80 = dStack_a0;
  }
  else {
    func_0x000140093a20(&dStack_80,&dStack_a0);
  }
  func_0x000140005290(&dStack_80,uVar9);
  func_0x000140001490(&uStack_1a8,&dStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_80);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  if ((0x46U >> (uStack_20c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_218);
  }
  puStack_268 = &uStack_1a8;
  func_0x00014000bee0(&uStack_198,0x1405c49c0);
  puStack_260 = &uStack_198;
  func_0x00014000bee0(&uStack_188,0x1405c49c0);
  puStack_258 = &uStack_188;
  func_0x00014000bee0(&uStack_178,0x140655d00);
  pdStack_248 = &dStack_f0;
  puStack_250 = &uStack_178;
  pdStack_240 = pdStack_248;
  pdStack_238 = pdStack_248;
  pdStack_230 = pdStack_248;
  func_0x000140001490(&uStack_128,puVar4);
  puStack_228 = &uStack_128;
  func_0x0001401445d0(param_1,param_2,&uStack_90,0xb,uRam00000001405c8f20,&puStack_278);
  uStack_108 = 7;
  func_0x000140175530(0);
  uStack_108 = 9;
  func_0x000140175540(0);
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_f0);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
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
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d8);
  }
  if ((0x46U >> (uStack_1dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1e8);
  }
  if ((0x46U >> (uStack_1ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1f8);
  }
  if ((0x46U >> (uStack_1fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_208);
  }
  puRam0000000140657668 = (undefined8 *)uStack_118;
  return;
}
END DECOMPILED REFERENCE */
