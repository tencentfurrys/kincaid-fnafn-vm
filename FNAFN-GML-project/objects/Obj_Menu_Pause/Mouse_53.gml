/// @description FNAFN Obj_Menu_Pause / Mouse_53 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Pause_Mouse_53 (2020 B @0x1400d7430)
// Event 53 = Mouse Left Released (ev_left_released family).
// The pause menu's two text buttons. Each is a hit-box test through the
// named script customfunct_ui_button_detection (now PORTED -- signature
// (x1, y1, x2, x2_offset, y2): returns 1 iff mouse_x > x1 &&
// mouse_x < x2 + x2_offset && mouse_y > y1 && mouse_y < y2).
// Args staged per button, in order (puStack_190..170 = argv[0..4]):
//   button 0 ("return"): (94, 340, 94 + string_width(pause_text[0]), 380, 94)
//   button 1 ("exit"):   (94, 385, 94 + string_width(pause_text[1]), 425, 94)
// Exe constants (EXE-CONSTANTS.md / exe_strings.py): 0x1405c5610 = 94.0,
// 0x1405c5620 = 340.0, 0x1405c5630 = 380.0, 0x1405c5640 = 385.0,
// 0x1405c5650 = 425.0, 0x1405c5660 = 1.0. NOTE: the 94.0 added to
// string_width is func_0x000140005290 = ADD (not a multiply -- the old
// "* 95" note misread the helper); 0x4057800000000000 is the double 94.0.
// Branch bodies (PROVEN 2026-10-06):
//   "return" -> with (45) { event_perform(ev_keypress, 27) }: the with()
//     block is helper func_0x000140144bd0/0x0001401451f0/0x0001401449f0
//     (its "repeat const" 0x4046800000000000 = 45.0 is the OBJECT INDEX
//     45 = Obj_Pause, not a loop count). func_0x000140181c50(self, other,
//     type, number) = event_perform(); type 9 = ev_keypress, 0x1b = 27 =
//     vk_escape. So clicking "return" forwards an Esc keypress to the
//     pause controller, which toggles the pause off (Obj_Pause KeyPress_27).
//   "exit" -> 1-arg call slot 0x1405c8cb0 (REGISTRY-CONFIRMED room_goto)
//     with const 1.0 -> room_goto(Rm_Menu) (room_names.json index 1).
if (customfunct_ui_button_detection(
        94,
        340,
        94 + string_width(pause_text[0]),
        380,
        94
    ) == 1) {
    with (Obj_Pause) {
        event_perform(ev_keypress, vk_escape);
    }
}

if (customfunct_ui_button_detection(
        94,
        385,
        94 + string_width(pause_text[1]),
        425,
        94
    ) == 1) {
    room_goto(Rm_Menu);
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Pause_Mouse_53(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 uVar5;
  undefined8 in_stack_fffffffffffffe58;
  undefined4 uVar7;
  undefined8 **ppuVar6;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 uStack_160;
  uint uStack_154;
  undefined8 uStack_150;
  uint uStack_144;
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
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  longlong lStack_68;
  undefined8 uStack_58;
  longlong *plStack_50;
  undefined8 uStack_48;
  
  uVar7 = (undefined4)((ulonglong)in_stack_fffffffffffffe58 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_138 = &UNK_14043ca49 / * "gml_Object_Obj_Menu_Pause_Mouse_53" * /;
  uStack_140 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_140;
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
  uStack_a0 = CONCAT44(0xffffff,(undefined4)uStack_a0);
  uStack_a8 = 0;
  uStack_154 = 0xffffff;
  uStack_160 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_130 = 1;
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plRam0000000140657680 = param_1;
  uStack_58 = param_2;
  plStack_50 = param_1;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x18753 / * "pause_text" * /);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 1) {
      uVar3 = func_0x000140147990(*plVar4);
      plVar4 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,0,uVar3);
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
  }
  func_0x000140001490(&uStack_118,plVar4);
  puStack_198 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5610);
  puStack_190 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5620);
  puStack_188 = &uStack_f8;
  uVar5 = func_0x0001401445d0(plStack_50,uStack_58,&uStack_88,1,CONCAT44(uVar7,uRam00000001405c8d80)
                              ,&puStack_198);
  uStack_6c = 0;
  uStack_78 = 0x4057800000000000;
  func_0x000140005290(&uStack_78,uVar5);
  func_0x000140001490(&uStack_e8,&uStack_78);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puStack_180 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c5630);
  puStack_178 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5610);
  ppuVar6 = &puStack_190;
  puStack_170 = &uStack_c8;
  uVar5 = gml_Script_customfunct_ui_button_detection(plStack_50,uStack_58,&uStack_98,5,ppuVar6);
  uStack_6c = 0;
  uStack_78 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar5,&uStack_78,uRam00000001405cd9c0,0);
  uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
  if (iVar2 == 0) {
    uStack_130 = 3;
    uStack_11c = 0;
    uStack_128 = 0x4046800000000000;
    iVar2 = func_0x000140144bd0(&uStack_78,&plStack_50,&uStack_58,&uStack_128);
    if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_128);
    }
    uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
    if (0 < iVar2) {
      do {
        uStack_130 = 5;
        func_0x000140181c50(plStack_50,uStack_58,9,0x1b);
        cVar1 = func_0x0001401451f0(&uStack_78,&plStack_50,&uStack_58);
        uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
      } while (cVar1 != '\0');
    }
    func_0x0001401449f0(&uStack_78,&plStack_50,&uStack_58);
    if (lStack_68 != 0) {
      func_0x00014012ec70();
      lStack_68 = 0;
    }
  }
  uStack_130 = 9;
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*plStack_50 + 8))(plStack_50,0x18753 / * "pause_text" * /);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,1,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
  }
  func_0x000140001490(&uStack_118,plVar4);
  puStack_198 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x1405c5610);
  puStack_190 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5640);
  puStack_188 = &uStack_f8;
  uVar5 = func_0x0001401445d0(plStack_50,uStack_58,&uStack_88,1,CONCAT44(uVar7,uRam00000001405c8d80)
                              ,&puStack_198);
  uStack_6c = 0;
  uStack_78 = 0x4057800000000000;
  func_0x000140005290(&uStack_78,uVar5);
  func_0x000140001490(&uStack_e8,&uStack_78);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puStack_180 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c5650);
  puStack_178 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c5610);
  ppuVar6 = &puStack_190;
  puStack_170 = &uStack_c8;
  uVar5 = gml_Script_customfunct_ui_button_detection(plStack_50,uStack_58,&uStack_98,5,ppuVar6);
  uVar7 = (undefined4)((ulonglong)ppuVar6 >> 0x20);
  uStack_6c = 0;
  uStack_78 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar5,&uStack_78,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_130 = 0xb;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    func_0x00014000bee0(&uStack_b8,0x1405c5660);
    puStack_168 = &uStack_b8;
    func_0x0001401445d0(plStack_50,uStack_58,&uStack_a8,1,CONCAT44(uVar7,uRam00000001405c8cb0),
                        &puStack_168);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_160);
  }
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  puRam0000000140657668 = (undefined8 *)uStack_140;
  return;
}
END DECOMPILED REFERENCE */
