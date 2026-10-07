/// @description FNAFN Obj_Menu_Customize / Mouse_54 - PORTED from C
// ---- sub-event Mouse_54 (split from Mouse.gml) ----
// ground truth: gml_Object_Obj_Menu_Customize_Mouse_54 (602 B @0x1400e34e0)
// Right-click "back to main menu" (same shape as Obj_Menu_Continue/Mouse_54:
// 4-arg instance_create_layer + instance_destroy, no draw_alpha gate).
// instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title) +
// instance_destroy(). Exe consts: x @0x1405c5a58 (TODO calibrate; same exit
// pattern as Mouse_53/Continue suggests 32), y @0x1405c5a68 = 160.0
// (EXE-CONSTANTS tag 0x4064...), layer str @0x1405c5a48 = "Main_menu",
// obj @0x1405c5a78 = 63.0 = Obj_Menu_Main_Title (obj_names.json);
// slot 0x1405c8d90 = instance_create_layer.
instance_create_layer(32 /* TODO(calibrate): const @0x1405c5a58, 32 per exit pattern */, 160, "Main_menu", Obj_Menu_Main_Title);
instance_destroy();
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Customize_Mouse_54(undefined8 param_1,undefined8 param_2)

{
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
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
  puStack_c8 = &UNK_14043cd12;
  uStack_c0 = 0;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  uRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_68,0x1405c5a58);
  puStack_f8 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x1405c5a68);
  puStack_f0 = &uStack_58;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  func_0x0001401441e0(&uStack_48,0x1405c5a48);
  puStack_e8 = &uStack_48;
  func_0x00014000bee0(&uStack_38,0x1405c5a78);
  puStack_e0 = &uStack_38;
  func_0x0001401445d0(param_1,param_2,&uStack_78,4,uRam00000001405c8d90,&puStack_f8);
  uStack_c0 = 3;
  func_0x00014017c070(param_1,param_2,0,0);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
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
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return;
}
END DECOMPILED REFERENCE */
