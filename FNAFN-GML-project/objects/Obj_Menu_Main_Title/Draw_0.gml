/// @description FNAFN Obj_Menu_Main_Title / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Title_Draw_0 (3019 B @0x140104860)
// Decoded, in order (uStack_80 = GML line markers):
//   star_alpha[0/1] array reads (id 0x18773, +8 self; index bounds-checked)
//     feed the alpha of two draw_sprite_ext calls (helper 0x1401755c0):
//     sprite 0x4c = 76 = Spr_Menu_Main_Stars (sprite_names.json),
//     subimg 0, x = _UNK_14043d57c (TODO calibrate below), y = 81.0
//     (0x42a20000 f32) and 202.0 (0x434a0000 f32), xscale/yscale 1.0
//     (0x3f800000 f32), rot 0, colour c_white (0xffffff).
//   surface (id 0x1877a) via 1-arg slot 0x1405c8a50 (surface_exists);
//     if missing: surface = surface_create(room_width, room_height)
//     [slots 0x1405c7b08/0x1405c7b18 via 0x14015ef90; EXE-REGISTRY.md].
//   0x1401756b0(surface) = surface_set_target(surface) (best fit: 1-arg
//     surface-id builtin before drawing; calibrate in-game).
//   0x14018d0b0((float)draw_alpha) = draw_set_alpha(draw_alpha)
//     [draw_alpha id 0x18712]; 0x140175520(game_font[0]) =
//     draw_set_font(game_font[0]) [game_font id 0x18725; proven by
//     Obj_Game_Over/Draw]; 0x1401756a0(0xff,0,0x6e)+0x14018d100 =
//     draw_set_color(make_color_rgb(255,0,110)) (same as Game_Over).
//   4x draw_text(x, y, text_menu[i]) [slot 0x1405c8da0; text_menu id
//     0x1878b]: (94,340),(94,385),(94,430),(94,475) from exe consts
//     0x1405c6370=94.0, 0x1405c6380=340.0, 0x1405c6390=385.0,
//     0x1405c63a0=430.0, 0x1405c63b0=475.0 (EXE-CONSTANTS.md).
//   0x140183c00() = surface_reset_target() (no-arg cleanup before the
//     surface is drawn; calibrate); draw_surface(surface, <runtime>,
//     <runtime>) [slot 0x1405c8ab0; both coords are runtime const
//     @0x140657168, TODO calibrate]; 0x140175460(param) = draw_self().
// TODO(calibrate): star x (_UNK_14043d57c, same const both draws — likely
//   0); draw_surface x/y (@0x140657168 x2 — likely 0,0 by convention).
draw_sprite_ext(Spr_Menu_Main_Stars, 0, 0 /* TODO(calibrate): _UNK_14043d57c */, 81, 1, 1, 0, c_white, star_alpha[0]);
draw_sprite_ext(Spr_Menu_Main_Stars, 0, 0 /* TODO(calibrate): _UNK_14043d57c */, 202, 1, 1, 0, c_white, star_alpha[1]);
if (!surface_exists(surface)) {
    surface = surface_create(room_width, room_height);
}
surface_set_target(surface);
draw_set_alpha(draw_alpha);
draw_set_font(game_font[0]);
draw_set_color(make_color_rgb(255, 0, 110));
draw_text(94, 340, text_menu[0]);
draw_text(94, 385, text_menu[1]);
draw_text(94, 430, text_menu[2]);
draw_text(94, 475, text_menu[3]);
surface_reset_target();
draw_surface(surface, 0 /* TODO(calibrate): const @0x140657168 */, 0 /* TODO(calibrate): const @0x140657168 */);
draw_self();

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Main_Title_Draw_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  double *pdVar6;
  double *pdVar7;
  undefined8 uVar8;
  double *pdVar9;
  longlong *plVar10;
  double dVar11;
  undefined8 in_stack_fffffffffffffeb0;
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
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 *puStack_78;
  undefined8 *puStack_70;
  undefined8 *puStack_68;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uVar5 = (undefined4)((ulonglong)in_stack_fffffffffffffeb0 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043d580;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  plRam0000000140657680 = param_1;
  pdVar6 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_98 = CONCAT44(0xffffff,(undefined4)uStack_98);
  uStack_a0 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  pdVar7 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18773);
  if (((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 2) && (*pdVar7 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar7);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*pdVar7);
      pdVar7 = (double *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
      goto code_r0x0001401049cb;
    }
    pdVar7 = (double *)func_0x000140147980(*pdVar7,0);
    if ((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) != 0) goto code_r0x0001401049d4;
code_r0x0001401049de:
    dVar11 = *pdVar7;
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
code_r0x0001401049cb:
    if ((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 0) goto code_r0x0001401049de;
code_r0x0001401049d4:
    dVar11 = (double)func_0x00014012d320(pdVar7);
  }
  uVar8 = CONCAT44(uVar5,0x3f800000);
  func_0x0001401755c0(param_1,0x4c,0,_UNK_14043d57c,0x42a20000,uVar8,0x3f800000,0,0xffffff,
                      (float)dVar11);
  uVar5 = (undefined4)((ulonglong)uVar8 >> 0x20);
  uStack_80 = 2;
  pdVar7 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18773);
  if (((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 2) && (*pdVar7 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar7);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*pdVar7);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      pdVar7 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x000140104a99;
    }
    pdVar7 = (double *)func_0x000140147980(*pdVar7,1);
    if ((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 0) goto code_r0x000140104ac9;
code_r0x000140104a9b:
    dVar11 = (double)func_0x00014012d320(pdVar7);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)pdVar7 + 0xc);
