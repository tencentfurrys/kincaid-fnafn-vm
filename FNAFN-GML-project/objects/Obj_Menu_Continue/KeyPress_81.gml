/// @description FNAFN Obj_Menu_Continue / KeyPress_81 - PORTED from C
// ---- sub-event KeyPress_81 (split from KeyPress.gml) ----
// Ground truth: gml_Object_Obj_Menu_Continue_KeyPress_81 (530 B @0x140052a80)
// Decoded (uStack_a0 = 1/3 are GML line markers):
//   1. line 1: 4-arg call on slot uRam00000001405c8d90 (REGISTRY-CONFIRMED
//      instance_create_layer), args staged in order:
//        x = exe const 0x1405c3cf8 = 32.0
//        y = exe const 0x1405c3d08 = 160.0
//        layer = exe string 0x1405c3ce8 = "Main_menu"
//        object = exe const 0x1405c3d18 = 63.0 -> obj_names.json index 63
//                 = Obj_Menu_Main_Title
//   2. line 3: instance_destroy() — helper func_0x00014017c070(self, other,
//      0, 0) (PROVEN 2026-10-06: scope -1 = self, fires ev_destroy +
//      ev_cleanup). The old "room_goto_next()" best-fit guess was wrong.
// Reading: Q on the night-select screen hands control back to the main
// menu (spawns Obj_Menu_Main_Title on the Main_menu layer at (32, 160))
// and then the continue-screen controller removes itself.
instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
instance_destroy();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_KeyPress_81(undefined8 param_1,undefined8 param_2)

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
  puStack_a8 = &UNK_14043a9d3;
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
  func_0x00014000bee0(&uStack_68,0x1405c3cf8);
  puStack_d8 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x1405c3d08);
  puStack_d0 = &uStack_58;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  func_0x0001401441e0(&uStack_48,0x1405c3ce8);
  puStack_c8 = &uStack_48;
  func_0x00014000bee0(&uStack_38,0x1405c3d18);
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

