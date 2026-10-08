/// @description FNAFN script customfunct_game_load - PORTED from C
// PORTED from C
// Ground truth: gml_Script_customfunct_game_load
// Decoded, in source-line order (uStack_c0 0x1d..0x35):
//   ini_open("FNAFNsave.ini") [func_0x00014018a800, string const @0x1405c33d0
//     via exe_strings.py]; then game[0..1] / game_settings[0..13] =
//     ini_read_string(section, key, default) [func_0x00014018a940, and the
//     slot 0x1405c8b40 = ini_read_string path via func_0x0001401445d0 --
//     same builtin, two call shapes]. Array stores go through the
//     func_0x00014012b840(array, index) element-accessor pair.
//   String consts resolved with exe_strings.py: "game info", "night",
//     "stars", "game settings", "VHS", "Fullscreen", "Vsync",
//     "Edge filtering", "FXAA", "Volume", "Ambience", "Futa mode",
//     "Subtitles", "Subtitle language", "English", "Subtitle font",
//     "default", "Office navigation", "both", "Office threshold",
//     defaults "full", "on", "enabled", "off".
//   Numeric defaults are .rdata doubles: 1.0 (@0x140439dd0, "night"),
//     2.0 (@0x140439e68, "Edge filtering"), 100.0 (@0x14043a0c0, "Volume"),
//     25.0 (@0x14043a210, "Office threshold").
//   Tail applies the settings: display_reset(Edge filtering, Vsync)
//     [slot 0x1405c8b50], window_set_fullscreen(Fullscreen) [slot
//     0x1405c8b60], surface_resize(application_surface [slot 0x1405c7ba8
//     read via func_0x00014015ef90], display_get_gui_width() [slot
//     0x1405c8b70], display_get_gui_height() [slot 0x1405c8b80]) [slot
//     0x1405c8a20 = surface_resize]. Dropped runner bookkeeping with no GML:
//     func_0x000140144b20 prologue, uStack_c0 line numbers, and the BSS
//     stores to uRam0000000140657680 (0x2b86a1/0x2b86a2 -- same unexplained
//     magic-marker shape seen in 100+ functions, no data flow).
function customfunct_game_load() {
    ini_open("FNAFNsave.ini");
    game[0] = ini_read_string("game info", "night", 1);
    game[1] = ini_read_string("game info", "stars", 0);
    game_settings[0] = ini_read_string("game settings", "VHS", "full");
    game_settings[1] = ini_read_string("game settings", "Fullscreen", 0);
    game_settings[2] = ini_read_string("game settings", "Vsync", 0);
    game_settings[3] = ini_read_string("game settings", "Edge filtering", 2);
    game_settings[4] = ini_read_string("game settings", "FXAA", "on");
    game_settings[9] = ini_read_string("game settings", "Volume", 100);
    game_settings[8] = ini_read_string("game settings", "Ambience", "enabled");
    game_settings[11] = ini_read_string("game settings", "Futa mode", "off");
    game_settings[5] = ini_read_string("game settings", "Subtitles", "on");
    game_settings[6] = ini_read_string("game settings", "Subtitle language", "English");
    game_settings[7] = ini_read_string("game settings", "Subtitle font", "default");
    game_settings[12] = ini_read_string("game settings", "Office navigation", "both");
    game_settings[13] = ini_read_string("game settings", "Office threshold", 25);
    ini_close();
    // VM-STRICTNESS ADAPTATION (not in C): the 2026 runner type-checks
    // builtins (YYGB) -- display_reset wants (real, bool) but ini values
    // arrive as strings ("0"/"2") or numeric defaults. The YYC build
    // coerced silently; convert explicitly (bool("0") would be TRUE, so
    // compare via real()).
    display_reset(real(game_settings[3]), real(game_settings[2]) != 0);
    window_set_fullscreen(real(game_settings[1]) != 0);
    surface_resize(application_surface, display_get_gui_width(), display_get_gui_height());
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

undefined8 *
gml_Script_customfunct_game_load(undefined8 param_1,undefined8 param_2,undefined8 *param_3)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 *puVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  longlong *plVar8;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 *puStack_88;
  undefined8 *puStack_80;
  undefined8 *puStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_c8 = &UNK_14043a241;
  uStack_c0 = 0;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uRam0000000140657680 = param_1;
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_68 = (ulonglong)(uint)uStack_68;
  uStack_70 = 0;
  uStack_e8 = (ulonglong)(uint)uStack_e8;
  uStack_f0 = 0;
  uStack_d8 = (ulonglong)(uint)uStack_d8;
  uStack_e0 = 0;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  func_0x000140144b20(uRam00000001405c9800);
  uStack_c0 = 0x1d;
  func_0x00014018a800(0x1405c33d0);
  uStack_c0 = 0x1e;
  uRam0000000140657680 = 0x2b86a1;
  uVar6 = func_0x00014018a940(0x1405c33de,0x1405c33e8,_UNK_140439dd0);
  func_0x000140141d00(plRam000000014065e080);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x1f;
  uVar6 = func_0x00014018a940(0x1405c33de,0x1405c33ee,0);
  func_0x000140141d00(plRam000000014065e080);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x21;
  uRam0000000140657680 = 0x2b86a2;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3402);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34b1);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,0);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x22;
  uVar6 = func_0x00014018a940(0x1405c33f4,0x1405c3406,0);
  func_0x000140141d00(plRam000000014065e080);
  puVar3 = (undefined8 *)func_0x00014012b840(plVar4,1);
  func_0x000140141d00(*plVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x23;
  uVar6 = func_0x00014018a940(0x1405c33f4,0x1405c3411,0);
  func_0x000140141d00(plRam000000014065e080);
  puVar3 = (undefined8 *)func_0x00014012b840(plVar4,2);
  func_0x000140141d00(*plVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x24;
  uVar6 = func_0x00014018a940(0x1405c33f4,0x1405c3417,_UNK_140439e68);
  func_0x000140141d00(plRam000000014065e080);
  puVar3 = (undefined8 *)func_0x00014012b840(plVar4,3);
  func_0x000140141d00(*plVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x25;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3426);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34b6);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,4);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x27;
  uVar6 = func_0x00014018a940(0x1405c33f4,0x1405c3460,_UNK_14043a0c0);
  func_0x000140141d00(plRam000000014065e080);
  puVar3 = (undefined8 *)func_0x00014012b840(plVar4,9);
  func_0x000140141d00(*plVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x28;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3467);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34b9);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,8);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x2a;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3470);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34c1);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,0xb);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x2c;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c342b);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34b6);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,5);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x2d;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3440);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34c5);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,6);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x2e;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3452);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34cd);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,7);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x2f;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  func_0x0001401441e0(&uStack_b8,0x1405c33f4);
  puStack_88 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c3480);
  puStack_80 = &uStack_a8;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  func_0x0001401441e0(&uStack_98,0x1405c34d5);
  puStack_78 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8b40,&puStack_88);
  func_0x000140141d00(plRam000000014065e080);
  uVar7 = func_0x00014012b840(plVar4,0xc);
  func_0x000140141d00(*plVar4);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(2);
  uStack_c0 = 0x30;
  uVar6 = func_0x00014018a940(0x1405c33f4,0x1405c34a0,_UNK_14043a210);
  func_0x000140141d00(plRam000000014065e080);
  puVar3 = (undefined8 *)func_0x00014012b840(plVar4,0xd);
  func_0x000140141d00(*plVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = uVar6;
  func_0x000140141c50(2);
  uStack_c0 = 0x32;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x0001401445d0(param_1,param_2,&uStack_70,0,uRam00000001405c8b30,0);
  uStack_c0 = 0x33;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 4) {
      uVar2 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,3,uVar2);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar4,3);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar4;
  }
  func_0x000140001490(&uStack_b8,plVar8);
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    puStack_88 = &uStack_b8;
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 3) {
      uVar2 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,2,uVar2);
      plVar8 = (longlong *)0x0;
    }
    else {
      plVar8 = (longlong *)func_0x000140147980(*plVar4,2);
    }
  }
  else {
    puStack_88 = &uStack_b8;
    func_0x000140144260(&UNK_140439cd8);
    plVar8 = plVar4;
  }
  func_0x000140001490(&uStack_a8,plVar8);
  puStack_80 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_70,2,uRam00000001405c8b50,&puStack_88);
  uStack_c0 = 0x34;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 2) {
      uVar2 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,1,uVar2);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_b8,plVar4);
  puStack_88 = &uStack_b8;
  func_0x0001401445d0(param_1,param_2,&uStack_70,1,uRam00000001405c8b60,&puStack_88);
  uStack_c0 = 0x35;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  if ((0x46U >> (uStack_e8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  uStack_f0 = 0;
  uStack_e8 = 0x500000000;
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  uStack_e0 = 0;
  uStack_d8 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_100);
  func_0x000140001490(&uStack_b8,&uStack_100);
  puStack_88 = &uStack_b8;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_f0,0,uRam00000001405c8b70,0);
  func_0x000140001490(&uStack_a8,uVar6);
  puStack_80 = &uStack_a8;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_e0,0,uRam00000001405c8b80,0);
  func_0x000140001490(&uStack_98,uVar6);
  puStack_78 = &uStack_98;
  func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8a20,&puStack_88);
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_e8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return param_3;
}
END DECOMPILED REFERENCE */
