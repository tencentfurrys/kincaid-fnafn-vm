/// @description FNAFN Obj_Menu_Continue / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Continue_Step_0 (10720 B @0x1400510f0)
// The MOUSE-DRIVEN half of the night-select screen (the keyboard half lives
// in KeyPress_69/81/83/87). uStack_180 = delta_factor (global 0x1870b),
// fetched once at the top and reused by every lerp below.
//
// Eight identical hit-box blocks, one per menu entry. Entry i tests
// customfunct_ui_button_detection(94, y1_i, 94 + string_width(text_night[i]),
// y2_i, 94) == 1 — the now-PORTED script (x1, y1, x2, x2_offset, y2 form);
// 94.0 = 0x4057800000000000 is ADDed to string_width via func_0x000140005290
// (not multiplied — an old note misread the helper). On hover the shared
// selector is parked on that entry:
//   Obj_Menu_Selector.select_y = y1_i        (0x1876d, 0x23-tagged write)
//   Obj_Menu_Main_Back.image_index = i       (slot 0x1405c7aa8, 0x1d-tagged)
// and, only when select was NOT already i (compare `iVar1 != 0`):
//   customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false)
//      — consts 0x1405c3a58 = 31.0, 0x140655540 x2 = BSS-zero globals
//   Obj_Menu_Main_Back.image_alpha = 0       (slot 0x1405c7b98)
//   select = i
// Hit-box rows (exe consts, y2 = y1 + 40 in every case):
//   i  y1 const        y1   y2 const        y2
//   0  0x1405c3a38     295  0x1405c3a48     335
//   1  0x1405c3a68     340  0x1405c3a78     380
//   2  0x1405c3a88     385  0x1405c3a98     425
//   3  0x1405c3aa8     430  0x1405c3ab8     470
//   4  0x1405c3ac8     475  0x1405c3ad8     515
//   5  0x1405c3ae8     520  0x1405c3af8     560
//   6  0x1405c3b08     565  0x1405c3b18     605
//   7  0x1405c3b28     610  0x1405c3b38     650
// (These y1 values match the KeyPress_83/87 select_y targets exactly.)
//
// Then the same three delta-scaled eases the keyboard handlers run:
//   Obj_Menu_Selector.y = lerp(y, select_y, 0.2 * delta_factor)
//   Obj_Menu_Selector.secondary_x = lerp(secondary_x,
//       94 + string_width(text_night[select]), 0.2 * delta_factor)
//   draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor)
// (lerp slot 0x1405c8cc0; 0x3fc999999999999a = 0.2; 0x3fa999999999999a =
//  0.05; draw_alpha target const 0x1405c3b48 = 1.0.)
if (customfunct_ui_button_detection(94, 295, 94 + string_width(text_night[0]), 335, 94) == 1) {
    Obj_Menu_Selector.select_y = 295;
    Obj_Menu_Main_Back.image_index = 0;
    if (select != 0) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 0;
    }
}
if (customfunct_ui_button_detection(94, 340, 94 + string_width(text_night[1]), 380, 94) == 1) {
    Obj_Menu_Selector.select_y = 340;
    Obj_Menu_Main_Back.image_index = 1;
    if (select != 1) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 1;
    }
}
if (customfunct_ui_button_detection(94, 385, 94 + string_width(text_night[2]), 425, 94) == 1) {
    Obj_Menu_Selector.select_y = 385;
    Obj_Menu_Main_Back.image_index = 2;
    if (select != 2) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 2;
    }
}
if (customfunct_ui_button_detection(94, 430, 94 + string_width(text_night[3]), 470, 94) == 1) {
    Obj_Menu_Selector.select_y = 430;
    Obj_Menu_Main_Back.image_index = 3;
    if (select != 3) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 3;
    }
}
if (customfunct_ui_button_detection(94, 475, 94 + string_width(text_night[4]), 515, 94) == 1) {
    Obj_Menu_Selector.select_y = 475;
    Obj_Menu_Main_Back.image_index = 4;
    if (select != 4) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 4;
    }
}
if (customfunct_ui_button_detection(94, 520, 94 + string_width(text_night[5]), 560, 94) == 1) {
    Obj_Menu_Selector.select_y = 520;
    Obj_Menu_Main_Back.image_index = 5;
    if (select != 5) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 5;
    }
}
if (customfunct_ui_button_detection(94, 565, 94 + string_width(text_night[6]), 605, 94) == 1) {
    Obj_Menu_Selector.select_y = 565;
    Obj_Menu_Main_Back.image_index = 6;
    if (select != 6) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 6;
    }
}
if (customfunct_ui_button_detection(94, 610, 94 + string_width(text_night[7]), 650, 94) == 1) {
    Obj_Menu_Selector.select_y = 610;
    Obj_Menu_Main_Back.image_index = 7;
    if (select != 7) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false);
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 7;
    }
}
Obj_Menu_Selector.y = lerp(Obj_Menu_Selector.y, Obj_Menu_Selector.select_y, 0.2 * delta_factor);
Obj_Menu_Selector.secondary_x = lerp(Obj_Menu_Selector.secondary_x, 94 + string_width(text_night[select]), 0.2 * delta_factor);
draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_Step_0(longlong *param_1,undefined8 param_2)

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
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined auStack_78 [8];
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined auStack_58 [8];
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uVar2 = (undefined4)((ulonglong)in_stack_fffffffffffffe58 >> 0x20);
  uStack_48 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043a93f;
  uStack_b0 = 0;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
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
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  plRam0000000140657680 = param_1;
  uStack_180 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_184 = 0xffffff;
  uStack_190 = 0;
  uStack_b0 = 1;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
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
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3a38);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  uStack_50._0_4_ = SUB124(_auStack_58,8);
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3a48);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  ppuVar8 = &puStack_f0;
  puStack_d0 = &uStack_118;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 3;
    _auStack_78 = ZEXT816(0x4072700000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 4;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 5;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
    _auStack_58 = ZEXT416(SUB164(_auStack_58,8)) << 0x40;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 7;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 8;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 9;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0;
    }
  }
  uStack_b0 = 0xd;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
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
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3a68);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3a78);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar8 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0xf;
    _auStack_78 = ZEXT816(0x4075400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x10;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x3ff0000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x11;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x13;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 0x14;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x15;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x3ff0000000000000;
    }
  }
  uStack_b0 = 0x19;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
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
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3a88);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3a98);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar8 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x1b;
    _auStack_78 = ZEXT816(0x4078100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x1c;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x4000000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x1d;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x4000000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x1f;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 0x20;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x21;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4000000000000000;
    }
  }
  uStack_b0 = 0x25;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
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
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3aa8);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3ab8);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar8 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x27;
    _auStack_78 = ZEXT816(0x407ae00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x28;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x4008000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x29;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x4008000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x2b;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 0x2c;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x2d;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4008000000000000;
    }
  }
  uStack_b0 = 0x31;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
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
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3ac8);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3ad8);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar8 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x33;
    _auStack_78 = ZEXT816(0x407db00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x34;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x4010000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x35;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x4010000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x37;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 0x38;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x39;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4010000000000000;
    }
  }
  uStack_b0 = 0x3d;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
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
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3ae8);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3af8);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar8 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x3f;
    _auStack_78 = ZEXT816(0x4080400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x40;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x4014000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x41;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x4014000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x43;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 0x44;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x45;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4014000000000000;
    }
  }
  uStack_b0 = 0x49;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 7) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,6,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,6);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3b08);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_f8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3b18);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar8 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar8);
  uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x4b;
    _auStack_78 = ZEXT816(0x4081a80000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x4c;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x4018000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x4d;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x4018000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x4f;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar8 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar8);
      uVar2 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
      uStack_b0 = 0x50;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x51;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4018000000000000;
    }
  }
  uStack_b0 = 0x55;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878c);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 8) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,7,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,7);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_168,plVar4);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3a28);
  puStack_f0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3b28);
  ppuVar8 = &puStack_f8;
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              ppuVar8);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_58,uVar5);
  func_0x000140001490(&uStack_138,auStack_58);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_58);
  }
  puStack_e0 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c3b38);
  puStack_d8 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3a28);
  puStack_d0 = &uStack_118;
  ppuVar9 = &puStack_f0;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_68,5,ppuVar9);
  uStack_50._4_4_ = 0;
  auStack_58 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x57;
    _auStack_78 = ZEXT816(0x4083100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x58;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_9c = 0;
    uStack_a8 = 0x401c000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_a8);
    uStack_b0 = 0x59;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_50._4_4_ = 0;
    auStack_58 = (undefined  [8])0x401c000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x5b;
      if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_68 = 0;
      uStack_60 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c3a58);
      puStack_f8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140655540);
      puStack_f0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140655540);
      ppuVar9 = &puStack_f8;
      puStack_e8 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_68,3,ppuVar9);
      uStack_b0 = 0x5c;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_b0 = 0x5d;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x401c000000000000;
    }
  }
  uStack_b0 = 0x61;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  _auStack_58 = ZEXT816(0);
  func_0x000140144a40(0x23,uRam00000001405c7b88,0x80000000,&uStack_178);
  uVar10 = (ulonglong)ppuVar9 & 0xffffffffffffff00;
  func_0x000140160480(0x23,0x1876d,0x80000000,auStack_58,uVar10,
                      (ulonglong)ppuVar8 & 0xffffffffffffff00);
  uVar2 = (undefined4)(uVar10 >> 0x20);
  func_0x000140001490(&uStack_168,&uStack_178);
  puStack_f8 = &uStack_168;
  func_0x000140001490(&uStack_158,auStack_58);
  uStack_70._4_4_ = 0;
  auStack_78 = (undefined  [8])0x3fc999999999999a;
  puStack_f0 = &uStack_158;
  func_0x0001400053f0(auStack_78,uStack_180);
  func_0x000140001490(&uStack_148,auStack_78);
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_78);
  }
  ppuVar8 = &puStack_f8;
  uVar10 = CONCAT44(uVar2,uRam00000001405c8cc0);
  puStack_e8 = &uStack_148;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,uVar10,ppuVar8);
  func_0x000140001490(&uStack_178,uVar5);
  func_0x00014015fea0(0x23,uRam00000001405c7b88,0x80000000,&uStack_178);
  uStack_b0 = 0x62;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  uStack_88 = 0;
  uStack_80 = 0x500000000;
  _auStack_78 = ZEXT816(0);
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
  uVar7 = (**(code **)(*param_1 + 8))(param_1,0x1878c);
  uVar10 = uVar10 & 0xffffffffffffff00;
  func_0x000140160480(0x23,0x18769,0x80000000,auStack_78,uVar10,
                      (ulonglong)ppuVar8 & 0xffffffffffffff00);
  uVar3 = (undefined4)(uVar10 >> 0x20);
  uVar2 = func_0x00014012cd90(uVar5);
  uVar5 = func_0x00014002fbe0(uVar7,uVar2);
  func_0x000140001490(&uStack_168,uVar5);
  puStack_f8 = &uStack_168;
  func_0x000140001490(&uStack_158,auStack_78);
  uVar7 = CONCAT44(uVar3,uRam00000001405c8d80);
  puStack_f0 = &uStack_158;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_88,1,uVar7,&puStack_f8);
  uVar2 = (undefined4)((ulonglong)uVar7 >> 0x20);
  uStack_fc = 0;
  uStack_108 = 0x4057800000000000;
  func_0x000140005290(&uStack_108,uVar5);
  func_0x000140001490(&uStack_148,&uStack_108);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  uStack_fc = 0;
  uStack_108 = 0x3fc999999999999a;
  puStack_e8 = &uStack_148;
  func_0x0001400053f0(&uStack_108,uStack_180);
  func_0x000140001490(&uStack_138,&uStack_108);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  puStack_e0 = &uStack_138;
  uVar7 = CONCAT44(uVar2,uRam00000001405c8cc0);
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,uVar7,&puStack_f0);
  uVar2 = (undefined4)((ulonglong)uVar7 >> 0x20);
  uVar7 = func_0x000140160290(0x23);
  func_0x000140141d00(uVar7);
  func_0x000140001490(auStack_78,uVar5);
  func_0x000140141c50(1);
  func_0x000140160b90(0x23,0x18769,0x80000000,auStack_78);
  uStack_b0 = 100;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
  func_0x000140001490(&uStack_168,uVar5);
  puStack_f8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c3b48);
  uStack_fc = 0;
  uStack_108 = 0x3fa999999999999a;
  puStack_f0 = &uStack_158;
  func_0x0001400053f0(&uStack_108,uStack_180);
  func_0x000140001490(&uStack_148,&uStack_108);
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  puStack_e8 = &uStack_148;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_68,3,CONCAT44(uVar2,uRam00000001405c8cc0),
                              &puStack_f8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar5,uVar7);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_184 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_190);
  }
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
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
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */
