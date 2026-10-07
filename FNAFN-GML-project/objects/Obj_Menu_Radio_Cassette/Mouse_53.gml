/// @description FNAFN Obj_Menu_Radio_Cassette / Mouse_53 - PORTED from C
// ---- sub-event Mouse_53 (split from Mouse.gml) ----
// ground truth: gml_Object_Obj_Menu_Radio_Cassette_Mouse_53 (7103 B @0x1400e6b80)
// Left-click: arrows page track_select, the exit row returns to the main
// menu, the import row attaches a user .ogg to the selected track.
// Regions (mouse_x/mouse_y vs x/y with literal offsets; bound signs per the
// PROVEN SUB helper 0x14002fc60 / += helper 0x14000bf90):
//   arrows: mouse_x in (x-500, x+500), mouse_y in (y-183, y+183)
//     (500/0xb7 = 183); left zone mouse_x < x-300 + arrow_alpha[1] == 1 ->
//     arrow_size[1] = 0.85, track_select -= 1 (-= via PROVEN 0x14000bdb0);
//     right zone mouse_x > x+300 + arrow_alpha[0] == 1 -> arrow_size[0] =
//     0.85, track_select += 1. Arrow scales ease back in Step_0.
//   exit row: mouse_y in (y+180, y+210) (0xb4 = 180, 0xd2 = 210) and the
//     mouse_x hit-test against string_width(radio_text[1]) ("exit"): stops
//     every custom_music stream (array_length loop + audio_stop_sound via
//     slot 0x1405c8960), recreates (-32, 352, "Main_menu",
//     Obj_Menu_Selector) and (32, 160, "Main_menu", Obj_Menu_Main_Title),
//     then instance_destroy()s self.
//   import row: same y band, hit-test vs string_width(radio_text[0])
//     ("import", x+10 based): filename = get_open_filename_ext("import
//     sound file (ogg only!)", runtime, runtime, ".ogg") (slot 0x1405c8fd0;
//     filter @0x1405c5b7a); stores into custom_music[track_select-1][*]
//     (double-accessor shape, as in Draw) + audio_create_stream /
//     audio_destroy_stream service slots.
// Tail: track_select = clamp(track_select, 1, 10) (slot 0x1405c8a00).
// TODO(calibrate): exact region bound signs (SUB vs += per site noted);
// runtime consts @0x140656exx (dialog defaults); custom_music column shape.
if (mouse_x > x - 500 && mouse_x < x + 500 && mouse_y > y - 183 && mouse_y < y + 183) {
    if (mouse_x < x - 300 && arrow_alpha[1] == 1) {
        arrow_size[1] = 0.85;
        track_select -= 1;
    }
    if (mouse_x > x + 300 && arrow_alpha[0] == 1) {
        arrow_size[0] = 0.85;
        track_select += 1;
    }
}
if (mouse_y > y + 180 && mouse_y < y + 210) {
    if (mouse_x > x + 10 - string_width(radio_text[1]) && mouse_x < x + 5) {
        // Exit row (radio_text[1] = "exit"): stop music, back to main menu.
        var _n = array_length(custom_music);
        for (var i = 0; i < _n; i++) {
            audio_stop_sound(custom_music[i, 0]); // TODO(calibrate): accessor column; loop bound is len +/- 1 in C
        }
        instance_create_layer(-32, 352, "Main_menu", Obj_Menu_Selector);
        instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
        instance_destroy();
    }
    if (mouse_x > x + 5 && mouse_x < x + 10 + string_width(radio_text[0])) {
        // Import row (radio_text[0] = "import") — partial: filename pick +
        // stream attach; service-slot shapes kept as TODO.
        var _file = get_open_filename_ext("import sound file (ogg only!)", "", "", ".ogg"); // TODO(calibrate): filter/defaults are runtime consts @0x140656e80
        custom_music[track_select - 1, 1] = _file; // TODO(calibrate): column shape; C also calls audio_create_stream/audio_destroy_stream around this
        // TODO: audio_create_stream(_file) / game_save_music wiring — verify in-game.
    }
}
track_select = clamp(track_select, 1, 10);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void gml_Object_Obj_Menu_Radio_Cassette_Mouse_53(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  uint in_stack_fffffffffffffe38;
  uint uVar10;
  ulonglong in_stack_fffffffffffffe40;
  undefined8 **ppuVar11;
  ulonglong uVar12;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  undefined8 uStack_180;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_130;
  uint uStack_124;
  undefined8 *puStack_120;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 uStack_e0;
  undefined *puStack_d8;
  undefined4 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined4 uStack_b0;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined4 uStack_88;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_d8 = &UNK_14043ce0b;
  uStack_d0 = 0;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  plRam0000000140657680 = param_1;
  uStack_98 = param_2;
  puStack_120 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fc);
  uStack_10c = 0xffffff;
  uStack_118 = 0.0;
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_180 = CONCAT44(0xffffff,(undefined4)uStack_180);
  uStack_188 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_d0 = 1;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
  in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
  in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,in_stack_fffffffffffffe38,
                      in_stack_fffffffffffffe40);
  func_0x00014002fc60(&uStack_70,&uStack_90,500);
  iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (0 < iVar2) {
    func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
    in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
    in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,in_stack_fffffffffffffe38
                        ,in_stack_fffffffffffffe40);
    uStack_64 = uStack_84;
    uStack_68 = uStack_88;
    if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
      uStack_70 = uStack_90;
    }
    else {
      func_0x0001400e9570(&uStack_70,&uStack_90);
    }
    func_0x00014000bf90(&uStack_70,500);
    iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 != -2 && iVar2 < 0) {
      func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_130);
      in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
      in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
      func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_b8,
                          in_stack_fffffffffffffe38,in_stack_fffffffffffffe40);
      func_0x00014002fc60(&uStack_70,&uStack_b8,0xb7);
      iVar2 = func_0x00014015be60(&uStack_130,&uStack_70,uRam00000001405cd9c0,1);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      if (0 < iVar2) {
        func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_130);
        in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
        in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
        func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_b8,
                            in_stack_fffffffffffffe38,in_stack_fffffffffffffe40);
        uStack_64 = uStack_ac;
        uStack_68 = uStack_b0;
        if ((0x46U >> (uStack_ac & 0x1f) & 1) == 0) {
          uStack_70 = uStack_b8;
        }
        else {
          func_0x0001400e9570(&uStack_70,&uStack_b8);
        }
        func_0x00014000bf90(&uStack_70,0xb7);
        iVar2 = func_0x00014015be60(&uStack_130,&uStack_70,uRam00000001405cd9c0,1);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        if (iVar2 != -2 && iVar2 < 0) {
          uStack_d0 = 3;
          func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
          in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
          in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
          func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,
                              in_stack_fffffffffffffe38,in_stack_fffffffffffffe40);
          func_0x00014002fc60(&uStack_70,&uStack_90,300);
          iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          if (iVar2 != -2 && iVar2 < 0) {
            plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186e1);
            if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
              func_0x0001401479b0();
              iVar2 = func_0x000140147990(*plVar4);
              if (iVar2 < 2) {
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
            uStack_64 = 0;
            uStack_70 = 0x3ff0000000000000;
            iVar2 = func_0x00014015be60(plVar4,&uStack_70,uRam00000001405cd9c0,0);
            if (iVar2 == 0) {
              uStack_d0 = 5;
              plRam0000000140657680 = (longlong *)0x287df;
              puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e2);
              func_0x000140141d00(param_1);
              puVar6 = (undefined8 *)func_0x00014012b840(puVar5,1);
              func_0x000140141d00(*puVar5);
              if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
                func_0x000140001410(puVar6);
              }
              *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
              *puVar6 = 0x3feb333333333333;
              func_0x000140141c50(2);
              uStack_d0 = 6;
              uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18794);
              uStack_64 = 0;
              uStack_70 = 0x3ff0000000000000;
              func_0x00014000bdb0(uVar7,&uStack_70);
              if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_70);
              }
            }
          }
          uStack_d0 = 8;
          func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
          in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
          in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
          func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,
                              in_stack_fffffffffffffe38,in_stack_fffffffffffffe40);
          uStack_64 = uStack_84;
          uStack_68 = uStack_88;
          if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
            uStack_70 = uStack_90;
          }
          else {
            func_0x0001400e9570(&uStack_70,&uStack_90);
          }
          func_0x00014000bf90(&uStack_70,300);
          iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          if (0 < iVar2) {
            plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x186e1);
            if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
              func_0x0001401479b0();
              iVar2 = func_0x000140147990(*plVar4);
              if (iVar2 < 1) {
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
            uStack_64 = 0;
            uStack_70 = 0x3ff0000000000000;
            iVar2 = func_0x00014015be60(plVar4,&uStack_70,uRam00000001405cd9c0,0);
            if (iVar2 == 0) {
              uStack_d0 = 10;
              puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e2);
              func_0x000140141d00(param_1);
              puVar6 = (undefined8 *)func_0x00014012b840(puVar5,0);
              func_0x000140141d00(*puVar5);
              if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
                func_0x000140001410(puVar6);
              }
              *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
              *puVar6 = 0x3feb333333333333;
              func_0x000140141c50(2);
              uStack_d0 = 0xb;
              uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18794);
              func_0x00014000bf90(uVar7,1);
            }
          }
        }
      }
    }
  }
  uStack_d0 = 0xf;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_130);
  in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
  in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_b8,in_stack_fffffffffffffe38,
                      in_stack_fffffffffffffe40);
  uStack_64 = uStack_ac;
  uStack_68 = uStack_b0;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) == 0) {
    uStack_70 = uStack_b8;
  }
  else {
    func_0x0001400e9570(&uStack_70,&uStack_b8);
  }
  func_0x00014000bf90(&uStack_70,0xb4);
  iVar2 = func_0x00014015be60(&uStack_130,&uStack_70,uRam00000001405cd9c0,1);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (0 < iVar2) {
    func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_130);
    in_stack_fffffffffffffe40 = in_stack_fffffffffffffe40 & 0xffffffffffffff00;
    in_stack_fffffffffffffe38 = in_stack_fffffffffffffe38 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_b8,in_stack_fffffffffffffe38
                        ,in_stack_fffffffffffffe40);
    uStack_64 = uStack_ac;
    uStack_68 = uStack_b0;
    if ((0x46U >> (uStack_ac & 0x1f) & 1) == 0) {
      uStack_70 = uStack_b8;
    }
    else {
      func_0x0001400e9570(&uStack_70,&uStack_b8);
    }
    func_0x00014000bf90(&uStack_70,0xd2);
    iVar2 = func_0x00014015be60(&uStack_130,&uStack_70,uRam00000001405cd9c0,1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar2 != -2 && iVar2 < 0) {
      uStack_d0 = 0x11;
      if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0x500000000;
      plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1875d);
      func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
      func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,
                          in_stack_fffffffffffffe38 & 0xffffff00,
                          in_stack_fffffffffffffe40 & 0xffffffffffffff00);
      if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
        func_0x0001401479b0();
        iVar2 = func_0x000140147990(*plVar4);
        if (iVar2 < 2) {
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
      func_0x000140001490(&uStack_178,plVar4);
      ppuVar11 = &puStack_108;
      uVar10 = uRam00000001405c8d80;
      puStack_108 = &uStack_178;
      uVar7 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8d80,ppuVar11);
      func_0x00014002fc60(&uStack_a8,&uStack_90,10);
      uStack_64 = uStack_9c;
      uStack_68 = uStack_a0;
      if ((0x46U >> (uStack_9c & 0x1f) & 1) == 0) {
        uStack_70 = uStack_a8;
      }
      else {
        func_0x0001400e9570(&uStack_70,&uStack_a8);
      }
      func_0x00014000bdb0(&uStack_70,uVar7);
      iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      if (0 < iVar2) {
        func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
        ppuVar11 = (undefined8 **)((ulonglong)ppuVar11 & 0xffffffffffffff00);
        uVar10 = uVar10 & 0xffffff00;
        func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,uVar10,ppuVar11);
        func_0x00014002fc60(&uStack_70,&uStack_90,5);
        iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        if (iVar2 != -2 && iVar2 < 0) {
          uStack_d0 = 0x13;
          if ((0x46U >> (uStack_180._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_188);
          }
          uStack_188 = 0;
          uStack_180 = 0x500000000;
          func_0x000140001490(&uStack_168,puStack_120);
          puStack_100 = &uStack_168;
          uVar7 = func_0x0001401445d0(param_1,uStack_98,&uStack_188,1,uRam00000001405c8ba0,
                                      &puStack_100);
          func_0x00014002fc60(&uStack_70,uVar7,1);
          func_0x000140001490(&uStack_118,&uStack_70);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          dVar1 = _UNK_14043a218;
          while( true ) {
            uStack_64 = 0;
            uStack_70 = 0;
            iVar2 = func_0x00014015be60(&uStack_118,&uStack_70,uRam00000001405cd9c0,1);
            if (iVar2 < 0) break;
            uStack_d0 = 0x15;
            if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uStack_80 = 0;
            uStack_78 = 0x500000000;
            uVar3 = func_0x00014012cd90(&uStack_118);
            plVar4 = (longlong *)func_0x00014002fbe0(puStack_120,uVar3);
            if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
              func_0x0001401479b0();
              iVar2 = func_0x000140147990(*plVar4);
              if (iVar2 < 1) {
                uVar3 = func_0x000140147990(*plVar4);
                func_0x000140144260(&UNK_140439ca6,0,uVar3);
                plVar4 = (longlong *)0x0;
              }
              else {
                plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
              }
            }
            else {
              func_0x000140144260(&UNK_140439cd8);
            }
            func_0x000140001490(&uStack_178,plVar4);
            puStack_108 = &uStack_178;
            func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8960,&puStack_108);
            switch(uStack_10c & 0xffffff) {
            case 0:
            case 0xd:
              uStack_118 = uStack_118 + dVar1;
              break;
            case 1:
              uStack_118 = (double)func_0x00014012d320(&uStack_118);
              uStack_118 = uStack_118 + dVar1;
              uStack_10c = 0;
              break;
            default:
              func_0x000140005560(&UNK_14043a32c,&uStack_118,&uStack_118);
              break;
            case 7:
              uStack_118 = (double)CONCAT44(uStack_118._4_4_,(int)uStack_118 + -1);
              break;
            case 10:
              uStack_118 = (double)((longlong)uStack_118 + -1);
            }
          }
          uStack_d0 = 0x17;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_178,0x1405c5ba0);
          puStack_108 = &uStack_178;
          func_0x00014000bee0(&uStack_168,0x1405c5bb0);
          puStack_100 = &uStack_168;
          if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_158);
          }
          func_0x0001401441e0(&uStack_158,0x1405c5b70);
          puStack_f8 = &uStack_158;
          func_0x00014000bee0(&uStack_148,0x1405c5bc0);
          puStack_f0 = &uStack_148;
          func_0x0001401445d0(param_1,uStack_98,&uStack_80,4,uRam00000001405c8d90,&puStack_108);
          uStack_d0 = 0x18;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_178,0x1405c5bd0);
          puStack_108 = &uStack_178;
          func_0x00014000bee0(&uStack_168,0x1405c5be0);
          puStack_100 = &uStack_168;
          if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_158);
          }
          func_0x0001401441e0(&uStack_158,0x1405c5b70);
          puStack_f8 = &uStack_158;
          func_0x00014000bee0(&uStack_148,0x1405c5bf0);
          ppuVar11 = &puStack_108;
          uVar10 = uRam00000001405c8d90;
          puStack_f0 = &uStack_148;
          func_0x0001401445d0(param_1,uStack_98,&uStack_80,4,uRam00000001405c8d90,ppuVar11);
          uStack_d0 = 0x19;
          func_0x00014017c070(param_1,uStack_98,0,0);
        }
      }
      uStack_d0 = 0x1b;
      func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
      uVar12 = (ulonglong)ppuVar11 & 0xffffffffffffff00;
      uVar10 = uVar10 & 0xffffff00;
      func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,uVar10,uVar12);
      uStack_64 = uStack_84;
      uStack_68 = uStack_88;
      if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
        uStack_70 = uStack_90;
      }
      else {
        func_0x0001400e9570(&uStack_70,&uStack_90);
      }
      func_0x00014000bf90(&uStack_70,5);
      iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      if (0 < iVar2) {
        if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_80);
        }
        uStack_80 = 0;
        uStack_78 = 0x500000000;
        plVar4 = (longlong *)(**(code **)(*param_1 + 8))(param_1,0x1875d);
        func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_c8);
        func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_90,uVar10 & 0xffffff00,
                            uVar12 & 0xffffffffffffff00);
        if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
          func_0x0001401479b0();
          iVar2 = func_0x000140147990(*plVar4);
          if (iVar2 < 1) {
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
        func_0x000140001490(&uStack_178,plVar4);
        puStack_108 = &uStack_178;
        uVar7 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8d80,&puStack_108
                                   );
        uStack_9c = uStack_84;
        uStack_a0 = uStack_88;
        if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
          uStack_a8 = uStack_90;
        }
        else {
          func_0x0001400e9570(&uStack_a8,&uStack_90);
        }
        func_0x00014000bf90(&uStack_a8,10);
        uStack_64 = uStack_9c;
        uStack_68 = uStack_a0;
        if ((0x46U >> (uStack_9c & 0x1f) & 1) == 0) {
          uStack_70 = uStack_a8;
        }
        else {
          func_0x0001400e9570(&uStack_70,&uStack_a8);
        }
        func_0x000140005290(&uStack_70,uVar7);
        iVar2 = func_0x00014015be60(&uStack_c8,&uStack_70,uRam00000001405cd9c0,1);
        if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_a8);
        }
        if (iVar2 != -2 && iVar2 < 0) {
          uStack_d0 = 0x1d;
          plRam0000000140657680 = (longlong *)0x3875c;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18794);
          if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_178);
          }
          func_0x0001401441e0(&uStack_178,0x1405c5b7a);
          puStack_108 = &uStack_178;
          if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_168);
          }
          func_0x0001401441e0(&uStack_168,0x140656e80);
          puStack_100 = &uStack_168;
          if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_158);
          }
          func_0x0001401441e0(&uStack_158,0x140656e80);
          puStack_f8 = &uStack_158;
          if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_148);
          }
          func_0x0001401441e0(&uStack_148,0x1405c5b80);
          puStack_f0 = &uStack_148;
          uVar8 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,4,uRam00000001405c8fd0,
                                      &puStack_108);
          func_0x000140141d00(plRam000000014065e080);
          func_0x00014002fc60(&uStack_70,uVar7,1);
          uVar3 = func_0x00014012cd90(&uStack_70);
          puVar5 = puStack_120;
          puVar6 = (undefined8 *)func_0x00014012b840(puStack_120,uVar3);
          func_0x000140141d00(*puVar5);
          uVar9 = func_0x00014012b840(puVar6,1);
          func_0x000140141d00(*puVar6);
          func_0x000140001490(uVar9,uVar8);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          func_0x000140141c50(3);
          uStack_d0 = 0x1e;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014002fc60(&uStack_70,uVar7,1);
          uVar3 = func_0x00014012cd90(&uStack_70);
          plVar4 = (longlong *)func_0x00014002fbe0(puStack_120,uVar3);
          if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
            func_0x0001401479b0();
            iVar2 = func_0x000140147990(*plVar4);
            if (iVar2 < 1) {
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
          func_0x000140001490(&uStack_178,plVar4);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          puStack_108 = &uStack_178;
          func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8bb0,&puStack_108);
          uStack_d0 = 0x1f;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014002fc60(&uStack_70,uVar7,1);
          uVar3 = func_0x00014012cd90(&uStack_70);
          plVar4 = (longlong *)func_0x00014002fbe0(puStack_120,uVar3);
          if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
            func_0x0001401479b0();
            iVar2 = func_0x000140147990(*plVar4);
            if (iVar2 < 2) {
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
          func_0x000140001490(&uStack_178,plVar4);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          puStack_108 = &uStack_178;
          uVar8 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8b90,
                                      &puStack_108);
          func_0x000140141d00(plRam000000014065e080);
          func_0x00014002fc60(&uStack_70,uVar7,1);
          uVar3 = func_0x00014012cd90(&uStack_70);
          puVar5 = puStack_120;
          puVar6 = (undefined8 *)func_0x00014012b840(puStack_120,uVar3);
          func_0x000140141d00(*puVar5);
          uVar7 = func_0x00014012b840(puVar6,0);
          func_0x000140141d00(*puVar6);
          func_0x000140001490(uVar7,uVar8);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          func_0x000140141c50(3);
        }
      }
    }
  }
  uStack_d0 = 0x24;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18794);
  func_0x000140001490(&uStack_178,uVar7);
  puStack_108 = &uStack_178;
  func_0x00014000bee0(&uStack_168,0x1405c5c00);
  puStack_100 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x1405c5c10);
  puStack_f8 = &uStack_158;
  uVar8 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8a00,&puStack_108);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar7,uVar8);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  if ((0x46U >> (uStack_19c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  if ((0x46U >> (uStack_180._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
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
  puRam0000000140657668 = (undefined8 *)uStack_e0;
  return;
}
END DECOMPILED REFERENCE */

