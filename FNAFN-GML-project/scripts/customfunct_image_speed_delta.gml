/// @description helper: advance image_index frame-independently
// PORTED from C
// CORRECTED 2026-10-01 against the real C (gml_Script_customfunct_image_speed_delta,
// 401 B @0x140004dd0):
//   1. global fetch `delta_factor` (id 0x1870b).
//   2. operand read of image_index (slot uRam00000001405c7aa8 — registry name
//      @0x1405c7aa0 "image_index", EXE-REGISTRY.md) via func_0x00014015f1a0.
//   3. argument0 * delta_factor  (func_0x0001400053f0 = MUL op helper).
//   4. image_index + (that)     (func_0x000140005290 = ADD op helper).
//   5. write image_index back   (func_0x000140160140 = assignment write).
// There is NO image_speed write in the C — the old ported body
// (image_index += delta; image_speed = delta;) was wrong.
// MUL-helper evidence: same shape decodes as 0.1 * delta_factor (lerp amount)
// in Obj_Camera_Static/Step and delta_factor * 0.0065 in Obj_Menu_Fade/Step.
function customfunct_image_speed_delta(delta) {
    image_index += delta * delta_factor;
}
