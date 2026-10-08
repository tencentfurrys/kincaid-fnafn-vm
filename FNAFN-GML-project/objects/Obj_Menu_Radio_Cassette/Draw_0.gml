/// @description FNAFN Obj_Menu_Radio_Cassette / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Radio_Cassette_Draw_0 (5645 B @0x1400ea050)
// Track-browser draw: two arrow sprites, the "track #N" header, the track
// name (or "unassigned"), and the import/exit labels, then draw_self.
// Id map: arrow_size 0x186e2, arrow_alpha 0x186e1, custom_music 0x186fc,
// track_select 0x18794, radio_text 0x1875d; x/y/image_alpha are the standard
// self slots (0x1405c7b78/0x1405c7b88/0x1405c7b98). Sprite 0x21 = 33 =
// Spr_Menu_Radio_Arrows (sprite_names.json); subimg 0 at x+450, subimg 1 at
// x-450 (via the PROVEN += 0x14000bf90 / SUB 0x14002fc60 helpers with
// 0x1c2 = 450). Scales = arrow_size[i] (xscale = yscale), alpha =
// arrow_alpha[i]. Slots: 0x1405c8da0 = draw_text, 0x1405c8840 = string,
// 0x1405c8ef0 = draw_text_transformed, 0x1405c8ba0 = array_length.
// Exe consts: "track #" @0x1405c5c90, "unassigned" @0x1405c5c98, 0.5
// @0x1405c5ca8, "Main_menu" @0x1405c5b70, -32/352/35/32/160/63 series.
// TODO(calibrate): halign helper 0x140175530 args (1/0/2 assumed
// center/left/right); track-name match const @0x140656e88 + angle
// @0x140656e90 (runtime, outside exe image); draw_text y offsets (-230 via
// SUB 0xe6, -200 via SUB 200) sign per SUB-helper proof.
draw_sprite_ext(Spr_Menu_Radio_Arrows, 0, x + 450, y, arrow_size[0], arrow_size[0], 0, c_white, arrow_alpha[0]);
draw_sprite_ext(Spr_Menu_Radio_Arrows, 1, x - 450, y, arrow_size[1], arrow_size[1], 0, c_white, arrow_alpha[1]);
draw_set_font(0);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 0, 220));
draw_text(x, y - 230, "track #" + string(track_select));
if (custom_music[track_select - 1, 1] == 0) { // TODO(calibrate): compared const is runtime @0x140656e88
    draw_text_transformed(x, y - 200, "unassigned", 0.5, 0.5, 0); // TODO(calibrate): angle is runtime const @0x140656e90
} else {
    draw_text_transformed(x, y - 200, string(custom_music[track_select - 1, 1]), 0.5, 0.5, 0); // TODO(calibrate): angle is runtime const @0x140656e90
}
draw_set_halign(fa_left);
draw_text(x + 35, y + 180, radio_text[0]);
draw_set_halign(fa_right); // TODO(calibrate): helper 0x140175530 arg 2 — best-fit halign right; verify in-game
draw_text(x - 35, y + 180, radio_text[1]); // TODO(calibrate): x uses SUB helper (x - 35); verify sign in-game
draw_self();

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Type propagation algorithm not settling

