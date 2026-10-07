/// @description FNAFN Obj_Menu_Pause / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Pause_Create_0 (3136 B @0x1400d5450)
// Decoded, in order:
//   1. global fetch `game_settings` (id 0x18727, +8 on runner context global
//      plRam000000014065e080) — later indexed as an array: [i] == "current
//      settings value selected in pause menu".
//   2. `pause_surface` (0x18752) = -1 (0xbff0000000000000), type cleared.
//   3. `back_surface` (0x186e5) = -1.
//   4. write image_alpha (slot uRam00000001405c7b98 — REGISTRY-CONFIRMED
//      image_alpha, NOT a custom `fading` var) = 0 via the
//      builtin-property-write helper func_0x000140160140.
//   5. two array-element writes to `pause_text` (0x18753) via the
//      element-write helper func_0x00014012b840(elem, index) +
//      func_0x0001401441e0(elem, const):
//        pause_text[0] = string @0x1405c5590
//        pause_text[1] = string @0x1405c5597
//   6. surface_exists(pause_surface) branch (1-arg funcid slot
//      uRam00000001405c8a50 — high co-fetch with game_font/draw_alpha =>
//      a surface predicate; best fit surface_exists): if NOT existing,
//      slot uRam00000001405c8a60 (2-arg draw-setup shape; best fit
//      draw_surface / draw_text pair with constants @0x1405c55b0 and
//      @0x1405c55c0), result assigned back into pause_surface via the
//      assign/copy helper func_0x000140001490.
//   7. same pattern for back_surface with constant @0x1405c55d0.
//   8. if back_surface was created: 4-arg call, slot uRam00000001405c8d40,
//      args = (back_surface, const @0x140656d20, const @0x140656d20,
//      image_alpha slot) — draw-position setup on the new surface.
//      (slot 0x1405c7b98 = image_alpha per EXE-REGISTRY.md)
//   9. two 4-arg calls, slot uRam00000001405c8d90 (high co-fetch with
//      draw_alpha/select/Room_to_go_to => draw-dimension getter/best-fit
//      draw_text_transformed family), args =
//      (const @0x140656d20, const @0x140656d20, string @0x1405c559c,
//       const @0x1405c55e0) then with const @0x1405c55f0.
//  10. global write `alpha_current` (id 0x186db) = 0.4
//      (0x3fd999999999999a) via global-write helper func_0x000140160b90.
//  11. for-loop over 0..48 (repeat count 0x4040000000000000 = 48.0; loop
//      init/next helpers func_0x000140144bd0 / 0x0001401451f0 /
//      0x0001401449f0), index formatted with a string constant
//      @0x1405c55a6 (printf-style build helper func_0x0001401453a0):
//        if (game_settings[0] == 2) { // type==2 (array) && nonzero
//            <index the array, elem 0>
//            if (<3-way compare of array elem vs the loop counter == 0>) {
//                animate_speed (0x186dd) = 0;
//                image_alpha (slot 0x1405c7b98) = 0;
//            } else {
//                animate_speed (0x186dd) = 0.35 (0x3fd6666666666666);
//                fade_ref = alpha_current (0x186db, +8 self fetch);
//                image_alpha (slot 0x1405c7b98) = <same value>;
//            }
//        }
//      Loop runs all iterations, no break: last matching index wins.
// Constants 0x1405c55xx / 0x140656d20 / 0x140656d40 are exe-data strings /
// shared numeric RValues — not resolvable offline (see SLOT-MAP.md).
image_alpha = 0; // slot 0x1405c7b98 = image_alpha (EXE-REGISTRY.md name-pointer rule)
pause_surface = -1;
back_surface = -1;
pause_text[0] = "return"; // exe const @0x1405c5590
pause_text[1] = "exit";   // exe const @0x1405c5597

// REGISTRY-CONFIRMED (EXE-REGISTRY.md): slot 0x1405c8a50 = surface_exists,
// slot 0x1405c8a60 = surface_create; the C 2-arg constants are doubles
// 640x720 (pause_surface) / 1280x720 (back_surface) from EXE-CONSTANTS.md.
if (!surface_exists(pause_surface)) {
    pause_surface = surface_create(640, 720);
}
if (!surface_exists(back_surface)) {
    back_surface = surface_create(1280, 720);
    // REGISTRY-CONFIRMED: slot 0x1405c8d40 = surface_copy.
    // C args (back_surface, application_surface x2, position state).
    surface_copy(back_surface, 0, 0, application_surface);
}

