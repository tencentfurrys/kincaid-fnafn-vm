/// @description FNAFN script customfunct_options_update - PORTED from C
// PORTED from C
// Ground truth: gml_Script_customfunct_options_update
// Decoded, in source-line order (uStack_98 5..0x2a):
//   1. game_settings[9] ("Volume") = clamp(game_settings[9], <lo>, 100.0)
//      [slot 0x1405c8a00 = clamp via func_0x0001401445d0; 100.0 is .data
//      const @0x1405c3188; <lo> is BSS runtime const @0x140655090 ->
//      TODO(calibrate) placeholder]; then audio_master_gain(game_settings[9])
//      [slot 0x1405c8a10, 1 arg; index-9 accessor via func_0x000140147980
//      with the 100.0 default @0x14043a0c0].
//   2. if (instance_exists(Obj_Menu_Static)) [0x20 = 32 = Obj_Menu_Static per
//      obj_names.json] with (Obj_Menu_Static) { if (game_settings[0] ("VHS")
//      == "full" [@0x1405c3170]) { animate_speed [id 0x186dd] = 0;
//      image_alpha [slot 0x1405c7b98] = 0; } else { animate_speed = 0.35
//      [0x3fd6666666666666]; image_alpha = alpha_current [id 0x186db]; } }.
//      The with() shape is the 0x140144bd0/0x1401451f0/0x1401449f0
//      enumerator over repeat const 32.0; the 3-arg func_0x000140160140
//      property write carries the value prepared in uStack_d8 (0 vs
//      alpha_current) -- cf. the 4-arg form in Obj_Filter_Menus/Create.gml.
//   3. if (instance_exists(Obj_Filter_Menus)) [0x29 = 41 per obj_names.json]
//      with (Obj_Filter_Menus) { if (game_settings[0] == "disabled"
//      [@0x1405c3175]) oldtvfilter_enabled [id 0x18750] = 0; else {
//      oldtvfilter_enabled = 1; <string switch below> } }. The switch on
//      game_settings[0] against lazily-initialized BSS statics "full"
//      (@0x1406550a0 <- @0x1405c3170) / "low" (@0x1406550b4 <- @0x1405c317e)
//      with ordinal table {0,1} is byte-identical to the switch already
//      ported in objects/Obj_Filter_Menus/Create.gml: "full" -> ordinal 0
//      -> event_perform(ev_alarm, 0); "low" -> ordinal 1 ->
//      event_perform(ev_alarm, 1). (This function's decompile prints the
//      0x140181c50 calls with 3 args -- decompiler artifact also affecting
//      its 160140 calls; the Filter_Menus precedent shows the true 4-arg
//      (self, other, 2, ordinal) event_perform shape.)
//   4. surface_resize(application_surface [slot 0x1405c7ba8 via
//      func_0x00014015ef90], 1280.0 [@0x1405c3198], 720.0 [@0x1405c31a8])
//      [slot 0x1405c8a20 = surface_resize].
// Dropped: 144b20 prologue, uStack_98 line numbers, BSS store ...7680 =
// 0x1f86a2, and the TLS lazy-init guard (emitted statics only).
function customfunct_options_update() {
    game_settings[9] = clamp(game_settings[9], 0 /* TODO(calibrate): lower bound is runtime const @0x140655090 (BSS, unreadable offline) */, 100);
    audio_master_gain(game_settings[9]);
    if (instance_exists(Obj_Menu_Static)) {
        with (Obj_Menu_Static) {
            if (game_settings[0] == "full") {
                animate_speed = 0;
                image_alpha = 0;
            } else {
                animate_speed = 0.35;
                image_alpha = alpha_current;
            }
        }
    }
    if (instance_exists(Obj_Filter_Menus)) {
        with (Obj_Filter_Menus) {
            if (game_settings[0] == "disabled") {
                oldtvfilter_enabled = 0;
            } else {
                oldtvfilter_enabled = 1;
                if (game_settings[0] == "full") {
                    event_perform(ev_alarm, 0);
                } else if (game_settings[0] == "low") {
                    event_perform(ev_alarm, 1);
                }
            }
        }
    }
    surface_resize(application_surface, 1280, 720);
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

undefined8 *
gml_Script_customfunct_options_update(longlong *param_1,undefined8 param_2,undefined8 *param_3)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  longlong *plVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  undefined8 *puVar9;
  longlong lVar10;
  longlong unaff_GS_OFFSET;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_128;
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
  undefined auStack_c8 [12];
  uint uStack_bc;
  longlong lStack_b8;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  longlong lStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  longlong *plStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043a0c8;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  plRam0000000140657680 = param_1;
  uStack_80 = param_2;
  plStack_68 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  puVar5 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18750);
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_88 = (ulonglong)(uint)uStack_88;
  uStack_90 = 0;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  func_0x000140144b20(uRam00000001405c9750);
  uStack_98 = 5;
  plRam0000000140657680 = (longlong *)0x1f86a2;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 10) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,9,uVar3);
      plVar6 = (longlong *)0x0;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar4,9);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar6 = plVar4;
  }
  func_0x000140001490(&uStack_108,plVar6);
  puStack_138 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140655090);
  puStack_130 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c3188);
  puStack_128 = &uStack_e8;
  uVar7 = func_0x0001401445d0(plStack_68,uStack_80,&uStack_90,3,uRam00000001405c8a00,&puStack_138);
  func_0x000140141d00(plRam000000014065e080);
  uVar8 = func_0x00014012b840(plVar4,9);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar8,uVar7);
  func_0x000140141c50(2);
  uStack_98 = 6;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 10) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,9,uVar3);
      plVar6 = (longlong *)0x0;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar4,9);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar6 = plVar4;
  }
  func_0x00014001f910(auStack_c8,plVar6,_UNK_14043a0c0);
  func_0x000140001490(&uStack_108,auStack_c8);
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_c8);
  }
  puStack_138 = &uStack_108;
  func_0x0001401445d0(plStack_68,uStack_80,&uStack_90,1,uRam00000001405c8a10,&puStack_138);
  uStack_98 = 7;
  cVar1 = func_0x00014017c0e0(plStack_68,uStack_80,0x20);
  if (cVar1 != '\0') {
    uStack_98 = 9;
    uStack_6c = 0;
    lStack_78 = 0x4040000000000000;
    iVar2 = func_0x000140144bd0(auStack_c8,&plStack_68,&uStack_80,&lStack_78);
    if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
      func_0x000140001410(&lStack_78);
    }
    if (0 < iVar2) {
      do {
        uStack_98 = 0xb;
        func_0x0001401453a0(&lStack_78,0x1405c3170);
        if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
          func_0x0001401479b0();
          iVar2 = func_0x000140147990(*plVar4);
          if (iVar2 < 1) {
            uVar3 = func_0x000140147990(*plVar4);
            func_0x000140144260(&UNK_140439ca6,0,uVar3);
            plVar6 = (longlong *)0x0;
          }
          else {
            plVar6 = (longlong *)func_0x000140147980(*plVar4,0);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
          plVar6 = plVar4;
        }
        iVar2 = func_0x00014015be60(plVar6,&lStack_78,uRam00000001405cd9c0,0);
        if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
          func_0x000140001410(&lStack_78);
        }
        if (iVar2 == 0) {
          uStack_98 = 0x12;
          puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186dd);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar9);
          }
          *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
          *puVar9 = 0;
          uStack_98 = 0x13;
          if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_d8);
          }
          uStack_cc = 0;
          uStack_d8 = 0;
          func_0x000140160140(plStack_68,uRam00000001405c7b98,0x80000000);
        }
        else {
          uStack_98 = 0xd;
          puVar9 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186dd);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar9);
          }
          *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
          *puVar9 = 0x3fd6666666666666;
          uStack_98 = 0xe;
          uVar7 = (**(code **)(*plStack_68 + 8))(plStack_68,0x186db);
          func_0x000140001490(&uStack_d8,uVar7);
          func_0x000140160140(plStack_68,uRam00000001405c7b98,0x80000000);
        }
        cVar1 = func_0x0001401451f0(auStack_c8,&plStack_68,&uStack_80);
      } while (cVar1 != '\0');
    }
    func_0x0001401449f0(auStack_c8,&plStack_68,&uStack_80);
    if (lStack_b8 != 0) {
      func_0x00014012ec70();
      lStack_b8 = 0;
    }
  }
  uStack_98 = 0x17;
  cVar1 = func_0x00014017c0e0(plStack_68,uStack_80,0x29);
  if (cVar1 != '\0') {
    uStack_98 = 0x19;
    uStack_6c = 0;
    lStack_78 = 0x4044800000000000;
    iVar2 = func_0x000140144bd0(auStack_c8,&plStack_68,&uStack_80,&lStack_78);
    if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
      func_0x000140001410(&lStack_78);
    }
    if (0 < iVar2) {
      do {
        uStack_98 = 0x1b;
        func_0x0001401453a0(&lStack_78,0x1405c3175);
        if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
          func_0x0001401479b0();
          iVar2 = func_0x000140147990(*plVar4);
          if (iVar2 < 1) {
            uVar3 = func_0x000140147990(*plVar4);
            func_0x000140144260(&UNK_140439ca6,0,uVar3);
            plVar6 = (longlong *)0x0;
          }
          else {
            plVar6 = (longlong *)func_0x000140147980(*plVar4,0);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
          plVar6 = plVar4;
        }
        iVar2 = func_0x00014015be60(plVar6,&lStack_78,uRam00000001405cd9c0,0);
        if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
          func_0x000140001410(&lStack_78);
        }
        if (iVar2 == 0) {
          uStack_98 = 0x1d;
          if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar5);
          }
          *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
          *puVar5 = 0;
        }
        else {
          uStack_98 = 0x21;
          if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar5);
          }
          *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
          *puVar5 = 0x3ff0000000000000;
          uStack_98 = 0x22;
          if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
            func_0x0001401479b0();
            iVar2 = func_0x000140147990(*plVar4);
            if (iVar2 < 1) {
              uVar3 = func_0x000140147990(*plVar4);
              func_0x000140144260(&UNK_140439ca6,0,uVar3);
              plVar6 = (longlong *)0x0;
            }
            else {
              plVar6 = (longlong *)func_0x000140147980(*plVar4,0);
            }
          }
          else {
            func_0x000140144260(&UNK_140439cd8);
            plVar6 = plVar4;
          }
          uStack_6c = *(uint *)((longlong)plVar6 + 0xc);
          uStack_70 = *(undefined4 *)(plVar6 + 1);
          if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
            lStack_78 = *plVar6;
          }
          else {
            func_0x000140028470(&lStack_78);
          }
          if (*(int *)(*(longlong *)
                        (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
              iRam00000001406550c8) {
            func_0x0001403f6320(0x1406550c8);
            if (iRam00000001406550c8 == -1) {
              func_0x0001401453a0(0x1406550a0,0x1405c3170);
              uRam00000001406550b0 = 0;
              func_0x0001401453a0(0x1406550b4,0x1405c317e);
              uRam00000001406550c4 = 1;
              func_0x0001403f6668(&DAT_140028280);
              func_0x0001403f62c0(0x1406550c8);
            }
          }
          uVar7 = uRam00000001405cd9c0;
          iVar2 = func_0x00014015be60(0x1406550a0,&lStack_78,uRam00000001405cd9c0,0);
          if (iVar2 == 0) {
            lVar10 = 0;
code_r0x0001400278f2:
            iVar2 = *(int *)(lVar10 * 0x14 + 0x1406550b0);
            if (iVar2 == 1) {
              uStack_98 = 0x25;
              func_0x000140181c50(plStack_68,uStack_80,2);
            }
            else if (iVar2 == 0) {
              uStack_98 = 0x24;
              func_0x000140181c50(plStack_68,uStack_80,2);
            }
          }
          else {
            iVar2 = func_0x00014015be60(0x1406550b4,&lStack_78,uVar7,0);
            if (iVar2 == 0) {
              lVar10 = 1;
              goto code_r0x0001400278f2;
            }
          }
          if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
            func_0x000140001410(&lStack_78);
          }
        }
        cVar1 = func_0x0001401451f0(auStack_c8,&plStack_68,&uStack_80);
      } while (cVar1 != '\0');
    }
    func_0x0001401449f0(auStack_c8,&plStack_68,&uStack_80);
    if (lStack_b8 != 0) {
      func_0x00014012ec70();
      lStack_b8 = 0;
    }
  }
  uStack_98 = 0x2a;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  func_0x00014015ef90(plStack_68,uRam00000001405c7ba8,0x80000000,&uStack_118);
  func_0x000140001490(&uStack_108,&uStack_118);
  puStack_138 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c3198);
  puStack_130 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c31a8);
  puStack_128 = &uStack_e8;
  func_0x0001401445d0(plStack_68,uStack_80,&uStack_90,3,uRam00000001405c8a20,&puStack_138);
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
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
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return param_3;
}
END DECOMPILED REFERENCE */
