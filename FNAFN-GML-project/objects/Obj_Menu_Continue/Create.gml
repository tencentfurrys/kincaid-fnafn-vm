/// @description FNAFN Obj_Menu_Continue / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Continue_Create_0 (1854 B @0x14004c840)
// Object-index helper decode (PROVEN this session via obj_names.json, built
// from data.win's OBJT chunk): func_0x00014015fea0(obj_index, builtin_slot,
// flags, &val) and func_0x000140160b90(obj_index, var_id, flags, &val) set a
// property/variable on a TARGET OBJECT (not self) -- here 0x1d = 29 =
// Obj_Menu_Main_Back and 0x23 = 35 = Obj_Menu_Selector. Self writes use the
// direct id-fetch path instead, which is how `select`/`surface`/`draw_alpha`
// below are distinguished from the dotted object writes.
// Decoded, in order (uStack_30 = GML line markers):
//   0. customfunct_audio_play_sound_single(Snd_Menu_Confirm, <?>, <?>) -- DIRECT script
//      call, argc=3; exe const 0x1405c3a18 = 22.0 (the menu-blip sound);
//      priority and loop are the same runtime const @0x140655530.
//   2. Obj_Menu_Main_Back.sprite_index = 1   [slot 0x1405c7be8, const 1.0].
//   3. Obj_Menu_Main_Back.image_alpha = 0    [slot 0x1405c7b98, const 0.0].
//   5. surface = -1                          [self var 0x1877a].
//   6. Obj_Menu_Selector.x = 94              [slot 0x1405c7b78, 94.0].
//   7. Obj_Menu_Selector.select_y = 295      [self-ish var 0x1876d on the
//      shared selector object; 295.0 = 0x4072700000000000].
//   8. select = 0                            [self var 0x1876a].
//  10-17. text_night[0..7] = the eight exe strings 0x1405c39d0..0x1405c3a0e:
//      "night 1".."night 6", "custom  night", "exit".
//  20. draw_alpha = 0                       [self var 0x18712].
// Reading: this is the NIGHT-SELECT ("continue") screen -- it swaps the
// shared backdrop to sprite 1 (starting invisible), parks the shared
// selector at (94, 295), resets the selection to 0, fills the night-label
// array, and plays the menu blip.
// TODO(calibrate): audio priority+loop are runtime const @0x140655530
// (0x14065xxxx, outside the exe image); loop is certainly false for a
// "single" UI blip, priority assumed 0.
customfunct_audio_play_sound_single(Snd_Menu_Confirm, /*priority*/ 0, /*loop*/ false);
Obj_Menu_Main_Back.sprite_index = 1;
Obj_Menu_Main_Back.image_alpha = 0;
surface = -1;
Obj_Menu_Selector.x = 94;
Obj_Menu_Selector.select_y = 295;
select = 0;
text_night[0] = "night 1";
text_night[1] = "night 2";
text_night[2] = "night 3";
text_night[3] = "night 4";
text_night[4] = "night 5";
text_night[5] = "night 6";
text_night[6] = "custom  night";
text_night[7] = "exit";
draw_alpha = 0;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_Create_0(longlong *param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  longlong lVar2;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  undefined *puStack_38;
  undefined4 uStack_30;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_38 = &UNK_14043a919;
  uStack_30 = 0;
  uStack_40 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_40;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_b8 = 0;
  uStack_b0 = 0x500000000;
  plRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_a8,0x1405c3a18);
  puStack_108 = &uStack_a8;
  func_0x00014000bee0(&uStack_98,0x140655530);
  puStack_100 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x140655530);
  puStack_f8 = &uStack_88;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_b8,3,&puStack_108);
  uStack_30 = 2;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  func_0x00014015fea0(0x1d,uRam00000001405c7be8,0x80000000,&uStack_70);
  uStack_30 = 3;
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  uStack_54 = 0;
  uStack_60 = 0;
  func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_60);
  uStack_30 = 5;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1877a);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0xbff0000000000000;
  uStack_30 = 6;
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_44 = 0;
  uStack_50 = 0x4057800000000000;
  func_0x00014015fea0(0x23,uRam00000001405c7b78,0x80000000,&uStack_50);
  uStack_30 = 7;
  uStack_e0 = 0;
  uStack_e8 = 0x4072700000000000;
  func_0x000140160b90(0x23,0x1876d,0x80000000,&uStack_e8);
  uStack_30 = 8;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
  uStack_30 = 10;
  plRam0000000140657680 = (longlong *)0x2878f;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,0);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c39d0);
  func_0x000140141c50(2);
  uStack_30 = 0xb;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,1);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c39d8);
  func_0x000140141c50(2);
  uStack_30 = 0xc;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,2);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c39e0);
  func_0x000140141c50(2);
  uStack_30 = 0xd;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,3);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c39e8);
  func_0x000140141c50(2);
  uStack_30 = 0xe;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,4);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c39f0);
  func_0x000140141c50(2);
  uStack_30 = 0xf;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,5);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c39f8);
  func_0x000140141c50(2);
  uStack_30 = 0x10;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,6);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c3a00);
  func_0x000140141c50(2);
  uStack_30 = 0x11;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1878c);
  func_0x000140141d00(param_1);
  lVar2 = func_0x00014012b840(puVar1,7);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)(lVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar2);
  }
  func_0x0001401441e0(lVar2,0x1405c3a0e);
  func_0x000140141c50(2);
  uStack_30 = 0x14;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18712);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_40;
  return;
}
END DECOMPILED REFERENCE */