joined_r0x000140104a99:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x000140104a9b;
code_r0x000140104ac9:
    dVar11 = *pdVar7;
  }
  func_0x0001401755c0(param_1,0x4c,0,_UNK_14043d57c,0x434a0000,CONCAT44(uVar5,0x3f800000),0x3f800000
                      ,0,0xffffff,(float)dVar11);
  uStack_80 = 4;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  pdVar7 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1877a);
  func_0x000140001490(&uStack_d8,pdVar7);
  puStack_78 = &uStack_d8;
  uVar8 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8a50,&puStack_78);
  cVar2 = func_0x00014012bb70(uVar8);
  if (cVar2 == '\0') {
    uStack_80 = 6;
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_a0 = 0;
    uStack_98 = 0x500000000;
    pdVar7 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x1877a);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_f8);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_e8);
    func_0x000140001490(&uStack_c8,&uStack_f8);
    puStack_70 = &uStack_c8;
    func_0x000140001490(&uStack_b8,&uStack_e8);
    puStack_68 = &uStack_b8;
    uVar8 = func_0x0001401445d0(param_1,param_2,&uStack_a0,2,uRam00000001405c8a60,&puStack_70);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdVar7,uVar8);
    func_0x000140141c50(1);
  }
  uStack_80 = 9;
  if ((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdVar7;
  }
  else {
    dVar11 = (double)func_0x00014012d320(pdVar7);
  }
  func_0x0001401756b0((longlong)dVar11);
  uStack_80 = 10;
  pdVar9 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18712);
  if ((*(uint *)((longlong)pdVar9 + 0xc) & 0xffffff) == 0) {
    dVar11 = *pdVar9;
  }
  else {
    dVar11 = (double)func_0x00014012d320(pdVar9);
  }
  func_0x00014018d0b0((float)dVar11);
  uStack_80 = 0xb;
  if (((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 2) && (*pdVar6 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar6);
    if (0 < iVar3) {
      pdVar6 = (double *)func_0x000140147980(*pdVar6,0);
      uVar1 = *(uint *)((longlong)pdVar6 + 0xc);
      goto joined_r0x000140104d61;
    }
    uVar5 = func_0x000140147990(*pdVar6);
    pdVar6 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar5);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar1 = *(uint *)((longlong)pdVar6 + 0xc);
joined_r0x000140104d61:
  if ((uVar1 & 0xffffff) == 0) {
    dVar11 = *pdVar6;
  }
  else {
    dVar11 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x000140175520((longlong)dVar11);
  uStack_80 = 0xd;
  uVar5 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar5);
  uStack_80 = 0xf;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar10 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
  func_0x00014000bee0(&uStack_d8,0x1405c6370);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c6380);
  puStack_70 = &uStack_c8;
  if (((*(uint *)((longlong)plVar10 + 0xc) & 0xffffff) == 2) && (*plVar10 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar10);
    if (iVar3 < 1) {
      uVar5 = func_0x000140147990(*plVar10);
      plVar10 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar5);
    }
    else {
      plVar10 = (longlong *)func_0x000140147980(*plVar10,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar10);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar10 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
  func_0x00014000bee0(&uStack_d8,0x1405c6370);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c6390);
  if (((*(uint *)((longlong)plVar10 + 0xc) & 0xffffff) == 2) && (*plVar10 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar10);
    if (iVar3 < 2) {
      uVar5 = func_0x000140147990(*plVar10);
      func_0x000140144260(&UNK_140439ca6,1,uVar5);
      plVar10 = (longlong *)0x0;
    }
    else {
      plVar10 = (longlong *)func_0x000140147980(*plVar10,1);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar10);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar10 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
  func_0x00014000bee0(&uStack_d8,0x1405c6370);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c63a0);
  if (((*(uint *)((longlong)plVar10 + 0xc) & 0xffffff) == 2) && (*plVar10 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar10);
    if (iVar3 < 3) {
      uVar5 = func_0x000140147990(*plVar10);
      func_0x000140144260(&UNK_140439ca6,2,uVar5);
      plVar10 = (longlong *)0x0;
    }
    else {
      plVar10 = (longlong *)func_0x000140147980(*plVar10,2);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar10);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x12;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar10 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
  func_0x00014000bee0(&uStack_d8,0x1405c6370);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c63b0);
  if (((*(uint *)((longlong)plVar10 + 0xc) & 0xffffff) == 2) && (*plVar10 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar10);
    if (iVar3 < 4) {
      uVar5 = func_0x000140147990(*plVar10);
      func_0x000140144260(&UNK_140439ca6,3,uVar5);
      plVar10 = (longlong *)0x0;
    }
    else {
      plVar10 = (longlong *)func_0x000140147980(*plVar10,3);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar10);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x13;
  func_0x000140183c00();
  uStack_80 = 0x14;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x000140001490(&uStack_d8,pdVar7);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x140657168);
  puStack_70 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x140657168);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8ab0,&puStack_78);
  uStack_80 = 0x17;
  func_0x000140175460(param_1);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
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
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
