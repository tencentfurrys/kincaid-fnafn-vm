/// @description FNAFN Obj_Night_UI_Camera_Button / KeyPress_87 - PORTED from C
// ---- sub-event KeyPress_87 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Night_UI_Camera_Button_KeyPress_87 (4991 B @0x140067c70)
// Decoded, in order (uStack_88 = GML line markers). Slots per
// EXE-REGISTRY.md: 0x1405c8d90 = instance_create_layer, 0x1405c89d0 =
// layer_set_visible, 0x1405c8e40 (unused here), 0x1405c8970 is NOT used —
// sounds go through the script customfunct_audio_play_sound_single
// (snd, priority, loop) per scripts/ported/
// customfunct_audio_play_sound_single.gml. Helpers per PORTING.md:
// 0x14017c0e0 = instance_exists(N), 0x14017c070 = instance_destroy() inside
// the with() loop (repeat-const 4.0 = OBJECT INDEX 4 =
// Obj_Night_Camera_Tablet per obj_names.json). Ids per builtin_ids.json:
// 0x18749 Night_recording, 0x186ec button_toggle (array), 0x18748
// Night_power_amount (global), 0x1873b Night_camera (global), 0x186eb
// button_index, 0x18758 Player_rotation_mode (obj 1), 0x1877e
// Tablet_Sprite_Speed (obj 4 = Obj_Night_Camera_Tablet), 0x1875b
// power_threshold, 0x18747 Night_office_rotated. Object 0x41 = 65 =
// Obj_Night_Camera_Screen_Flash; image_alpha slot 0x1405c7b98.
//   1. if (Night_recording != 0) exit.
//   3. button_toggle[0] ^= 1 (bool flip, cf. Music_Switch; index 0).
//   5. switch on the button_toggle[0] copy: cases 0 / 1.0 are CERTAIN
//      (pool @0x1406557f0 = 0 / @0x140655804 = 1.0 literal in the guarded
//      init). Label table @0x140655800 runtime — mapping assumed identity
//      (0 -> off-branch, 1 -> on-branch):
//      case 0 (0x7-0x19):
//        0x7. Night_power_amount -= 1 (the line-0x7 id-0x186ec fetch is
//             discarded — the -= lands on the id-0x18748 global slot,
//             same YYC idiom as the Freddy Step 0x21 write).
//        0x8. Night_camera = 0.
//        0x9. customfunct_audio_play_sound_single(<exe @0x1405c4028>,
//             <rt @0x1406557e0>, <rt @0x1406557e0>).
//        0xa/0xc. if (instance_exists(Obj_Night_Camera_Tablet)) {
//                   with (Obj_Night_Camera_Tablet) { instance_destroy(); } }.
//        0x11. button_index = 0.
//        0x12. Obj_Night_Camera_Screen_Flash.image_alpha = 0
//              (object-tagged property write 0x14015fea0(0x41, ...)).
//        0x13. instance_create_layer(<rt @0x1406557e0>, <rt @0x1406557e0>,
//              "<layer @0x1405c4000>", <obj const @0x1405c4038>).
//        0x14. Obj_Night_Camera_Tablet.image_index = 18 (0x4032000000000000).
//        0x15. Obj_Night_Camera_Tablet.Tablet_Sprite_Speed = -0.99
//              (0xbfefae147ae147ae literal).
//        0x16. audio_stop_sound(<exe @0x1405c4048>).
//        0x17. func_0x00014017bda0(self, 49) (0x31) — unknown helper,
//              comment-only (cf. the ported Foxy Step jumpscare tail).
//        0x18. layer_set_visible("<layer @0x1405c4004>", <rt @0x1406557e0>).
//        0x19. switch on Night_office_rotated: cases 0 / 1.0 CERTAIN
//              (pool @0x140655820/@0x140655834 literal in the init); table
//              @0x140655830 runtime — assumed identity:
//              case 0: layer_set_visible("<@0x1405c400f>", <exe @0x1405c4058>);
//                      layer_set_visible("<@0x1405c401c>", <rt @0x1406557e0>).
//              case 1: layer_set_visible("<@0x1405c400f>", <rt @0x1406557e0>);
//                      layer_set_visible("<@0x1405c401c>", <exe @0x1405c4058>).
//      case 1 (0x24-0x31):
//        0x24. if (Night_power_amount >= power_threshold) (`>=` via `r >= 0`):
//          0x35. customfunct_audio_play_sound_single(<exe @0x1405c4078>,
//                <rt>, <rt>); button_toggle[0] = 0.
//        else (0x26): Night_power_amount += 1 (+= helper 0x14000bf90);
//          0x27. customfunct_audio_play_sound_single(<exe @0x1405c4068>,
//                <rt>, <rt>);
//          0x28. if (instance_exists(Obj_Night_Camera_Tablet)) {
//                  with (Obj_Night_Camera_Tablet) { instance_destroy(); } }.
//          0x2f. instance_create_layer(<rt>, <rt>, "<layer @0x1405c4000>",
//                <obj const @0x1405c4038>) (same consts as 0x13).
//          0x30. Obj_Night_Camera_Tablet.image_index = 0.
//          0x31. Obj_Night_Camera_Tablet.Tablet_Sprite_Speed = 0.99
//                (0x3fefae147ae147ae literal).
// TODO(calibrate): toggle-switch table @0x140655800 + rotated-switch table
// @0x140655830 mappings; layer-name strings + numeric consts @0x1405c40xx
// (below dump range — "TODO_calibrate_..." / 0); obj const @0x1405c4038
// (0 assumed); runtime consts @0x1406557e0 (BSS-zero: 0/false);
// func_0x00014017bda0 identity; random/pitch .rdata values — verify in-game.
// Ported: Obj_Night_UI_Camera_Button / KeyPress_87
if (Night_recording != 0) {
    exit;
}
button_toggle[0] ^= 1;
if (button_toggle[0] == 0) { // TODO(calibrate): table @0x140655800 mapping assumed identity — verify in-game
    Night_power_amount -= 1;
    Night_camera = 0;
    customfunct_audio_play_sound_single(0 /* TODO(calibrate): exe const @0x1405c4028 */, 0 /* TODO(calibrate): runtime const @0x1406557e0 */, false /* TODO(calibrate): runtime const @0x1406557e0 */);
    if (instance_exists(Obj_Night_Camera_Tablet)) {
        with (Obj_Night_Camera_Tablet) { instance_destroy(); }
    }
    button_index = 0;
    Obj_Night_Camera_Screen_Flash.image_alpha = 0;
    instance_create_layer(0 /* TODO(calibrate): runtime const @0x1406557e0 */, 0 /* TODO(calibrate): runtime const @0x1406557e0 */, "TODO_calibrate_0x1405c4000", 0 /* TODO(calibrate): obj const @0x1405c4038 */);
    Obj_Night_Camera_Tablet.image_index = 18;
    Obj_Night_Camera_Tablet.Tablet_Sprite_Speed = -0.99;
    audio_stop_sound(0 /* TODO(calibrate): exe const @0x1405c4048 */);
    // TODO(calibrate): func_0x00014017bda0(self, 49) (0x31) — unknown helper, verify in-game
    layer_set_visible("TODO_calibrate_0x1405c4004", 0 /* TODO(calibrate): runtime const @0x1406557e0 */);
    if (Night_office_rotated == 0) { // TODO(calibrate): table @0x140655830 mapping assumed identity — verify in-game
        layer_set_visible("TODO_calibrate_0x1405c400f", 0 /* TODO(calibrate): exe const @0x1405c4058 */);
        layer_set_visible("TODO_calibrate_0x1405c401c", 0 /* TODO(calibrate): runtime const @0x1406557e0 */);
    } else if (Night_office_rotated == 1) { // TODO(calibrate): same table
        layer_set_visible("TODO_calibrate_0x1405c400f", 0 /* TODO(calibrate): runtime const @0x1406557e0 */);
        layer_set_visible("TODO_calibrate_0x1405c401c", 0 /* TODO(calibrate): exe const @0x1405c4058 */);
    }
} else if (button_toggle[0] == 1) { // TODO(calibrate): same table
    if (Night_power_amount >= power_threshold) {
        customfunct_audio_play_sound_single(0 /* TODO(calibrate): exe const @0x1405c4078 */, 0 /* TODO(calibrate): runtime const @0x1406557e0 */, false /* TODO(calibrate): runtime const @0x1406557e0 */);
        button_toggle[0] = 0;
    } else {
        Night_power_amount += 1;
        customfunct_audio_play_sound_single(0 /* TODO(calibrate): exe const @0x1405c4068 */, 0 /* TODO(calibrate): runtime const @0x1406557e0 */, false /* TODO(calibrate): runtime const @0x1406557e0 */);
        if (instance_exists(Obj_Night_Camera_Tablet)) {
            with (Obj_Night_Camera_Tablet) { instance_destroy(); }
        }
        instance_create_layer(0 /* TODO(calibrate): runtime const @0x1406557e0 */, 0 /* TODO(calibrate): runtime const @0x1406557e0 */, "TODO_calibrate_0x1405c4000", 0 /* TODO(calibrate): obj const @0x1405c4038 */);
        Obj_Night_Camera_Tablet.image_index = 0;
        Obj_Night_Camera_Tablet.Tablet_Sprite_Speed = 0.99;
    }
}
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_UI_Camera_Button_KeyPress_87(longlong *param_1,undefined8 param_2)

{
  byte bVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  longlong *plVar9;
  longlong *plVar10;
  double *pdVar11;
  longlong lVar12;
  longlong unaff_GS_OFFSET;
  undefined8 **ppuVar13;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  longlong lStack_158;
  undefined4 uStack_150;
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
  undefined8 uStack_e0;
  longlong lStack_d8;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  longlong *plStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043b03e;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  plRam0000000140657680 = param_1;
  uStack_80 = param_2;
  plStack_78 = param_1;
  uVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18748);
  puVar7 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  puVar8 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_88 = 1;
  uStack_e0 = (ulonglong)(uint)uStack_e0;
  uStack_e8 = 0;
  iVar3 = func_0x00014015be60(uVar5,&uStack_e8,uRam00000001405cd9c0,0);
  if (iVar3 != 0) goto code_r0x000140068e34;
  uStack_88 = 3;
  plRam0000000140657680 = (longlong *)0x2879d;
  plVar9 = (longlong *)(**(code **)(*plStack_78 + 0x10))(plStack_78,0x186ec);
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar9);
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
      plVar10 = (longlong *)0x0;
    }
    else {
      plVar10 = (longlong *)func_0x000140147980(*plVar9,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar10 = plVar9;
  }
  bVar1 = func_0x00014012bb70(plVar10);
  func_0x000140141d00(plStack_78);
  pdVar11 = (double *)func_0x00014012b840(plVar9,0);
  func_0x000140141d00(*plVar9);
  if ((0x46U >> (*(uint *)((longlong)pdVar11 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar11);
  }
  *(undefined4 *)((longlong)pdVar11 + 0xc) = 0;
  *pdVar11 = (double)(uint)(bVar1 ^ 1);
  func_0x000140141c50(2);
  uStack_88 = 5;
  if (((*(uint *)((longlong)plVar9 + 0xc) & 0xffffff) == 2) && (*plVar9 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar9);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar9);
      plVar9 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar9 = (longlong *)func_0x000140147980(*plVar9,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_14c = *(uint *)((longlong)plVar9 + 0xc);
  uStack_150 = *(undefined4 *)(plVar9 + 1);
  if ((0x46U >> (uStack_14c & 0x1f) & 1) == 0) {
    lStack_158 = *plVar9;
  }
  else {
    func_0x0001400697f0(&lStack_158,plVar9);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655818) &&
     (func_0x0001403f6320(0x140655818), iRam0000000140655818 == -1)) {
    uRam00000001406557fc = 0;
    uRam00000001406557f0 = 0;
    uRam0000000140655810 = 0x100000000;
    uRam0000000140655804 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_1400696d0);
    func_0x0001403f62c0(0x140655818);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar12 = 0;
  iVar3 = func_0x00014015be60(0x1406557f0,&lStack_158,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
code_r0x000140067fdc:
    iVar3 = *(int *)(lVar12 * 0x14 + 0x140655800);
    if (iVar3 == 1) {
      uStack_88 = 0x24;
      uVar5 = (**(code **)(*plStack_78 + 8))(plStack_78,0x1875b);
      iVar3 = func_0x00014015be60(uVar6,uVar5,uRam00000001405cd9c0,1);
      if ((iVar3 == -2) || (-1 < iVar3)) {
        uStack_88 = 0x35;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68 = 0x500000000;
        func_0x00014000bee0(&uStack_138,0x1405c4078);
        puStack_c8 = &uStack_138;
        func_0x00014000bee0(&uStack_128,0x1406557e0);
        puStack_c0 = &uStack_128;
        func_0x00014000bee0(&uStack_118,0x1406557e0);
        puStack_b8 = &uStack_118;
        gml_Script_customfunct_audio_play_sound_single
                  (plStack_78,uStack_80,&uStack_70,3,&puStack_c8);
        uStack_88 = 0x36;
        puVar7 = (undefined8 *)(**(code **)(*plStack_78 + 0x10))(plStack_78,0x186ec);
        func_0x000140141d00(plStack_78);
        puVar8 = (undefined8 *)func_0x00014012b840(puVar7,0);
        func_0x000140141d00(*puVar7);
        if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar8);
        }
        *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
        *puVar8 = 0;
        func_0x000140141c50(2);
      }
      else {
        uStack_88 = 0x26;
        func_0x00014000bf90(uVar6,1);
        uStack_88 = 0x27;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68 = 0x500000000;
        func_0x00014000bee0(&uStack_138,0x1405c4068);
        puStack_c8 = &uStack_138;
        func_0x00014000bee0(&uStack_128,0x1406557e0);
        puStack_c0 = &uStack_128;
        func_0x00014000bee0(&uStack_118,0x1406557e0);
        ppuVar13 = &puStack_c8;
        puStack_b8 = &uStack_118;
        gml_Script_customfunct_audio_play_sound_single
                  (plStack_78,uStack_80,&uStack_70,3,&puStack_c8);
        uStack_88 = 0x28;
        cVar2 = func_0x00014017c0e0(plStack_78,uStack_80,4);
        uVar4 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
        if (cVar2 != '\0') {
          uStack_88 = 0x2a;
          uStack_9c = 0;
          uStack_a8 = 0x4010000000000000;
          iVar3 = func_0x000140144bd0(&uStack_e8,&plStack_78,&uStack_80,&uStack_a8);
          if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_a8);
          }
          uVar4 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
          if (0 < iVar3) {
            do {
              uStack_88 = 0x2c;
              func_0x00014017c070(plStack_78,uStack_80,0,0);
              cVar2 = func_0x0001401451f0(&uStack_e8,&plStack_78);
              uVar4 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
            } while (cVar2 != '\0');
          }
          func_0x0001401449f0(&uStack_e8,&plStack_78,&uStack_80);
          if (lStack_d8 != 0) {
            func_0x00014012ec70();
            lStack_d8 = 0;
          }
        }
        uStack_88 = 0x2f;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68 = 0x500000000;
        func_0x00014000bee0(&uStack_138,0x1406557e0);
        puStack_c8 = &uStack_138;
        func_0x00014000bee0(&uStack_128,0x1406557e0);
        puStack_c0 = &uStack_128;
        if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_118);
        }
        func_0x0001401441e0(&uStack_118,0x1405c4000);
        puStack_b8 = &uStack_118;
        func_0x00014000bee0(&uStack_108,0x1405c4038);
        puStack_b0 = &uStack_108;
        func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,4,CONCAT44(uVar4,uRam00000001405c8d90),
                            &puStack_c8);
        uStack_88 = 0x30;
        if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_f8);
        }
        uStack_ec = 0;
        uStack_f8 = 0;
        func_0x00014015fea0(4,uRam00000001405c7aa8,0x80000000,&uStack_f8);
        uStack_88 = 0x31;
        uStack_e0 = 0;
        uStack_e8 = 0x3fefae147ae147ae;
        func_0x000140160b90(4,0x1877e,0x80000000,&uStack_e8);
      }
      uStack_88 = 0x38;
    }
    else if (iVar3 == 0) {
      uStack_88 = 7;
      (**(code **)(*plStack_78 + 0x10))(plStack_78,0x186ec);
      uStack_e0 = uStack_e0 & 0xffffffff;
      uStack_e8 = 0x3ff0000000000000;
      func_0x00014000bdb0(uVar6,&uStack_e8);
      if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_e8);
      }
      uStack_88 = 8;
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0;
      uStack_88 = 9;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x1405c4028);
      puStack_c8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x1406557e0);
      puStack_c0 = &uStack_128;
      func_0x00014000bee0(&uStack_118,0x1406557e0);
      ppuVar13 = &puStack_c8;
      puStack_b8 = &uStack_118;
      gml_Script_customfunct_audio_play_sound_single(plStack_78,uStack_80,&uStack_70,3,ppuVar13);
      uStack_88 = 10;
      cVar2 = func_0x00014017c0e0(plStack_78,uStack_80,4);
      uVar4 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
      if (cVar2 != '\0') {
        uStack_88 = 0xc;
        uStack_9c = 0;
        uStack_a8 = 0x4010000000000000;
        iVar3 = func_0x000140144bd0(&uStack_e8,&plStack_78,&uStack_80,&uStack_a8);
        if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_a8);
        }
        uVar4 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
        if (0 < iVar3) {
          do {
            uStack_88 = 0xe;
            func_0x00014017c070(plStack_78,uStack_80,0,0);
            cVar2 = func_0x0001401451f0(&uStack_e8,&plStack_78);
            uVar4 = (undefined4)((ulonglong)ppuVar13 >> 0x20);
          } while (cVar2 != '\0');
        }
        func_0x0001401449f0(&uStack_e8,&plStack_78,&uStack_80);
        if (lStack_d8 != 0) {
          func_0x00014012ec70();
          lStack_d8 = 0;
        }
      }
      uStack_88 = 0x11;
      puVar7 = (undefined8 *)(**(code **)(*plStack_78 + 0x10))(plStack_78,0x186eb);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0;
      uStack_88 = 0x12;
      if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_148);
      }
      uStack_13c = 0;
      uStack_148 = 0;
      func_0x00014015fea0(0x41,uRam00000001405c7b98,0x80000000,&uStack_148);
      uStack_88 = 0x13;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x1406557e0);
      puStack_c8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x1406557e0);
      puStack_c0 = &uStack_128;
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
      func_0x0001401441e0(&uStack_118,0x1405c4000);
      puStack_b8 = &uStack_118;
      func_0x00014000bee0(&uStack_108,0x1405c4038);
      uVar5 = CONCAT44(uVar4,uRam00000001405c8d90);
      puStack_b0 = &uStack_108;
      func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,4,uVar5,&puStack_c8);
      uVar4 = (undefined4)((ulonglong)uVar5 >> 0x20);
      uStack_88 = 0x14;
      if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_f8);
      }
      uStack_ec = 0;
      uStack_f8 = 0x4032000000000000;
      func_0x00014015fea0(4,uRam00000001405c7aa8,0x80000000,&uStack_f8);
      uStack_88 = 0x15;
      uStack_e0 = 0;
      uStack_e8 = 0xbfefae147ae147ae;
      func_0x000140160b90(4,0x1877e,0x80000000,&uStack_e8);
      uStack_88 = 0x16;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x1405c4048);
      uVar5 = CONCAT44(uVar4,uRam00000001405c8960);
      puStack_c8 = &uStack_138;
      func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,1,uVar5,&puStack_c8);
      uVar4 = (undefined4)((ulonglong)uVar5 >> 0x20);
      uStack_88 = 0x17;
      func_0x00014017bda0(plStack_78,uStack_80,0x31);
      uStack_88 = 0x18;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_138);
      }
      func_0x0001401441e0(&uStack_138,0x1405c4004);
      puStack_c8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x1406557e0);
      uVar5 = CONCAT44(uVar4,uRam00000001405c89d0);
      puStack_c0 = &uStack_128;
      func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,2,uVar5,&puStack_c8);
      uVar4 = (undefined4)((ulonglong)uVar5 >> 0x20);
      uStack_88 = 0x19;
      uStack_9c = *(uint *)((longlong)puVar8 + 0xc);
      uStack_a0 = *(undefined4 *)(puVar8 + 1);
      if ((0x46U >> (uStack_9c & 0x1f) & 1) == 0) {
        uStack_a8 = *puVar8;
      }
      else {
        func_0x0001400697f0(&uStack_a8,puVar8);
      }
      if ((*(int *)(*(longlong *)
                     (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
           iRam0000000140655848) && (func_0x0001403f6320(0x140655848), iRam0000000140655848 == -1))
      {
        uRam000000014065582c = 0;
        uRam0000000140655820 = 0;
        uRam0000000140655840 = 0x100000000;
        uRam0000000140655834 = 0x3ff0000000000000;
        func_0x0001403f6668(&DAT_140069760);
        func_0x0001403f62c0(0x140655848);
      }
      uVar5 = uRam00000001405cd9c0;
      lVar12 = 0;
      iVar3 = func_0x00014015be60(0x140655820,&uStack_a8,uRam00000001405cd9c0,0);
      if (iVar3 == 0) {
code_r0x000140068b1d:
        iVar3 = *(int *)(lVar12 * 0x14 + 0x140655830);
        if (iVar3 == 1) {
          uStack_88 = 0x1e;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_138);
          }
          func_0x0001401441e0(&uStack_138,0x1405c400f);
          puStack_c8 = &uStack_138;
          func_0x00014000bee0(&uStack_128,0x1406557e0);
          uVar5 = CONCAT44(uVar4,uRam00000001405c89d0);
          puStack_c0 = &uStack_128;
          func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,2,uVar5,&puStack_c8);
          uVar4 = (undefined4)((ulonglong)uVar5 >> 0x20);
          uStack_88 = 0x1f;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_138);
          }
          func_0x0001401441e0(&uStack_138,0x1405c401c);
          puStack_c8 = &uStack_138;
          func_0x00014000bee0(&uStack_128,0x1405c4058);
          puStack_c0 = &uStack_128;
          func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,2,CONCAT44(uVar4,uRam00000001405c89d0)
                              ,&puStack_c8);
        }
        else if (iVar3 == 0) {
          uStack_88 = 0x1b;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_138);
          }
          func_0x0001401441e0(&uStack_138,0x1405c400f);
          puStack_c8 = &uStack_138;
          func_0x00014000bee0(&uStack_128,0x1405c4058);
          uVar5 = CONCAT44(uVar4,uRam00000001405c89d0);
          puStack_c0 = &uStack_128;
          func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,2,uVar5,&puStack_c8);
          uVar4 = (undefined4)((ulonglong)uVar5 >> 0x20);
          uStack_88 = 0x1c;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_138);
          }
          func_0x0001401441e0(&uStack_138,0x1405c401c);
          puStack_c8 = &uStack_138;
          func_0x00014000bee0(&uStack_128,0x1406557e0);
          puStack_c0 = &uStack_128;
          func_0x0001401445d0(plStack_78,uStack_80,&uStack_70,2,CONCAT44(uVar4,uRam00000001405c89d0)
                              ,&puStack_c8);
        }
      }
      else {
        iVar3 = func_0x00014015be60(0x140655834,&uStack_a8,uVar5,0);
        if (iVar3 == 0) {
          lVar12 = 1;
          goto code_r0x000140068b1d;
        }
      }
      uStack_88 = 0x22;
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
    }
  }
  else {
    iVar3 = func_0x00014015be60(0x140655804,&lStack_158,uVar5,0);
    if (iVar3 == 0) {
      lVar12 = 1;
      goto code_r0x000140067fdc;
    }
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
code_r0x000140068e34:
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
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
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
