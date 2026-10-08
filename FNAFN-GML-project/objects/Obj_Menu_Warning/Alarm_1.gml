/// @description FNAFN Obj_Menu_Warning / Alarm_1 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Warning_Alarm_1 (720 B @0x1401124f0)
// slot 0x1405c8d90 = instance_create_layer (4 args: x, y, layer, obj).
// x/y both load the SAME runtime-pool const @0x1406573b0 (guarded init;
// value not in the exe image -> TODO(calibrate), see pool-map.json).
// string const @0x1405c6528 = "Main_menu" (layer); 0x1405c6538 = 57.0
// -> object 57 = Obj_Menu_Disclaimer (obj_names.json).
// slot 0x1405c8c20 = surface_free; var 0x1877a 'surface' fetched as arg.
// func_0x00014017c070 = instance_destroy (PROVEN).
instance_create_layer(0 /* TODO(calibrate): x @0x1406573b0 */, 0 /* TODO(calibrate): y @0x1406573b0 */, "Main_menu", Obj_Menu_Disclaimer);
surface_free(surface);
instance_destroy();
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Warning_Alarm_1(longlong *param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
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
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  
  uStack_38 = 0xfffffffffffffffe;
  puStack_d8 = &UNK_14043d8a0 / * "gml_Object_Obj_Menu_Warning_Alarm_1" * /;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_d0 = 1;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  plRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_88,0x1406573b0);
  puStack_108 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x1406573b0);
  puStack_100 = &uStack_78;
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  func_0x0001401441e0(&uStack_68,0x1405c6528);
  puStack_f8 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x1405c6538);
  puStack_f0 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_48,4,uRam00000001405c8d90,&puStack_108);
  uStack_d0 = 2;
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  uVar1 = (**(code **)(*param_1 + 8))(param_1,0x1877a / * surface * /);
  func_0x000140001490(&uStack_88,uVar1);
  puStack_108 = &uStack_88;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8c20,&puStack_108);
  uStack_d0 = 4;
  func_0x00014017c070(param_1,param_2,0,0);
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
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
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
