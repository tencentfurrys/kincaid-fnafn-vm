/// @description FNAFN Obj_Menu_Options / KeyPress_81 - PORTED from C
// ---- sub-event KeyPress_81 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Menu_Options_KeyPress_81 (1237 B @0x140088530)
// Exit path, byte-identical logic to Mouse_54: save + apply options, swap
// the shared selector back, spawn the main title, destroy self. Consts:
// -32.0 @0x1405c4848, 352.0 @0x1405c4858, "Main_menu" @0x1405c4838, 35.0 =
// obj 35 Obj_Menu_Selector @0x1405c4868; 32.0 @0x1405c4878, 160.0
// @0x1405c4888, 63.0 = obj 63 Obj_Menu_Main_Title @0x1405c4898;
// instance_create_layer = slot 0x1405c8d90; with-block repeat const 9.0 =
// obj 9 Obj_Menu_Options_Selector with instance_destroy() body.
customfunct_game_save();
customfunct_options_update();
instance_create_layer(-32, 352, "Main_menu", Obj_Menu_Selector);
with (Obj_Menu_Options_Selector) {
    instance_destroy();
}
instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
instance_destroy();
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Options_KeyPress_81(undefined8 param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar4;
  undefined8 uVar3;
  undefined auStack_148 [16];
  longlong lStack_138;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
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
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_80;
  undefined *puStack_78;
  undefined4 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043b4db;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_70 = 1;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  uRam0000000140657680 = param_1;
  uStack_68 = param_2;
  uStack_60 = param_1;
  gml_Script_customfunct_game_save(param_1,param_2,&uStack_58,0,0);
  uStack_70 = 2;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
    param_2 = uStack_68;
    param_1 = uStack_60;
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  uVar4 = 0;
  gml_Script_customfunct_options_update(param_1,param_2,&uStack_58,0,0);
  uStack_70 = 3;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c4848);
  puStack_128 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c4858);
  puStack_120 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c4838);
  puStack_118 = &uStack_a8;
  func_0x00014000bee0(&uStack_98,0x1405c4868);
  uVar3 = CONCAT44(uVar4,uRam00000001405c8d90);
  puStack_110 = &uStack_98;
  func_0x0001401445d0(uStack_60,uStack_68,&uStack_58,4,uVar3,&puStack_128);
  uStack_70 = 4;
  uStack_cc = 0;
  uStack_d8 = 0x4022000000000000;
  iVar2 = func_0x000140144bd0(auStack_148,&uStack_60,&uStack_68,&uStack_d8);
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  uVar4 = (undefined4)((ulonglong)uVar3 >> 0x20);
  if (0 < iVar2) {
    do {
      uStack_70 = 6;
      func_0x00014017c070(uStack_60,uStack_68,0,0);
      cVar1 = func_0x0001401451f0(auStack_148,&uStack_60);
      uVar4 = (undefined4)((ulonglong)uVar3 >> 0x20);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_148,&uStack_60,&uStack_68);
  uStack_70 = 8;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c4878);
  puStack_128 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c4888);
  puStack_120 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c4838);
  puStack_118 = &uStack_a8;
  func_0x00014000bee0(&uStack_98,0x1405c4898);
  puStack_110 = &uStack_98;
  func_0x0001401445d0(uStack_60,uStack_68,&uStack_58,4,CONCAT44(uVar4,uRam00000001405c8d90),
                      &puStack_128);
  uStack_70 = 10;
  func_0x00014017c070(uStack_60,uStack_68,0,0);
  if (lStack_138 != 0) {
    func_0x00014012ec70();
    lStack_138 = 0;
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
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
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
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
