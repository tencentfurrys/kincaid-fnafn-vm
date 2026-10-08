/// @description FNAFN Obj_Game_Over_Tablet / Create — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Game_Over_Tablet / Create
Tablet_Sprite_Speed = -0.99;
image_index = 9;
customfunct_audio_play_sound_single(Snd_Camera_Close, 0, false);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Game_Over_Tablet_Create_0(longlong *param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 uStack_e0;
  undefined *puStack_d8;
  undefined4 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_d8 = &UNK_14043c1dc;
  uStack_d0 = 0;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_38 = CONCAT44(0xffffff,(undefined4)uStack_38);
  uStack_40 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1877e);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0xbfefae147ae147ae;
  uStack_d0 = 2;
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_44 = 0;
  uStack_50 = 0x4022000000000000;
  func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_50);
  uStack_d0 = 4;
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  uStack_40 = 0;
  uStack_38 = 0x500000000;
  func_0x00014000bee0(&uStack_88,0x1405c4f70);
  puStack_f8 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x140656450);
  puStack_f0 = &uStack_78;
  func_0x00014000bee0(&uStack_68,0x140656450);
  puStack_e8 = &uStack_68;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_40,3,&puStack_f8);
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
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
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
  puRam0000000140657668 = (undefined8 *)uStack_e0;
  return;
}
END DECOMPILED REFERENCE */