// REGISTRY-CONFIRMED: slot 0x1405c8d90 = instance_create_layer; C args
// (0, 0, layer-name string @0x1405c559c = "Night_end", 41.0) then 32.0 --
// the pause-menu instance spawns on layer "Night_end" at depth 41/32.
instance_create_layer(0, 0, "Night_end", 41);
instance_create_layer(0, 0, "Night_end", 32);

alpha_current = 0.4;
for (var i = 0; i < 48; i++) {
    // if (game_settings[0] == <array element matching i>) ...
    // TODO(calibrate): exact array comparison — the C 3-way compares
    // game_settings[0] against the loop counter constant string-built
    // with @0x1405c55a6 (an index/name formatter).
    if (game_settings[0] == 2) {
        animate_speed = 0;
        image_alpha = 0; // slot 0x1405c7b98 = image_alpha (registry)
    } else {
        animate_speed = 0.35;
        image_alpha = alpha_current; // slot 0x1405c7b98 (registry)
    }
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Pause_Create_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 *puVar7;
  longlong lVar8;
  undefined8 uVar9;
  undefined8 uVar10;
  longlong *plVar11;
  undefined auStack_188 [16];
  longlong lStack_178;
  undefined8 uStack_168;
  undefined8 uStack_160;
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
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  longlong *plStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043c9e1 / * "gml_Object_Obj_Menu_Pause_Create_0" * /;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  plRam0000000140657680 = param_1;
  uStack_68 = param_2;
  plStack_50 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727 / * "game_settings" * /);
  uStack_58 = CONCAT44(0xffffff,(undefined4)uStack_58);
  uStack_60 = 0;
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18752 / * "pause_surface" * /);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0xbff0000000000000;
  uStack_80 = 2;
  puVar6 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e5 / * "back_surface" * /);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0xbff0000000000000;
  uStack_80 = 3;
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  uStack_94 = 0;
  uStack_a0 = 0;
  func_0x000140160140(plStack_50,uRam00000001405c7b98,0x80000000,&uStack_a0);
  uStack_80 = 5;
  plRam0000000140657680 = (longlong *)0x287dc;
  puVar7 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18753 / * "pause_text" * /);
  func_0x000140141d00(plStack_50);
  lVar8 = func_0x00014012b840(puVar7,0);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar8);
  }
  func_0x0001401441e0(lVar8,0x1405c5590);
  func_0x000140141c50(2);
  uStack_80 = 6;
  puVar7 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18753 / * "pause_text" * /);
  func_0x000140141d00(plStack_50);
  lVar8 = func_0x00014012b840(puVar7,1);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar8);
  }
  func_0x0001401441e0(lVar8,0x1405c5597);
  func_0x000140141c50(2);
  uStack_80 = 8;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  func_0x000140001490(&uStack_118,puVar5);
  puStack_d8 = &uStack_118;
  uVar9 = func_0x0001401445d0(plStack_50,uStack_68,&uStack_60,1,uRam00000001405c8a50,&puStack_d8);
  cVar1 = func_0x00014012bb70(uVar9);
  if (cVar1 == '\0') {
    uStack_80 = 10;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    uVar9 = (**(code **)(*plStack_50 + 0x10))(plStack_50,0x18752 / * "pause_surface" * /);
    func_0x00014000bee0(&uStack_108,0x1405c55b0);
    puStack_d0 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c55c0);
    puStack_c8 = &uStack_f8;
    uVar10 = func_0x0001401445d0(plStack_50,uStack_68,&uStack_78,2,uRam00000001405c8a60,&puStack_d0);
    func_0x000140141d00(plStack_50);
    func_0x000140001490(uVar9,uVar10);
    func_0x000140141c50(1);
  }
  uStack_80 = 0xc;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  func_0x000140001490(&uStack_118,puVar6);
  puStack_d8 = &uStack_118;
  uVar9 = func_0x0001401445d0(plStack_50,uStack_68,&uStack_60,1,uRam00000001405c8a50,&puStack_d8);
  cVar1 = func_0x00014012bb70(uVar9);
  if (cVar1 == '\0') {
    uStack_80 = 0xe;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    uVar9 = (**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e5 / * "back_surface" * /);
    func_0x00014000bee0(&uStack_108,0x1405c55d0);
    puStack_d0 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c55c0);
    puStack_c8 = &uStack_f8;
    uVar10 = func_0x0001401445d0(plStack_50,uStack_68,&uStack_78,2,uRam00000001405c8a60,&puStack_d0);
    func_0x000140141d00(plStack_50);
    func_0x000140001490(uVar9,uVar10);
    func_0x000140141c50(1);
    uStack_80 = 0xf;
    if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    uStack_60 = 0;
    uStack_58 = 0x500000000;
    uVar9 = (**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e5 / * "back_surface" * /);
    func_0x00014015ef90(plStack_50,uRam00000001405c7ba8,0x80000000,&uStack_128);
    func_0x000140001490(&uStack_118,uVar9);
    puStack_d8 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x140656d20);
    puStack_d0 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x140656d20);
    puStack_c8 = &uStack_f8;
    func_0x000140001490(&uStack_e8,&uStack_128);
    puStack_c0 = &uStack_e8;
    func_0x0001401445d0(plStack_50,uStack_68,&uStack_60,4,uRam00000001405c8d40,&puStack_d8);
  }
  uStack_80 = 0x12;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x140656d20);
  puStack_d8 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x140656d20);
  puStack_d0 = &uStack_108;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c559c);
  puStack_c8 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c55e0);
  puStack_c0 = &uStack_e8;
  func_0x0001401445d0(plStack_50,uStack_68,&uStack_60,4,uRam00000001405c8d90,&puStack_d8);
  uStack_80 = 0x13;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x140656d20);
  puStack_d8 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x140656d20);
  puStack_d0 = &uStack_108;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c559c);
  puStack_c8 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c55f0);
  puStack_c0 = &uStack_e8;
  func_0x0001401445d0(plStack_50,uStack_68,&uStack_60,4,uRam00000001405c8d90,&puStack_d8);
  uStack_80 = 0x14;
  uStack_160 = 0;
  uStack_168 = 0x3fd999999999999a;
  func_0x000140160b90(0x20,0x186db / * "alpha_current" * /,0x80000000,&uStack_168);
  uStack_80 = 0x15;
  uStack_a4 = 0;
  uStack_b0 = 0x4040000000000000;
  iVar2 = func_0x000140144bd0(auStack_188,&plStack_50,&uStack_68,&uStack_b0);
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if (0 < iVar2) {
    do {
      uStack_80 = 0x17;
      func_0x0001401453a0(&uStack_b0,0x1405c55a6);
      if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
        func_0x0001401479b0();
        iVar2 = func_0x000140147990(*plVar4);
        if (iVar2 < 1) {
          uVar3 = func_0x000140147990(*plVar4);
          func_0x000140144260(&UNK_140439ca6 / * "index out of bounds request %d maximum size is %d" * /,0,uVar3);
          plVar11 = (longlong *)0x0;
        }
        else {
          plVar11 = (longlong *)func_0x000140147980(*plVar4,0);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8 / * "trying to index variable that is not an array" * /);
        plVar11 = plVar4;
      }
      iVar2 = func_0x00014015be60(plVar11,&uStack_b0,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b0);
      }
      if (iVar2 == 0) {
        uStack_80 = 0x1e;
        puVar5 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186dd / * "animate_speed" * /);
        if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar5);
        }
        *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
        *puVar5 = 0;
        uStack_80 = 0x1f;
        if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_a0);
        }
        uStack_94 = 0;
        uStack_a0 = 0;
        func_0x000140160140(plStack_50,uRam00000001405c7b98,0x80000000);
      }
      else {
        uStack_80 = 0x19;
        puVar5 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186dd / * "animate_speed" * /);
        if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar5);
        }
        *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
        *puVar5 = 0x3fd6666666666666;
        uStack_80 = 0x1a;
        uVar9 = (**(code **)(*plStack_50 + 8))(plStack_50,0x186db / * "alpha_current" * /);
        func_0x000140001490(&uStack_a0,uVar9);
        func_0x000140160140(plStack_50,uRam00000001405c7b98,0x80000000);
      }
      cVar1 = func_0x0001401451f0(auStack_188,&plStack_50,&uStack_68);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_188,&plStack_50,&uStack_68);
  if (lStack_178 != 0) {
    func_0x00014012ec70();
    lStack_178 = 0;
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
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
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
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
