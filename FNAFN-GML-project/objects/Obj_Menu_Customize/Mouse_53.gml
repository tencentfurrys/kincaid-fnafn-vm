/// @description FNAFN Obj_Menu_Customize / Mouse_53 - PORTED from C
// ---- sub-event Mouse_53 (split from Mouse.gml) ----
// Ground truth: gml_Object_Obj_Menu_Customize_Mouse_53 (5537 B @0x1400e1690)
// Click handling, gated on draw_alpha > 0.975 (0x3fef33...; `0 < compare`).
// Six hit-boxes share the Step geometry (94, y1, 94 + string_width(
// text_figure[i]), y2, 94); y1/y2 = 340/380, 385/425, 430/470, 475/515,
// 520/560, 565/605. Object 0x1d = Obj_Menu_Main_Back (obj_names.json):
// slots 0x1405c7b98 = image_alpha, 0x1405c7aa8 = image_index.
// Blocks 0-4 select the roster portrait (image_alpha = 0 + image_index):
// "freddy" -> 1, "bonnie" -> 2, "chica" -> 3, "foxy" -> 4, "none" -> 0.
// Block 5 ("exit") spawns the main menu and removes this controller:
// instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title)
// (exe consts @0x1405c5a18 = 32.0, @0x1405c5a28 = 160.0,
// str @0x1405c5938 = "Main_menu", @0x1405c5a38 = 63.0 = Obj_Menu_Main_Title;
// slot 0x1405c8d90 = instance_create_layer) + instance_destroy()
// (PROVEN helper 0x14017c070).
if (draw_alpha > 0.975) {
    if (customfunct_ui_button_detection(94, 340, 94 + string_width(text_figure[0]), 380, 94) == 1) {
        Obj_Menu_Main_Back.image_alpha = 0;
        Obj_Menu_Main_Back.image_index = 1;
    }
    if (customfunct_ui_button_detection(94, 385, 94 + string_width(text_figure[1]), 425, 94) == 1) {
        Obj_Menu_Main_Back.image_alpha = 0;
        Obj_Menu_Main_Back.image_index = 2;
    }
    if (customfunct_ui_button_detection(94, 430, 94 + string_width(text_figure[2]), 470, 94) == 1) {
        Obj_Menu_Main_Back.image_alpha = 0;
        Obj_Menu_Main_Back.image_index = 3;
    }
    if (customfunct_ui_button_detection(94, 475, 94 + string_width(text_figure[3]), 515, 94) == 1) {
        Obj_Menu_Main_Back.image_alpha = 0;
        Obj_Menu_Main_Back.image_index = 4;
    }
    if (customfunct_ui_button_detection(94, 520, 94 + string_width(text_figure[4]), 560, 94) == 1) {
        Obj_Menu_Main_Back.image_alpha = 0;
        Obj_Menu_Main_Back.image_index = 0;
    }
    if (customfunct_ui_button_detection(94, 565, 94 + string_width(text_figure[5]), 605, 94) == 1) {
        instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
        instance_destroy();
    }
}
// ground truth: gml_Object_Obj_Menu_Customize_Mouse_53 (5537 B @0x1400e1690)
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Customize_Mouse_53(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  longlong *plVar4;
  undefined8 in_stack_fffffffffffffe18;
  undefined4 uVar6;
  undefined8 **ppuVar5;
  undefined8 uStack_1d8;
  uint uStack_1cc;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 *puStack_1b8;
  undefined8 *puStack_1b0;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
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
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uVar6 = (undefined4)((ulonglong)in_stack_fffffffffffffe18 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043cceb;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
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
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_70._4_4_ = 0xffffff;
  uStack_78 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_b8 = CONCAT44(0xffffff,(undefined4)uStack_b8);
  uStack_c0 = 0;
  uStack_1cc = 0xffffff;
  uStack_1d8 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_a0 = 1;
  plRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18712);
  uStack_4c = 0;
  uStack_58 = 0x3fef333333333333;
  iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    uStack_a0 = 3;
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
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 1) {
        uVar2 = func_0x000140147990(*plVar4);
        plVar4 = (longlong *)0x0;
        func_0x000140144260(&UNK_140439ca6,0,uVar2);
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_168,plVar4);
    puStack_1b8 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c5948);
    puStack_1b0 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c5958);
    puStack_1a8 = &uStack_148;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_1b8);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_138,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_1a0 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c5968);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c5948);
    ppuVar5 = &puStack_1b0;
    puStack_190 = &uStack_118;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_78,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_a0 = 5;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_a0 = 6;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0x3ff0000000000000;
      func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_88);
    }
    uStack_a0 = 9;
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
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 2) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,1,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,1);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_168,plVar4);
    puStack_1b8 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c5948);
    puStack_1b0 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c5978);
    puStack_1a8 = &uStack_148;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_1b8);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_138,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_1a0 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c5988);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c5948);
    ppuVar5 = &puStack_1b0;
    puStack_190 = &uStack_118;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_78,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_a0 = 0xb;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_a0 = 0xc;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0x4000000000000000;
      func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_88);
    }
    uStack_a0 = 0xf;
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
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 3) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,2,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,2);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_168,plVar4);
    puStack_1b8 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c5948);
    puStack_1b0 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c5998);
    puStack_1a8 = &uStack_148;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_1b8);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_138,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_1a0 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c59a8);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c5948);
    ppuVar5 = &puStack_1b0;
    puStack_190 = &uStack_118;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_78,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_a0 = 0x11;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_a0 = 0x12;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0x4008000000000000;
      func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_88);
    }
    uStack_a0 = 0x15;
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
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 4) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,3,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,3);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_168,plVar4);
    puStack_1b8 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c5948);
    puStack_1b0 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c59b8);
    puStack_1a8 = &uStack_148;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_1b8);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_138,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_1a0 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c59c8);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c5948);
    ppuVar5 = &puStack_1b0;
    puStack_190 = &uStack_118;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_78,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_a0 = 0x17;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_a0 = 0x18;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0x4010000000000000;
      func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_88);
    }
    uStack_a0 = 0x1b;
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
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 5) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,4,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,4);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_168,plVar4);
    puStack_1b8 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c5948);
    puStack_1b0 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c59d8);
    puStack_1a8 = &uStack_148;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_1b8);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_138,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_1a0 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c59e8);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c5948);
    ppuVar5 = &puStack_1b0;
    puStack_190 = &uStack_118;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_78,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_a0 = 0x1d;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_a0 = 0x1e;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_7c = 0;
      uStack_88 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_88);
    }
    uStack_a0 = 0x23;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70._0_4_ = 0;
    uStack_70._4_4_ = 5;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878a);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 6) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,5,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,5);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_168,plVar4);
    puStack_1b8 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c5948);
    puStack_1b0 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c59f8);
    puStack_1a8 = &uStack_148;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_1b8);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_138,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_1a0 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c5a08);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c5948);
    ppuVar5 = &puStack_1b0;
    puStack_190 = &uStack_118;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_78,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_a0 = 0x25;
      if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_c0);
      }
      uStack_c0 = 0;
      uStack_b8 = 0x500000000;
      func_0x00014000bee0(&uStack_108,0x1405c5a18);
      puStack_188 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c5a28);
      puStack_180 = &uStack_f8;
      if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_e8);
      }
      func_0x0001401441e0(&uStack_e8,0x1405c5938);
      puStack_178 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1405c5a38);
      puStack_170 = &uStack_d8;
      func_0x0001401445d0(param_1,param_2,&uStack_c0,4,CONCAT44(uVar6,uRam00000001405c8d90),
                          &puStack_188);
      uStack_a0 = 0x26;
      func_0x00014017c070(param_1,param_2,0,0);
    }
  }
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d8);
  }
  if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */

