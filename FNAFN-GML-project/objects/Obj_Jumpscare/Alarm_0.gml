/// @description FNAFN Obj_Jumpscare / Alarm — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Jumpscare / Alarm
image_alpha = 1;
sprite_index = 47; // Spr_Jumpscare_Freddy
image_index = 0;
audio_play_sound(Snd_Jumpscare_Freddy, 0, 0); // TODO: args
Animation_end = 165;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Jumpscare_Alarm_0(longlong *param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  undefined8 uStack_30;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043dd7c;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_30 = CONCAT44(0xffffff,(undefined4)uStack_30);
  uStack_38 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a0 = 1;
  uStack_8c = 0;
  uStack_98 = 0x3ff0000000000000;
  plRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_98);
  uStack_a0 = 2;
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_4c = 0;
  uStack_58 = 0x4047800000000000;
  func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_58);
  uStack_a0 = 3;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  uStack_3c = 0;
  uStack_48 = 0;
  func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_48);
  uStack_a0 = 4;
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  uStack_38 = 0;
  uStack_30 = 0x500000000;
  func_0x00014000bee0(&uStack_88,0x1405c6a78);
  puStack_128 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x140657638);
  puStack_120 = &uStack_78;
  func_0x00014000bee0(&uStack_68,0x140657638);
  puStack_118 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_38,3,uRam00000001405c8970,&puStack_128);
  uStack_a0 = 6;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186de);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x4064a00000000000;
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
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */