/// @description FNAFN Obj_Menu_Radio_Cassette / Create — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Radio_Cassette_Create_0
// Decoded, in order (uStack_80 = GML line markers):
//   (0). customfunct_game_create_music_stream() (direct named-script call).
//   2. customfunct_audio_play_sound_single(Snd_Menu_Confirm, <runtime>, <runtime>)
//      (22.0 = exe const @0x1405c5b40 verified; priority/loop are runtime
//      const @0x140656e70, outside the mapped exe image).
//   3. with (Obj_Menu_Selector) { instance_destroy(); } (35.0 =
//      0x4041800000000000 literal; object 35 = Obj_Menu_Selector per
//      obj_names.json; with-shape helpers 0x140144bd0/0x1401451f0/0x1401449f0
//      per PORTING.md).
//   7. Obj_Menu_Main_Back.sprite_index = 71 (71.0 = 0x4051c000000000000
//      literal; object 0x1d = 29 = Obj_Menu_Main_Back; slot 0x1405c7be8 =
//      sprite_index; 71 = Spr_Menu_Background_Radio per sprite_names.json).
//   8. Obj_Menu_Main_Back.image_alpha = 0 (slot 0x1405c7b98 = image_alpha).
//   9. instance_create_layer(x, y - 40, "Main_menu", Obj_Menu_Radio_Play)
//      (x/y read via func_0x00014015f1a0 on slots 0x1405c7b78/0x1405c7b88;
//      y - 40 via the PROVEN SUB helper func_0x00014002fc60 with 0x28 = 40;
//      "Main_menu" = exe const @0x1405c5b28; 56.0 = exe const @0x1405c5b50,
//      object 56 = Obj_Menu_Radio_Play; slot 0x1405c8d90 =
//      instance_create_layer).
//   0xb/c. arrow_size[0] = 1; arrow_size[1] = 1 (id 0x186e2, element writes).
//   0xe/f. arrow_alpha[0] = 0.5 (0x3fe0...); arrow_alpha[1] = 1.0 (id 0x186e1).
//   0x11. track_select = 1 (id 0x18794).
//   0x13. radio_text[0] = "import" (id 0x1875d; exe const @0x1405c5b32).
//   0x15. radio_text[1] = "exit" (exe const @0x1405c5b39).
// TODO(calibrate): priority/loop runtime const @0x140656e70 (outside the
// mapped exe image) — verify in-game.
// Ported: Obj_Menu_Radio_Cassette / Create
customfunct_game_create_music_stream();
customfunct_audio_play_sound_single(Snd_Menu_Confirm, 0, false); // TODO(calibrate): priority/loop are runtime const @0x140656e70
with (Obj_Menu_Selector) {
    instance_destroy();
}
Obj_Menu_Main_Back.sprite_index = 71; // Spr_Menu_Background_Radio
Obj_Menu_Main_Back.image_alpha = 0;
instance_create_layer(x, y - 40, "Main_menu", Obj_Menu_Radio_Play);
arrow_size[0] = 1;
arrow_size[1] = 1;
arrow_alpha[0] = 0.5;
arrow_alpha[1] = 1;
track_select = 1;
radio_text[0] = "import";
radio_text[1] = "exit";

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Radio_Cassette_Create_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  longlong lVar5;
  undefined8 **ppuVar6;
  ulonglong uVar7;
  undefined4 uVar8;
  ulonglong in_stack_fffffffffffffe60;
  undefined auStack_198 [16];
  longlong lStack_188;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
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
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  longlong *plStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043cd88;
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
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  plRam0000000140657680 = param_1;
  uStack_68 = param_2;
  plStack_50 = param_1;
  gml_Script_customfunct_game_create_music_stream(param_1,param_2,&uStack_60,0,0);
  uStack_80 = 2;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  func_0x00014000bee0(&uStack_118,0x1405c5b40);
  puStack_178 = &uStack_118;
  func_0x00014000bee0(&uStack_108,0x140656e70);
  puStack_170 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140656e70);
  ppuVar6 = &puStack_178;
  puStack_168 = &uStack_f8;
  gml_Script_customfunct_audio_play_sound_single(plStack_50,uStack_68,&uStack_60,3,&puStack_178);
  uStack_80 = 3;
  uStack_6c = 0;
  uStack_78 = 0x4041800000000000;
  iVar2 = func_0x000140144bd0(auStack_198,&plStack_50,&uStack_68,&uStack_78);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if (0 < iVar2) {
    do {
      uStack_80 = 5;
      func_0x00014017c070(plStack_50,uStack_68,0,0);
      cVar1 = func_0x0001401451f0(auStack_198,&plStack_50);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_198,&plStack_50,&uStack_68);
  uStack_80 = 7;
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  uStack_a4 = 0;
  uStack_b0 = 0x4051c00000000000;
  func_0x00014015fea0(0x1d,uRam00000001405c7be8,0x80000000,&uStack_b0);
  uStack_80 = 8;
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  uStack_94 = 0;
  uStack_a0 = 0;
  func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_a0);
  uStack_80 = 9;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  in_stack_fffffffffffffe60 = in_stack_fffffffffffffe60 & 0xffffffffffffff00;
  uVar7 = (ulonglong)ppuVar6 & 0xffffffffffffff00;
  func_0x00014015f1a0(plStack_50,uRam00000001405c7b78,0x80000000,&uStack_d0,uVar7,
                      in_stack_fffffffffffffe60);
  uVar7 = uVar7 & 0xffffffffffffff00;
  func_0x00014015f1a0(plStack_50,uRam00000001405c7b88,0x80000000,&uStack_c0,uVar7,
                      in_stack_fffffffffffffe60 & 0xffffffffffffff00);
  uVar8 = (undefined4)(uVar7 >> 0x20);
  func_0x000140001490(&uStack_118,&uStack_d0);
  puStack_178 = &uStack_118;
  func_0x00014002fc60(&uStack_78,&uStack_c0,0x28);
  func_0x000140001490(&uStack_108,&uStack_78);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puStack_170 = &uStack_108;
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  func_0x0001401441e0(&uStack_f8,0x1405c5b28);
  puStack_168 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c5b50);
  puStack_160 = &uStack_e8;
  func_0x0001401445d0(plStack_50,uStack_68,&uStack_60,4,CONCAT44(uVar8,uRam00000001405c8d90),
                      &puStack_178);
  uStack_80 = 0xb;
  plRam0000000140657680 = (longlong *)0x287df;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e2);
  func_0x000140141d00(plStack_50);
  puVar4 = (undefined8 *)func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  uStack_80 = 0xc;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e2);
  func_0x000140141d00(plStack_50);
  puVar4 = (undefined8 *)func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  uStack_80 = 0xe;
  plRam0000000140657680 = (longlong *)0x287b8;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e1);
  func_0x000140141d00(plStack_50);
  puVar4 = (undefined8 *)func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x3fe0000000000000;
  func_0x000140141c50(2);
  uStack_80 = 0xf;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x186e1);
  func_0x000140141d00(plStack_50);
  puVar4 = (undefined8 *)func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  uStack_80 = 0x11;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x18794);
  if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar3);
  }
  *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
  *puVar3 = 0x3ff0000000000000;
  uStack_80 = 0x13;
  plRam0000000140657680 = (longlong *)0x287e1;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1875d);
  func_0x000140141d00(plStack_50);
  lVar5 = func_0x00014012b840(puVar3,0);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar5);
  }
  func_0x0001401441e0(lVar5,0x1405c5b32);
  func_0x000140141c50(2);
  uStack_80 = 0x15;
  puVar3 = (undefined8 *)(**(code **)(*plStack_50 + 0x10))(plStack_50,0x1875d);
  func_0x000140141d00(plStack_50);
  lVar5 = func_0x00014012b840(puVar3,1);
  func_0x000140141d00(*puVar3);
  if ((0x46U >> (*(uint *)(lVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar5);
  }
  func_0x0001401441e0(lVar5,0x1405c5b39);
  func_0x000140141c50(2);
  if (lStack_188 != 0) {
    func_0x00014012ec70();
    lStack_188 = 0;
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
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
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
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
