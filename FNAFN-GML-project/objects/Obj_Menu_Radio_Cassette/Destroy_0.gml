/// @description FNAFN Obj_Menu_Radio_Cassette / Destroy — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Menu_Radio_Cassette / Destroy
customfunct_game_save_music();
with (Obj_Menu_Radio_Play) {
    instance_destroy();
}
customfunct_game_music_clear();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Radio_Cassette_Destroy_0(undefined8 param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined auStack_d8 [16];
  longlong lStack_c8;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043cdb4;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_a8 = 1;
  uStack_40 = 0;
  uStack_38 = 0x500000000;
  uRam0000000140657680 = param_1;
  uStack_50 = param_2;
  uStack_48 = param_1;
  gml_Script_customfunct_game_save_music(param_1,param_2,&uStack_40,0,0);
  uStack_a8 = 2;
  uStack_54 = 0;
  uStack_60 = 0x404c000000000000;
  iVar2 = func_0x000140144bd0(auStack_d8,&uStack_48,&uStack_50,&uStack_60);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if (0 < iVar2) {
    do {
      uStack_a8 = 4;
      func_0x00014017c070(uStack_48,uStack_50,0,0);
      cVar1 = func_0x0001401451f0(auStack_d8,&uStack_48);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_d8,&uStack_48,&uStack_50);
  uStack_a8 = 8;
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  uStack_40 = 0;
  uStack_38 = 0x500000000;
  gml_Script_customfunct_game_music_clear(uStack_48,uStack_50,&uStack_40,0,0);
  if (lStack_c8 != 0) {
    func_0x00014012ec70();
    lStack_c8 = 0;
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */