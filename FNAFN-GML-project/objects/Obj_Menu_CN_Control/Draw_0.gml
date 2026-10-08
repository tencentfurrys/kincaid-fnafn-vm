/// @description FNAFN Obj_Menu_CN_Control / Draw — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Menu_CN_Control / Draw
draw_set_color(make_color_rgb(255, 0, 110));
draw_set_font(0);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
draw_text(1152, 660, "Press enter to start");

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_CN_Control_Draw_0(undefined8 param_1,undefined8 param_2)

{
  undefined4 uVar1;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined *puStack_78;
  undefined4 uStack_70;
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
  puStack_78 = &UNK_14043c160;
  uStack_70 = 0;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_30._4_4_ = 0xffffff;
  uStack_38 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uRam0000000140657680 = param_1;
  uVar1 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar1);
  uStack_70 = 2;
  func_0x000140175520(0);
  uStack_70 = 3;
  func_0x000140175540(2);
  uStack_70 = 4;
  func_0x000140175530(2);
  uStack_70 = 6;
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  uStack_38 = 0;
  uStack_30 = 0x500000000;
  func_0x00014000bee0(&uStack_68,0x1405c4f28);
  puStack_d8 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x1405c4f38);
  puStack_d0 = &uStack_58;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  func_0x0001401441e0(&uStack_48,0x1405c4f10);
  puStack_c8 = &uStack_48;
  func_0x0001401445d0(param_1,param_2,&uStack_38,3,uRam00000001405c8da0,&puStack_d8);
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
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
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */