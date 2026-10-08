/// @description FNAFN Obj_Menu_Customize / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Customize_Draw_0 (3363 B @0x1400e3960)
// Custom-night roster draw: surface setup, backdrop sprite, "customize"
// title, the six text_figure labels, then present + draw_self. Same surface
// scaffold as the ported Obj_Menu_Main_Title/Draw. Id map: surface 0x1877a,
// draw_alpha 0x18712, game_font 0x18725 (global), text_figure 0x1878a.
// Slots: 0x1405c8a50 = surface_exists, 0x1405c8a60 = surface_create,
// 0x1405c7b08/0x1405c7b18 = room_width/room_height, 0x1405c8da0 = draw_text,
// 0x1405c8ab0 = draw_surface. Exe consts: title at (32, 185) = "customize"
// (@0x1405c5a98/@0x1405c5aa8/@0x1405c5a88); rows x = 94 (@0x1405c5ab8),
// y = 340/385/430/475/520/565 (@0x1405c5ac8..@0x1405c5b18); color
// make_color_rgb(255, 0, 110) (0xff/0/0x6e, same as Main_Title/Game_Over).
// TODO(calibrate): helper 0x140175550(param, 42, 0, 0, 0) best-fit
// draw_sprite(Spr_Menu_Fade_Overlay, 0, 0, 0) (42 = Spr_Menu_Fade_Overlay);
// draw_surface coords are runtime const @0x140656e60 (assumed 0, 0).
if (!surface_exists(surface)) {
    surface = surface_create(room_width, room_height);
}
surface_set_target(surface);
draw_sprite(Spr_Menu_Fade_Overlay, 0, 0, 0); // TODO(calibrate): helper 0x140175550 shape — best-fit draw_sprite; verify in-game
draw_set_font(game_font[1]);
draw_set_alpha(draw_alpha);
draw_text(32, 185, "customize");
draw_set_font(game_font[0]);
draw_set_color(make_color_rgb(255, 0, 110));
draw_text(94, 340, text_figure[0]);
draw_text(94, 385, text_figure[1]);
draw_text(94, 430, text_figure[2]);
draw_text(94, 475, text_figure[3]);
draw_text(94, 520, text_figure[4]);
draw_text(94, 565, text_figure[5]);
surface_reset_target();
draw_surface(surface, 0, 0); // TODO(calibrate): coords are runtime const @0x140656e60
draw_self();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Customize_Draw_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  double *pdVar5;
  double *pdVar6;
  undefined8 uVar7;
  double *pdVar8;
  longlong *plVar9;
  double dVar10;
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
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 *puStack_78;
  undefined8 *puStack_70;
  undefined8 *puStack_68;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043cd39;
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
  pdVar5 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_80 = 1;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  pdVar6 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1877a);
  func_0x000140001490(&uStack_d8,pdVar6);
  puStack_78 = &uStack_d8;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8a50,&puStack_78);
  cVar2 = func_0x00014012bb70(uVar7);
  if (cVar2 == '\0') {
    uStack_80 = 2;
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_a0 = 0;
    uStack_98 = 0;
    uStack_94 = 5;
    pdVar6 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x1877a);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_f8);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_e8);
    func_0x000140001490(&uStack_c8,&uStack_f8);
    puStack_70 = &uStack_c8;
    func_0x000140001490(&uStack_b8,&uStack_e8);
    puStack_68 = &uStack_b8;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_a0,2,uRam00000001405c8a60,&puStack_70);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdVar6,uVar7);
    func_0x000140141c50(1);
  }
  uStack_80 = 6;
  if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) {
    dVar10 = *pdVar6;
  }
  else {
    dVar10 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x0001401756b0((longlong)dVar10);
  uStack_80 = 7;
  func_0x000140175550(param_1,0x2a,0,0,0);
  uStack_80 = 8;
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar5);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      pdVar8 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x0001400e3c67;
    }
    pdVar8 = (double *)func_0x000140147980(*pdVar5,1);
    if ((*(uint *)((longlong)pdVar8 + 0xc) & 0xffffff) == 0) goto code_r0x0001400e3c94;
code_r0x0001400e3c69:
    dVar10 = (double)func_0x00014012d320();
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    pdVar8 = pdVar5;
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x0001400e3c67:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x0001400e3c69;
code_r0x0001400e3c94:
    dVar10 = *pdVar8;
  }
  func_0x000140175520((longlong)dVar10);
  uStack_80 = 9;
  pdVar8 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18712);
  if ((*(uint *)((longlong)pdVar8 + 0xc) & 0xffffff) == 0) {
    dVar10 = *pdVar8;
  }
  else {
    dVar10 = (double)func_0x00014012d320(pdVar8);
  }
  func_0x00014018d0b0((float)dVar10);
  uStack_80 = 10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_d8,0x1405c5a98);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5aa8);
  puStack_70 = &uStack_c8;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c5a88);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0xc;
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar5);
    if (0 < iVar3) {
      pdVar5 = (double *)func_0x000140147980(*pdVar5,0);
      uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
      goto joined_r0x0001400e3df6;
    }
    uVar4 = func_0x000140147990(*pdVar5);
    pdVar5 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar4);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x0001400e3df6:
  if ((uVar1 & 0xffffff) == 0) {
    dVar10 = *pdVar5;
  }
  else {
    dVar10 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x000140175520((longlong)dVar10);
  uStack_80 = 0xe;
  uVar4 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar4);
  uStack_80 = 0x10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  func_0x00014000bee0(&uStack_d8,0x1405c5ab8);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5ac8);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar9);
      plVar9 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,0);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar9);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  func_0x00014000bee0(&uStack_d8,0x1405c5ab8);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5ad8);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,1);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar9);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x12;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  func_0x00014000bee0(&uStack_d8,0x1405c5ab8);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5ae8);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,2);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar9);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x13;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  func_0x00014000bee0(&uStack_d8,0x1405c5ab8);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5af8);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,3);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar9);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x14;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  func_0x00014000bee0(&uStack_d8,0x1405c5ab8);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5b08);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,4);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar9);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x15;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar9 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  func_0x00014000bee0(&uStack_d8,0x1405c5ab8);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5b18);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    puStack_70 = &uStack_c8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 6) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,5,uVar4);
      plVar9 = (longlong *)0x0;
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,5);
    }
  }
  else {
    puStack_70 = &uStack_c8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar9);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x16;
  func_0x000140183c00();
  uStack_80 = 0x18;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x000140001490(&uStack_d8,pdVar6);
  puStack_78 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x140656e60);
  puStack_70 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x140656e60);
  puStack_68 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8ab0,&puStack_78);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
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
