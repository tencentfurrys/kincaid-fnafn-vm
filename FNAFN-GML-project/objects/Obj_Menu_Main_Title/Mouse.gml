/// @description FNAFN Obj_Menu_Main_Title / Mouse - Mouse_53 PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_53  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_53 — PORTED from C ----
// ground truth: gml_Object_Obj_Menu_Main_Title_Mouse_53 (4506 B @0x140102d20)
// Event 53 = Mouse Left Released (same as Obj_Menu_Pause/Mouse_53, PORTED).
// Outer gate (line 1): if (draw_alpha > 0.975) (id 0x18712 vs
// 0x3fef333333333333 = 0.975, 3-way compare with flag 1, branch on >).
// Three text buttons, each hit-tested through the named script
// customfunct_ui_button_detection(x1, y1, x2, y2, x1b) — same 5-arg
// shape as Pause/Mouse: (94, y, 94 + string_width(text_menu[i]),
// yBottom, 94), compared == 1:
//   button 0 ("new game", y 340/380): play blip (22, runtime, runtime),
//      instance_create_layer(<runtime>, <runtime>, "Fade",
//      Obj_Menu_Transition) (layer "Fade" @0x1405c62b0, obj 2.0
//      @0x1405c6300), then Obj_Menu_Transition.Room_to_go_to = 5
//      (Rm_Loading — room_names.json).
//   button 1 ("continue", y 385/425): instance_create_layer(<runtime>,
//      <runtime>, "Main_menu", Obj_Menu_Continue) (layer @0x1405c62b5,
//      obj 3.0 @0x1405c6330), then with (Obj_Menu_Main_Options) {
//      instance_destroy(); } with (Obj_Menu_Main_Music) {
//      instance_destroy(); } instance_destroy(); (repeat consts 76.0 =
//      Obj_Menu_Main_Options, 55.0 = Obj_Menu_Main_Music).
//   button 2 ("customize", y 430/470): instance_create_layer(<runtime>,
//      <runtime>, "Main_menu", Obj_Menu_Customize) (obj 53.0
//      @0x1405c6360), then the same two with-destroys + self destroy.
// ("extras"/text_menu[3] has no button block in this event.)
// Exe consts (exe_strings.py): 0x1405c62c0 = 94.0, 0x1405c62d0 = 340.0,
// 0x1405c62e0 = 380.0, 0x1405c6310 = 385.0, 0x1405c6320 = 425.0,
// 0x1405c6340 = 430.0, 0x1405c6350 = 470.0, 0x1405c62f0 = 22.0.
// TODO(calibrate): draw_alpha threshold exact value (0.975 assumed from
// the double bits); instance_create_layer x/y are runtime const
// @0x140657158 (assumed 0, 0); audio priority/loop same runtime const.
if (draw_alpha > 0.975) {
    if (customfunct_ui_button_detection(94, 340, 94 + string_width(text_menu[0]), 380, 94) == 1) {
        customfunct_audio_play_sound_single(Snd_Menu_Confirm, 0, false); // TODO(calibrate): priority/loop are runtime const @0x140657158
        instance_create_layer(0, 0, "Fade", Obj_Menu_Transition); // TODO(calibrate): x/y are runtime const @0x140657158
        Obj_Menu_Transition.Room_to_go_to = 5; // Rm_Loading (room_names.json)
    }
    if (customfunct_ui_button_detection(94, 385, 94 + string_width(text_menu[1]), 425, 94) == 1) {
        instance_create_layer(0, 0, "Main_menu", Obj_Menu_Continue); // TODO(calibrate): x/y are runtime const @0x140657158
        with (Obj_Menu_Main_Options) {
            instance_destroy();
        }
        with (Obj_Menu_Main_Music) {
            instance_destroy();
        }
        instance_destroy();
    }
    if (customfunct_ui_button_detection(94, 430, 94 + string_width(text_menu[2]), 470, 94) == 1) {
        instance_create_layer(0, 0, "Main_menu", Obj_Menu_Customize); // TODO(calibrate): x/y are runtime const @0x140657158
        with (Obj_Menu_Main_Options) {
            instance_destroy();
        }
        with (Obj_Menu_Main_Music) {
            instance_destroy();
        }
        instance_destroy();
    }
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Title_Mouse_53(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  longlong *plVar5;
  undefined8 in_stack_fffffffffffffde8;
  undefined4 uVar7;
  undefined8 **ppuVar6;
  undefined8 uStack_208;
  uint uStack_1fc;
  undefined8 uStack_1f8;
  uint uStack_1ec;
  undefined8 *puStack_1e8;
  undefined8 *puStack_1e0;
  undefined8 *puStack_1d8;
  undefined8 *puStack_1d0;
  undefined8 *puStack_1c8;
  undefined8 *puStack_1c0;
  undefined8 *puStack_1b8;
  undefined8 *puStack_1b0;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
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
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f0;
  uint uStack_e4;
  longlong lStack_e0;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  longlong lStack_68;
  undefined8 uStack_58;
  longlong *plStack_50;
  undefined8 uStack_48;
  
  uVar7 = (undefined4)((ulonglong)in_stack_fffffffffffffde8 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043d554;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
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
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_80._4_4_ = 0xffffff;
  uStack_88 = 0;
  uStack_a0 = CONCAT44(0xffffff,(undefined4)uStack_a0);
  uStack_a8 = 0;
  uStack_90 = CONCAT44(0xffffff,(undefined4)uStack_90);
  uStack_98 = 0;
  uStack_1fc = 0xffffff;
  uStack_208 = 0;
  uStack_1ec = 0xffffff;
  uStack_1f8 = 0;
  uStack_b0 = 1;
  plRam0000000140657680 = param_1;
  uStack_58 = param_2;
  plStack_50 = param_1;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18712);
  uStack_70 = (ulonglong)(uint)uStack_70;
  uStack_78 = 0x3fef333333333333;
  iVar2 = func_0x00014015be60(uVar4,&uStack_78,uRam00000001405cd9c0,1);
  if (0 < iVar2) {
    uStack_b0 = 3;
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_88 = 0;
    uStack_80 = 0x500000000;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_50 + 8))(plStack_50,0x1878b);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 1) {
        uVar3 = func_0x000140147990(*plVar5);
        plVar5 = (longlong *)0x0;
        func_0x000140144260(&UNK_140439ca6,0,uVar3);
      }
      else {
        plVar5 = (longlong *)func_0x000140147980(*plVar5,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_198,plVar5);
    puStack_1e8 = &uStack_198;
    func_0x00014000bee0(&uStack_188,0x1405c62c0);
    puStack_1e0 = &uStack_188;
    func_0x00014000bee0(&uStack_178,0x1405c62d0);
    puStack_1d8 = &uStack_178;
    uVar4 = func_0x0001401445d0(plStack_50,uStack_58,&uStack_a8,1,
                                CONCAT44(uVar7,uRam00000001405c8d80),&puStack_1e8);
    uStack_70 = uStack_70 & 0xffffffff;
    uStack_78 = 0x4057800000000000;
    func_0x000140005290(&uStack_78,uVar4);
    func_0x000140001490(&uStack_168,&uStack_78);
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    puStack_1d0 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c62e0);
    puStack_1c8 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c62c0);
    ppuVar6 = &puStack_1e0;
    puStack_1c0 = &uStack_148;
    uVar4 = gml_Script_customfunct_ui_button_detection(plStack_50,uStack_58,&uStack_88,5,ppuVar6);
    uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
    uStack_70 = uStack_70 & 0xffffffff;
    uStack_78 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar4,&uStack_78,uRam00000001405cd9c0,0);
    if (iVar2 == 0) {
      uStack_b0 = 5;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x1405c62f0);
      puStack_1b8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x140657158);
      puStack_1b0 = &uStack_128;
      func_0x00014000bee0(&uStack_118,0x140657158);
      ppuVar6 = &puStack_1b8;
      puStack_1a8 = &uStack_118;
      gml_Script_customfunct_audio_play_sound_single(plStack_50,uStack_58,&uStack_98,3,&puStack_1b8)
      ;
      uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
      uStack_b0 = 6;
      if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      uStack_88 = 0;
      uStack_80 = 0x500000000;
      func_0x00014000bee0(&uStack_198,0x140657158);
      puStack_1e8 = &uStack_198;
      func_0x00014000bee0(&uStack_188,0x140657158);
      puStack_1e0 = &uStack_188;
      if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_178);
      }
      func_0x0001401441e0(&uStack_178,0x1405c62b0);
      puStack_1d8 = &uStack_178;
      func_0x00014000bee0(&uStack_168,0x1405c6300);
      uVar4 = CONCAT44(uVar7,uRam00000001405c8d90);
      puStack_1d0 = &uStack_168;
      func_0x0001401445d0(plStack_50,uStack_58,&uStack_88,4,uVar4,&puStack_1e8);
      uVar7 = (undefined4)((ulonglong)uVar4 >> 0x20);
      uStack_b0 = 7;
      uStack_70 = 0;
      uStack_78 = 0x4014000000000000;
      func_0x000140160b90(2,0x18760,0x80000000,&uStack_78);
    }
    uStack_b0 = 10;
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_88 = 0;
    uStack_80 = 0x500000000;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_50 + 8))(plStack_50,0x1878b);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 2) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,1,uVar3);
        plVar5 = (longlong *)0x0;
      }
      else {
        plVar5 = (longlong *)func_0x000140147980(*plVar5,1);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_198,plVar5);
    puStack_1e8 = &uStack_198;
    func_0x00014000bee0(&uStack_188,0x1405c62c0);
    puStack_1e0 = &uStack_188;
    func_0x00014000bee0(&uStack_178,0x1405c6310);
    puStack_1d8 = &uStack_178;
    uVar4 = func_0x0001401445d0(plStack_50,uStack_58,&uStack_a8,1,
                                CONCAT44(uVar7,uRam00000001405c8d80),&puStack_1e8);
    uStack_70 = uStack_70 & 0xffffffff;
    uStack_78 = 0x4057800000000000;
    func_0x000140005290(&uStack_78,uVar4);
    func_0x000140001490(&uStack_168,&uStack_78);
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    puStack_1d0 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c6320);
    puStack_1c8 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c62c0);
    puStack_1c0 = &uStack_148;
    ppuVar6 = &puStack_1e0;
    uVar4 = gml_Script_customfunct_ui_button_detection(plStack_50,uStack_58,&uStack_88,5,ppuVar6);
    uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
    uStack_70 = uStack_70 & 0xffffffff;
    uStack_78 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar4,&uStack_78,uRam00000001405cd9c0,0);
    if (iVar2 == 0) {
      uStack_b0 = 0xc;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x140657158);
      puStack_1b8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x140657158);
      puStack_1b0 = &uStack_128;
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c62b5);
      puStack_1a8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c6330);
      uVar4 = CONCAT44(uVar7,uRam00000001405c8d90);
      puStack_1a0 = &uStack_108;
      func_0x0001401445d0(plStack_50,uStack_58,&uStack_98,4,uVar4,&puStack_1b8);
      uStack_b0 = 0xd;
      uStack_e4 = 0;
      uStack_f0 = 0x4053000000000000;
      iVar2 = func_0x000140144bd0(&uStack_78,&plStack_50,&uStack_58,&uStack_f0);
      if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f0);
      }
      if (0 < iVar2) {
        do {
          uStack_b0 = 0xf;
          func_0x00014017c070(plStack_50,uStack_58,0,0);
          cVar1 = func_0x0001401451f0(&uStack_78,&plStack_50);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_78,&plStack_50,&uStack_58);
      uStack_b0 = 0x11;
      uStack_c4 = 0;
      uStack_d0 = 0x404b800000000000;
      iVar2 = func_0x000140144bd0(&uStack_f0,&plStack_50,&uStack_58,&uStack_d0);
      if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_d0);
      }
      uVar7 = (undefined4)((ulonglong)uVar4 >> 0x20);
      if (0 < iVar2) {
        do {
          uStack_b0 = 0x13;
          func_0x00014017c070(plStack_50,uStack_58,0,0);
          cVar1 = func_0x0001401451f0(&uStack_f0,&plStack_50);
          uVar7 = (undefined4)((ulonglong)uVar4 >> 0x20);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_f0,&plStack_50,&uStack_58);
      uStack_b0 = 0x15;
      func_0x00014017c070(plStack_50,uStack_58,0,0);
      if (lStack_e0 != 0) {
        func_0x00014012ec70();
        lStack_e0 = 0;
      }
      if (lStack_68 != 0) {
        func_0x00014012ec70();
        lStack_68 = 0;
      }
    }
    uStack_b0 = 0x18;
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_88 = 0;
    uStack_80._0_4_ = 0;
    uStack_80._4_4_ = 5;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_50 + 8))(plStack_50,0x1878b);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 3) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,2,uVar3);
        plVar5 = (longlong *)0x0;
      }
      else {
        plVar5 = (longlong *)func_0x000140147980(*plVar5,2);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_198,plVar5);
    puStack_1e8 = &uStack_198;
    func_0x00014000bee0(&uStack_188,0x1405c62c0);
    puStack_1e0 = &uStack_188;
    func_0x00014000bee0(&uStack_178,0x1405c6340);
    puStack_1d8 = &uStack_178;
    uVar4 = func_0x0001401445d0(plStack_50,uStack_58,&uStack_a8,1,
                                CONCAT44(uVar7,uRam00000001405c8d80),&puStack_1e8);
    uStack_70 = uStack_70 & 0xffffffff;
    uStack_78 = 0x4057800000000000;
    func_0x000140005290(&uStack_78,uVar4);
    func_0x000140001490(&uStack_168,&uStack_78);
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    puStack_1d0 = &uStack_168;
    func_0x00014000bee0(&uStack_158,0x1405c6350);
    puStack_1c8 = &uStack_158;
    func_0x00014000bee0(&uStack_148,0x1405c62c0);
    puStack_1c0 = &uStack_148;
    ppuVar6 = &puStack_1e0;
    uVar4 = gml_Script_customfunct_ui_button_detection(plStack_50,uStack_58,&uStack_88,5,ppuVar6);
    uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
    uStack_70 = uStack_70 & 0xffffffff;
    uStack_78 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar4,&uStack_78,uRam00000001405cd9c0,0);
    if (iVar2 == 0) {
      uStack_b0 = 0x1a;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x140657158);
      puStack_1b8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x140657158);
      puStack_1b0 = &uStack_128;
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c62b5);
      puStack_1a8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c6360);
      puStack_1a0 = &uStack_108;
      func_0x0001401445d0(plStack_50,uStack_58,&uStack_98,4,CONCAT44(uVar7,uRam00000001405c8d90),
                          &puStack_1b8);
      uStack_b0 = 0x1b;
      uStack_e4 = 0;
      uStack_f0 = 0x4053000000000000;
      iVar2 = func_0x000140144bd0(&uStack_78,&plStack_50,&uStack_58,&uStack_f0);
      if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f0);
      }
      if (0 < iVar2) {
        do {
          uStack_b0 = 0x1d;
          func_0x00014017c070(plStack_50,uStack_58,0,0);
          cVar1 = func_0x0001401451f0(&uStack_78,&plStack_50);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_78,&plStack_50,&uStack_58);
      uStack_b0 = 0x1f;
      uStack_c4 = 0;
      uStack_d0 = 0x404b800000000000;
      iVar2 = func_0x000140144bd0(&uStack_f0,&plStack_50,&uStack_58,&uStack_d0);
      if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_d0);
      }
      if (0 < iVar2) {
        do {
          uStack_b0 = 0x21;
          func_0x00014017c070(plStack_50,uStack_58,0,0);
          cVar1 = func_0x0001401451f0(&uStack_f0,&plStack_50);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_f0,&plStack_50,&uStack_58);
      uStack_b0 = 0x23;
      func_0x00014017c070(plStack_50,uStack_58,0,0);
      if (lStack_e0 != 0) {
        func_0x00014012ec70();
        lStack_e0 = 0;
      }
      if (lStack_68 != 0) {
        func_0x00014012ec70();
        lStack_68 = 0;
      }
    }
  }
  if ((0x46U >> (uStack_1ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1f8);
  }
  if ((0x46U >> (uStack_1fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_208);
  }
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
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
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */
