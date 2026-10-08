/// @description FNAFN Obj_Game_Over / Draw — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Game_Over / Draw
draw_sprite(Spr_UI_Game_Over, 0, 640, 330);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 0, 110));
draw_set_font(game_font[0]);
draw_text(640, 410, "press enter to continue");
draw_set_halign(fa_left);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Game_Over_Draw_0(undefined8 param_1,undefined8 param_2)

{
  uint uVar1;
  undefined4 uVar2;
  int iVar3;
  double *pdVar4;
  double dVar5;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
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
  undefined *puStack_48;
  undefined4 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_48 = &UNK_14043b243;
  uStack_40 = 0;
  uStack_50 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_50;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uRam0000000140657680 = param_1;
  pdVar4 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_30 = CONCAT44(0xffffff,(undefined4)uStack_30);
  uStack_38 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_40 = 1;
  func_0x000140175550(param_1,0x29,0,_UNK_14043b00c,0x43a50000);
  uStack_40 = 2;
  func_0x000140175530(1);
  uStack_40 = 3;
  uVar2 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar2);
  uStack_40 = 4;
  if (((*(uint *)((longlong)pdVar4 + 0xc) & 0xffffff) == 2) && (*pdVar4 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar4);
    if (0 < iVar3) {
      pdVar4 = (double *)func_0x000140147980(*pdVar4,0);
      uVar1 = *(uint *)((longlong)pdVar4 + 0xc);
      goto joined_r0x00014006f5e2;
    }
    uVar2 = func_0x000140147990(*pdVar4);
    pdVar4 = (double *)0x0;
    func_0x000140144260(&UNK_140439ca6,0,uVar2);
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uVar1 = *(uint *)((longlong)pdVar4 + 0xc);
joined_r0x00014006f5e2:
  if ((uVar1 & 0xffffff) == 0) {
    dVar5 = *pdVar4;
  }
  else {
    dVar5 = (double)func_0x00014012d320(pdVar4);
  }
  func_0x000140175520((longlong)dVar5);
  uStack_40 = 5;
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  uStack_38 = 0;
  uStack_30 = 0x500000000;
  func_0x00014000bee0(&uStack_88,0x1405c41e8);
  puStack_d8 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x1405c41f8);
  puStack_d0 = &uStack_78;
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  func_0x0001401441e0(&uStack_68,0x1405c41d0);
  puStack_c8 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_38,3,uRam00000001405c8da0,&puStack_d8);
  uStack_40 = 7;
  func_0x000140175530(0);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
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
  puRam0000000140657668 = (undefined8 *)uStack_50;
  return;
}
END DECOMPILED REFERENCE */