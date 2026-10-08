/// @description FNAFN postprocess / Destroy — PORTED from C
// Ground truth: gml_Object_postprocess_Destroy_0
// Single call: application_surface_draw_enable(1.0) — slot 0x1405c8ad0
// (registry), const 0x1405c4da8 = double 1.0 (exe_strings.py). Re-enables
// the app-surface draw on cleanup (mirror of Create which disables).
application_surface_draw_enable(1);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_postprocess_Destroy_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 *puStack_90;
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
  puStack_a0 = &UNK_14043beb4;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
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
  uStack_98 = 1;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  uRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_38,0x1405c4da8);
  puStack_90 = &uStack_38;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8ad0,&puStack_90);
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
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