void gml_Object_Obj_Menu_Radio_Cassette_Draw_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  longlong *plVar6;
  longlong *plVar7;
  undefined8 uVar8;
  undefined4 uVar9;
  undefined8 uVar10;
  undefined4 uVar12;
  double dVar11;
  undefined4 uVar13;
  undefined4 uVar14;
  undefined4 uVar15;
  float fVar16;
  uint in_stack_fffffffffffffdd8;
  uint uVar17;
  ulonglong in_stack_fffffffffffffde0;
  ulonglong uVar18;
  undefined8 **ppuVar19;
  undefined8 uStack_1f0;
  uint uStack_1e4;
  undefined8 uStack_1e0;
  uint uStack_1d4;
  undefined8 uStack_1d0;
  uint uStack_1c4;
  undefined8 uStack_1c0;
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
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 uStack_110;
  undefined *puStack_108;
  undefined4 uStack_100;
  double dStack_f8;
  undefined4 uStack_f0;
  uint uStack_ec;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  double dStack_d0;
  undefined4 uStack_c8;
  uint uStack_c4;
  double dStack_c0;
  undefined4 uStack_b8;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  double dStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 uStack_90;
  
  uStack_90 = 0xfffffffffffffffe;
  puStack_108 = &UNK_14043ce63;
  uStack_100 = 0;
  uStack_110 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_110;
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
  uStack_c4 = 0xffffff;
  dStack_d0 = 0.0;
  uStack_b4 = 0xffffff;
  dStack_c0 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_d8 = param_2;
  uStack_1c0 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fc);
  uStack_a8 = CONCAT44(0xffffff,(undefined4)uStack_a8);
  uStack_b0 = 0;
  uStack_e0 = CONCAT44(0xffffff,(undefined4)uStack_e0);
  uStack_e8 = 0;
  uStack_1e4 = 0xffffff;
  uStack_1f0 = 0;
  uStack_1d4 = 0xffffff;
  uStack_1e0 = 0;
  uStack_1c4 = 0xffffff;
  uStack_1d0 = 0;
  uStack_100 = 1;
  plVar6 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186e2);
  plVar7 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186e1);
  in_stack_fffffffffffffde0 = in_stack_fffffffffffffde0 & 0xffffffffffffff00;
  in_stack_fffffffffffffdd8 = in_stack_fffffffffffffdd8 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,in_stack_fffffffffffffdd8,
                      in_stack_fffffffffffffde0);
  in_stack_fffffffffffffde0 = in_stack_fffffffffffffde0 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,
                      in_stack_fffffffffffffdd8 & 0xffffff00,in_stack_fffffffffffffde0);
  uVar5 = (undefined4)(in_stack_fffffffffffffde0 >> 0x20);
  if (((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) == 2) && (*plVar7 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar7);
    if (iVar1 < 1) {
      uVar2 = func_0x000140147990(*plVar7);
      plVar7 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar2);
      goto code_r0x0001400ea29d;
    }
    plVar7 = (longlong *)func_0x000140147980(*plVar7,0);
    if ((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) != 0) goto code_r0x0001400ea2a6;
code_r0x0001400ea2f4:
    uVar2 = (undefined4)*plVar7;
    uVar13 = (undefined4)((ulonglong)*plVar7 >> 0x20);
    if ((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) != 2) goto code_r0x0001400ea306;
code_r0x0001400ea2bf:
    if (*plVar6 == 0) goto code_r0x0001400ea306;
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (iVar1 < 1) {
      uVar3 = func_0x000140147990(*plVar6);
      plVar7 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
      goto code_r0x0001400ea315;
    }
    plVar7 = (longlong *)func_0x000140147980(*plVar6,0);
    if ((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) == 0) goto code_r0x0001400ea36c;
code_r0x0001400ea31e:
    uVar10 = func_0x00014012d320(plVar7);
    uVar3 = (undefined4)uVar10;
    uVar12 = (undefined4)((ulonglong)uVar10 >> 0x20);
    if ((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) != 2) goto code_r0x0001400ea37e;
code_r0x0001400ea337:
    if (*plVar6 == 0) goto code_r0x0001400ea37e;
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (0 < iVar1) {
      plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
      uVar17 = *(uint *)((longlong)plVar6 + 0xc);
      goto joined_r0x0001400ea391;
    }
    uVar4 = func_0x000140147990(*plVar6);
    plVar6 = (longlong *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar4);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
code_r0x0001400ea29d:
    if ((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) == 0) goto code_r0x0001400ea2f4;
