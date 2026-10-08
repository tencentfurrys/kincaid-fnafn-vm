/// @description FNAFN Obj_Menu_Transition / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Transition_Create_0 (3675 B @0x14004a800)
// Globals fetched (+8 on runner context): game_settings (0x18727),
// oldtvfilter_enabled (0x18750), bufferSurface (0x186e9).
// Decoded, in order (uStack_a0 = GML line markers):
//   1-2. `surf` (0x18779) = -1; `Room_to_go_to` (0x18760) = -1.
//   3. if (!surface_exists(surf)) [slot 0x1405c8a50]:
//   5.    surf = surface_create(1280, 720) [slot 0x1405c8a60; exe consts
//         0x1405c3990 = 1280.0, 0x1405c39a0 = 720.0].
//   6.    surface_resize(surf, display_get_width(), display_get_height())
//         [slots 0x1405c8a20 / 0x1405c8d20 / 0x1405c8d30 — 0-arg getters].
//   7.    if (game_settings[0] != "disabled") [exe string 0x1405c3960]:
//   9.       oldtvfilter_enabled = 0;
//  10.       surface_copy(surf, x, y, bufferSurface[0]) [slot 0x1405c8d40;
//            bufferSurface indexed with a bounds check].
//  13.    else (game_settings[0] == "disabled"):
//  15.       surface_copy(surf, x, y, application_surface)
//            [slot 0x1405c7ba8 read via func_0x00014015ef90].
//  18. if (room == 1) [slot 0x1405c7b38, const 1.0]:
//  20-21.   instance_deactivate_layer("Main_menu" / "Back")
//          [slot 0x1405c8d50; exe strings 0x1405c3969 / 0x1405c3973].
//  23. if (room == 0) [const 0.0]:
//  25-26.   instance_deactivate_layer("Main_menu" / "Back").
//  27.    layer_background_visible(layer_background_get_id("Background"),
//            <0x140655510>) [slots 0x1405c8d60 / 0x1405c88c0; exe string
//            0x1405c3978 = "Background"].
//  29. if (room == 7) [const 0x401c000000000000 = 7.0]:
//  31-32.   instance_deactivate_layer("UI" / "AI") [0x1405c3983 / 0x1405c3986].
//  34. image_alpha = 1 [slot 0x1405c7b98, const 1.0].
// Reading: set up the fullscreen transition overlay (1280x720 resized to
// the display), seeded from the old-TV-filter buffer or the plain
// application surface depending on the graphics setting; deactivate the
// menu layers for the room being left; start fully opaque. The Step event
// then fades image_alpha toward -0.5 and fires surface_free + room_goto.
// TODO(calibrate): the runtime const @0x140655510 (0x14065xxxx, outside the
// exe image) supplies surface_copy x/y and the layer_background_visible
// flag — 0 by convention for all three.
surf = -1;
Room_to_go_to = -1;
show_message("TRANS settings0=" + string(game_settings[0]) + " bufex=" + string(variable_global_exists("bufferSurface")));
if (variable_global_exists("bufferSurface")) {
    show_message("TRANS b0=" + string(bufferSurface[0]) + " ex=" + string(surface_exists(bufferSurface[0])));
}
if (!surface_exists(surf)) {
    surf = surface_create(1280, 720);
    surface_resize(surf, display_get_width(), display_get_height());
    if (game_settings[0] != "disabled") {
        oldtvfilter_enabled = 0;
        surface_copy(surf, 0, 0, bufferSurface[0]);
    } else {
        surface_copy(surf, 0, 0, application_surface);
    }
}
if (room == 1) {
    instance_deactivate_layer("Main_menu");
    instance_deactivate_layer("Back");
}
if (room == 0) {
    instance_deactivate_layer("Main_menu");
    instance_deactivate_layer("Back");
    layer_background_visible(layer_background_get_id("Background"), 0);
}
if (room == 7) {
    instance_deactivate_layer("UI");
    instance_deactivate_layer("AI");
}
image_alpha = 1;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Transition_Create_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  undefined8 uVar8;
  longlong *plVar9;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 *puStack_130;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  undefined8 uStack_110;
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
  longlong *plStack_b8;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 *puStack_98;
  undefined8 *puStack_90;
  undefined8 *puStack_88;
  undefined8 *puStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043a87a;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  plRam0000000140657680 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  puStack_130 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18750);
  plStack_b8 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186e9);
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_110 = CONCAT44(0xffffff,(undefined4)uStack_110);
  uStack_118 = 0;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18779);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0xbff0000000000000;
  uStack_a0 = 2;
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18760);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0xbff0000000000000;
  uStack_a0 = 3;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x000140001490(&uStack_f8,puVar5);
  puStack_98 = &uStack_f8;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8a50,&puStack_98);
  cVar1 = func_0x00014012bb70(uVar7);
  if (cVar1 == '\0') {
    uStack_a0 = 5;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18779);
    func_0x00014000bee0(&uStack_e8,0x1405c3990);
    puStack_90 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x1405c39a0);
    puStack_88 = &uStack_d8;
    uVar8 = func_0x0001401445d0(param_1,param_2,&uStack_68,2,uRam00000001405c8a60,&puStack_90);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar7,uVar8);
    func_0x000140141c50(1);
    uStack_a0 = 6;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    uStack_118 = 0;
    uStack_110 = 0x500000000;
    uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18779);
    func_0x000140001490(&uStack_f8,uVar7);
    puStack_98 = &uStack_f8;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_68,0,uRam00000001405c8d20,0);
    func_0x000140001490(&uStack_e8,uVar7);
    puStack_90 = &uStack_e8;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_118,0,uRam00000001405c8d30,0);
    func_0x000140001490(&uStack_d8,uVar7);
    puStack_88 = &uStack_d8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8a20,&puStack_98);
    uStack_a0 = 7;
    func_0x0001401453a0(&uStack_78,0x1405c3960);
    if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar4);
      if (iVar2 < 1) {
        uVar3 = func_0x000140147990(*plVar4);
        func_0x000140144260(&UNK_140439ca6,0,uVar3);
        plVar9 = (longlong *)0x0;
      }
      else {
        plVar9 = (longlong *)func_0x000140147980(*plVar4,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
      plVar9 = plVar4;
    }
    iVar2 = func_0x00014015be60(plVar9,&uStack_78,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    if (iVar2 != 0) {
      uStack_a0 = 9;
      if ((0x46U >> (*(uint *)((longlong)puStack_130 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_130);
      }
      *(undefined4 *)((longlong)puStack_130 + 0xc) = 0;
      *puStack_130 = 0;
      uStack_a0 = 10;
      if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_58);
      }
      uStack_58 = 0;
      uStack_50 = 0x500000000;
      uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18779);
      func_0x000140001490(&uStack_f8,uVar7);
      puStack_98 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655510);
      puStack_90 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x140655510);
      if (((*(uint *)((longlong)plStack_b8 + 0xc) & 0xffffff) == 2) && (*plStack_b8 != 0)) {
        puStack_88 = &uStack_d8;
        func_0x0001401479b0();
        iVar2 = func_0x000140147990(*plStack_b8);
        if (iVar2 < 1) {
          uVar3 = func_0x000140147990();
          plStack_b8 = (longlong *)0x0;
          func_0x000140144260(&UNK_140439ca6,0,uVar3);
        }
        else {
          plStack_b8 = (longlong *)func_0x000140147980(*plStack_b8,0);
        }
      }
      else {
        puStack_88 = &uStack_d8;
        func_0x000140144260(&UNK_140439cd8);
      }
      func_0x000140001490(&uStack_c8,plStack_b8);
      puStack_80 = &uStack_c8;
      func_0x0001401445d0(param_1,param_2,&uStack_58,4,uRam00000001405c8d40,&puStack_98);
    }
    uStack_a0 = 0xd;
    func_0x0001401453a0(&uStack_78,0x1405c3960);
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
    iVar2 = func_0x00014015be60(plVar4,&uStack_78,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    if (iVar2 == 0) {
      uStack_a0 = 0xf;
      if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_58);
      }
      uStack_58 = 0;
      uStack_50 = 0x500000000;
      uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18779);
      func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_140);
      func_0x000140001490(&uStack_f8,uVar7);
      puStack_98 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x140655510);
      puStack_90 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x140655510);
      puStack_88 = &uStack_d8;
      func_0x000140001490(&uStack_c8,&uStack_140);
      puStack_80 = &uStack_c8;
      func_0x0001401445d0(param_1,param_2,&uStack_58,4,uRam00000001405c8d40,&puStack_98);
    }
  }
  uStack_a0 = 0x12;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_108);
  uStack_6c = 0;
  uStack_78 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(&uStack_108,&uStack_78,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_a0 = 0x14;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3969);
    puStack_98 = &uStack_f8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8d50,&puStack_98);
    uStack_a0 = 0x15;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3973);
    puStack_98 = &uStack_f8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8d50,&puStack_98);
  }
  uStack_a0 = 0x17;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_108);
  uStack_6c = 0;
  uStack_78 = 0;
  iVar2 = func_0x00014015be60(&uStack_108,&uStack_78,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_a0 = 0x19;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3969);
    puStack_98 = &uStack_f8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8d50,&puStack_98);
    uStack_a0 = 0x1a;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3973);
    puStack_98 = &uStack_f8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8d50,&puStack_98);
    uStack_a0 = 0x1b;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3978);
    puStack_98 = &uStack_f8;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_68,1,uRam00000001405c8d60,&puStack_98);
    func_0x000140001490(&uStack_e8,uVar7);
    puStack_90 = &uStack_e8;
    func_0x00014000bee0(&uStack_d8,0x140655510);
    puStack_88 = &uStack_d8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,2,uRam00000001405c88c0,&puStack_90);
  }
  uStack_a0 = 0x1d;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_108);
  uStack_6c = 0;
  uStack_78 = 0x401c000000000000;
  iVar2 = func_0x00014015be60(&uStack_108,&uStack_78,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_a0 = 0x1f;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3983);
    puStack_98 = &uStack_f8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8d50,&puStack_98);
    uStack_a0 = 0x20;
    if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_58 = 0;
    uStack_50 = 0x500000000;
    if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_f8);
    }
    func_0x0001401441e0(&uStack_f8,0x1405c3986);
    puStack_98 = &uStack_f8;
    func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8d50,&puStack_98);
  }
  uStack_a0 = 0x22;
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  uStack_11c = 0;
  uStack_128 = 0x3ff0000000000000;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_128);
  if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
