/// @description FNAFN Obj_Menu_Selector / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Selector_Draw_0 (272 B @0x1400b03d0)
// Decoded: the entire event body is ONE no-argument runner call,
// func_0x000140175460() (global-instance fetch at [rcx+0xcc], VM dispatch
// through +0x28 with argc=0, result discarded). No variable fetch, no
// property write, no argument push; the staged uStack = N before the call
// is the GML source-line marker. An empty Draw event compiles to a bare
// return, so the original GML was a single statement whose whole effect
// is "draw this instance normally": the matching no-arg builtin is
// draw_self(). (obj_OLDTVFilter_* and postprocess Draw events share this
// shape because the OLDTVFilter pipeline draws them via its own surface
// pass.)
// TODO(calibrate): draw_self vs draw_sprite_ext-with-defaults is not
// distinguishable in YYC for a no-arg builtin — verify rendering in-game.
draw_self();

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Menu_Selector_Draw_0  va=0x1400b03d0  size=272 ====

void gml_Object_Obj_Menu_Selector_Draw_0(undefined8 param_1)

{
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
  uint uStack_2c;
  undefined8 uStack_28;
  uint uStack_1c;
  undefined8 uStack_18;
  
  uStack_18 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043c025 / * "gml_Object_Obj_Menu_Selector_Draw_0" * /;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_1c = 0xffffff;
  uStack_28 = 0;
  uStack_70 = 3;
  uRam0000000140657680 = param_1;
  func_0x000140175460();
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_28);
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
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
