/// @description FNAFN Obj_Menu_Customize / Step - PORTED from C
// Ground truth: gml_Object_Obj_Menu_Customize_Step_0 (6136 B @0x1400df330)
// Custom-night hover step (keyboard-free half; click handling is in
// Mouse_53/54). Globals: delta_factor (0x1870b). Self: text_figure[0..5]
// array (0x1878a) = ["freddy","bonnie","chica","foxy","none","exit"] (see
// Create port), select (0x1876a), draw_alpha (0x18712).
// Shared selector (object 0x23 = Obj_Menu_Selector): select_y (0x1876d),
// y (slot 0x1405c7b88), secondary_x (0x18769).
// Each block tests customfunct_ui_button_detection(94, y1,
// 94 + string_width(text_figure[i]), y2, 94) == 1 and parks the selector:
// y1/y2 from exe consts (EXE-CONSTANTS tags decode exactly, y2 = y1 + 40):
// i  y1    y2    select_y const         select
// 0  340   380   0x40754... (340)       0
// 1  385   425   0x40781... (385)       1
// 2  430   470   0x407ae... (430)       2
// 3  475   515   0x407db... (475)       3
// 4  520   560   0x40804... (520)       4
// 5  565   605   0x4081a8... (565)      5
// (Unlike Continue/Step there is no hover sound here.)
// Trailing eases (same as Continue/Step):
// Obj_Menu_Selector.y = lerp(y, select_y, 0.2 * delta_factor)
// Obj_Menu_Selector.secondary_x = lerp(secondary_x,
//   94 + string_width(text_figure[select]), 0.2 * delta_factor)
// draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor)
// (lerp slot 0x1405c8cc0; 0.2 = 0x3fc99..., 0.05 = 0x3fa99...; target 1.0
// const @0x1405c5928; x base 94.0 = 0x40578... via ADD helper 0x140005290.)
if (customfunct_ui_button_detection(94, 340, 94 + string_width(text_figure[0]), 380, 94) == 1) {
    Obj_Menu_Selector.select_y = 340;
    select = 0;
}
if (customfunct_ui_button_detection(94, 385, 94 + string_width(text_figure[1]), 425, 94) == 1) {
    Obj_Menu_Selector.select_y = 385;
    select = 1;
}
if (customfunct_ui_button_detection(94, 430, 94 + string_width(text_figure[2]), 470, 94) == 1) {
    Obj_Menu_Selector.select_y = 430;
    select = 2;
}
if (customfunct_ui_button_detection(94, 475, 94 + string_width(text_figure[3]), 515, 94) == 1) {
    Obj_Menu_Selector.select_y = 475;
    select = 3;
}
if (customfunct_ui_button_detection(94, 520, 94 + string_width(text_figure[4]), 560, 94) == 1) {
    Obj_Menu_Selector.select_y = 520;
    select = 4;
}
if (customfunct_ui_button_detection(94, 565, 94 + string_width(text_figure[5]), 605, 94) == 1) {
    Obj_Menu_Selector.select_y = 565;
    select = 5;
}
Obj_Menu_Selector.y = lerp(Obj_Menu_Selector.y, Obj_Menu_Selector.select_y, 0.2 * delta_factor);
Obj_Menu_Selector.secondary_x = lerp(Obj_Menu_Selector.secondary_x, 94 + string_width(text_figure[select]), 0.2 * delta_factor);
draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor);
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Customize_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  undefined8 in_stack_fffffffffffffe58;
  undefined8 **ppuVar8;
  undefined8 **ppuVar9;
  ulonglong uVar10;
  undefined8 uStack_190;
  uint uStack_184;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
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
  undefined auStack_e8 [8];
  undefined8 uStack_e0;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  undefined8 *puStack_a0;
  undefined8 *puStack_98;
  undefined8 *puStack_90;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined auStack_58 [8];
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uVar2 = (undefined4)((ulonglong)in_stack_fffffffffffffe58 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_c8 = &UNK_14043ccc6;
  uStack_c0 = 0;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  plRam0000000140657680 = param_1;
  uStack_160 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_184 = 0xffffff;
  uStack_190 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uStack_c0 = 1;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 1) {
      uVar3 = func_0x000140147990(*plVar4);
      plVar4 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar4);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5858);
  puStack_b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c5868);
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_b8);
  uStack_50._4_4_ = 0;
  uStack_50._0_4_ = SUB124(_auStack_58,8);
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_118,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5878);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5858);
  ppuVar8 = &puStack_b0;
  puStack_90 = &uStack_f8;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_c0 = 3;
    _auStack_58 = ZEXT816(0x4075400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_58);
    uStack_c0 = 4;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0;
  }
  uStack_c0 = 7;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 2) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar4);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5858);
  puStack_b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c5888);
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_b8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_118,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5898);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5858);
  ppuVar8 = &puStack_b0;
  puStack_90 = &uStack_f8;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_c0 = 9;
    _auStack_58 = ZEXT816(0x4078100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_58);
    uStack_c0 = 10;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x3ff0000000000000;
  }
  uStack_c0 = 0xd;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 3) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,2,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,2);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar4);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5858);
  puStack_b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c58a8);
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_b8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_118,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c58b8);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5858);
  ppuVar8 = &puStack_b0;
  puStack_90 = &uStack_f8;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_c0 = 0xf;
    _auStack_58 = ZEXT816(0x407ae00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_58);
    uStack_c0 = 0x10;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x4000000000000000;
  }
  uStack_c0 = 0x13;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 4) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,3,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,3);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar4);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5858);
  puStack_b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c58c8);
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_b8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_118,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c58d8);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5858);
  ppuVar8 = &puStack_b0;
  puStack_90 = &uStack_f8;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_c0 = 0x15;
    _auStack_58 = ZEXT816(0x407db00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_58);
    uStack_c0 = 0x16;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x4008000000000000;
  }
  uStack_c0 = 0x19;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 5) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,4,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,4);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar4);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5858);
  puStack_b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c58e8);
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_b8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_118,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c58f8);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5858);
  ppuVar8 = &puStack_b0;
  puStack_90 = &uStack_f8;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_c0 = 0x1b;
    _auStack_58 = ZEXT816(0x4080400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_58);
    uStack_c0 = 0x1c;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x4010000000000000;
  }
  uStack_c0 = 0x1f;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 6) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,5,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,5);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_148,plVar4);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5858);
  puStack_b0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c5908);
  ppuVar8 = &puStack_b8;
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              ppuVar8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_118,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_a0 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5918);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5858);
  ppuVar9 = &puStack_b0;
  puStack_90 = &uStack_f8;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar9);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_c0 = 0x21;
    _auStack_58 = ZEXT816(0x4081a80000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_58);
    uStack_c0 = 0x22;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x4014000000000000;
  }
  uStack_c0 = 0x25;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  _auStack_58 = ZEXT816(0);
  func_0x000140144a40(0x23,uRam00000001405c7b88,0x80000000,&uStack_158);
  uVar10 = (ulonglong)ppuVar9 & 0xffffffffffffff00;
  func_0x000140160480(0x23,0x1876d,0x80000000,auStack_58,uVar10,
                      (ulonglong)ppuVar8 & 0xffffffffffffff00);
  uVar2 = (undefined4)(uVar10 >> 0x20);
  func_0x000140001490(&uStack_148,&uStack_158);
  puStack_b8 = &uStack_148;
  func_0x000140001490(&uStack_138,auStack_58);
  uStack_e0._4_4_ = 0;
  uStack_e0._0_4_ = SUB124(_auStack_e8,8);
  auStack_e8 = (undefined  [8])0x3fc999999999999a;
  puStack_b0 = &uStack_138;
  func_0x0001400053f0(auStack_e8,uStack_160);
  func_0x000140001490(&uStack_128,auStack_e8);
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_e8);
  }
  ppuVar8 = &puStack_b8;
  uVar10 = CONCAT44(uVar2,uRam00000001405c8cc0);
  puStack_a8 = &uStack_128;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,uVar10,ppuVar8);
  func_0x000140001490(&uStack_158,uVar5);
  func_0x00014015fea0(0x23,uRam00000001405c7b88,0x80000000,&uStack_158);
  uStack_c0 = 0x26;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  _auStack_e8 = ZEXT816(0);
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
  uVar7 = (**(code **)(*param_1 + 8))(param_1,0x1878a);
  uVar10 = uVar10 & 0xffffffffffffff00;
  func_0x000140160480(0x23,0x18769,0x80000000,auStack_e8,uVar10,
                      (ulonglong)ppuVar8 & 0xffffffffffffff00);
  uVar3 = (undefined4)(uVar10 >> 0x20);
  uVar2 = func_0x00014012cd90(uVar5);
  uVar5 = func_0x00014002fbe0(uVar7,uVar2);
  func_0x000140001490(&uStack_148,uVar5);
  puStack_b8 = &uStack_148;
  func_0x000140001490(&uStack_138,auStack_e8);
  uVar7 = CONCAT44(uVar3,uRam00000001405c8d80);
  puStack_b0 = &uStack_138;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,uVar7,&puStack_b8);
  uVar2 = (undefined4)((ulonglong)uVar7 >> 0x20);
  uStack_7c = 0;
  uStack_88 = 0x4057800000000000;
  func_0x000140005290(&uStack_88,uVar5);
  func_0x000140001490(&uStack_128,&uStack_88);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_7c = 0;
  uStack_88 = 0x3fc999999999999a;
  puStack_a8 = &uStack_128;
  func_0x0001400053f0(&uStack_88,uStack_160);
  func_0x000140001490(&uStack_118,&uStack_88);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  puStack_a0 = &uStack_118;
  uVar7 = CONCAT44(uVar2,uRam00000001405c8cc0);
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,uVar7,&puStack_b0);
  uVar2 = (undefined4)((ulonglong)uVar7 >> 0x20);
  uVar7 = func_0x000140160290(0x23);
  func_0x000140141d00(uVar7);
  func_0x000140001490(auStack_e8,uVar5);
  func_0x000140141c50(1);
  func_0x000140160b90(0x23,0x18769,0x80000000,auStack_e8);
  uStack_c0 = 0x28;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
  func_0x000140001490(&uStack_148,uVar5);
  puStack_b8 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c5928);
  uStack_7c = 0;
  uStack_88 = 0x3fa999999999999a;
  puStack_b0 = &uStack_138;
  func_0x0001400053f0(&uStack_88,uStack_160);
  func_0x000140001490(&uStack_128,&uStack_88);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  puStack_a8 = &uStack_128;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,CONCAT44(uVar2,uRam00000001405c8cc0),
                              &puStack_b8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar5,uVar7);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
  }
  if ((0x46U >> (uStack_184 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_190);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
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
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return;
}
END DECOMPILED REFERENCE */
