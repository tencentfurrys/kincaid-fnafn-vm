/// @description FNAFN Obj_Menu_Fade / Draw_0 — PORTED from C (rebuilt 2026-10-01)
// Ground truth: gml_Object_Obj_Menu_Fade_Draw_0 (395 B @0x14006c140)
// Decoded (uStack_70 = 1 is the GML line marker):
//   1. read image_alpha (slot uRam00000001405c7b98 — registry name
//      @0x1405c7b90, EXE-REGISTRY.md; NOT `fading`) via op helper
//      func_0x00014015f1a0 (the type!=0 string->number coercion branch is
//      YYC defensive noise for a value Create always sets to a number).
//   2. fullscreen draw: func_0x0001401755c0(self, 0x55, 0, 0, 0,
//      0x44a00000, 0x44340000, 0, 0, (float)alpha).
//      0x44a00000 (f32) = 1280.0, 0x44340000 (f32) = 720.0, so:
//      sprite id 0x55 (runtime sprite slot), subimg 0, x 0, y 0,
//      xscale 1280, yscale 720, rot 0, colour 0 (c_black), alpha =
//      image_alpha  =>  exactly draw_sprite_ext(..., c_black, image_alpha)
//      stretched over the 1280x720 window: a black fade overlay whose
//      opacity is this instance's image_alpha.
// CORRECTION vs the old port: the alpha argument IS explicit and image_alpha
// comes from the registry-proven slot; draw_rectangle guessing removed.
// 2026-10-06: sprite id 0x55 = SPRT index 85 = Spr_UI_Fade_Black (1px wide
// — exactly the 1x1-black-sprite guess below), and 0x44340000 was misread
// as 736; it is 720.0 (matches the 1280x720 window every other object uses).
draw_sprite_ext(Spr_UI_Fade_Black, 0, 0, 0, 1280, 720, 0, c_black, image_alpha);

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Menu_Fade_Draw_0  va=0x14006c140  size=395 ====

void gml_Object_Obj_Menu_Fade_Draw_0(undefined8 param_1)

{
  double dVar1;
  uint in_stack_ffffffffffffff48;
  uint in_stack_ffffffffffffff50;
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
  double dStack_28;
  uint uStack_1c;
  undefined8 uStack_18;
  
  uStack_18 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043b126 / * "gml_Object_Obj_Menu_Fade_Draw_0" * /;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_1c = 0xffffff;
  dStack_28 = 0.0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_70 = 1;
  uRam0000000140657680 = param_1;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&dStack_28,
                      in_stack_ffffffffffffff48 & 0xffffff00,in_stack_ffffffffffffff50 & 0xffffff00)
  ;
  dVar1 = dStack_28;
  if ((uStack_1c & 0xffffff) != 0) {
    dVar1 = (double)func_0x00014012d320(&dStack_28);
  }
  func_0x0001401755c0(param_1,0x55,0,0,0,0x44a00000,0x44340000,0,0,(float)dVar1);
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
  if ((0x46U >> (uStack_1c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_28);
  }
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
