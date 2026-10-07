/// @description FNAFN Obj_Night_UI_Camera_Button / Draw_75 — PORTED from C
// Ground truth: gml_Object_Obj_Night_UI_Camera_Button_Draw_75 (2194 B @0x1400670a0)
// Sprite ids are SPRT indices (sprite_names.json): 0x11 = 17 =
// Spr_Night_UI_Camera_Button, 99 = Spr_Night_UI_Freddy_Alert,
// 0x66 = 102 = Spr_Night_UI_Key_Hints.
// button_alpha is a 2-element array ([0] = main button alpha, [1] = bottom
// hint-bar alpha); key_alpha is a 4-element array. Array-index boilerplate
// (1479b0/147990/147980) elided.
// 1. draw_sprite_ext(Spr_Night_UI_Camera_Button, button_index,
//        <x @UNK_14043b000>, button_y, 1, 1, 0, c_white, button_alpha[0])
//    (TODO(calibrate): x const — runtime float outside the mapped image).
// 2. draw_sprite_ext(Spr_Night_UI_Freddy_Alert,
//        Obj_Night_1_5_Freddy_AI.image_index,  // object 0x2f = 47, tagged read
//        <x @UNK_14043b000>, button_y + 15, 0.7, 0.7, 0, c_white, alert_alpha)
//    (0x3f333333 f32 ~= 0.7; += helper 0x14000bf90 for the +15.)
// 3. if (Night_camera != 0) stop (require Night_camera == 0).
// 4. draw_sprite_ext(Spr_Night_UI_Key_Hints, 0, <x @UNK_14043b004>, 670,
//        1, 1, 0, c_white, key_alpha[0])
//    draw_sprite_ext(Spr_Night_UI_Key_Hints, 1, <x @UNK_14043b008>, 670,
//        1, 1, 0, c_white, key_alpha[1])
//    draw_sprite_ext(Spr_Night_UI_Key_Hints, 2, <x @UNK_14043b004>, 670,
//        1, 1, 0, c_white, key_alpha[2])
//    draw_sprite_ext(Spr_Night_UI_Key_Hints, 2, <x @UNK_14043b008>, 670,
//        1, 1, 0, c_white, key_alpha[3])
//    (0x44278000 f32 = 670.0; x consts TODO(calibrate); note the last two
//    both use subimg 2 — as in the C, not a typo.)
// 5. draw_sprite_ext(Spr_Night_UI_Camera_Button, 0, <x @UNK_14043b00c>, 679,
//        1, 1, 0, c_white, button_alpha[1])  (0x4429c000 f32 = 679.0).
draw_sprite_ext(Spr_Night_UI_Camera_Button, button_index, TODO_calibrate_14043b000, button_y, 1, 1, 0, c_white, button_alpha[0]);
draw_sprite_ext(Spr_Night_UI_Freddy_Alert, Obj_Night_1_5_Freddy_AI.image_index, TODO_calibrate_14043b000, button_y + 15, 0.7, 0.7, 0, c_white, alert_alpha);
if (Night_camera == 0) {
    draw_sprite_ext(Spr_Night_UI_Key_Hints, 0, TODO_calibrate_14043b004, 670, 1, 1, 0, c_white, key_alpha[0]);
    draw_sprite_ext(Spr_Night_UI_Key_Hints, 1, TODO_calibrate_14043b008, 670, 1, 1, 0, c_white, key_alpha[1]);
    draw_sprite_ext(Spr_Night_UI_Key_Hints, 2, TODO_calibrate_14043b004, 670, 1, 1, 0, c_white, key_alpha[2]);
    draw_sprite_ext(Spr_Night_UI_Key_Hints, 2, TODO_calibrate_14043b008, 670, 1, 1, 0, c_white, key_alpha[3]);
    draw_sprite_ext(Spr_Night_UI_Camera_Button, 0, TODO_calibrate_14043b00c, 679, 1, 1, 0, c_white, button_alpha[1]);
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_UI_Camera_Button_Draw_75(longlong *param_1)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  double *pdVar5;
  undefined8 *puVar6;
  longlong *plVar7;
  undefined8 *puVar8;
  undefined4 uVar9;
  undefined8 uVar10;
  undefined4 uVar12;
  undefined4 uVar13;
  double dVar11;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  double dStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043b010;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_74 = 0xffffff;
  dStack_80 = 0.0;
  plRam0000000140657680 = param_1;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_88 = 1;
  pdVar5 = (double *)(**(code **)(*param_1 + 8))(param_1,0x186eb);
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x186ed);
  plVar7 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186ea);
  if (((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) == 2) && (*plVar7 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar7);
    if (iVar2 < 1) {
      uVar3 = func_0x000140147990(*plVar7);
      plVar7 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
      goto code_r0x0001400671e1;
    }
    plVar7 = (longlong *)func_0x000140147980(*plVar7,0);
    if ((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) != 0) goto code_r0x0001400671ea;
code_r0x00014006721c:
    uVar3 = (undefined4)*plVar7;
    uVar12 = (undefined4)((ulonglong)*plVar7 >> 0x20);
    if ((*(uint *)((longlong)puVar6 + 0xc) & 0xffffff) != 0) goto code_r0x0001400671fe;
code_r0x000140067229:
    uVar9 = (undefined4)*puVar6;
    uVar13 = (undefined4)((ulonglong)*puVar6 >> 0x20);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) != 0) goto code_r0x000140067212;
