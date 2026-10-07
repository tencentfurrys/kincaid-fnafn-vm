/// @description FNAFN Obj_Menu_Continue / Mouse_54 - PORTED from C
// ---- sub-event Mouse_54 (split from Mouse.gml) ----
// Ground truth: gml_Object_Obj_Menu_Continue_Mouse_54 (530 B @0x1400508b0)
// Byte-identical shape to KeyPress_81 (same 530 B size, same call sequence
// -- the mirror holds), only the exe constants differ, and they decode to
// the SAME values: x=32.0 (0x1405c3b68), y=160.0 (0x1405c3b78), layer
// "Main_menu" (0x1405c3b58), object 63.0 (0x1405c3b88 -> Obj_Menu_Main_Title
// via obj_names.json), then func_0x00014017c070(self, other, 0, 0) =
// instance_destroy() (PROVEN 2026-10-06; the old "room_goto_next" best-fit
// guess was wrong — this is the 0x14017c070 self-removal, not a room
// change). Reading: right-click on the night-select screen is the same
// "back to main menu" action as the Q key — hand control to the main menu
// and remove the continue-screen controller.
instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
instance_destroy();
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_Mouse_54(undefined8 param_1,undefined8 param_2)

{
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043a963;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_a0 = 1;
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  uRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_68,0x1405c3b68);
  puStack_d8 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x1405c3b78);
  puStack_d0 = &uStack_58;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  func_0x0001401441e0(&uStack_48,0x1405c3b58);
  puStack_c8 = &uStack_48;
  func_0x00014000bee0(&uStack_38,0x1405c3b88);
  puStack_c0 = &uStack_38;
  func_0x0001401445d0(param_1,param_2,&uStack_78,4,uRam00000001405c8d90,&puStack_d8);
  uStack_a0 = 3;
  func_0x00014017c070(param_1,param_2,0,0);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
