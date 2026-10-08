/// @description FNAFN postprocess / Create — PORTED from C
// Ground truth: gml_Object_postprocess_Create_0
//   application_surface_draw_enable(<runtime const @0x140656300>)
//     — slot 0x1405c8ad0 (registry); const lives in guarded pool
//     (TODO(calibrate), likely false/0 to take over compositing; compare
//     Destroy which passes 1.0 to re-enable).
//   fxaa_on (id 0x18722) = 1.0, fxaa_strength (id 0x18723) = 4.0
//     (0x4010000000000000).
application_surface_draw_enable(false); // TODO(calibrate): const @0x140656300 unmapped, Destroy uses 1.0
fxaa_on = 1;
fxaa_strength = 4;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_postprocess_Create_0(longlong *param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  undefined8 *puStack_a8;
  undefined8 uStack_a0;
  undefined *puStack_98;
  undefined4 uStack_90;
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
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_98 = &UNK_14043be94;
  uStack_90 = 0;
  uStack_a0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  plRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_38,0x140656300);
  puStack_a8 = &uStack_38;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8ad0,&puStack_a8);
  uStack_90 = 2;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18722);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x3ff0000000000000;
  uStack_90 = 4;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18723);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0x4010000000000000;
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
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a0;
  return;
}
END DECOMPILED REFERENCE */
