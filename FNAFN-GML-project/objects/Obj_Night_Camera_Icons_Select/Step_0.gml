/// @description FNAFN Obj_Night_Camera_Icons_Select / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Icons_Select_Step_0
// Single call: customfunct_image_speed_delta(0.06) — const @0x1405c48f8 =
// double 0.06 (exe_strings.py). Ported script lives in scripts/ported/.
customfunct_image_speed_delta(0.06);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Icons_Select_Step_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 *puStack_80;
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
  puStack_90 = &UNK_14043b65b;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_88 = 2;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  uRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_38,0x1405c48f8);
  puStack_80 = &uStack_38;
  gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_48,1,&puStack_80);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
