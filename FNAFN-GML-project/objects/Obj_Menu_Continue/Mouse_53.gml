/// @description FNAFN Obj_Menu_Continue / Mouse_53 - PORTED from C
// ---- sub-event Mouse_53 (split from Mouse.gml) ----
// ground truth: gml_Object_Obj_Menu_Continue_Mouse_53 (2266 B @0x140050c90)
// Left-click confirm on the night-select screen. Gated on draw_alpha > 0.95
// (0x3fef333333333333, `0 < iVar1`) like KeyPress_69 — clicks only count once
// faded in. Two hit-box blocks through the named script
// customfunct_ui_button_detection (5-arg box test, same (94, y1,
// 94 + string_width(...), y2, 94) shape as Obj_Menu_Pause/Mouse and the
// Continue Step rows):
//   entry 6 ("custom  night"): (94, 565, 94 + string_width(text_night[6]),
//     605, 94) — consts 0x1405c3ba8 = 94.0, 0x1405c3bb8 = 565.0,
//     0x1405c3bc8 = 605.0; string_width slot 0x1405c8d80, ADD helper
//     func_0x000140005290 builds 94 + width. On hit: room_goto custom-night branch
//     (1-arg call slot 0x1405c8cb0 = room_goto, arg runtime const
//     @0x140655550 — same select-6 branch as KeyPress_69).
//   entry 7 ("exit"): (94, 610, 94 + string_width(text_night[7]), 650, 94)
//     — consts 0x1405c3bd8 = 610.0, 0x1405c3be8 = 650.0. On hit:
//     instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title)
//     (consts 0x1405c3bf8 = 32.0, 0x1405c3c08 = 160.0, string 0x1405c3b98 =
//     "Main_menu", 0x1405c3c18 = 63.0 -> obj_names.json 63 =
//     Obj_Menu_Main_Title; slot 0x1405c8d90 = instance_create_layer) then
//     instance_destroy() (func_0x00014017c070, PROVEN 2026-10-06) — the same
//     "back to main menu" action as KeyPress_81/Q and Mouse_54/right-click.
// TODO(calibrate): room_goto arg @0x140655550 is 0x14065xxxx (outside the exe
//   image); kept as Rm_Menu_Custom_Night (room 0) to match the KeyPress_69
//   select-6 branch — confirm in-game.
if (draw_alpha > 0.95) {
    if (customfunct_ui_button_detection(94, 565, 94 + string_width(text_night[6]), 605, 94) == 1) {
        room_goto(Rm_Menu_Custom_Night);
    }
    if (customfunct_ui_button_detection(94, 610, 94 + string_width(text_night[7]), 650, 94) == 1) {
        instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
        instance_destroy();
    }
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_Mouse_53(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  longlong *plVar4;
  undefined8 in_stack_fffffffffffffe58;
  undefined4 uVar6;
  undefined8 **ppuVar5;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 uStack_140;
  undefined *puStack_138;
  undefined4 uStack_130;
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
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uVar6 = (undefined4)((ulonglong)in_stack_fffffffffffffe58 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_138 = &UNK_14043a989;
  uStack_140 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_140;
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
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_80._4_4_ = 0xffffff;
  uStack_88 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_130 = 1;
  plRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18712);
  uStack_4c = 0;
  uStack_58 = 0x3fef333333333333;
  iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    uStack_130 = 3;
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
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 7) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,6,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,6);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_128,plVar4);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c3ba8);
    puStack_190 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3bb8);
    puStack_188 = &uStack_108;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_198);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_f8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_180 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x1405c3bc8);
    puStack_178 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c3ba8);
    ppuVar5 = &puStack_190;
    puStack_170 = &uStack_d8;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_88,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_130 = 5;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_c8,0x140655550);
      uVar3 = CONCAT44(uVar6,uRam00000001405c8cb0);
      puStack_168 = &uStack_c8;
      func_0x0001401445d0(param_1,param_2,&uStack_68,1,uVar3,&puStack_168);
      uVar6 = (undefined4)((ulonglong)uVar3 >> 0x20);
    }
    uStack_130 = 7;
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_88 = 0;
    uStack_80._0_4_ = 0;
    uStack_80._4_4_ = 5;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar1 = func_0x000140147990(*plVar4);
      if (iVar1 < 8) {
        uVar2 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,7,uVar2);
        plVar4 = (longlong *)0x0;
      }
      else {
        plVar4 = (longlong *)func_0x000140147980(*plVar4,7);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_128,plVar4);
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c3ba8);
    puStack_190 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c3bd8);
    puStack_188 = &uStack_108;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_78,1,CONCAT44(uVar6,uRam00000001405c8d80),
                                &puStack_198);
    uStack_4c = 0;
    uStack_58 = 0x4057800000000000;
    func_0x000140005290(&uStack_58,uVar3);
    func_0x000140001490(&uStack_f8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_180 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x1405c3be8);
    puStack_178 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c3ba8);
    ppuVar5 = &puStack_190;
    puStack_170 = &uStack_d8;
    uVar3 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_88,5,ppuVar5);
    uVar6 = (undefined4)((ulonglong)ppuVar5 >> 0x20);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar3,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_130 = 9;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_c8,0x1405c3bf8);
      puStack_168 = &uStack_c8;
      func_0x00014000bee0(&uStack_b8,0x1405c3c08);
      puStack_160 = &uStack_b8;
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      func_0x0001401441e0(&uStack_a8,0x1405c3b98);
      puStack_158 = &uStack_a8;
      func_0x00014000bee0(&uStack_98,0x1405c3c18);
      puStack_150 = &uStack_98;
      func_0x0001401445d0(param_1,param_2,&uStack_68,4,CONCAT44(uVar6,uRam00000001405c8d90),
                          &puStack_168);
      uStack_130 = 10;
      func_0x00014017c070(param_1,param_2,0,0);
    }
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  puRam0000000140657668 = (undefined8 *)uStack_140;
  return;
}
END DECOMPILED REFERENCE */

