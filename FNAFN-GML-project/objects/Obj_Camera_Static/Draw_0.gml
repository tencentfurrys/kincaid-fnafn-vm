/// @description FNAFN Obj_Camera_Static / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Camera_Static_Draw_0 (272 B @0x1400aa5a0)
// The entire event body is ONE no-argument call: func_0x000140175460().
// Its opcodes (mov ecx,[rcx+0xcc] = global-instance fetch, then a VM
// dispatch through the fetched value's +0x28 slot with argc=0 and the
// result discarded) are the runner's no-arg builtin/script invocation.
// No variable fetch, no property write, no argument push precedes it, and
// the uStack_60 = 2 right before the call is the GML line marker (same
// marker pattern as the other *_Static siblings; sibling Draw events show
// 1..3 there).
// An empty Draw event compiles to a pure ret, so the original GML was a
// single statement whose whole effect is "draw this instance normally":
// the only matching no-arg builtin is draw_self().
// TODO(calibrate): verify in-game that the static camera image renders
// (draw_self vs draw_sprite_ext with defaults — the YYC shapes are
// indistinguishable for a no-arg builtin, and draw_self is the canonical
// no-arg draw statement in GM 2022 YYC builds).
draw_self();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Camera_Static_Draw_0(undefined8 param_1)

{
  undefined8 uStack_70;
  undefined *puStack_68;
  undefined4 uStack_60;
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
  puStack_68 = &UNK_14043b7b4;
  uStack_70 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_70;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_1c = 0xffffff;
  uStack_28 = 0;
  uStack_60 = 2;
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
  puRam0000000140657668 = (undefined8 *)uStack_70;
  return;
}
END DECOMPILED REFERENCE */
