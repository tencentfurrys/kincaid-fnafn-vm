/// @description FNAFN Obj_Menu_Radio_Cassette / Mouse_54 - PORTED from C
// ---- sub-event Mouse_54 (split from Mouse.gml) ----
// ground truth: gml_Object_Obj_Menu_Radio_Cassette_Mouse_54 (1625 B @0x1400e95f0)
// Right-click "back to main menu": stops every custom_music stream, then the
// same two creates + self destroy as the Mouse_53 exit row. Loop bound is
// array_length(custom_music) (slot 0x1405c8ba0; the C bound is len +/- 1 via
// the typed-increment switch — canonical for-loop assumed). Stream stop is
// slot 0x1405c8960 -> audio_stop_sound (slot X-8 rule). Creates: (-32, 352,
// "Main_menu", 35 = Obj_Menu_Selector) + (32, 160, "Main_menu", 63 =
// Obj_Menu_Main_Title) — exe consts @0x1405c5c30..@0x1405c5c80.
// TODO(calibrate): accessor column + exact loop bound; verify in-game.
var _n = array_length(custom_music);
for (var i = 0; i < _n; i++) {
    audio_stop_sound(custom_music[i, 0]); // TODO(calibrate): accessor column; C bound is len +/- 1
}
instance_create_layer(-32, 352, "Main_menu", Obj_Menu_Selector);
instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
instance_destroy();

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void gml_Object_Obj_Menu_Radio_Cassette_Mouse_54(undefined8 param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  longlong *plVar6;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 uStack_100;
  undefined *puStack_f8;
  undefined4 uStack_f0;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_f8 = &UNK_14043ce37;
  uStack_f0 = 0;
  uStack_100 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_100;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uRam0000000140657680 = param_1;
  uStack_90 = param_2;
  uStack_88 = param_1;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fc);
  uStack_74 = 0xffffff;
  uStack_80 = 0.0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_f0 = 1;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_e8,uVar4);
  puStack_128 = &uStack_e8;
  uVar5 = func_0x0001401445d0(uStack_88,uStack_90,&uStack_70,1,uRam00000001405c8ba0,&puStack_128);
  func_0x00014002fc60(&uStack_a0,uVar5,1);
  func_0x000140001490(&uStack_80,&uStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  dVar1 = _UNK_14043a218;
  while( true ) {
    uStack_94 = 0;
    uStack_a0 = 0;
    iVar2 = func_0x00014015be60(&uStack_80,&uStack_a0,uRam00000001405cd9c0,1);
    if (iVar2 < 0) break;
    uStack_f0 = 3;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    uVar3 = func_0x00014012cd90(&uStack_80);
    plVar6 = (longlong *)func_0x00014002fbe0(uVar4,uVar3);
    if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
      func_0x0001401479b0();
      iVar2 = func_0x000140147990(*plVar6);
      if (iVar2 < 1) {
        uVar3 = func_0x000140147990(*plVar6);
        func_0x000140144260(&UNK_140439ca6,0,uVar3);
        plVar6 = (longlong *)0x0;
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_e8,plVar6);
    puStack_128 = &uStack_e8;
    func_0x0001401445d0(uStack_88,uStack_90,&uStack_70,1,uRam00000001405c8960,&puStack_128);
    switch(uStack_74 & 0xffffff) {
    case 0:
    case 0xd:
      uStack_80 = uStack_80 + dVar1;
      break;
    case 1:
      uStack_80 = (double)func_0x00014012d320(&uStack_80);
      uStack_80 = uStack_80 + dVar1;
      uStack_74 = 0;
      break;
    default:
      func_0x000140005560(&UNK_14043a32c,&uStack_80,&uStack_80);
      break;
    case 7:
      uStack_80 = (double)CONCAT44(uStack_80._4_4_,(int)uStack_80 + -1);
      break;
    case 10:
      uStack_80 = (double)((longlong)uStack_80 + -1);
    }
  }
  uStack_f0 = 5;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_e8,0x1405c5c30);
  puStack_128 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c5c40);
  puStack_120 = &uStack_d8;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  func_0x0001401441e0(&uStack_c8,0x1405c5c20);
  puStack_118 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c5c50);
  puStack_110 = &uStack_b8;
  func_0x0001401445d0(uStack_88,uStack_90,&uStack_70,4,uRam00000001405c8d90,&puStack_128);
  uStack_f0 = 6;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_e8,0x1405c5c60);
  puStack_128 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c5c70);
  puStack_120 = &uStack_d8;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  func_0x0001401441e0(&uStack_c8,0x1405c5c20);
  puStack_118 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c5c80);
  puStack_110 = &uStack_b8;
  func_0x0001401445d0(uStack_88,uStack_90,&uStack_70,4,uRam00000001405c8d90,&puStack_128);
  uStack_f0 = 8;
  func_0x00014017c070(uStack_88,uStack_90,0,0);
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
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
  puRam0000000140657668 = (undefined8 *)uStack_100;
  return;
}
END DECOMPILED REFERENCE */