code_r0x0001400ea2a6:
    uVar10 = func_0x00014012d320(plVar7);
    uVar2 = (undefined4)uVar10;
    uVar13 = (undefined4)((ulonglong)uVar10 >> 0x20);
    if ((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) goto code_r0x0001400ea2bf;
code_r0x0001400ea306:
    func_0x000140144260(&UNK_140439cd8);
    plVar7 = plVar6;
code_r0x0001400ea315:
    if ((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) != 0) goto code_r0x0001400ea31e;
code_r0x0001400ea36c:
    uVar3 = (undefined4)*plVar7;
    uVar12 = (undefined4)((ulonglong)*plVar7 >> 0x20);
    if ((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) goto code_r0x0001400ea337;
code_r0x0001400ea37e:
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar17 = *(uint *)((longlong)plVar6 + 0xc);
joined_r0x0001400ea391:
  if ((uVar17 & 0xffffff) == 0) {
    uVar4 = (undefined4)*plVar6;
    uVar14 = (undefined4)((ulonglong)*plVar6 >> 0x20);
  }
  else {
    uVar10 = func_0x00014012d320(plVar6);
    uVar4 = (undefined4)uVar10;
    uVar14 = (undefined4)((ulonglong)uVar10 >> 0x20);
  }
  if ((uStack_b4 & 0xffffff) == 0) {
    uVar9 = SUB84(dStack_c0,0);
    uVar15 = (undefined4)((ulonglong)dStack_c0 >> 0x20);
  }
  else {
    uVar10 = func_0x00014012d320(&dStack_c0);
    uVar9 = (undefined4)uVar10;
    uVar15 = (undefined4)((ulonglong)uVar10 >> 0x20);
  }
  uStack_94 = uStack_c4;
  uStack_98 = uStack_c8;
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) == 0) {
    dStack_a0 = dStack_d0;
  }
  else {
    func_0x0001400eca10(&dStack_a0,&dStack_d0);
  }
  func_0x00014000bf90(&dStack_a0,0x1c2);
  dVar11 = dStack_a0;
  if ((uStack_94 & 0xffffff) != 0) {
    dVar11 = (double)func_0x00014012d320(&dStack_a0);
  }
  fVar16 = (float)(double)CONCAT44(uVar15,uVar9);
  uVar18 = CONCAT44(uVar5,(float)(double)CONCAT44(uVar14,uVar4));
  func_0x0001401755c0(param_1,0x21,0,(float)dVar11,fVar16,uVar18,
                      (float)(double)CONCAT44(uVar12,uVar3),0,0xffffff,
                      (float)(double)CONCAT44(uVar13,uVar2));
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  uStack_100 = 2;
  plVar6 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186e2);
  plVar7 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186e1);
  uVar18 = uVar18 & 0xffffffffffffff00;
  uVar17 = (uint)fVar16 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,uVar17,uVar18);
  uVar18 = uVar18 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,uVar17 & 0xffffff00,uVar18)
  ;
  uVar5 = (undefined4)(uVar18 >> 0x20);
  if (((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) == 2) && (*plVar7 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar7);
    if (iVar1 < 2) {
      uVar2 = func_0x000140147990(*plVar7);
      func_0x000140144260(&UNK_140439ca6,1,uVar2);
      plVar7 = (longlong *)0x0;
      uVar17 = uRam000000000000000c;
    }
    else {
      plVar7 = (longlong *)func_0x000140147980(*plVar7,1);
      uVar17 = *(uint *)((longlong)plVar7 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar17 = *(uint *)((longlong)plVar7 + 0xc);
  }
  if ((uVar17 & 0xffffff) == 0) {
    uVar2 = (undefined4)*plVar7;
    uVar13 = (undefined4)((ulonglong)*plVar7 >> 0x20);
    uVar17 = *(uint *)((longlong)plVar6 + 0xc);
  }
  else {
    uVar10 = func_0x00014012d320(plVar7);
    uVar2 = (undefined4)uVar10;
    uVar13 = (undefined4)((ulonglong)uVar10 >> 0x20);
    uVar17 = *(uint *)((longlong)plVar6 + 0xc);
  }
  if (((uVar17 & 0xffffff) == 2) && (*plVar6 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (iVar1 < 2) {
      uVar3 = func_0x000140147990(*plVar6);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar7 = (longlong *)0x0;
      uVar17 = uRam000000000000000c;
    }
    else {
      plVar7 = (longlong *)func_0x000140147980(*plVar6,1);
      uVar17 = *(uint *)((longlong)plVar7 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar17 = *(uint *)((longlong)plVar6 + 0xc);
    plVar7 = plVar6;
  }
  if ((uVar17 & 0xffffff) == 0) {
    uVar3 = (undefined4)*plVar7;
    uVar12 = (undefined4)((ulonglong)*plVar7 >> 0x20);
    uVar17 = *(uint *)((longlong)plVar6 + 0xc);
  }
  else {
    uVar10 = func_0x00014012d320();
    uVar3 = (undefined4)uVar10;
    uVar12 = (undefined4)((ulonglong)uVar10 >> 0x20);
    uVar17 = *(uint *)((longlong)plVar6 + 0xc);
  }
  if (((uVar17 & 0xffffff) == 2) && (*plVar6 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (iVar1 < 2) {
      uVar4 = func_0x000140147990(*plVar6);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      plVar6 = (longlong *)0x0;
      uVar17 = uRam000000000000000c;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar6,1);
      uVar17 = *(uint *)((longlong)plVar6 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar17 = *(uint *)((longlong)plVar6 + 0xc);
  }
  if ((uVar17 & 0xffffff) == 0) {
    uVar4 = (undefined4)*plVar6;
    uVar14 = (undefined4)((ulonglong)*plVar6 >> 0x20);
  }
  else {
    uVar10 = func_0x00014012d320(plVar6);
    uVar4 = (undefined4)uVar10;
    uVar14 = (undefined4)((ulonglong)uVar10 >> 0x20);
  }
  if ((uStack_b4 & 0xffffff) == 0) {
    uVar9 = SUB84(dStack_c0,0);
    uVar15 = (undefined4)((ulonglong)dStack_c0 >> 0x20);
  }
  else {
    uVar10 = func_0x00014012d320(&dStack_c0);
    uVar9 = (undefined4)uVar10;
    uVar15 = (undefined4)((ulonglong)uVar10 >> 0x20);
  }
  func_0x00014002fc60(&dStack_a0,&dStack_d0,0x1c2);
  dVar11 = dStack_a0;
  if ((uStack_94 & 0xffffff) != 0) {
    dVar11 = (double)func_0x00014012d320(&dStack_a0);
  }
  fVar16 = (float)(double)CONCAT44(uVar15,uVar9);
  uVar18 = CONCAT44(uVar5,(float)(double)CONCAT44(uVar14,uVar4));
  func_0x0001401755c0(param_1,0x21,1,(float)dVar11,fVar16,uVar18,
                      (float)(double)CONCAT44(uVar12,uVar3),0,0xffffff,
                      (float)(double)CONCAT44(uVar13,uVar2));
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  uStack_100 = 4;
  func_0x000140175520(0);
  uStack_100 = 5;
  func_0x000140175530(1);
  uStack_100 = 6;
  uVar5 = func_0x0001401756a0(0xff,0,0xdc);
  func_0x00014018d100(uVar5);
  uStack_100 = 7;
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  uStack_b0 = 0;
  uStack_a8 = 0x500000000;
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  uVar10 = (**(code **)(*param_1 + 8))(param_1,0x18794);
  uVar18 = uVar18 & 0xffffffffffffff00;
  uVar17 = (uint)fVar16 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,uVar17,uVar18);
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,uVar17 & 0xffffff00,
                      uVar18 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_1b8,uVar10);
  puStack_148 = &uStack_1b8;
  func_0x000140001490(&uStack_1a8,&dStack_d0);
  puStack_140 = &uStack_1a8;
  func_0x00014002fc60(&dStack_a0,&dStack_c0,0xe6);
  func_0x000140001490(&uStack_198,&dStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  puStack_138 = &uStack_198;
  uVar8 = func_0x0001401445d0(param_1,uStack_d8,&uStack_e8,1,uRam00000001405c8840,&puStack_148);
  func_0x0001401453a0(&dStack_f8,0x1405c5c90);
  uStack_94 = uStack_ec;
  uStack_98 = uStack_f0;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) == 0) {
    dStack_a0 = dStack_f8;
  }
  else {
    func_0x0001400eca10(&dStack_a0,&dStack_f8);
  }
  func_0x000140005290(&dStack_a0,uVar8);
  func_0x000140001490(&uStack_188,&dStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_f8);
  }
  ppuVar19 = &puStack_140;
  uVar17 = uRam00000001405c8da0;
  puStack_130 = &uStack_188;
  func_0x0001401445d0(param_1,uStack_d8,&uStack_b0,3,uRam00000001405c8da0,ppuVar19);
  uStack_100 = 8;
  func_0x0001401453a0(&dStack_a0,0x140656e88);
  func_0x00014002fc60(&dStack_f8,uVar10,1);
  uVar5 = func_0x00014012cd90(&dStack_f8);
  plVar6 = (longlong *)func_0x00014002fbe0(uStack_1c0,uVar5);
  if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (iVar1 < 2) {
      uVar5 = func_0x000140147990(*plVar6);
      func_0x000140144260(&UNK_140439ca6,1,uVar5);
      plVar6 = (longlong *)0x0;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar6,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  iVar1 = func_0x00014015be60(plVar6,&dStack_a0,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_f8);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  if (iVar1 == 0) {
    uStack_100 = 10;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8 = 0x500000000;
    (**(code **)(*param_1 + 8))(param_1,0x18794);
    uVar18 = (ulonglong)ppuVar19 & 0xffffffffffffff00;
    uVar17 = uVar17 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,uVar17,uVar18);
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,uVar17 & 0xffffff00,
                        uVar18 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_1b8,&dStack_d0);
    puStack_148 = &uStack_1b8;
    func_0x00014002fc60(&dStack_a0,&dStack_c0,200);
    func_0x000140001490(&uStack_1a8,&dStack_a0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&dStack_a0);
    }
    puStack_140 = &uStack_1a8;
    if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_198);
    }
    func_0x0001401441e0(&uStack_198,0x1405c5c98);
    puStack_138 = &uStack_198;
    func_0x00014000bee0(&uStack_188,0x1405c5ca8);
    puStack_130 = &uStack_188;
    func_0x00014000bee0(&uStack_178,0x1405c5ca8);
    puStack_128 = &uStack_178;
    func_0x00014000bee0(&uStack_168,0x140656e90);
    ppuVar19 = &puStack_148;
    uVar17 = uRam00000001405c8ef0;
    puStack_120 = &uStack_168;
    func_0x0001401445d0(param_1,uStack_d8,&uStack_b0,6,uRam00000001405c8ef0,ppuVar19);
  }
  else {
    uStack_100 = 0xe;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8 = 0x500000000;
    if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_e8);
    }
    uStack_e8 = 0;
    uStack_e0 = 0x500000000;
    uVar10 = (**(code **)(*param_1 + 8))(param_1,0x18794);
    uVar18 = (ulonglong)ppuVar19 & 0xffffffffffffff00;
    uVar17 = uVar17 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,uVar17,uVar18);
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,uVar17 & 0xffffff00,
                        uVar18 & 0xffffffffffffff00);
    func_0x00014002fc60(&dStack_a0,uVar10,1);
    uVar5 = func_0x00014012cd90(&dStack_a0);
    plVar6 = (longlong *)func_0x00014002fbe0(uStack_1c0,uVar5);
    if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar6);
      if (iVar1 < 2) {
        uVar5 = func_0x000140147990(*plVar6);
        func_0x000140144260(&UNK_140439ca6,1,uVar5);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar6,1);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_1b8,plVar6);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&dStack_a0);
    }
    puStack_148 = &uStack_1b8;
    func_0x000140001490(&uStack_1a8,&dStack_d0);
    puStack_140 = &uStack_1a8;
    func_0x00014002fc60(&dStack_a0,&dStack_c0,200);
    func_0x000140001490(&uStack_198,&dStack_a0);
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&dStack_a0);
    }
    puStack_138 = &uStack_198;
    uVar10 = func_0x0001401445d0(param_1,uStack_d8,&uStack_e8,1,uRam00000001405c8840,&puStack_148);
    func_0x000140001490(&uStack_188,uVar10);
    puStack_130 = &uStack_188;
    func_0x00014000bee0(&uStack_178,0x1405c5ca8);
    puStack_128 = &uStack_178;
    func_0x00014000bee0(&uStack_168,0x1405c5ca8);
    puStack_120 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x140656e90);
    ppuVar19 = &puStack_140;
    uVar17 = uRam00000001405c8ef0;
    puStack_118 = &uStack_158;
    func_0x0001401445d0(param_1,uStack_d8,&uStack_b0,6,uRam00000001405c8ef0,ppuVar19);
  }
  uStack_100 = 0x11;
  func_0x000140175530(0);
  uStack_100 = 0x12;
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  uStack_b0 = 0;
  uStack_a8 = 0x500000000;
  plVar6 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1875d);
  uVar18 = (ulonglong)ppuVar19 & 0xffffffffffffff00;
  uVar17 = uVar17 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,uVar17,uVar18);
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,uVar17 & 0xffffff00,
                      uVar18 & 0xffffffffffffff00);
  uStack_94 = uStack_c4;
  uStack_98 = uStack_c8;
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) == 0) {
    dStack_a0 = dStack_d0;
  }
  else {
    func_0x0001400eca10(&dStack_a0,&dStack_d0);
  }
  func_0x00014000bf90(&dStack_a0,0x23);
  func_0x000140001490(&uStack_1b8,&dStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  uStack_94 = uStack_b4;
  uStack_98 = uStack_b8;
  puStack_148 = &uStack_1b8;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
    dStack_a0 = dStack_c0;
  }
  else {
    func_0x0001400eca10(&dStack_a0,&dStack_c0);
  }
  func_0x00014000bf90(&dStack_a0,0xb4);
  func_0x000140001490(&uStack_1a8,&dStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
    puStack_140 = &uStack_1a8;
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (iVar1 < 1) {
      uVar5 = func_0x000140147990(*plVar6);
      plVar6 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar5);
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
    }
  }
  else {
    puStack_140 = &uStack_1a8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_198,plVar6);
  ppuVar19 = &puStack_148;
  uVar17 = uRam00000001405c8da0;
  puStack_138 = &uStack_198;
  func_0x0001401445d0(param_1,uStack_d8,&uStack_b0,3,uRam00000001405c8da0,ppuVar19);
  uStack_100 = 0x14;
  func_0x000140175530(2);
  uStack_100 = 0x15;
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  uStack_b0 = 0;
  uStack_a8 = 0x500000000;
  plVar6 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1875d);
  uVar18 = (ulonglong)ppuVar19 & 0xffffffffffffff00;
  uVar17 = uVar17 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&dStack_d0,uVar17,uVar18);
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&dStack_c0,uVar17 & 0xffffff00,
                      uVar18 & 0xffffffffffffff00);
  func_0x00014002fc60(&dStack_a0,&dStack_d0,0x23);
  func_0x000140001490(&uStack_1b8,&dStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  uStack_94 = uStack_b4;
  uStack_98 = uStack_b8;
  puStack_148 = &uStack_1b8;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
    dStack_a0 = dStack_c0;
  }
  else {
    func_0x0001400eca10(&dStack_a0,&dStack_c0);
  }
  func_0x00014000bf90(&dStack_a0,0xb4);
  func_0x000140001490(&uStack_1a8,&dStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_a0);
  }
  if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
    puStack_140 = &uStack_1a8;
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar6);
    if (iVar1 < 2) {
      uVar5 = func_0x000140147990(*plVar6);
      func_0x000140144260(&UNK_140439ca6,1,uVar5);
      plVar6 = (longlong *)0x0;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar6,1);
    }
  }
  else {
    puStack_140 = &uStack_1a8;
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_198,plVar6);
  puStack_138 = &uStack_198;
  func_0x0001401445d0(param_1,uStack_d8,&uStack_b0,3,uRam00000001405c8da0,&puStack_148);
  uStack_100 = 0x18;
  func_0x000140175460(param_1);
  if ((0x46U >> (uStack_1c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d0);
  }
  if ((0x46U >> (uStack_1d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1e0);
  }
  if ((0x46U >> (uStack_1e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1f0);
  }
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_d0);
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
  puRam0000000140657668 = (undefined8 *)uStack_110;
  return;
}
END DECOMPILED REFERENCE */
