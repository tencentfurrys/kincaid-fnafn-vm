/// @description FNAFN Obj_Menu_Options / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Create_0 (5580 B @0x140074950)
// Decoded, in order (uStack_58 = GML line markers):
//   0. customfunct_audio_play_sound_single(Snd_Menu_Confirm, <runtime>, <runtime>) —
//      exe const 0x1405c4490 = 22.0 (menu blip); priority/loop are the
//      same runtime const @0x140655a10 (TODO/calibrate below).
//   2. if (room == 1): Obj_Menu_Main_Back.sprite_index = 92
//      (Spr_Menu_Background_Options, sprite_names.json),
//      Obj_Menu_Main_Back.image_alpha = 0, then
//      with (Obj_Menu_Selector) { instance_destroy(); } — the repeat
//      const 0x4041800000000000 = 35.0 is the OBJECT INDEX 35 =
//      Obj_Menu_Selector (obj_names.json), not a loop count.
//   0xb. if (room == 4): object_set_visible(Obj_Menu_Pause, <runtime>)
//      (slot 0x1405c8ed0; obj const 0x1405c44a0 = 48.0; 2nd arg runtime
//      @0x140655a10 — TODO/calibrate, 1 matches Destroy's call shape).
//   0xf. instance_activate_object best-fit (direct helper
//      func_0x00014017bda0(self, other, 50); only 2 sites in the exe;
//      pairs with Destroy's instance_deactivate_object(
//      Obj_Menu_Options_Icons)) — TODO/calibrate identity in-game.
//   0x11. instance_create_layer(12, 12, "Main_menu",
//      Obj_Menu_Options_Selector) (consts 12.0/12.0/"Main_menu"/9.0).
//   0x12. instance_create_layer(1240, 540, "Main_menu",
//      Obj_Menu_Options_Preview) (consts 1240.0/540.0/"Main_menu"/46.0).
//   0x14-0x18. surface slots = -1 (main/video/audio/pref); the id-0x186d1
//      slot (registry name looks like a script,
//      customfunct_ui_button_detection_x) is assigned -1 as an instance
//      variable here — ported literally.
//   0x19-0x1c. select = 1; select_y = select_y_final = 192;
//      colour_pink = make_color_rgb(255, 0, 110).
//   0x1d-0x21. text_scale[0..4] = 0.95, 0.7, 0.7, 0.7, 0.7.
//   0x23-0x2a. text_options[0..6] = "video", "audio", "preferences",
//      "accessibility", "credits", "exit", "reset data".
//   0x2c. draw_alpha = 0.  0x2e. menu = "video".
//   0x30-0x34. text_video[0..4] = "VHS filter:", "fullscreen:",
//      "vsync:", "edge filtering:", "FXAA:".
//   0x36-0x37. text_audio[0..1] = "quieter ambience:", "master volume:".
//   0x39-0x3a. text_pref[0..1] = "gamemode type:", "futa mode:".
//   0x3c-0x40. text_access[0..4] = "subtitles:", "subt. language:",
//      "subtitle font:", "navigation type:", "nav. threshold:".
// Reading: entering the options screen plays the menu blip, swaps the
// shared backdrop to the options background (when coming from room 1),
// replaces the shared selector with its own selector + preview instances,
// and seeds every options label array.
// TODO(calibrate): audio priority/loop @0x140655a10 (assumed 0/false);
// object_set_visible 2nd arg @0x140655a10 (assumed 1);
// func_0x00014017bda0 identity (best-fit instance_activate_object).
customfunct_audio_play_sound_single(Snd_Menu_Confirm, 0, false); // TODO(calibrate): priority/loop are runtime const @0x140655a10
if (room == 1) {
    Obj_Menu_Main_Back.sprite_index = 92; // Spr_Menu_Background_Options (sprite_names.json)
    Obj_Menu_Main_Back.image_alpha = 0;
    with (Obj_Menu_Selector) {
        instance_destroy();
    }
}
if (room == 4) {
    object_set_visible(Obj_Menu_Pause, 1); // TODO(calibrate): 2nd arg is runtime const @0x140655a10
}
instance_activate_object(Obj_Menu_Options_Icons); // TODO(calibrate): func_0x00014017bda0 identity best-fit
instance_create_layer(12, 12, "Main_menu", Obj_Menu_Options_Selector);
instance_create_layer(1240, 540, "Main_menu", Obj_Menu_Options_Preview);
main_surface = -1;
video_surface = -1;
audio_surface = -1;
pref_surface = -1;
customfunct_ui_button_detection_x = -1;
select = 1;
select_y = 192;
select_y_final = 192;
colour_pink = make_color_rgb(255, 0, 110);
text_scale[0] = 0.95;
text_scale[1] = 0.7;
text_scale[2] = 0.7;
text_scale[3] = 0.7;
text_scale[4] = 0.7;
text_options[0] = "video";
text_options[1] = "audio";
text_options[2] = "preferences";
text_options[3] = "accessibility";
text_options[4] = "credits";
text_options[5] = "exit";
text_options[6] = "reset data";
draw_alpha = 0;
menu = "video";
text_video[0] = "VHS filter:";
text_video[1] = "fullscreen:";
text_video[2] = "vsync:";
text_video[3] = "edge filtering:";
text_video[4] = "FXAA:";
text_audio[0] = "quieter ambience:";
text_audio[1] = "master volume:";
text_pref[0] = "gamemode type:";
text_pref[1] = "futa mode:";
text_access[0] = "subtitles:";
text_access[1] = "subt. language:";
text_access[2] = "subtitle font:";
text_access[3] = "navigation type:";
text_access[4] = "nav. threshold:";

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Options_Create_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 *puVar3;
  double *pdVar4;
  undefined8 *puVar5;
  longlong lVar6;
  undefined8 **ppuVar7;
  undefined4 uVar9;
  undefined8 uVar8;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  undefined4 uStack_13c;
  longlong lStack_138;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined *puStack_60;
  undefined4 uStack_58;
  longlong *plStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_60 = &UNK_14043b3a6;
  uStack_58 = 0;
  uStack_68 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_68;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  plRam0000000140657680 = param_1;
  uStack_80 = param_2;
  plStack_50 = param_1;
  func_0x00014000bee0(&uStack_f8,0x1405c4490);
  puStack_118 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x140655a10);
  puStack_110 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140655a10);
  ppuVar7 = &puStack_118;
  puStack_108 = &uStack_d8;
  gml_Script_customfunct_audio_play_sound_single(plStack_50,uStack_80,&uStack_78,3,&puStack_118);
  uStack_58 = 2;
  func_0x00014015ef90(plStack_50,uRam00000001405c7b38,0x80000000,&uStack_b0);
  uStack_13c = 0;
  uStack_148 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(&uStack_b0,&uStack_148,uRam00000001405cd9c0,0);
  uVar9 = (undefined4)((ulonglong)ppuVar7 >> 0x20);
  if (iVar2 == 0) {
    uStack_58 = 4;
    if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_94 = 0;
    uStack_a0 = 0x4057000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7be8,0x80000000,&uStack_a0);
    uStack_58 = 5;
    if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_84 = 0;
    uStack_90 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_90);
    uStack_58 = 6;
    uStack_11c = 0;
    uStack_128 = 0x4041800000000000;
    iVar2 = func_0x000140144bd0(&uStack_148,&plStack_50,&uStack_80,&uStack_128);
    if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_128);
    }
    uVar9 = (undefined4)((ulonglong)ppuVar7 >> 0x20);
    if (0 < iVar2) {
      do {
        uStack_58 = 8;
        func_0x00014017c070(plStack_50,uStack_80,0,0);
        cVar1 = func_0x0001401451f0(&uStack_148,&plStack_50);
        uVar9 = (undefined4)((ulonglong)ppuVar7 >> 0x20);
      } while (cVar1 != '\0');
    }
    func_0x0001401449f0(&uStack_148,&plStack_50,&uStack_80);
    if (lStack_138 != 0) {
      func_0x00014012ec70();
      lStack_138 = 0;
    }
  }
  uStack_58 = 0xb;
  func_0x00014015ef90(plStack_50,uRam00000001405c7b38,0x80000000,&uStack_b0);
  uStack_13c = 0;
  uStack_148 = 0x4010000000000000;
  iVar2 = func_0x00014015be60(&uStack_b0,&uStack_148,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_58 = 0xd;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    func_0x00014000bee0(&uStack_f8,0x1405c44a0);
    puStack_118 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x140655a10);
    uVar8 = CONCAT44(uVar9,uRam00000001405c8ed0);
    puStack_110 = &uStack_e8;
    func_0x0001401445d0(plStack_50,uStack_80,&uStack_78,2,uVar8,&puStack_118);
    uVar9 = (undefined4)((ulonglong)uVar8 >> 0x20);
  }
  uStack_58 = 0xf;
  func_0x00014017bda0(plStack_50,uStack_80,0x32);
  uStack_58 = 0x11;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  func_0x00014000bee0(&uStack_f8,0x1405c44b0);
  puStack_118 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c44b0);
  puStack_110 = &uStack_e8;
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  func_0x0001401441e0(&uStack_d8,0x1405c4360);
  puStack_108 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c44c0);
  uVar8 = CONCAT44(uVar9,uRam00000001405c8d90);
  puStack_100 = &uStack_c8;
  func_0x0001401445d0(plStack_50,uStack_80,&uStack_78,4,uVar8,&puStack_118);
  uVar9 = (undefined4)((ulonglong)uVar8 >> 0x20);
  uStack_58 = 0x12;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  func_0x00014000bee0(&uStack_f8,0x1405c44d0);
  puStack_118 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c44e0);
  puStack_110 = &uStack_e8;
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  func_0x0001401441e0(&uStack_d8,0x1405c4360);
  puStack_108 = &uStack_d8;
  func_0x00014000bee0(&uStack_c8,0x1405c44f0);
  puStack_100 = &uStack_c8;
  func_0x0001401445d0(plStack_50,uStack_80,&uStack_78,4,CONCAT44(uVar9,uRam00000001405c8d90),
                      &puStack_118);
  uStack_58 = 0x14;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18734);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0xbff0000000000000;
  uStack_58 = 0x15;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1879a);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0xbff0000000000000;
  uStack_58 = 0x16;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e4);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0xbff0000000000000;
  uStack_58 = 0x17;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1875c);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0xbff0000000000000;
  uStack_58 = 0x18;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186d1);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0xbff0000000000000;
  uStack_58 = 0x19;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1876a);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3ff0000000000000;
  uStack_58 = 0x1a;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1876d);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x4068000000000000;
  uStack_58 = 0x1b;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1876e);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x4068000000000000;
  uStack_58 = 0x1c;
  pdVar4 = (double *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186f5);
  iVar2 = func_0x0001401756a0(0xff,0,0x6e);
  if ((0x46U >> (*(uint *)((longlong)pdVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar4);
  }
  *(undefined4 *)((longlong)pdVar4 + 0xc) = 0;
  *pdVar4 = (double)iVar2;
  uStack_58 = 0x1d;
  plRam0000000140657680 = (longlong *)0x287b0;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878f);
  func_0x000140141d00(plStack_50);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3fee666666666666;
  func_0x000140141c50(2);
  uStack_58 = 0x1e;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878f);
  func_0x000140141d00(plStack_50);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3fe6666666666666;
  func_0x000140141c50(2);
  uStack_58 = 0x1f;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878f);
  func_0x000140141d00(plStack_50);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,2);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3fe6666666666666;
  func_0x000140141c50(2);
  uStack_58 = 0x20;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878f);
  func_0x000140141d00(plStack_50);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,3);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3fe6666666666666;
  func_0x000140141c50(2);
  uStack_58 = 0x21;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878f);
  func_0x000140141d00(plStack_50);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,4);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3fe6666666666666;
  func_0x000140141c50(2);
  uStack_58 = 0x23;
  plRam0000000140657680 = (longlong *)0x287b1;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c436a);
  func_0x000140141c50(2);
  uStack_58 = 0x24;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4370);
  func_0x000140141c50(2);
  uStack_58 = 0x25;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,2);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4376);
  func_0x000140141c50(2);
  uStack_58 = 0x26;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,3);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4382);
  func_0x000140141c50(2);
  uStack_58 = 0x27;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,4);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4390);
  func_0x000140141c50(2);
  uStack_58 = 0x29;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,5);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4398);
  func_0x000140141c50(2);
  uStack_58 = 0x2a;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878d);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,6);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c439d);
  func_0x000140141c50(2);
  uStack_58 = 0x2c;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18712);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0;
  uStack_58 = 0x2e;
  lVar6 = (**(code **)(*plStack_50 + 0x10))(plStack_50,0x18737);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c436a);
  uStack_58 = 0x30;
  plRam0000000140657680 = (longlong *)0x287b3;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18790);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c43a8);
  func_0x000140141c50(2);
  uStack_58 = 0x31;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18790);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c43b4);
  func_0x000140141c50(2);
  uStack_58 = 0x32;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18790);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,2);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c43c0);
  func_0x000140141c50(2);
  uStack_58 = 0x33;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18790);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,3);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c43d0);
  func_0x000140141c50(2);
  uStack_58 = 0x34;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18790);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,4);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c43e0);
  func_0x000140141c50(2);
  uStack_58 = 0x36;
  plRam0000000140657680 = (longlong *)0x287b4;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18788);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c43f0);
  func_0x000140141c50(2);
  uStack_58 = 0x37;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18788);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4402);
  func_0x000140141c50(2);
  uStack_58 = 0x39;
  plRam0000000140657680 = (longlong *)0x287b5;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878e);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4411);
  func_0x000140141c50(2);
  uStack_58 = 0x3a;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1878e);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4420);
  func_0x000140141c50(2);
  uStack_58 = 0x3c;
  plRam0000000140657680 = (longlong *)0x287b6;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18786);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c442b);
  func_0x000140141c50(2);
  uStack_58 = 0x3d;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18786);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4440);
  func_0x000140141c50(2);
  uStack_58 = 0x3e;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18786);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,2);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4450);
  func_0x000140141c50(2);
  uStack_58 = 0x3f;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18786);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,3);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4460);
  func_0x000140141c50(2);
  uStack_58 = 0x40;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18786);
  func_0x000140141d00(plStack_50);
  lVar6 = func_0x00014012b840(puVar3,4);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar6);
  }
  func_0x0001401441e0(lVar6,0x1405c4480);
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
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
  puRam0000000140657668 = (undefined8 *)uStack_68;
  return;
}
END DECOMPILED REFERENCE */