code_r0x000140067236:
    dVar11 = *pdVar5;
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
code_r0x0001400671e1:
    if ((*(uint *)((longlong)plVar7 + 0xc) & 0xffffff) == 0) goto code_r0x00014006721c;
code_r0x0001400671ea:
    uVar10 = func_0x00014012d320(plVar7);
    uVar3 = (undefined4)uVar10;
    uVar12 = (undefined4)((ulonglong)uVar10 >> 0x20);
    if ((*(uint *)((longlong)puVar6 + 0xc) & 0xffffff) == 0) goto code_r0x000140067229;
code_r0x0001400671fe:
    uVar10 = func_0x00014012d320(puVar6);
    uVar9 = (undefined4)uVar10;
    uVar13 = (undefined4)((ulonglong)uVar10 >> 0x20);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x000140067236;
code_r0x000140067212:
    dVar11 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x0001401755c0(param_1,0x11,(longlong)dVar11,_UNK_14043b000,
                      (float)(double)CONCAT44(uVar13,uVar9),0x3f800000,0x3f800000,0,0xffffff,
                      (float)(double)CONCAT44(uVar12,uVar3));
  uStack_88 = 2;
  puVar8 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x186d9);
  func_0x000140144a40(0x2f,uRam00000001405c7aa8,0x80000000,&dStack_80);
  if ((*(uint *)((longlong)puVar8 + 0xc) & 0xffffff) == 0) {
    uVar3 = (undefined4)*puVar8;
    uVar12 = (undefined4)((ulonglong)*puVar8 >> 0x20);
  }
  else {
    uVar10 = func_0x00014012d320(puVar8);
    uVar3 = (undefined4)uVar10;
    uVar12 = (undefined4)((ulonglong)uVar10 >> 0x20);
  }
  uStack_64 = *(uint *)((longlong)puVar6 + 0xc);
  uStack_68 = *(undefined4 *)(puVar6 + 1);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
    uStack_70 = *puVar6;
  }
  else {
    func_0x000140067bf0(&uStack_70,puVar6);
  }
  func_0x00014000bf90(&uStack_70,0xf);
  if ((uStack_64 & 0xffffff) == 0) {
    uVar9 = (undefined4)uStack_70;
    uVar13 = (undefined4)((ulonglong)uStack_70 >> 0x20);
    dVar11 = dStack_80;
  }
  else {
    uVar10 = func_0x00014012d320(&uStack_70);
    uVar9 = (undefined4)uVar10;
    uVar13 = (undefined4)((ulonglong)uVar10 >> 0x20);
    dVar11 = dStack_80;
  }
  dStack_80 = dVar11;
  if ((uStack_74 & 0xffffff) != 0) {
    dVar11 = (double)func_0x00014012d320(&dStack_80);
  }
  func_0x0001401755c0(param_1,99,(longlong)dVar11,_UNK_14043b000,
                      (float)(double)CONCAT44(uVar13,uVar9),0x3f333333,0x3f333333,0,0xffffff,
                      (float)(double)CONCAT44(uVar12,uVar3));
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_88 = 5;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014006788f;
  uStack_88 = 7;
  (**(code **)(*param_1 + 8))(param_1,0x186ed);
  pdVar5 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1872d);
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar5);
    if (iVar2 < 1) {
      uVar3 = func_0x000140147990(*pdVar5);
      pdVar5 = (double *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
      goto code_r0x00014006745c;
    }
    pdVar5 = (double *)func_0x000140147980(*pdVar5,0);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) != 0) goto code_r0x000140067465;
