/// @description FNAFN Obj_Menu_Main_Title / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Main_Title_Create_0 (4414 B @0x1400fcab0)
// Decoded, in order (uStack_70 = GML line markers):
//   0. customfunct_audio_play_sound_single(Snd_Menu_Confirm, <runtime>, <runtime>) —
//      exe const 0x1405c6130 = 22.0 (menu blip); priority/loop are the
//      same runtime const @0x140657070 (TODO/calibrate, assumed 0/false).
//   2. Obj_Menu_Main_Back.sprite_index = 55 (Spr_Menu_Background_Main).
//   3. Obj_Menu_Main_Back.image_index = 0.
//   4. Obj_Menu_Main_Back.image_alpha = 0.
//      (all three are object-tagged writes 0x14015fea0 on object 0x1d =
//      29 = Obj_Menu_Main_Back — obj_names.json.)
//   5-7. select = 0; glitching = 0 (id 0x18729); glitch_type = 0
//      (id 0x18728).
//   9. surface = -1 (id 0x1877a).
//   10. Obj_Menu_Selector.x = 94 (slot 0x1405c7b78, const 94.0).
//   0xb. Obj_Menu_Selector.select_y = 340 (tagged write 0x140160b90 on
//      object 0x23 = 35 = Obj_Menu_Selector, var id 0x1876d).
//   0xd-0x10. text_menu[0..3] = "new game", "continue", "customize",
//      "extras" (exe strings @0x1405c6100/@0x1405c6109/@0x1405c6112
//      /@0x1405c611c — exe_strings.py).
//   0x12. draw_alpha = 0 (id 0x18712).
//   0x14. game[1] (global id 0x18724, index 1) 3-way-compared against
//      guarded consts @0x140657080/@0x140657094/@0x1406570a8
//      (TODO/calibrate values): match-0 -> star_alpha = (0, 0),
//      match-1 -> (1, 0), match-2 -> (1, 1) (id 0x18773, indices 0/1).
//      The dispatch ints (0/1/2 at pool +0x14 strides) prove the mapping.
//   0x21. if (!instance_exists(Obj_Menu_Main_Options)) // 0x4c = 76
//      instance_create_layer(1195, 635, "Main_menu",
//      Obj_Menu_Main_Options) (consts 1195.0/635.0/"Main_menu"/76.0).
//   0x25. if (!instance_exists(Obj_Menu_Main_Music)) // 0x37 = 55
//      instance_create_layer(1056, 635, "Main_menu", Obj_Menu_Main_Music)
//      (consts 1056.0/635.0/"Main_menu"/55.0).
//   0x2c-0x33. for (i = 0; i < 12; i++) Scr_Camera_Update[i] = -100
//      (id 0x186d5, a 12-element array — PORTING.md; bound 12.0 =
//      0x4028000000000000; value -100.0 = 0xc059000000000000), then
//      Scr_Camera_Update[0] = random_range-ish of the rdata consts
//      @0x14043bb40/@0x14043cbe8 (helper 0x140168cf0, best-fit
//      random_range — TODO/calibrate args and identity).
// Reading: the main-title screen plays the menu blip, shows the main
// backdrop, parks the shared selector at (94, 340), fills the four menu
// labels, restores the star rating from game[1], ensures the gear
// (options) and music buttons exist, and resets the camera array.
// TODO(calibrate): audio priority/loop @0x140657070; game[1] star
// thresholds @0x140657080/@0x140657094/@0x1406570a8 (assumed 0/1/2);
// Scr_Camera_Update[0] random args @0x14043bb40/@0x14043cbe8.
customfunct_audio_play_sound_single(Snd_Menu_Confirm, 0, false); // TODO(calibrate): priority/loop are runtime const @0x140657070
Obj_Menu_Main_Back.sprite_index = 55; // Spr_Menu_Background_Main (sprite_names.json)
Obj_Menu_Main_Back.image_index = 0;
Obj_Menu_Main_Back.image_alpha = 0;
select = 0;
glitching = 0;
glitch_type = 0;
surface = -1;
Obj_Menu_Selector.x = 94;
Obj_Menu_Selector.select_y = 340;
text_menu[0] = "new game";
text_menu[1] = "continue";
text_menu[2] = "customize";
text_menu[3] = "extras";
draw_alpha = 0;
if (game[1] == 0) { // TODO(calibrate): compared const is runtime @0x140657080
    star_alpha[0] = 0;
    star_alpha[1] = 0;
} else if (game[1] == 1) { // TODO(calibrate): compared const is runtime @0x140657094
    star_alpha[0] = 1;
    star_alpha[1] = 0;
} else if (game[1] == 2) { // TODO(calibrate): compared const is runtime @0x1406570a8
    star_alpha[0] = 1;
    star_alpha[1] = 1;
}
if (!instance_exists(Obj_Menu_Main_Options)) {
    instance_create_layer(1195, 635, "Main_menu", Obj_Menu_Main_Options);
}
if (!instance_exists(Obj_Menu_Main_Music)) {
    instance_create_layer(1056, 635, "Main_menu", Obj_Menu_Main_Music);
}
for (var i = 0; i < 12; i++) {
    Scr_Camera_Update[i] = -100;
}
Scr_Camera_Update[0] = random_range(0, 0); // TODO(calibrate): args are rdata consts @0x14043bb40/@0x14043cbe8; helper 0x140168cf0 best-fit random_range

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Main_Title_Create_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  longlong *plVar6;
  undefined8 *puVar7;
  longlong lVar8;
  undefined8 *puVar9;
  longlong unaff_GS_OFFSET;
  undefined8 uVar10;
  undefined8 **ppuVar11;
  undefined8 uStack_1b8;
  undefined4 uStack_1ac;
  undefined8 uStack_1a8;
  undefined8 uStack_1a0;
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
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  longlong lStack_b0;
  undefined4 uStack_a8;
  uint uStack_a4;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined *puStack_78;
  undefined4 uStack_70;
  longlong *plStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043d422;
  uStack_70 = 0;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  plRam0000000140657680 = param_1;
  plStack_68 = param_1;
  plVar6 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_a0 = 0;
  uStack_98 = 0x500000000;
  func_0x00014000bee0(&uStack_138,0x1405c6130);
  puStack_158 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x140657070);
  puStack_150 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x140657070);
  ppuVar11 = &puStack_158;
  puStack_148 = &uStack_118;
  gml_Script_customfunct_audio_play_sound_single(plStack_68,param_2,&uStack_a0,3,&puStack_158);
  uVar4 = (undefined4)((ulonglong)ppuVar11 >> 0x20);
  uStack_70 = 2;
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  uStack_e4 = 0;
  uStack_f0 = 0x404b800000000000;
  func_0x00014015fea0(0x1d,uRam00000001405c7be8,0x80000000,&uStack_f0);
  uStack_70 = 3;
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  uStack_d4 = 0;
  uStack_e0 = 0;
  func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_e0);
  uStack_70 = 4;
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  uStack_c4 = 0;
  uStack_d0 = 0;
  func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_d0);
  uStack_70 = 5;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1876a);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0;
  uStack_70 = 6;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18729);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0;
  uStack_70 = 7;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18728);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0;
  uStack_70 = 9;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1877a);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0xbff0000000000000;
  uStack_70 = 10;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  uStack_b4 = 0;
  uStack_c0 = 0x4057800000000000;
  func_0x00014015fea0(0x23,uRam00000001405c7b78,0x80000000,&uStack_c0);
  uStack_70 = 0xb;
  uStack_1a0 = 0;
  uStack_1a8 = 0x4075400000000000;
  func_0x000140160b90(0x23,0x1876d,0x80000000,&uStack_1a8);
  uStack_70 = 0xd;
  plRam0000000140657680 = (longlong *)0x287e6;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878b);
  func_0x000140141d00(plStack_68);
  lVar8 = func_0x00014012b840(puVar7,0);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar8);
  }
  func_0x0001401441e0(lVar8,0x1405c6100);
  func_0x000140141c50(2);
  uStack_70 = 0xe;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878b);
  func_0x000140141d00(plStack_68);
  lVar8 = func_0x00014012b840(puVar7,1);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar8);
  }
  func_0x0001401441e0(lVar8,0x1405c6109);
  func_0x000140141c50(2);
  uStack_70 = 0xf;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878b);
  func_0x000140141d00(plStack_68);
  lVar8 = func_0x00014012b840(puVar7,2);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar8);
  }
  func_0x0001401441e0(lVar8,0x1405c6112);
  func_0x000140141c50(2);
  uStack_70 = 0x10;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x1878b);
  func_0x000140141d00(plStack_68);
  lVar8 = func_0x00014012b840(puVar7,3);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)(lVar8 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar8);
  }
  func_0x0001401441e0(lVar8,0x1405c611c);
  func_0x000140141c50(2);
  uStack_70 = 0x12;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18712);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar7);
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0;
  uStack_70 = 0x14;
  if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar6);
    if (iVar3 < 2) {
      uVar5 = func_0x000140147990(*plVar6);
      func_0x000140144260(&UNK_140439ca6,1,uVar5);
      plVar6 = (longlong *)0x0;
    }
    else {
      plVar6 = (longlong *)func_0x000140147980(*plVar6,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_a4 = *(uint *)((longlong)plVar6 + 0xc);
  uStack_a8 = *(undefined4 *)(plVar6 + 1);
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) == 0) {
    lStack_b0 = *plVar6;
  }
  else {
    func_0x0001400fe140(&lStack_b0,plVar6);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406570bc) &&
     (func_0x0001403f6320(0x1406570bc), iRam00000001406570bc == -1)) {
    uRam000000014065708c = 0;
    uRam0000000140657080 = 0;
    uRam00000001406570a0 = 0x100000000;
    uRam0000000140657094 = 0x3ff0000000000000;
    uRam00000001406570b4 = 0x200000000;
    uRam00000001406570a8 = 0x4000000000000000;
    func_0x0001403f6668(&DAT_1400fe090);
    func_0x0001403f62c0(0x1406570bc);
  }
  uVar10 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar3 = func_0x00014015be60(0x140657080,&lStack_b0,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
code_r0x0001400fd278:
    iVar3 = *(int *)(lVar8 * 0x14 + 0x140657090);
  }
  else {
    iVar3 = func_0x00014015be60(0x140657094,&lStack_b0,uVar10,0);
    if (iVar3 != 0) {
      iVar3 = func_0x00014015be60(0x1406570a8,&lStack_b0,uVar10,0);
      if (iVar3 != 0) goto code_r0x0001400fd598;
      lVar8 = 2;
      goto code_r0x0001400fd278;
    }
    iVar3 = uRam00000001406570a0._4_4_;
  }
  if (iVar3 == 2) {
    uStack_70 = 0x1c;
    plRam0000000140657680 = (longlong *)0x287e7;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18773);
    func_0x000140141d00(plStack_68);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,0);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0x3ff0000000000000;
    func_0x000140141c50(2);
    uStack_70 = 0x1d;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18773);
    func_0x000140141d00(plStack_68);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,1);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0x3ff0000000000000;
    func_0x000140141c50(2);
  }
  else if (iVar3 == 1) {
    uStack_70 = 0x19;
    plRam0000000140657680 = (longlong *)0x287e7;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18773);
    func_0x000140141d00(plStack_68);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,0);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0x3ff0000000000000;
    func_0x000140141c50(2);
    uStack_70 = 0x1a;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18773);
    func_0x000140141d00(plStack_68);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,1);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0;
    func_0x000140141c50(2);
  }
  else if (iVar3 == 0) {
    uStack_70 = 0x16;
    plRam0000000140657680 = (longlong *)0x287e7;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18773);
    func_0x000140141d00(plStack_68);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,0);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0;
    func_0x000140141c50(2);
    uStack_70 = 0x17;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x18773);
    func_0x000140141d00(plStack_68);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,1);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0;
    func_0x000140141c50(2);
  }
code_r0x0001400fd598:
  uStack_70 = 0x21;
  cVar2 = func_0x00014017c0e0(plStack_68,param_2,0x4c);
  if (cVar2 == '\0') {
    uStack_70 = 0x23;
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_a0 = 0;
    uStack_98 = 0x500000000;
    func_0x00014000bee0(&uStack_138,0x1405c6140);
    puStack_158 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c6150);
    puStack_150 = &uStack_128;
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    func_0x0001401441e0(&uStack_118,0x1405c6123);
    puStack_148 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c6160);
    uVar10 = CONCAT44(uVar4,uRam00000001405c8d90);
    puStack_140 = &uStack_108;
    func_0x0001401445d0(plStack_68,param_2,&uStack_a0,4,uVar10,&puStack_158);
    uVar4 = (undefined4)((ulonglong)uVar10 >> 0x20);
  }
  uStack_70 = 0x25;
  cVar2 = func_0x00014017c0e0(plStack_68,param_2,0x37);
  if (cVar2 == '\0') {
    uStack_70 = 0x27;
    if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a0);
    }
    uStack_a0 = 0;
    uStack_98 = 0x500000000;
    func_0x00014000bee0(&uStack_138,0x1405c6170);
    puStack_158 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c6150);
    puStack_150 = &uStack_128;
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_118);
    }
    func_0x0001401441e0(&uStack_118,0x1405c6123);
    puStack_148 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c6180);
    puStack_140 = &uStack_108;
    func_0x0001401445d0(plStack_68,param_2,&uStack_a0,4,CONCAT44(uVar4,uRam00000001405c8d90),
                        &puStack_158);
  }
  uStack_70 = 0x2c;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  dVar1 = _UNK_140439dd0;
  uStack_84 = 0;
  uStack_90 = 0.0;
  while( true ) {
    uStack_1ac = 0;
    uStack_1b8 = 0x4028000000000000;
    iVar3 = func_0x00014015be60(&uStack_90,&uStack_1b8,uRam00000001405cd9c0,1);
    if ((iVar3 == -2) || (-1 < iVar3)) break;
    uStack_70 = 0x2e;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186d5);
    func_0x000140141d00(plStack_68);
    uVar4 = func_0x00014012cd90(&uStack_90);
    puVar9 = (undefined8 *)func_0x00014012b840(puVar7,uVar4);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar9);
    }
    *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
    *puVar9 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_84 & 0xffffff) {
    case 1:
      uStack_90 = (double)func_0x00014012d320(&uStack_90);
      uStack_90 = uStack_90 + dVar1;
      uStack_84 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_90,&uStack_90);
      break;
    case 7:
      uStack_90 = (double)CONCAT44(uStack_90._4_4_,(int)uStack_90 + 1);
      break;
    case 10:
      uStack_90 = (double)((longlong)uStack_90 + 1);
      break;
    case 0xd:
      uStack_84 = 0;
    case 0:
      uStack_90 = uStack_90 + dVar1;
    }
  }
  uStack_70 = 0x33;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar7 = (undefined8 *)(**(code **)(*plStack_68 + 0x10))(plStack_68,0x186d5);
  uVar10 = func_0x000140168cf0(_UNK_14043bb40,_UNK_14043cbe8);
  func_0x000140141d00(plStack_68);
  puVar9 = (undefined8 *)func_0x00014012b840(puVar7,0);
  func_0x000140141d00(*puVar7);
  if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar9);
  }
  *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
  *puVar9 = uVar10;
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_b0);
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
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
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
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
