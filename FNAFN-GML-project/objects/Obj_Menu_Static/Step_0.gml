/// @description FNAFN Obj_Menu_Static / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Static_Step_0 (376 B @0x1400aa260)
// Decoded, in order (uStack_98 = 2 is the GML line marker):
//   1. instance fetch `animate_speed` (id 0x186dd, +8 self fetch).
//   2. call gml_Script_customfunct_image_speed_delta(self, argc=1,
//      arg0 = animate_speed, ret discarded — the C passes &uStack_48 for
//      the return slot but never reads it).
// That is the whole event: the menu static image advances its
// image_index by animate_speed * global.delta_factor every frame
// (see scripts/ported/customfunct_image_speed_delta.gml — corrected to
// match the real C of that script: image_index += delta * delta_factor).
customfunct_image_speed_delta(animate_speed);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Static_Step_0(longlong *param_1,undefined8 param_2)

{
  undefined8 uVar1;
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
  puStack_a0 = &UNK_14043be29;
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
  uStack_98 = 2;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  plRam0000000140657680 = param_1;
  uVar1 = (**(code **)(*param_1 + 8))(param_1,0x186dd);
  func_0x000140001490(&uStack_38,uVar1);
  puStack_90 = &uStack_38;
  gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_48,1,&puStack_90);
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
