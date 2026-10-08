/// @description FNAFN Obj_Menu_Continue / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Continue_Draw_0 (3600 B @0x1400519c0)
// Same draw family as Obj_Menu_Main_Title/Draw (PORTED) — decoded in
// order (uStack_80 = GML line markers):
//   1-3. if (!surface_exists(surface)) surface = surface_create(
//      room_width, room_height) [slots 0x1405c8a50/0x1405c8a60;
//      room_width/room_height via 0x14015ef90 on slots
//      0x1405c7b08/0x1405c7b18 — EXE-REGISTRY.md].
//   6. surface_set_target(surface) [1-arg builtin 0x1401756b0].
//   7. draw_sprite(Spr_Menu_Fade_Overlay, 0, 0, 0) — 4-arg helper
//      0x140175550(self, 0x2a, 0, 0, 0); sprite 0x2a = 42 =
//      Spr_Menu_Fade_Overlay (sprite_names.json). Best-fit draw_sprite
//      (same shape as Obj_Game_Over/Draw's (0x29, ...) call) —
//      TODO(calibrate) helper identity in-game.
//   8. draw_set_font(game_font[1]) [game id 0x18725; 0x140175520 proven
//      draw_set_font].
//   9. draw_set_alpha(draw_alpha) [id 0x18712; float setter 0x14018d0b0].
//   10. draw_text(32, 185, "continue") [slot 0x1405c8da0; exe consts
//      0x1405c3c38 = 32.0, 0x1405c3c48 = 185.0, string "continue"
//      @0x1405c3c28 — exe_strings.py].
//   0xb. draw_set_font(game_font[0]).
//   0xc. draw_set_color(make_color_rgb(255, 0, 110)).
//   0xe-0x15. draw_text(94, y, text_night[i]) for i = 0..7 with
//      y = 295, 340, 385, 430, 475, 520, 565, 610 (exe consts
//      @0x1405c3c68..@0x1405c3cd8; x = 94.0 @0x1405c3c58 throughout).
//   0x16. surface_reset_target() [no-arg 0x140183c00].
//   0x18. draw_surface(surface, <runtime>, <runtime>) [slot 0x1405c8ab0;
//      both coords are runtime const @0x140655560 — TODO(calibrate),
//      likely 0, 0 by convention].
// Reading: the night-select screen renders its labels ("continue" +
// the eight text_night rows) onto its surface, then composites the
// surface. Unlike Main_Title/Draw there is no star field and no final
// draw_self().
// TODO(calibrate): 0x140175550 identity (best-fit draw_sprite);
// draw_surface x/y runtime const @0x140655560 (assumed 0, 0).
if (!surface_exists(surface)) {
    surface = surface_create(room_width, room_height);
}
surface_set_target(surface);
draw_sprite(Spr_Menu_Fade_Overlay, 0, 0, 0); // TODO(calibrate): helper 0x140175550 identity best-fit
draw_set_font(game_font[1]);
draw_set_alpha(draw_alpha);
draw_text(32, 185, "continue");
draw_set_font(game_font[0]);
draw_set_color(make_color_rgb(255, 0, 110));
draw_text(94, 295, text_night[0]);
draw_text(94, 340, text_night[1]);
draw_text(94, 385, text_night[2]);
draw_text(94, 430, text_night[3]);
draw_text(94, 475, text_night[4]);
draw_text(94, 520, text_night[5]);
draw_text(94, 565, text_night[6]);
draw_text(94, 610, text_night[7]);
surface_reset_target();
draw_surface(surface, 0 /* TODO(calibrate): runtime const @0x140655560 */, 0 /* TODO(calibrate): same */);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_Draw_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  double *pdVar5;
  undefined8 uVar6;
  double *pdVar7;
  longlong *plVar8;
  double dVar9;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined4 uStack_d0;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  double *pdStack_98;
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
  puStack_88 = &UNK_14043a9af;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  plRam0000000140657680 = param_1;
  pdVar5 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_80 = 1;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  pdStack_98 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1877a);
  func_0x000140001490(&uStack_c8,pdStack_98);
  puStack_78 = &uStack_c8;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8a50,&puStack_78);
  cVar2 = func_0x00014012bb70(uVar6);
  if (cVar2 == '\0') {
    uStack_80 = 3;
    if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_d8);
    }
    uStack_d8 = 0;
    uStack_d0 = 0;
    uStack_cc = 5;
    pdStack_98 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x1877a);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_f8);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_e8);
    func_0x000140001490(&uStack_b8,&uStack_f8);
    puStack_70 = &uStack_b8;
    func_0x000140001490(&uStack_a8,&uStack_e8);
    puStack_68 = &uStack_a8;
    uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_d8,2,uRam00000001405c8a60,&puStack_70);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdStack_98,uVar6);
    func_0x000140141c50(1);
  }
  uStack_80 = 6;
  if ((*(uint *)((longlong)pdStack_98 + 0xc) & 0xffffff) == 0) {
    dVar9 = *pdStack_98;
  }
  else {
    dVar9 = (double)func_0x00014012d320();
  }
  func_0x0001401756b0((longlong)dVar9);
  uStack_80 = 7;
  func_0x000140175550(param_1,0x2a,0,0,0);
  uStack_80 = 8;
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar5);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      pdVar7 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x000140051c97;
    }
    pdVar7 = (double *)func_0x000140147980(*pdVar5,1);
    if ((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 0) goto code_r0x000140051cc4;
code_r0x000140051c99:
    dVar9 = (double)func_0x00014012d320();
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    pdVar7 = pdVar5;
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x000140051c97:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x000140051c99;
code_r0x000140051cc4:
    dVar9 = *pdVar7;
  }
  func_0x000140175520((longlong)dVar9);
  uStack_80 = 9;
  pdVar7 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18712);
  if ((*(uint *)((longlong)pdVar7 + 0xc) & 0xffffff) == 0) {
    dVar9 = *pdVar7;
  }
  else {
    dVar9 = (double)func_0x00014012d320(pdVar7);
  }
  func_0x00014018d0b0((float)dVar9);
  uStack_80 = 10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c3c38);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3c48);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3c28);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0xb;
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar5);
    if (0 < iVar3) {
      pdVar5 = (double *)func_0x000140147980(*pdVar5,0);
      uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
      goto joined_r0x000140051e0e;
    }
    uVar4 = func_0x000140147990(*pdVar5);
    pdVar5 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar4);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x000140051e0e:
  if ((uVar1 & 0xffffff) == 0) {
    dVar9 = *pdVar5;
  }
  else {
    dVar9 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x000140175520((longlong)dVar9);
  uStack_80 = 0xc;
  uVar4 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar4);
  uStack_80 = 0xe;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3c68);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar8);
      plVar8 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,0);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0xf;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3c78);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,1);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3c88);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 3) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,2,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,2);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3c98);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 4) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,3,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,3);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x12;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3ca8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 5) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,4,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,4);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x13;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3cb8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 6) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,5,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,5);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x14;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3cc8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 7) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,6,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,6);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x15;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  plVar8 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x00014000bee0(&uStack_c8,0x1405c3c58);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c3cd8);
  if (((*(uint *)((longlong)plVar8 + 0xc) & 0xffffff) == 2) && (*plVar8 != 0)) {
    puStack_70 = &uStack_b8;
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar8);
    if (iVar3 < 8) {
      uVar4 = func_0x000140147990(*plVar8);
      func_0x000140144260(&UNK_140439ca6,7,uVar4);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar8,7);
    }
  }
  else {
    puStack_70 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x16;
  func_0x000140183c00();
  uStack_80 = 0x18;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x000140001490(&uStack_c8,pdStack_98);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x140655560);
  puStack_70 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655560);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8ab0,&puStack_78);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
