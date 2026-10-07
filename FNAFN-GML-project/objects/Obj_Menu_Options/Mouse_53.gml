/// @description FNAFN Obj_Menu_Options / Mouse_53 - PORTED from C
// ---- sub-event Mouse_53 (split from Mouse.gml) ----
// ground truth: gml_Object_Obj_Menu_Options_Mouse_53 (17218 B @0x140077bf0)
// Decoded in order (uStack_b8 = GML line markers):
//   2. if (mouse_y < 116.0) [0x405d... = 116.0]: tab row. Per tab i with
//      centre X[i] = 94/320/640/960/1186 (exe .data doubles) and label
//      T[i] = "video"/"audio"/"preferences"/"accessibility"/"credits"
//      (@0x1405c45b0/@0x1405c45b6/@0x1405c45bc/@0x1405c45c8/@0x1405c45d6):
//      if (customfunct_ui_button_detection_x(X[i] - string_width(
//          text_options[i]), X[i] + string_width(text_options[i]),
//          <runtime @0x140655a20>)) {
//          if (menu != T[i]) {
//              customfunct_audio_play_sound_single(Snd_Camera_Click, <runtime>, <runtime>)
//              [48.0 @0x1405c45e8]; menu = T[i]; select = 1;
//              text_scale[j] = (j == i) ? 0.95 : 0.7 [0x3fee.../0x3fe6...];
//              static_magnetude = 1; buttons_x = (i == 0) ? 0 : -416
//              [0xc07a... = -416.0]; Obj_Menu_Options_Preview.arrow_alpha = 0
//              [object-tagged write 0x140160b90(0x2e = 46, 0x186e1)];
//              with (Obj_Menu_Pause) { event_perform(ev_alarm, 0); }
//              [repeat const 48.0 = Obj_Menu_Pause, obj_names.json]
//          }
//      }
//   0x61. if (mouse_x < 384.0) [0x4078... = 384.0]: row-select regions, all
//      gated on mouse_y in (116, 656) [116.0 @0x405d..., 656.0 @0x40848...],
//      each playing sound 31 (@0x1405c45f8):
//        y in (192, 256) -> select = 1; (256, 320) -> select = 2;
//        (320, 384) -> select = 3; (384, 448) -> select = 4 and
//        (448, 512) -> select = 5, the last two additionally gated on
//        (menu != "preferences"); then with (Obj_Menu_Pause) {
//        event_perform(ev_alarm, 0); }.
//   0x8a. if (mouse_y > 656.0) [0x40848... = 656.0]: if (mouse_x < 320.0)
//      [0x4074... = 320.0]: exit sequence (bottom-left "exit" label at
//      (94, 656) per Draw) = customfunct_game_save();
//      customfunct_options_update(); instance_create_layer(-32, 352,
//      "Main_menu", Obj_Menu_Selector) [-32.0 @0x1405c4608, 352.0 @0x1405c4618,
//      "Main_menu" @0x1405c45de, 35.0 = obj 35 @0x1405c4628]; with
//      (Obj_Menu_Options_Selector) { instance_destroy(); } [repeat const
//      9.0 = obj 9]; instance_create_layer(32, 160, "Main_menu",
//      Obj_Menu_Main_Title) [32.0/160.0 @0x1405c4638/@0x1405c4648, 63.0 =
//      obj 63 @0x1405c4658]; instance_destroy() [self].
//   0x9b. switch (select) over 1..5 (guarded pool @0x140655a30): case bodies
//      are indirect jumps Ghidra could not recover; non-matching falls
//      through to plain cleanup+return.
// TODO(calibrate): customfunct_ui_button_detection_x 3rd arg + audio
// priority/loop runtime const @0x140655a20; exit-region geometry in-game;
// the 5 select-switch case bodies (jumptable unrecovered).
if (mouse_y < 116) {
    if (customfunct_ui_button_detection_x(94 - string_width(text_options[0]), 94 + string_width(text_options[0]), 0 /* TODO(calibrate): runtime const @0x140655a20 */)) {
        if (menu != "video") {
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate): runtime @0x140655a20 */, false /* TODO(calibrate): same */);
            menu = "video";
            select = 1;
            text_scale[0] = 0.95;
            text_scale[1] = 0.7;
            text_scale[2] = 0.7;
            text_scale[3] = 0.7;
            text_scale[4] = 0.7;
            static_magnetude = 1;
            buttons_x = 0;
            Obj_Menu_Options_Preview.arrow_alpha = 0;
            with (Obj_Menu_Pause) {
                event_perform(ev_alarm, 0);
            }
        }
    }
    if (customfunct_ui_button_detection_x(320 - string_width(text_options[1]), 320 + string_width(text_options[1]), 0 /* TODO(calibrate): runtime const @0x140655a20 */)) {
        if (menu != "audio") {
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
            menu = "audio";
            select = 1;
            text_scale[0] = 0.7;
            text_scale[1] = 0.95;
            text_scale[2] = 0.7;
            text_scale[3] = 0.7;
            text_scale[4] = 0.7;
            static_magnetude = 1;
            buttons_x = -416;
            Obj_Menu_Options_Preview.arrow_alpha = 0;
            with (Obj_Menu_Pause) {
                event_perform(ev_alarm, 0);
            }
        }
    }
    if (customfunct_ui_button_detection_x(640 - string_width(text_options[2]), 640 + string_width(text_options[2]), 0 /* TODO(calibrate) */)) {
        if (menu != "preferences") {
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
            menu = "preferences";
            select = 1;
            text_scale[0] = 0.7;
            text_scale[1] = 0.7;
            text_scale[2] = 0.95;
            text_scale[3] = 0.7;
            text_scale[4] = 0.7;
            static_magnetude = 1;
            buttons_x = -416;
            Obj_Menu_Options_Preview.arrow_alpha = 0;
            with (Obj_Menu_Pause) {
                event_perform(ev_alarm, 0);
            }
        }
    }
    if (customfunct_ui_button_detection_x(960 - string_width(text_options[3]), 960 + string_width(text_options[3]), 0 /* TODO(calibrate) */)) {
        if (menu != "accessibility") {
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
            menu = "accessibility";
            select = 1;
            text_scale[0] = 0.7;
            text_scale[1] = 0.7;
            text_scale[2] = 0.7;
            text_scale[3] = 0.95;
            text_scale[4] = 0.7;
            static_magnetude = 1;
            buttons_x = -416;
            Obj_Menu_Options_Preview.arrow_alpha = 0;
            with (Obj_Menu_Pause) {
                event_perform(ev_alarm, 0);
            }
        }
    }
    if (customfunct_ui_button_detection_x(1186 - string_width(text_options[4]), 1186 + string_width(text_options[4]), 0 /* TODO(calibrate) */)) {
        if (menu != "credits") {
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
            menu = "credits";
            select = 1;
            text_scale[0] = 0.7;
            text_scale[1] = 0.7;
            text_scale[2] = 0.7;
            text_scale[3] = 0.7;
            text_scale[4] = 0.95;
            static_magnetude = 1;
            buttons_x = -416;
            Obj_Menu_Options_Preview.arrow_alpha = 0;
            with (Obj_Menu_Pause) {
                event_perform(ev_alarm, 0);
            }
        }
    }
}
if (mouse_x < 384) {
    if ((mouse_y > 116) && (mouse_y < 656)) {
        if ((mouse_y > 192) && (mouse_y < 256)) {
            customfunct_audio_play_sound_single(Snd_Menu_Select, 0 /* TODO(calibrate): runtime @0x140655a20 */, false /* TODO(calibrate): same */);
            select = 1;
        }
        if ((mouse_y > 256) && (mouse_y < 320)) {
            customfunct_audio_play_sound_single(Snd_Menu_Select, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
            select = 2;
        }
        if ((mouse_y > 320) && (mouse_y < 384)) {
            customfunct_audio_play_sound_single(Snd_Menu_Select, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
            select = 3;
        }
        if ((mouse_y > 384) && (mouse_y < 448)) {
            if (menu != "preferences") {
                customfunct_audio_play_sound_single(Snd_Menu_Select, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
                select = 4;
            }
        }
        if ((mouse_y > 448) && (mouse_y < 512)) {
            if (menu != "preferences") {
                customfunct_audio_play_sound_single(Snd_Menu_Select, 0 /* TODO(calibrate) */, false /* TODO(calibrate) */);
                select = 5;
            }
        }
    }
    with (Obj_Menu_Pause) {
        event_perform(ev_alarm, 0);
    }
}
if (mouse_y > 656) {
    if (mouse_x < 320) {
        customfunct_game_save();
        customfunct_options_update();
        instance_create_layer(-32, 352, "Main_menu", Obj_Menu_Selector);
        with (Obj_Menu_Options_Selector) {
            instance_destroy();
        }
        instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
        instance_destroy();
    }
}
switch (select) {
    case 1: // TODO(calibrate): case bodies unrecovered (Ghidra jumptable @0x14007db1c) — verify in-game
        break;
    case 2: // TODO(calibrate): same
        break;
    case 3: // TODO(calibrate): same
        break;
    case 4: // TODO(calibrate): same
        break;
    case 5: // TODO(calibrate): same
        break;
    default:
        break;
}
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_Options_Mouse_53(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  longlong *plVar5;
  longlong *plVar6;
  undefined8 uVar7;
  longlong lVar8;
  undefined8 *puVar9;
  undefined8 *puVar10;
  ulonglong uVar11;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_fffffffffffffe08;
  undefined4 uVar14;
  undefined8 uVar12;
  undefined8 **ppuVar13;
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
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined auStack_a0 [8];
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined4 uStack_80;
  uint uStack_7c;
  longlong lStack_78;
  longlong *plStack_68;
  undefined8 uStack_60;
  
  uVar14 = (undefined4)((ulonglong)in_stack_fffffffffffffe08 >> 0x20);
  uStack_60 = 0xfffffffffffffffe;
  puStack_c0 = &UNK_14043b439;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
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
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  plRam0000000140657680 = param_1;
  uStack_90 = param_2;
  plStack_68 = param_1;
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  uStack_1dc = 0xffffff;
  uStack_1e8 = 0;
  uStack_a8._4_4_ = 0xffffff;
  uStack_b0 = 0;
  uStack_100 = CONCAT44(0xffffff,(undefined4)uStack_100);
  uStack_108 = 0;
  uStack_f0 = CONCAT44(0xffffff,(undefined4)uStack_f0);
  uStack_f8 = 0;
  uStack_e0 = CONCAT44(0xffffff,(undefined4)uStack_e0);
  uStack_e8 = 0;
  uStack_b8 = 2;
  func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
  uStack_7c = 0;
  uStack_88 = 0x405d000000000000;
  iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
  if ((iVar2 != -2) && (iVar2 < 0)) {
    uStack_b8 = 4;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8 = 0x500000000;
    if ((0x46U >> (uStack_100._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_108 = 0;
    uStack_100 = 0x500000000;
    if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_68 + 8))(plStack_68,0x1878d);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 1) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,0,uVar3);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar5,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar6 = plVar5;
    }
    func_0x000140001490(&uStack_1d8,plVar6);
    puStack_158 = &uStack_1d8;
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
    func_0x000140001490(&uStack_1c8,plVar5);
    puStack_150 = &uStack_1c8;
    uVar12 = CONCAT44(uVar14,uRam00000001405c8d80);
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_108,1,uVar12,&puStack_158);
    uVar14 = (undefined4)((ulonglong)uVar12 >> 0x20);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4057800000000000;
    func_0x00014000bdb0(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1b8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_148 = &uStack_1b8;
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_f8,1,
                                CONCAT44(uVar14,uRam00000001405c8d80),&puStack_150);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4057800000000000;
    func_0x000140005290(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1a8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_140 = &uStack_1a8;
    func_0x00014000bee0(&uStack_198,0x140655a20);
    ppuVar13 = &puStack_148;
    puStack_138 = &uStack_198;
    uVar7 = gml_Script_customfunct_ui_button_detection_x(plStack_68,uStack_90,&uStack_b0,3,ppuVar13)
    ;
    uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
    cVar1 = func_0x00014012bb70(uVar7);
    if (cVar1 != '\0') {
      uVar7 = (**(code **)(*plStack_68 + 8))(plStack_68,0x18737);
      func_0x0001401453a0(&uStack_88,0x1405c45b0);
      iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar2 != 0) {
        uStack_b8 = 6;
        if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_e8);
        }
        uStack_e8 = 0;
        uStack_e0 = 0x500000000;
        func_0x00014000bee0(&uStack_188,0x1405c45e8);
        puStack_130 = &uStack_188;
        func_0x00014000bee0(&uStack_178,0x140655a20);
        puStack_128 = &uStack_178;
        func_0x00014000bee0(&uStack_168,0x140655a20);
        ppuVar13 = &puStack_130;
        puStack_120 = &uStack_168;
        gml_Script_customfunct_audio_play_sound_single(plStack_68,uStack_90,&uStack_e8,3,ppuVar13);
        uStack_b8 = 7;
        lVar8 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
        if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(lVar8);
        }
        func_0x0001401441e0(lVar8,0x1405c45b0);
        uStack_b8 = 8;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0x3ff0000000000000;
        uStack_b8 = 9;
        plRam0000000140657680 = (longlong *)0x287b0;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,0);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fee666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 10;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,1);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0xb;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,2);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0xc;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,3);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0xd;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,4);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0xe;
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x3ff0000000000000;
        uStack_b8 = 0xf;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186ee);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0;
        uStack_b8 = 0x10;
        uStack_98._4_4_ = 0;
        uStack_98._0_4_ = SUB124(_auStack_a0,8);
        auStack_a0 = (undefined  [8])0x4047000000000000;
        iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,auStack_a0);
        if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(auStack_a0);
        }
        uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
        if (0 < iVar2) {
          do {
            uStack_b8 = 0x12;
            func_0x000140181c50(plStack_68,uStack_90,2,0);
            cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68,&uStack_90);
            uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
          } while (cVar1 != '\0');
        }
        func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
        if (lStack_78 != 0) {
          func_0x00014012ec70();
          lStack_78 = 0;
        }
      }
    }
    uStack_b8 = 0x15;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8 = 0x500000000;
    if ((0x46U >> (uStack_100._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_108 = 0;
    uStack_100 = 0x500000000;
    if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_68 + 8))(plStack_68,0x1878d);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 2) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,1,uVar3);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar5,1);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar6 = plVar5;
    }
    func_0x000140001490(&uStack_1d8,plVar6);
    puStack_158 = &uStack_1d8;
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
    func_0x000140001490(&uStack_1c8,plVar5);
    puStack_150 = &uStack_1c8;
    uVar12 = CONCAT44(uVar14,uRam00000001405c8d80);
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_108,1,uVar12,&puStack_158);
    uVar14 = (undefined4)((ulonglong)uVar12 >> 0x20);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4074000000000000;
    func_0x00014000bdb0(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1b8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_148 = &uStack_1b8;
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_f8,1,
                                CONCAT44(uVar14,uRam00000001405c8d80),&puStack_150);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4074000000000000;
    func_0x000140005290(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1a8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_140 = &uStack_1a8;
    func_0x00014000bee0(&uStack_198,0x140655a20);
    ppuVar13 = &puStack_148;
    puStack_138 = &uStack_198;
    uVar7 = gml_Script_customfunct_ui_button_detection_x(plStack_68,uStack_90,&uStack_b0,3,ppuVar13)
    ;
    uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
    cVar1 = func_0x00014012bb70(uVar7);
    if (cVar1 != '\0') {
      uVar7 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
      func_0x0001401453a0(&uStack_88,0x1405c45b6);
      iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar2 != 0) {
        uStack_b8 = 0x17;
        if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_e8);
        }
        uStack_e8 = 0;
        uStack_e0 = 0x500000000;
        func_0x00014000bee0(&uStack_188,0x1405c45e8);
        puStack_130 = &uStack_188;
        func_0x00014000bee0(&uStack_178,0x140655a20);
        puStack_128 = &uStack_178;
        func_0x00014000bee0(&uStack_168,0x140655a20);
        ppuVar13 = &puStack_130;
        puStack_120 = &uStack_168;
        gml_Script_customfunct_audio_play_sound_single(plStack_68,uStack_90,&uStack_e8,3,ppuVar13);
        uStack_b8 = 0x18;
        lVar8 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
        if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(lVar8);
        }
        func_0x0001401441e0(lVar8,0x1405c45b6);
        uStack_b8 = 0x19;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0x3ff0000000000000;
        uStack_b8 = 0x1a;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,0);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x1b;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,1);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fee666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x1c;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,2);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x1d;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,3);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x1e;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,4);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x1f;
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x3ff0000000000000;
        uStack_b8 = 0x20;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186ee);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0;
        uStack_b8 = 0x21;
        _auStack_a0 = SUB1612(ZEXT816(0),0);
        uStack_98._4_4_ = 0;
        func_0x000140160b90(0x2e,0x186e1,0x80000000,auStack_a0);
        uStack_b8 = 0x22;
        uStack_10c = 0;
        uStack_118 = 0x4047000000000000;
        iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,&uStack_118);
        if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_118);
        }
        uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
        if (0 < iVar2) {
          do {
            uStack_b8 = 0x24;
            func_0x000140181c50(plStack_68,uStack_90,2,0);
            cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68,&uStack_90);
            uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
          } while (cVar1 != '\0');
        }
        func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
        if (lStack_78 != 0) {
          func_0x00014012ec70();
          lStack_78 = 0;
        }
      }
    }
    uStack_b8 = 0x27;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8 = 0x500000000;
    if ((0x46U >> (uStack_100._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_108 = 0;
    uStack_100 = 0x500000000;
    if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_68 + 8))(plStack_68,0x1878d);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 3) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,2,uVar3);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar5,2);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar6 = plVar5;
    }
    func_0x000140001490(&uStack_1d8,plVar6);
    puStack_158 = &uStack_1d8;
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
    func_0x000140001490(&uStack_1c8,plVar5);
    puStack_150 = &uStack_1c8;
    uVar12 = CONCAT44(uVar14,uRam00000001405c8d80);
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_108,1,uVar12,&puStack_158);
    uVar14 = (undefined4)((ulonglong)uVar12 >> 0x20);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4084000000000000;
    func_0x00014000bdb0(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1b8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_148 = &uStack_1b8;
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_f8,1,
                                CONCAT44(uVar14,uRam00000001405c8d80),&puStack_150);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4084000000000000;
    func_0x000140005290(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1a8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_140 = &uStack_1a8;
    func_0x00014000bee0(&uStack_198,0x140655a20);
    ppuVar13 = &puStack_148;
    puStack_138 = &uStack_198;
    uVar7 = gml_Script_customfunct_ui_button_detection_x(plStack_68,uStack_90,&uStack_b0,3,ppuVar13)
    ;
    uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
    cVar1 = func_0x00014012bb70(uVar7);
    if (cVar1 != '\0') {
      uVar7 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
      func_0x0001401453a0(&uStack_88,0x1405c45bc);
      iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar2 != 0) {
        uStack_b8 = 0x29;
        if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_e8);
        }
        uStack_e8 = 0;
        uStack_e0 = 0x500000000;
        func_0x00014000bee0(&uStack_188,0x1405c45e8);
        puStack_130 = &uStack_188;
        func_0x00014000bee0(&uStack_178,0x140655a20);
        puStack_128 = &uStack_178;
        func_0x00014000bee0(&uStack_168,0x140655a20);
        ppuVar13 = &puStack_130;
        puStack_120 = &uStack_168;
        gml_Script_customfunct_audio_play_sound_single(plStack_68,uStack_90,&uStack_e8,3,ppuVar13);
        uStack_b8 = 0x2a;
        lVar8 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
        if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(lVar8);
        }
        func_0x0001401441e0(lVar8,0x1405c45bc);
        uStack_b8 = 0x2b;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0x3ff0000000000000;
        uStack_b8 = 0x2c;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,0);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x2d;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,1);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x2e;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,2);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fee666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x2f;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,3);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x30;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,4);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x31;
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x3ff0000000000000;
        uStack_b8 = 0x32;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186ee);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0xc07a000000000000;
        uStack_b8 = 0x33;
        _auStack_a0 = SUB1612(ZEXT816(0),0);
        uStack_98._4_4_ = 0;
        func_0x000140160b90(0x2e,0x186e1,0x80000000,auStack_a0);
        uStack_b8 = 0x34;
        uStack_10c = 0;
        uStack_118 = 0x4047000000000000;
        iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,&uStack_118);
        if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_118);
        }
        uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
        if (0 < iVar2) {
          do {
            uStack_b8 = 0x36;
            func_0x000140181c50(plStack_68,uStack_90,2,0);
            cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68,&uStack_90);
            uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
          } while (cVar1 != '\0');
        }
        func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
        if (lStack_78 != 0) {
          func_0x00014012ec70();
          lStack_78 = 0;
        }
      }
    }
    uStack_b8 = 0x39;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8 = 0x500000000;
    if ((0x46U >> (uStack_100._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_108 = 0;
    uStack_100 = 0x500000000;
    if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_68 + 8))(plStack_68,0x1878d);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 4) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,3,uVar3);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar5,3);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar6 = plVar5;
    }
    func_0x000140001490(&uStack_1d8,plVar6);
    puStack_158 = &uStack_1d8;
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 4) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,3,uVar3);
        plVar5 = (longlong *)0x0;
      }
      else {
        plVar5 = (longlong *)func_0x000140147980(*plVar5,3);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_1c8,plVar5);
    puStack_150 = &uStack_1c8;
    uVar12 = CONCAT44(uVar14,uRam00000001405c8d80);
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_108,1,uVar12,&puStack_158);
    uVar14 = (undefined4)((ulonglong)uVar12 >> 0x20);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x408e000000000000;
    func_0x00014000bdb0(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1b8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_148 = &uStack_1b8;
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_f8,1,
                                CONCAT44(uVar14,uRam00000001405c8d80),&puStack_150);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x408e000000000000;
    func_0x000140005290(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1a8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_140 = &uStack_1a8;
    func_0x00014000bee0(&uStack_198,0x140655a20);
    ppuVar13 = &puStack_148;
    puStack_138 = &uStack_198;
    uVar7 = gml_Script_customfunct_ui_button_detection_x(plStack_68,uStack_90,&uStack_b0,3,ppuVar13)
    ;
    uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
    cVar1 = func_0x00014012bb70(uVar7);
    if (cVar1 != '\0') {
      uVar7 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
      func_0x0001401453a0(&uStack_88,0x1405c45c8);
      iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar2 != 0) {
        uStack_b8 = 0x3b;
        if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_e8);
        }
        uStack_e8 = 0;
        uStack_e0 = 0x500000000;
        func_0x00014000bee0(&uStack_188,0x1405c45e8);
        puStack_130 = &uStack_188;
        func_0x00014000bee0(&uStack_178,0x140655a20);
        puStack_128 = &uStack_178;
        func_0x00014000bee0(&uStack_168,0x140655a20);
        ppuVar13 = &puStack_130;
        puStack_120 = &uStack_168;
        gml_Script_customfunct_audio_play_sound_single(plStack_68,uStack_90,&uStack_e8,3,ppuVar13);
        uStack_b8 = 0x3c;
        lVar8 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
        if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(lVar8);
        }
        func_0x0001401441e0(lVar8,0x1405c45c8);
        uStack_b8 = 0x3d;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0x3ff0000000000000;
        uStack_b8 = 0x3e;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,0);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x3f;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,1);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x40;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,2);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x41;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,3);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fee666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x42;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,4);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x43;
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x3ff0000000000000;
        uStack_b8 = 0x44;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186ee);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0xc07a000000000000;
        uStack_b8 = 0x45;
        _auStack_a0 = SUB1612(ZEXT816(0),0);
        uStack_98._4_4_ = 0;
        func_0x000140160b90(0x2e,0x186e1,0x80000000,auStack_a0);
        uStack_b8 = 0x46;
        uStack_10c = 0;
        uStack_118 = 0x4047000000000000;
        iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,&uStack_118);
        if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_118);
        }
        uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
        if (0 < iVar2) {
          do {
            uStack_b8 = 0x48;
            func_0x000140181c50(plStack_68,uStack_90,2,0);
            cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68,&uStack_90);
            uVar14 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
          } while (cVar1 != '\0');
        }
        func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
        if (lStack_78 != 0) {
          func_0x00014012ec70();
          lStack_78 = 0;
        }
      }
    }
    uStack_b8 = 0x4b;
    if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b0);
    }
    uStack_b0 = 0;
    uStack_a8._0_4_ = 0;
    uStack_a8._4_4_ = 5;
    if ((0x46U >> (uStack_100._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_108);
    }
    uStack_108 = 0;
    uStack_100 = 0x500000000;
    if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    uStack_f8 = 0;
    uStack_f0 = 0x500000000;
    plVar5 = (longlong *)(**(code **)(*plStack_68 + 8))(plStack_68,0x1878d);
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 5) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,4,uVar3);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar5,4);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar6 = plVar5;
    }
    func_0x000140001490(&uStack_1d8,plVar6);
    puStack_158 = &uStack_1d8;
    if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar5);
      if (iVar2 < 5) {
        uVar3 = func_0x000140147990(*plVar5);
        func_0x000140144260(&UNK_140439ca6,4,uVar3);
        plVar5 = (longlong *)0x0;
      }
      else {
        plVar5 = (longlong *)func_0x000140147980(*plVar5,4);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_1c8,plVar5);
    puStack_150 = &uStack_1c8;
    uVar12 = CONCAT44(uVar14,uRam00000001405c8d80);
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_108,1,uVar12,&puStack_158);
    uVar14 = (undefined4)((ulonglong)uVar12 >> 0x20);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4092880000000000;
    func_0x00014000bdb0(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1b8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_148 = &uStack_1b8;
    uVar7 = func_0x0001401445d0(plStack_68,uStack_90,&uStack_f8,1,
                                CONCAT44(uVar14,uRam00000001405c8d80),&puStack_150);
    func_0x00014001f910(auStack_a0,uVar7,_UNK_140439e68);
    uStack_7c = 0;
    uStack_88 = 0x4092880000000000;
    func_0x000140005290(&uStack_88,auStack_a0);
    func_0x000140001490(&uStack_1a8,&uStack_88);
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_a0);
    }
    puStack_140 = &uStack_1a8;
    func_0x00014000bee0(&uStack_198,0x140655a20);
    puStack_138 = &uStack_198;
    uVar7 = gml_Script_customfunct_ui_button_detection_x
                      (plStack_68,uStack_90,&uStack_b0,3,&puStack_148);
    cVar1 = func_0x00014012bb70(uVar7);
    if (cVar1 != '\0') {
      uVar7 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
      func_0x0001401453a0(&uStack_88,0x1405c45d6);
      iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar2 != 0) {
        uStack_b8 = 0x4d;
        if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_e8);
        }
        uStack_e8 = 0;
        uStack_e0 = 0x500000000;
        func_0x00014000bee0(&uStack_188,0x1405c45e8);
        puStack_130 = &uStack_188;
        func_0x00014000bee0(&uStack_178,0x140655a20);
        puStack_128 = &uStack_178;
        func_0x00014000bee0(&uStack_168,0x140655a20);
        puStack_120 = &uStack_168;
        gml_Script_customfunct_audio_play_sound_single
                  (plStack_68,uStack_90,&uStack_e8,3,&puStack_130);
        uStack_b8 = 0x4e;
        lVar8 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
        if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(lVar8);
        }
        func_0x0001401441e0(lVar8,0x1405c45d6);
        uStack_b8 = 0x4f;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
        if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar9);
        }
        *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
        *puVar9 = 0x3ff0000000000000;
        uStack_b8 = 0x50;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,0);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x51;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,1);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x52;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,2);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x53;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,3);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fe6666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x54;
        puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878f);
        func_0x000140141d00(plStack_68);
        puVar10 = (undefined8 *)func_0x00014012b840(puVar9,4);
        func_0x000140141d00(*puVar9);
        if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar10);
        }
        *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
        *puVar10 = 0x3fee666666666666;
        func_0x000140141c50(2);
        uStack_b8 = 0x55;
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0x3ff0000000000000;
        uStack_b8 = 0x56;
        puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186ee);
        if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar4);
        }
        *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
        *puVar4 = 0xc07a000000000000;
        uStack_b8 = 0x57;
        _auStack_a0 = SUB1612(ZEXT816(0),0);
        uStack_98._4_4_ = 0;
        func_0x000140160b90(0x2e,0x186e1,0x80000000,auStack_a0);
        uStack_b8 = 0x58;
        uStack_10c = 0;
        uStack_118 = 0x4047000000000000;
        iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,&uStack_118);
        if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_118);
        }
        if (0 < iVar2) {
          do {
            uStack_b8 = 0x5a;
            func_0x000140181c50(plStack_68,uStack_90,2,0);
            cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68,&uStack_90);
          } while (cVar1 != '\0');
        }
        func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
        if (lStack_78 != 0) {
          func_0x00014012ec70();
          lStack_78 = 0;
        }
      }
    }
  }
  uStack_b8 = 0x61;
  func_0x00014015ef90(plStack_68,uRam00000001405c7bc8,0x80000000,&uStack_1e8);
  uStack_7c = 0;
  uStack_88 = 0x4078000000000000;
  iVar2 = func_0x00014015be60(&uStack_1e8,&uStack_88,uRam00000001405cd9c0,1);
  if ((iVar2 != -2) && (iVar2 < 0)) {
    func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
    uStack_7c = 0;
    uStack_88 = 0x405d000000000000;
    iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
      uStack_7c = 0;
      uStack_88 = 0x4084800000000000;
      iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 0)) {
        uStack_b8 = 99;
        func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
        uStack_7c = 0;
        uStack_88 = 0x4068000000000000;
        iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
          uStack_7c = 0;
          uStack_88 = 0x4070000000000000;
          iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
          if ((iVar2 != -2) && (iVar2 < 0)) {
            uStack_b8 = 0x65;
            if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_b0);
            }
            uStack_b0 = 0;
            uStack_a8._0_4_ = 0;
            uStack_a8._4_4_ = 5;
            func_0x00014000bee0(&uStack_1d8,0x1405c45f8);
            puStack_158 = &uStack_1d8;
            func_0x00014000bee0(&uStack_1c8,0x140655a20);
            puStack_150 = &uStack_1c8;
            func_0x00014000bee0(&uStack_1b8,0x140655a20);
            puStack_148 = &uStack_1b8;
            gml_Script_customfunct_audio_play_sound_single
                      (plStack_68,uStack_90,&uStack_b0,3,&puStack_158);
            uStack_b8 = 0x66;
            puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
            if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
              func_0x000140001410(puVar4);
            }
            *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
            *puVar4 = 0x3ff0000000000000;
          }
        }
        uStack_b8 = 0x68;
        func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
        uStack_7c = 0;
        uStack_88 = 0x4070000000000000;
        iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
          uStack_7c = 0;
          uStack_88 = 0x4074000000000000;
          iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
          if ((iVar2 != -2) && (iVar2 < 0)) {
            uStack_b8 = 0x6a;
            if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_b0);
            }
            uStack_b0 = 0;
            uStack_a8._0_4_ = 0;
            uStack_a8._4_4_ = 5;
            func_0x00014000bee0(&uStack_1d8,0x1405c45f8);
            puStack_158 = &uStack_1d8;
            func_0x00014000bee0(&uStack_1c8,0x140655a20);
            puStack_150 = &uStack_1c8;
            func_0x00014000bee0(&uStack_1b8,0x140655a20);
            puStack_148 = &uStack_1b8;
            gml_Script_customfunct_audio_play_sound_single
                      (plStack_68,uStack_90,&uStack_b0,3,&puStack_158);
            uStack_b8 = 0x6b;
            puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
            if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
              func_0x000140001410(puVar4);
            }
            *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
            *puVar4 = 0x4000000000000000;
          }
        }
        uStack_b8 = 0x6d;
        func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
        uStack_7c = 0;
        uStack_88 = 0x4074000000000000;
        iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
          uStack_7c = 0;
          uStack_88 = 0x4078000000000000;
          iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
          if ((iVar2 != -2) && (iVar2 < 0)) {
            uStack_b8 = 0x6f;
            if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_b0);
            }
            uStack_b0 = 0;
            uStack_a8._0_4_ = 0;
            uStack_a8._4_4_ = 5;
            func_0x00014000bee0(&uStack_1d8,0x1405c45f8);
            puStack_158 = &uStack_1d8;
            func_0x00014000bee0(&uStack_1c8,0x140655a20);
            puStack_150 = &uStack_1c8;
            func_0x00014000bee0(&uStack_1b8,0x140655a20);
            puStack_148 = &uStack_1b8;
            gml_Script_customfunct_audio_play_sound_single
                      (plStack_68,uStack_90,&uStack_b0,3,&puStack_158);
            uStack_b8 = 0x70;
            puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
            if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
              func_0x000140001410(puVar4);
            }
            *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
            *puVar4 = 0x4008000000000000;
          }
        }
        uStack_b8 = 0x72;
        func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
        uStack_7c = 0;
        uStack_88 = 0x4078000000000000;
        iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
          uStack_7c = 0;
          uStack_88 = 0x407c000000000000;
          iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
          if ((iVar2 != -2) && (iVar2 < 0)) {
            uStack_b8 = 0x74;
            uVar7 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
            func_0x0001401453a0(&uStack_88,0x1405c45bc);
            iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
            if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_88);
            }
            if (iVar2 != 0) {
              uStack_b8 = 0x76;
              if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_b0);
              }
              uStack_b0 = 0;
              uStack_a8._0_4_ = 0;
              uStack_a8._4_4_ = 5;
              func_0x00014000bee0(&uStack_1d8,0x1405c45f8);
              puStack_158 = &uStack_1d8;
              func_0x00014000bee0(&uStack_1c8,0x140655a20);
              puStack_150 = &uStack_1c8;
              func_0x00014000bee0(&uStack_1b8,0x140655a20);
              puStack_148 = &uStack_1b8;
              gml_Script_customfunct_audio_play_sound_single
                        (plStack_68,uStack_90,&uStack_b0,3,&puStack_158);
              uStack_b8 = 0x77;
              puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
              if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
                func_0x000140001410(puVar4);
              }
              *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
              *puVar4 = 0x4010000000000000;
            }
          }
        }
        uStack_b8 = 0x7a;
        func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
        uStack_7c = 0;
        uStack_88 = 0x407c000000000000;
        iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
          uStack_7c = 0;
          uStack_88 = 0x4080000000000000;
          iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
          if ((iVar2 != -2) && (iVar2 < 0)) {
            uStack_b8 = 0x7c;
            uVar7 = (**(code **)(*plStack_68 + 0x10))(plStack_68,0x18737);
            func_0x0001401453a0(&uStack_88,0x1405c45bc);
            iVar2 = func_0x00014015be60(uVar7,&uStack_88,uRam00000001405cd9c0,0);
            if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_88);
            }
            if (iVar2 != 0) {
              uStack_b8 = 0x7e;
              if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_b0);
              }
              uStack_b0 = 0;
              uStack_a8._0_4_ = 0;
              uStack_a8._4_4_ = 5;
              func_0x00014000bee0(&uStack_1d8,0x1405c45f8);
              puStack_158 = &uStack_1d8;
              func_0x00014000bee0(&uStack_1c8,0x140655a20);
              puStack_150 = &uStack_1c8;
              func_0x00014000bee0(&uStack_1b8,0x140655a20);
              puStack_148 = &uStack_1b8;
              gml_Script_customfunct_audio_play_sound_single
                        (plStack_68,uStack_90,&uStack_b0,3,&puStack_158);
              uStack_b8 = 0x7f;
              puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
              if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
                func_0x000140001410(puVar4);
              }
              *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
              *puVar4 = 0x4014000000000000;
            }
          }
        }
        uStack_b8 = 0x82;
        uStack_98._4_4_ = 0;
        uStack_98._0_4_ = SUB124(_auStack_a0,8);
        auStack_a0 = (undefined  [8])0x4047000000000000;
        iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,auStack_a0);
        if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(auStack_a0);
        }
        if (0 < iVar2) {
          do {
            uStack_b8 = 0x84;
            func_0x000140181c50(plStack_68,uStack_90,2,0);
            cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68,&uStack_90);
          } while (cVar1 != '\0');
        }
        func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
        if (lStack_78 != 0) {
          func_0x00014012ec70();
          lStack_78 = 0;
        }
      }
    }
  }
  uStack_b8 = 0x8a;
  func_0x00014015ef90(plStack_68,uRam00000001405c7bd8,0x80000000,&uStack_d8);
  uStack_7c = 0;
  uStack_88 = 0x4084800000000000;
  iVar2 = func_0x00014015be60(&uStack_d8,&uStack_88,uRam00000001405cd9c0,1);
  if (0 < iVar2) {
    uStack_b8 = 0x8c;
    func_0x00014015ef90(plStack_68,uRam00000001405c7bc8,0x80000000,&uStack_1e8);
    uStack_7c = 0;
    uStack_88 = 0x4074000000000000;
    iVar2 = func_0x00014015be60(&uStack_1e8,&uStack_88,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_b8 = 0x8e;
      if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b0);
      }
      uStack_b0 = 0;
      uStack_a8 = 0x500000000;
      gml_Script_customfunct_game_save(plStack_68,uStack_90,&uStack_b0,0,0);
      uStack_b8 = 0x8f;
      if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b0);
      }
      uStack_b0 = 0;
      uStack_a8 = 0x500000000;
      uVar14 = 0;
      gml_Script_customfunct_options_update(plStack_68,uStack_90,&uStack_b0,0,0);
      uStack_b8 = 0x90;
      if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b0);
      }
      uStack_b0 = 0;
      uStack_a8 = 0x500000000;
      func_0x00014000bee0(&uStack_1d8,0x1405c4608);
      puStack_158 = &uStack_1d8;
      func_0x00014000bee0(&uStack_1c8,0x1405c4618);
      puStack_150 = &uStack_1c8;
      if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_1b8);
      }
      func_0x0001401441e0(&uStack_1b8,0x1405c45de);
      puStack_148 = &uStack_1b8;
      func_0x00014000bee0(&uStack_1a8,0x1405c4628);
      uVar7 = CONCAT44(uVar14,uRam00000001405c8d90);
      puStack_140 = &uStack_1a8;
      func_0x0001401445d0(plStack_68,uStack_90,&uStack_b0,4,uVar7,&puStack_158);
      uStack_b8 = 0x91;
      uStack_98._4_4_ = 0;
      auStack_a0 = (undefined  [8])0x4022000000000000;
      iVar2 = func_0x000140144bd0(&uStack_88,&plStack_68,&uStack_90,auStack_a0);
      if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_a0);
      }
      uVar14 = (undefined4)((ulonglong)uVar7 >> 0x20);
      if (0 < iVar2) {
        do {
          uStack_b8 = 0x93;
          func_0x00014017c070(plStack_68,uStack_90,0,0);
          cVar1 = func_0x0001401451f0(&uStack_88,&plStack_68);
          uVar14 = (undefined4)((ulonglong)uVar7 >> 0x20);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_88,&plStack_68,&uStack_90);
      uStack_b8 = 0x95;
      if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b0);
      }
      uStack_b0 = 0;
      uStack_a8._0_4_ = 0;
      uStack_a8._4_4_ = 5;
      func_0x00014000bee0(&uStack_1d8,0x1405c4638);
      puStack_158 = &uStack_1d8;
      func_0x00014000bee0(&uStack_1c8,0x1405c4648);
      puStack_150 = &uStack_1c8;
      if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_1b8);
      }
      func_0x0001401441e0(&uStack_1b8,0x1405c45de);
      puStack_148 = &uStack_1b8;
      func_0x00014000bee0(&uStack_1a8,0x1405c4658);
      puStack_140 = &uStack_1a8;
      func_0x0001401445d0(plStack_68,uStack_90,&uStack_b0,4,CONCAT44(uVar14,uRam00000001405c8d90),
                          &puStack_158);
      uStack_b8 = 0x96;
      func_0x00014017c070(plStack_68,uStack_90,0,0);
      if (lStack_78 != 0) {
        func_0x00014012ec70();
        lStack_78 = 0;
      }
    }
  }
  uStack_b8 = 0x9b;
  puVar4 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
  uStack_7c = *(uint *)((longlong)puVar4 + 0xc);
  uStack_80 = *(undefined4 *)(puVar4 + 1);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) == 0) {
    uStack_88 = *puVar4;
  }
  else {
    func_0x00014007dc10(&uStack_88,puVar4);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655a94) &&
     (func_0x0001403f6320(0x140655a94), iRam0000000140655a94 == -1)) {
    uRam0000000140655a3c = 0;
    uRam0000000140655a30 = 0x3ff0000000000000;
    uRam0000000140655a50 = 0x100000000;
    uRam0000000140655a44 = 0x4000000000000000;
    uRam0000000140655a64 = 0x200000000;
    uRam0000000140655a58 = 0x4008000000000000;
    uRam0000000140655a78 = 0x300000000;
    uRam0000000140655a6c = 0x4010000000000000;
    uRam0000000140655a8c = 0x400000000;
    uRam0000000140655a80 = 0x4014000000000000;
    func_0x0001403f6668(&DAT_14007db30);
    func_0x0001403f62c0(0x140655a94);
  }
  uVar7 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar2 = func_0x00014015be60(0x140655a30,&uStack_88,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x00014007b9e1:
    uVar11 = (ulonglong)*(uint *)(lVar8 * 0x14 + 0x140655a40);
  }
  else {
    iVar2 = func_0x00014015be60(0x140655a44,&uStack_88,uVar7,0);
    if (iVar2 == 0) {
      lVar8 = 1;
      goto code_r0x00014007b9e1;
    }
    iVar2 = func_0x00014015be60(0x140655a58,&uStack_88,uVar7,0);
    if (iVar2 == 0) {
      uVar11 = uRam0000000140655a64 >> 0x20;
    }
    else {
      iVar2 = func_0x00014015be60(0x140655a6c,&uStack_88,uVar7,0);
      if (iVar2 == 0) {
        uVar11 = uRam0000000140655a78 >> 0x20;
      }
      else {
        iVar2 = func_0x00014015be60(0x140655a80,&uStack_88,uVar7,0);
        if (iVar2 != 0) goto code_r0x00014007bb70;
        uVar11 = uRam0000000140655a8c >> 0x20;
      }
    }
  }
  if (uVar11 < 5) {
                    / * WARNING: Could not recover jumptable at 0x00014007ba01. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
    (*(code *)(&UNK_14007db1c + *(int *)(&UNK_14007db1c + uVar11 * 4)))();
    return;
  }
code_r0x00014007bb70:
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_100._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_a8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_1dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1e8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */

