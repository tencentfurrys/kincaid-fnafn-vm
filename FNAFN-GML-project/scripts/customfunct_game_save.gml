/// @description FNAFN script customfunct_game_save - PORTED from C
// PORTED from C
// Ground truth: gml_Script_customfunct_game_save
// Decoded, in source-line order (uStack_b0 3..0x18): the exact mirror of
// customfunct_game_load. ini_open("FNAFNsave.ini") [func_0x00014018a800],
// then ini_write_string(section, key, value) for game[0..1] and
// game_settings[0..13] -- via func_0x00014018a9a0 for the "game info" pair
// plus "Volume"/"Office threshold", and via slot 0x1405c8b20 =
// ini_write_string (func_0x0001401445d0 path) for the rest; same builtin,
// two call shapes. Array reads use the func_0x000140147980(array, index)
// accessor (with bounds-check fallback) wrapped in the number-or-
// string-convert idiom (func_0x00014012d320), which has no GML equivalent
// (ini_write_string converts numbers itself). Same string consts as the
// load port (@0x1405c33d0..@0x1405c34a0 via exe_strings.py). Closes with
// ini_close() [slot 0x1405c8b30, 0 args]. Dropped: 144b20 prologue,
// uStack_b0 line numbers (kept for ordering only).
function customfunct_game_save() {
    ini_open("FNAFNsave.ini");
    ini_write_string("game info", "night", game[0]);
    ini_write_string("game info", "stars", game[1]);
    ini_write_string("game settings", "VHS", game_settings[0]);
    ini_write_string("game settings", "Fullscreen", game_settings[1]);
    ini_write_string("game settings", "Vsync", game_settings[2]);
    ini_write_string("game settings", "Edge filtering", game_settings[3]);
    ini_write_string("game settings", "FXAA", game_settings[4]);
    ini_write_string("game settings", "Subtitles", game_settings[5]);
    ini_write_string("game settings", "Subtitle language", game_settings[6]);
    ini_write_string("game settings", "Subtitle font", game_settings[7]);
    ini_write_string("game settings", "Volume", game_settings[9]);
    ini_write_string("game settings", "Ambience", game_settings[8]);
    ini_write_string("game settings", "Futa mode", game_settings[11]);
    ini_write_string("game settings", "Office navigation", game_settings[12]);
    ini_write_string("game settings", "Office threshold", game_settings[13]);
    ini_close();
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Type propagation algorithm not settling

undefined8 *
gml_Script_customfunct_game_save(undefined8 param_1,undefined8 param_2,undefined8 *param_3)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  longlong *plVar5;
  longlong *plVar6;
  longlong lVar7;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined8 *puStack_a8;
  undefined8 *puStack_a0;
  undefined8 *puStack_98;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043a220;
  uStack_b0 = 0;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uRam0000000140657680 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  plVar5 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_50 = (ulonglong)(uint)uStack_50;
  uStack_58 = 0;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  func_0x000140144b20(uRam00000001405c97f0);
  uStack_b0 = 3;
  func_0x00014018a800(0x1405c33d0);
  uStack_b0 = 4;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (0 < iVar2) {
      plVar6 = (longlong *)func_0x000140147980(*plVar4,0);
      uVar1 = *(uint *)((longlong)plVar6 + 0xc);
      goto joined_r0x000140033291;
    }
    uVar3 = func_0x000140147990(*plVar4);
    func_0x000140144260(&UNK_140439ca6,0,uVar3);
    plVar6 = (longlong *)0x0;
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar6 = plVar4;
  }
  uVar1 = *(uint *)((longlong)plVar6 + 0xc);
joined_r0x000140033291:
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar6;
  }
  else {
    lVar7 = func_0x00014012d320(plVar6);
  }
  func_0x00014018a9a0(0x1405c33de,0x1405c33e8,lVar7);
  uStack_b0 = 5;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar4 = (longlong *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,1);
      uVar1 = *(uint *)((longlong)plVar4 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)plVar4 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar4;
  }
  else {
    lVar7 = func_0x00014012d320(plVar4);
  }
  func_0x00014018a9a0(0x1405c33de,0x1405c33ee,lVar7);
  uStack_b0 = 7;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3402);
  puStack_a0 = &uStack_78;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 1) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 8;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar4 = (longlong *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,1);
      uVar1 = *(uint *)((longlong)plVar4 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
    uVar1 = *(uint *)((longlong)plVar5 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar4;
  }
  else {
    lVar7 = func_0x00014012d320();
  }
  func_0x00014018a9a0(0x1405c33f4,0x1405c3406,lVar7);
  uStack_b0 = 9;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 3) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,2,uVar3);
      plVar4 = (longlong *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,2);
      uVar1 = *(uint *)((longlong)plVar4 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
    uVar1 = *(uint *)((longlong)plVar5 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar4;
  }
  else {
    lVar7 = func_0x00014012d320();
  }
  func_0x00014018a9a0(0x1405c33f4,0x1405c3411,lVar7);
  uStack_b0 = 10;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 4) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,3,uVar3);
      plVar4 = (longlong *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,3);
      uVar1 = *(uint *)((longlong)plVar4 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
    uVar1 = *(uint *)((longlong)plVar5 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar4;
  }
  else {
    lVar7 = func_0x00014012d320();
  }
  func_0x00014018a9a0(0x1405c33f4,0x1405c3417,lVar7);
  uStack_b0 = 0xb;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3426);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 5) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,4,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,4);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0xd;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c342b);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 6) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,5,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,5);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0xe;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3440);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 7) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,6,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,6);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0xf;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3452);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 8) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,7,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,7);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0x11;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 10) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,9,uVar3);
      plVar4 = (longlong *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,9);
      uVar1 = *(uint *)((longlong)plVar4 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
    uVar1 = *(uint *)((longlong)plVar5 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar4;
  }
  else {
    lVar7 = func_0x00014012d320();
  }
  func_0x00014018a9a0(0x1405c33f4,0x1405c3460,lVar7);
  uStack_b0 = 0x12;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3467);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 9) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,8,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,8);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0x14;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3470);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 0xc) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,0xb,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,0xb);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0x15;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  func_0x0001401441e0(&uStack_88,0x1405c33f4);
  puStack_a8 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c3480);
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    puStack_a0 = &uStack_78;
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 0xd) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,0xc,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar5,0xc);
    }
  }
  else {
    puStack_a0 = &uStack_78;
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar5;
  }
  func_0x000140001490(&uStack_68,plVar4);
  puStack_98 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8b20,&puStack_a8);
  uStack_b0 = 0x16;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar5);
    if (iVar2 < 0xe) {
      uVar3 = func_0x000140147990(*plVar5);
      func_0x000140144260(&UNK_140439ca6,0xd,uVar3);
      plVar5 = (longlong *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      plVar5 = (longlong *)func_0x000140147980(*plVar5,0xd);
      uVar1 = *(uint *)((longlong)plVar5 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)plVar5 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    lVar7 = *plVar5;
  }
  else {
    lVar7 = func_0x00014012d320(plVar5);
  }
  func_0x00014018a9a0(0x1405c33f4,0x1405c34a0,lVar7);
  uStack_b0 = 0x18;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x0001401445d0(param_1,param_2,&uStack_58,0,uRam00000001405c8b30,0);
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return param_3;
}
END DECOMPILED REFERENCE */