code_r0x00014006746f:
    dVar11 = *pdVar5;
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
code_r0x00014006745c:
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x00014006746f;
code_r0x000140067465:
    dVar11 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x0001401755c0(param_1,0x66,0,_UNK_14043b004,0x44278000,0x3f800000,0x3f800000,0,0xffffff,
                      (float)dVar11);
  uStack_88 = 8;
  pdVar5 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1872d);
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar5);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      pdVar5 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x00014006752a;
    }
    pdVar5 = (double *)func_0x000140147980(*pdVar5,1);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x000140067577;
code_r0x00014006752c:
    dVar11 = (double)func_0x00014012d320(pdVar5);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x00014006752a:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x00014006752c;
code_r0x000140067577:
    dVar11 = *pdVar5;
  }
  func_0x0001401755c0(param_1,0x66,1,_UNK_14043b008,0x44278000,0x3f800000,0x3f800000,0,0xffffff,
                      (float)dVar11);
  uStack_88 = 9;
  pdVar5 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1872d);
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar5);
    if (iVar2 < 3) {
      uVar3 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,2,uVar3);
      pdVar5 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x000140067635;
    }
    pdVar5 = (double *)func_0x000140147980(*pdVar5,2);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x000140067665;
code_r0x000140067637:
    dVar11 = (double)func_0x00014012d320(pdVar5);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x000140067635:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x000140067637;
code_r0x000140067665:
    dVar11 = *pdVar5;
  }
  func_0x0001401755c0(param_1,0x66,2,_UNK_14043b004,0x44278000,0x3f800000,0x3f800000,0,0xffffff,
                      (float)dVar11);
  uStack_88 = 10;
  pdVar5 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1872d);
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar5);
    if (iVar2 < 4) {
      uVar3 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,3,uVar3);
      pdVar5 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x000140067723;
    }
    pdVar5 = (double *)func_0x000140147980(*pdVar5,3);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x000140067753;
code_r0x000140067725:
    dVar11 = (double)func_0x00014012d320(pdVar5);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x000140067723:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x000140067725;
code_r0x000140067753:
    dVar11 = *pdVar5;
  }
  func_0x0001401755c0(param_1,0x66,2,_UNK_14043b008,0x44278000,0x3f800000,0x3f800000,0,0xffffff,
                      (float)dVar11);
  uStack_88 = 0xb;
  pdVar5 = (double *)(**(code **)(*param_1 + 8))(param_1,0x186ea);
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*pdVar5);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      pdVar5 = (double *)0x0;
      uVar1 = uRam000000000000000c;
      goto joined_r0x000140067811;
    }
    pdVar5 = (double *)func_0x000140147980(*pdVar5,1);
    if ((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 0) goto code_r0x000140067841;
code_r0x000140067813:
    dVar11 = (double)func_0x00014012d320(pdVar5);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
joined_r0x000140067811:
    if ((uVar1 & 0xffffff) != 0) goto code_r0x000140067813;
code_r0x000140067841:
    dVar11 = *pdVar5;
  }
  func_0x0001401755c0(param_1,0x11,0,_UNK_14043b00c,0x4429c000,0x3f800000,0x3f800000,0,0xffffff,
                      (float)dVar11);
code_r0x00014006788f:
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
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_80);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
