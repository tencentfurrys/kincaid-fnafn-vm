/// @description FNAFN Obj_Menu_Main_Title / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Title_Step_0 (9075 B @0x1400fee60)
// Hover rows drive the shared selector + backdrop portrait; the tail lerps
// the selector, the label right edge and draw_alpha, then runs the glitch
// state machine. Id map: text_menu 0x1878b, select 0x1876a,
// draw_alpha 0x18712, glitching 0x18729, glitch_type 0x18728, delta_factor
// 0x1870b (global), select_y 0x1876d + secondary_x 0x18769 on object 0x23 =
// 35 = Obj_Menu_Selector (obj_names.json), image_index/image_alpha on object
// 0x1d = 29 = Obj_Menu_Main_Back. Exe consts (exe_strings.py /
// EXE-CONSTANTS.md): 94/340/380/385/425/430/470/475/515, 31.0 = menu blip
// @0x1405c6210, 160.0 @0x1405c6290, 32.0 @0x1405c62a0, 1.0 @0x1405c6280.
// Runtime consts @0x14065xxxx are outside the mapped exe image.
// TODO(calibrate): audio priority/loop @0x1406570c0 (assumed 0/false);
// glitching case consts @0x1406570d0/@0x1406570e4 + dispatch @0x1406570e0
// (assumed 0/1); glitch random args _UNK_140439e78/_UNK_14043b078 (helper
// 0x140168cf0, best-fit random_range); glitch_type 4-way jumptable targets
// @0x140657100..@0x14065713c + dispatch @0x140657110 (Ghidra could not
// recover the jumptable — branches TODO).
if (customfunct_ui_button_detection(94, 340, 94 + string_width(text_menu[0]), 380, 94) == 1) {
    Obj_Menu_Selector.select_y = 340;
    Obj_Menu_Main_Back.image_index = 0;
    Obj_Menu_Main_Back.image_alpha = 0;
    if (select != 0) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false); // TODO(calibrate): priority/loop are runtime const @0x1406570c0
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 0;
    }
}
if (customfunct_ui_button_detection(94, 385, 94 + string_width(text_menu[1]), 425, 94) == 1) {
    Obj_Menu_Selector.select_y = 385;
    Obj_Menu_Main_Back.image_index = 1;
    Obj_Menu_Main_Back.image_alpha = 0;
    if (select != 1) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false); // TODO(calibrate): priority/loop are runtime const @0x1406570c0
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 1;
    }
}
if (customfunct_ui_button_detection(94, 430, 94 + string_width(text_menu[2]), 470, 94) == 1) {
    Obj_Menu_Selector.select_y = 430;
    Obj_Menu_Main_Back.image_index = 2;
    Obj_Menu_Main_Back.image_alpha = 0;
    if (select != 2) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false); // TODO(calibrate): priority/loop are runtime const @0x1406570c0
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 2;
    }
}
if (customfunct_ui_button_detection(94, 475, 94 + string_width(text_menu[3]), 515, 94) == 1) {
    Obj_Menu_Selector.select_y = 475;
    Obj_Menu_Main_Back.image_index = 3;
    Obj_Menu_Main_Back.image_alpha = 0;
    if (select != 3) {
        customfunct_audio_play_sound_single(Snd_Menu_Select, 0, false); // TODO(calibrate): priority/loop are runtime const @0x1406570c0
        Obj_Menu_Main_Back.image_alpha = 0;
        select = 3;
    }
}
// Shared tail (same shape as KeyPress_83/87): selector follows select_y,
// label right edge follows the selected label, menu fades in.
Obj_Menu_Selector.y = lerp(Obj_Menu_Selector.y, Obj_Menu_Selector.select_y, 0.2 * delta_factor);
Obj_Menu_Selector.secondary_x = lerp(Obj_Menu_Selector.secondary_x, 94 + string_width(text_menu[select]), 0.2 * delta_factor);
draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor);
// Glitch state machine — partial: case dispatch consts are runtime
// TODO(calibrate) (assumed 0/1); the glitch_type 4-way jumptable was not
// recovered by Ghidra, so its branches are TODO.
if (glitching == 1) { // TODO(calibrate): case const is runtime @0x1406570d0/@0x1406570e4
    y = lerp(y, 160, 0.5 * delta_factor); // TODO(calibrate): self x/y lerp targets 160/32 per @0x1405c6290/@0x1405c62a0
    x = lerp(x, 32, 0.5 * delta_factor);
    image_alpha = lerp(image_alpha, 1, 0.3 * delta_factor);
} else {
    image_alpha = random_range(0, 0); // TODO(calibrate): args are rdata consts _UNK_140439e78/_UNK_14043b078; helper 0x140168cf0 best-fit random_range
    // TODO: glitch_type 4-way switch (@0x140657100..@0x14065713c, dispatch @0x140657110) — jumptable not recovered.
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Main_Title_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  ulonglong uVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_fffffffffffffdd8;
  undefined8 **ppuVar10;
  undefined8 **ppuVar11;
  undefined8 uStack_218;
  uint uStack_20c;
  undefined8 uStack_208;
  uint uStack_1fc;
  undefined8 uStack_1f8;
  uint uStack_1ec;
  undefined8 uStack_1e8;
  uint uStack_1dc;
  undefined8 uStack_1d8;
  uint uStack_1cc;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_170;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined auStack_d8 [8];
  undefined8 uStack_d0;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined4 uStack_90;
  uint uStack_8c;
  undefined auStack_88 [8];
  undefined8 uStack_80;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uVar2 = (undefined4)((ulonglong)in_stack_fffffffffffffdd8 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043d508;
  uStack_b0 = 0;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_1cc = 0xffffff;
  uStack_1d8 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_1dc = 0xffffff;
  uStack_1e8 = 0;
  plRam0000000140657680 = param_1;
  uStack_170 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_20c = 0xffffff;
  uStack_218 = 0;
  uStack_1fc = 0xffffff;
  uStack_208 = 0;
  uStack_1ec = 0xffffff;
  uStack_1f8 = 0;
  uStack_b0 = 1;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
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
  func_0x000140001490(&uStack_1d8,plVar4);
  puStack_138 = &uStack_1d8;
  func_0x00014000bee0(&uStack_1c8,0x1405c61e0);
  puStack_130 = &uStack_1c8;
  func_0x00014000bee0(&uStack_1b8,0x1405c61f0);
  puStack_128 = &uStack_1b8;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_138);
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x4067800000000000;
  func_0x000140005290(auStack_88,uVar5);
  func_0x000140001490(&uStack_1a8,auStack_88);
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  puStack_120 = &uStack_1a8;
  func_0x00014000bee0(&uStack_198,0x1405c6200);
  puStack_118 = &uStack_198;
  func_0x00014000bee0(&uStack_188,0x1405c61e0);
  ppuVar10 = &puStack_130;
  puStack_110 = &uStack_188;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_70,5,ppuVar10);
  uVar2 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 2;
    _auStack_d8 = ZEXT816(0x4075400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_d8);
    uStack_b0 = 4;
    if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_fc = 0;
    uStack_108 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_108);
    uStack_b0 = 5;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
    _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
    iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 7;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_1d8,0x1405c6210);
      puStack_138 = &uStack_1d8;
      func_0x00014000bee0(&uStack_1c8,0x1406570c0);
      puStack_130 = &uStack_1c8;
      func_0x00014000bee0(&uStack_1b8,0x1406570c0);
      ppuVar10 = &puStack_138;
      puStack_128 = &uStack_1b8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,ppuVar10);
      uVar2 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
      uStack_b0 = 8;
      if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f8);
      }
      uStack_ec = 0;
      uStack_f8 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_f8);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
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
  func_0x000140001490(&uStack_1d8,plVar4);
  puStack_138 = &uStack_1d8;
  func_0x00014000bee0(&uStack_1c8,0x1405c61e0);
  puStack_130 = &uStack_1c8;
  func_0x00014000bee0(&uStack_1b8,0x1405c6220);
  puStack_128 = &uStack_1b8;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_138);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_88,uVar5);
  func_0x000140001490(&uStack_1a8,auStack_88);
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  puStack_120 = &uStack_1a8;
  func_0x00014000bee0(&uStack_198,0x1405c6230);
  puStack_118 = &uStack_198;
  func_0x00014000bee0(&uStack_188,0x1405c61e0);
  puStack_110 = &uStack_188;
  ppuVar10 = &puStack_130;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_70,5,ppuVar10);
  uVar2 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0xf;
    _auStack_d8 = ZEXT816(0x4078100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_d8);
    uStack_b0 = 0x10;
    if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_fc = 0;
    uStack_108 = 0x3ff0000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_108);
    uStack_b0 = 0x11;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x13;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_1d8,0x1405c6210);
      puStack_138 = &uStack_1d8;
      func_0x00014000bee0(&uStack_1c8,0x1406570c0);
      puStack_130 = &uStack_1c8;
      func_0x00014000bee0(&uStack_1b8,0x1406570c0);
      ppuVar10 = &puStack_138;
      puStack_128 = &uStack_1b8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,ppuVar10);
      uVar2 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
      uStack_b0 = 0x14;
      if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f8);
      }
      uStack_ec = 0;
      uStack_f8 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_f8);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
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
  func_0x000140001490(&uStack_1d8,plVar4);
  puStack_138 = &uStack_1d8;
  func_0x00014000bee0(&uStack_1c8,0x1405c61e0);
  puStack_130 = &uStack_1c8;
  func_0x00014000bee0(&uStack_1b8,0x1405c6240);
  puStack_128 = &uStack_1b8;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              &puStack_138);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_88,uVar5);
  func_0x000140001490(&uStack_1a8,auStack_88);
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  puStack_120 = &uStack_1a8;
  func_0x00014000bee0(&uStack_198,0x1405c6250);
  puStack_118 = &uStack_198;
  func_0x00014000bee0(&uStack_188,0x1405c61e0);
  puStack_110 = &uStack_188;
  ppuVar10 = &puStack_130;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_70,5,ppuVar10);
  uVar2 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x1b;
    _auStack_d8 = ZEXT816(0x407ae00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_d8);
    uStack_b0 = 0x1c;
    if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_fc = 0;
    uStack_108 = 0x4000000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_108);
    uStack_b0 = 0x1d;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x4000000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x1f;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_1d8,0x1405c6210);
      puStack_138 = &uStack_1d8;
      func_0x00014000bee0(&uStack_1c8,0x1406570c0);
      puStack_130 = &uStack_1c8;
      func_0x00014000bee0(&uStack_1b8,0x1406570c0);
      ppuVar10 = &puStack_138;
      puStack_128 = &uStack_1b8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,ppuVar10);
      uVar2 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
      uStack_b0 = 0x20;
      if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f8);
      }
      uStack_ec = 0;
      uStack_f8 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_f8);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1878b);
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
  func_0x000140001490(&uStack_1d8,plVar4);
  puStack_138 = &uStack_1d8;
  func_0x00014000bee0(&uStack_1c8,0x1405c61e0);
  puStack_130 = &uStack_1c8;
  func_0x00014000bee0(&uStack_1b8,0x1405c6260);
  ppuVar10 = &puStack_138;
  puStack_128 = &uStack_1b8;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,CONCAT44(uVar2,uRam00000001405c8d80),
                              ppuVar10);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4057800000000000;
  func_0x000140005290(auStack_88,uVar5);
  func_0x000140001490(&uStack_1a8,auStack_88);
  if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  puStack_120 = &uStack_1a8;
  func_0x00014000bee0(&uStack_198,0x1405c6270);
  puStack_118 = &uStack_198;
  func_0x00014000bee0(&uStack_188,0x1405c61e0);
  puStack_110 = &uStack_188;
  ppuVar11 = &puStack_130;
  uVar5 = gml_Script_customfunct_ui_button_detection(param_1,param_2,&uStack_70,5,ppuVar11);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x27;
    _auStack_d8 = ZEXT816(0x407db00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_d8);
    uStack_b0 = 0x28;
    if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_fc = 0;
    uStack_108 = 0x4008000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_108);
    uStack_b0 = 0x29;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x4008000000000000;
    iVar1 = func_0x00014015be60(uVar5,auStack_88,uRam00000001405cd9c0,0);
    if (iVar1 != 0) {
      uStack_b0 = 0x2b;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_1d8,0x1405c6210);
      puStack_138 = &uStack_1d8;
      func_0x00014000bee0(&uStack_1c8,0x1406570c0);
      puStack_130 = &uStack_1c8;
      func_0x00014000bee0(&uStack_1b8,0x1406570c0);
      ppuVar11 = &puStack_138;
      puStack_128 = &uStack_1b8;
      gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_70,3,ppuVar11);
      uStack_b0 = 0x2c;
      if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f8);
      }
      uStack_ec = 0;
      uStack_f8 = 0;
      func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_f8);
      uStack_b0 = 0x2d;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0x4008000000000000;
    }
  }
  uStack_b0 = 0x32;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  _auStack_88 = ZEXT816(0);
  func_0x000140144a40(0x23,uRam00000001405c7b88,0x80000000,&uStack_1e8);
  uVar8 = (ulonglong)ppuVar11 & 0xffffffffffffff00;
  func_0x000140160480(0x23,0x1876d,0x80000000,auStack_88,uVar8,
                      (ulonglong)ppuVar10 & 0xffffffffffffff00);
  uVar2 = (undefined4)(uVar8 >> 0x20);
  func_0x000140001490(&uStack_1d8,&uStack_1e8);
  puStack_138 = &uStack_1d8;
  func_0x000140001490(&uStack_1c8,auStack_88);
  uStack_d0._4_4_ = 0;
  auStack_d8 = (undefined  [8])0x3fc999999999999a;
  puStack_130 = &uStack_1c8;
  func_0x0001400053f0(auStack_d8,uStack_170);
  func_0x000140001490(&uStack_1b8,auStack_d8);
  if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_d8);
  }
  ppuVar10 = &puStack_138;
  uVar8 = CONCAT44(uVar2,uRam00000001405c8cc0);
  puStack_128 = &uStack_1b8;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uVar8,ppuVar10);
  func_0x000140001490(&uStack_1e8,uVar5);
  func_0x00014015fea0(0x23,uRam00000001405c7b88,0x80000000,&uStack_1e8);
  uStack_b0 = 0x33;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  uStack_e8 = 0;
  uStack_e0 = 0x500000000;
  _auStack_d8 = ZEXT816(0);
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
  uVar7 = (**(code **)(*param_1 + 8))(param_1,0x1878b);
  uVar8 = uVar8 & 0xffffffffffffff00;
  func_0x000140160480(0x23,0x18769,0x80000000,auStack_d8,uVar8,
                      (ulonglong)ppuVar10 & 0xffffffffffffff00);
  uVar3 = (undefined4)(uVar8 >> 0x20);
  uVar2 = func_0x00014012cd90(uVar5);
  uVar5 = func_0x00014002fbe0(uVar7,uVar2);
  func_0x000140001490(&uStack_1d8,uVar5);
  puStack_138 = &uStack_1d8;
  func_0x000140001490(&uStack_1c8,auStack_d8);
  uVar7 = CONCAT44(uVar3,uRam00000001405c8d80);
  puStack_130 = &uStack_1c8;
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,uVar7,&puStack_138);
  uVar2 = (undefined4)((ulonglong)uVar7 >> 0x20);
  uStack_9c = 0;
  uStack_a8 = 0x4057800000000000;
  func_0x000140005290(&uStack_a8,uVar5);
  func_0x000140001490(&uStack_1b8,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_9c = 0;
  uStack_a8 = 0x3fc999999999999a;
  puStack_128 = &uStack_1b8;
  func_0x0001400053f0(&uStack_a8,uStack_170);
  func_0x000140001490(&uStack_1a8,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puStack_120 = &uStack_1a8;
  uVar7 = CONCAT44(uVar2,uRam00000001405c8cc0);
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uVar7,&puStack_130);
  uVar2 = (undefined4)((ulonglong)uVar7 >> 0x20);
  uVar7 = func_0x000140160290(0x23);
  func_0x000140141d00(uVar7);
  func_0x000140001490(auStack_d8,uVar5);
  func_0x000140141c50(1);
  func_0x000140160b90(0x23,0x18769,0x80000000,auStack_d8);
  uStack_b0 = 0x35;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
  func_0x000140001490(&uStack_1d8,uVar5);
  puStack_138 = &uStack_1d8;
  func_0x00014000bee0(&uStack_1c8,0x1405c6280);
  uStack_9c = 0;
  uStack_a8 = 0x3fa999999999999a;
  puStack_130 = &uStack_1c8;
  func_0x0001400053f0(&uStack_a8,uStack_170);
  func_0x000140001490(&uStack_1b8,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  ppuVar10 = &puStack_138;
  uVar8 = CONCAT44(uVar2,uRam00000001405c8cc0);
  puStack_128 = &uStack_1b8;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uVar8,ppuVar10);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar5,uVar7);
  func_0x000140141c50(1);
  uStack_b0 = 0x37;
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18729);
  uStack_9c = *(uint *)((longlong)puVar6 + 0xc);
  uStack_a0 = *(undefined4 *)(puVar6 + 1);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) == 0) {
    uStack_a8 = *puVar6;
  }
  else {
    func_0x000140102300(&uStack_a8,puVar6);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406570f8) &&
     (func_0x0001403f6320(0x1406570f8), iRam00000001406570f8 == -1)) {
    auRam00000001406570dc = ZEXT816(0);
    uRam00000001406570d0 = 0x3ff0000000000000;
    uRam00000001406570f0 = 0x100000000;
    func_0x0001403f6668(&DAT_1401021a0);
    func_0x0001403f62c0(0x1406570f8);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar1 = func_0x00014015be60(0x1406570d0,&uStack_a8,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x1406570e4,&uStack_a8,uVar5,0);
    if (iVar1 != 0) goto joined_r0x000140100bae;
    lVar9 = 1;
  }
  iVar1 = *(int *)(lVar9 * 0x14 + 0x1406570e0);
  if (iVar1 == 1) {
    uStack_b0 = 0x42;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    uVar8 = uVar8 & 0xffffffffffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_158,uVar8,
                        (ulonglong)ppuVar10 & 0xffffffffffffff00);
    uVar2 = (undefined4)(uVar8 >> 0x20);
    func_0x000140001490(&uStack_1d8,&uStack_158);
    puStack_138 = &uStack_1d8;
    func_0x00014000bee0(&uStack_1c8,0x1405c6290);
    uStack_8c = 0;
    uStack_98 = 0x3fe0000000000000;
    puStack_130 = &uStack_1c8;
    func_0x0001400053f0(&uStack_98,uStack_170);
    func_0x000140001490(&uStack_1b8,&uStack_98);
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    ppuVar10 = &puStack_138;
    uVar8 = CONCAT44(uVar2,uRam00000001405c8cc0);
    puStack_128 = &uStack_1b8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uVar8,ppuVar10);
    func_0x000140001490(&uStack_158,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_158);
    uStack_b0 = 0x43;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    uVar8 = uVar8 & 0xffffffffffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_148,uVar8,
                        (ulonglong)ppuVar10 & 0xffffffffffffff00);
    uVar2 = (undefined4)(uVar8 >> 0x20);
    func_0x000140001490(&uStack_1d8,&uStack_148);
    puStack_138 = &uStack_1d8;
    func_0x00014000bee0(&uStack_1c8,0x1405c62a0);
    uStack_8c = 0;
    uStack_98 = 0x3fe0000000000000;
    puStack_130 = &uStack_1c8;
    func_0x0001400053f0(&uStack_98,uStack_170);
    func_0x000140001490(&uStack_1b8,&uStack_98);
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    ppuVar10 = &puStack_138;
    uVar8 = CONCAT44(uVar2,uRam00000001405c8cc0);
    puStack_128 = &uStack_1b8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uVar8,ppuVar10);
    func_0x000140001490(&uStack_148,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_148);
    uStack_b0 = 0x44;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    uVar8 = uVar8 & 0xffffffffffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_168,uVar8,
                        (ulonglong)ppuVar10 & 0xffffffffffffff00);
    uVar2 = (undefined4)(uVar8 >> 0x20);
    func_0x000140001490(&uStack_1d8,&uStack_168);
    puStack_138 = &uStack_1d8;
    func_0x00014000bee0(&uStack_1c8,0x1405c6280);
    uStack_8c = 0;
    uStack_98 = 0x3fd3333333333333;
    puStack_130 = &uStack_1c8;
    func_0x0001400053f0(&uStack_98,uStack_170);
    func_0x000140001490(&uStack_1b8,&uStack_98);
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    puStack_128 = &uStack_1b8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,CONCAT44(uVar2,uRam00000001405c8cc0),
                                &puStack_138);
    func_0x000140001490(&uStack_168,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_168);
    uStack_b0 = 0x45;
    goto joined_r0x000140100bae;
  }
  if (iVar1 != 0) goto joined_r0x000140100bae;
  uStack_b0 = 0x39;
  uVar5 = func_0x000140168cf0((int)_UNK_140439e78,_UNK_14043b078);
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  uStack_15c = 0;
  uStack_168 = uVar5;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_168);
  uStack_b0 = 0x3a;
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18728);
  uStack_8c = *(uint *)((longlong)puVar6 + 0xc);
  uStack_90 = *(undefined4 *)(puVar6 + 1);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) == 0) {
    uStack_98 = *puVar6;
  }
  else {
    func_0x000140102300(&uStack_98,puVar6);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140657150) &&
     (func_0x0001403f6320(0x140657150), iRam0000000140657150 == -1)) {
    uRam000000014065710c = 0;
    uRam0000000140657100 = 0x3ff0000000000000;
    uRam0000000140657120 = 0x100000000;
    uRam0000000140657114 = 0x4000000000000000;
    uRam0000000140657134 = 0x200000000;
    uRam0000000140657128 = 0x4008000000000000;
    uRam0000000140657148 = 0x300000000;
    uRam000000014065713c = 0x4010000000000000;
    func_0x0001403f6668(&DAT_140102230);
    func_0x0001403f62c0(0x140657150);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar1 = func_0x00014015be60(0x140657100,&uStack_98,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x000140100d0b:
    uVar8 = (ulonglong)*(uint *)(lVar9 * 0x14 + 0x140657110);
joined_r0x0001401010aa:
    if (uVar8 < 4) {
                    // (Ghidra note) WARNING: Could not recover jumptable at 0x000140100d2b. Too many branches
                    // (Ghidra note) WARNING: Treating indirect jump as call
      (*(code *)(&UNK_14010218c + *(int *)(&UNK_14010218c + uVar8 * 4)))();
      return;
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140657114,&uStack_98,uVar5,0);
    if (iVar1 == 0) {
      lVar9 = 1;
      goto code_r0x000140100d0b;
    }
    iVar1 = func_0x00014015be60(0x140657128,&uStack_98,uVar5,0);
    if (iVar1 == 0) {
      uVar8 = uRam0000000140657134 >> 0x20;
      goto joined_r0x0001401010aa;
    }
    iVar1 = func_0x00014015be60(0x14065713c,&uStack_98,uVar5,0);
    if (iVar1 == 0) {
      uVar8 = uRam0000000140657148 >> 0x20;
      goto joined_r0x0001401010aa;
    }
  }
  uStack_b0 = 0x41;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
joined_r0x000140100bae:
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_1ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1f8);
  }
  if ((0x46U >> (uStack_1fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_208);
  }
  if ((0x46U >> (uStack_20c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_218);
  }
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
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
  if ((0x46U >> (uStack_1dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1e8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
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
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */
