/// @description FNAFN Obj_Night_Time / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Night_Time_Draw_75 (701 B @0x14008bc70)
// Draws the night clock. func_0x0001401755c0 = draw_sprite_ext (proven in
// Obj_Menu_Fade/Draw); arg order (sprite, subimg, x, y, xscale, yscale,
// rot, colour, alpha):
//   sprite 0x59 = 89 = Spr_Night_UI_Time (sprite_names.json, data.win SPRT
//     chunk — the id indexes the chunk, same rule as OBJT/ROOM)
//   subimg = the instance variable `time` (id 0x18791) — the clock face
//     tracks the current hour
//   x = _UNK_14043b00c = f32 640.0, y = 0x43b40000 = f32 360.0 (screen
//     center of the 1280x720 view)
//   xscale/yscale = image_xscale/image_yscale (read via the op helper),
//   rot = 0, colour = 0xffffff = c_white, alpha = image_alpha
draw_sprite_ext(Spr_Night_UI_Time, time, 640, 360, image_xscale, image_yscale, 0, c_white, image_alpha);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Time_Draw_75(longlong *param_1)

{
  uint uVar1;
  double *pdVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined8 uVar6;
  undefined4 uVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  double dVar7;
  uint in_stack_fffffffffffffef8;
  uint in_stack_ffffffffffffff00;
  undefined8 uStack_d8;
  undefined *puStack_d0;
  undefined4 uStack_c8;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_d0 = &UNK_14043b613;
  uStack_d8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d8;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_c8 = 1;
  plRam0000000140657680 = param_1;
  pdVar2 = (double *)(**(code **)(*param_1 + 8))(param_1,0x18791);
  in_stack_ffffffffffffff00 = in_stack_ffffffffffffff00 & 0xffffff00;
  in_stack_fffffffffffffef8 = in_stack_fffffffffffffef8 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_80,in_stack_fffffffffffffef8,
                      in_stack_ffffffffffffff00);
  in_stack_ffffffffffffff00 = in_stack_ffffffffffffff00 & 0xffffff00;
  in_stack_fffffffffffffef8 = in_stack_fffffffffffffef8 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7c08,0x80000000,&uStack_70,in_stack_fffffffffffffef8,
                      in_stack_ffffffffffffff00);
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_60,
                      in_stack_fffffffffffffef8 & 0xffffff00,in_stack_ffffffffffffff00 & 0xffffff00)
  ;
  if ((uStack_54 & 0xffffff) == 0) {
    uVar3 = (undefined4)uStack_60;
    uVar8 = (undefined4)((ulonglong)uStack_60 >> 0x20);
  }
  else {
    uVar6 = func_0x00014012d320(&uStack_60);
    uVar3 = (undefined4)uVar6;
    uVar8 = (undefined4)((ulonglong)uVar6 >> 0x20);
  }
  if ((uStack_64 & 0xffffff) == 0) {
    uVar4 = (undefined4)uStack_70;
    uVar9 = (undefined4)((ulonglong)uStack_70 >> 0x20);
  }
  else {
    uVar6 = func_0x00014012d320(&uStack_70);
    uVar4 = (undefined4)uVar6;
    uVar9 = (undefined4)((ulonglong)uVar6 >> 0x20);
  }
  if ((uStack_74 & 0xffffff) == 0) {
    uVar5 = (undefined4)uStack_80;
    uVar10 = (undefined4)((ulonglong)uStack_80 >> 0x20);
    uVar1 = *(uint *)((longlong)pdVar2 + 0xc);
  }
  else {
    uVar6 = func_0x00014012d320(&uStack_80);
    uVar5 = (undefined4)uVar6;
    uVar10 = (undefined4)((ulonglong)uVar6 >> 0x20);
    uVar1 = *(uint *)((longlong)pdVar2 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    dVar7 = *pdVar2;
  }
  else {
    dVar7 = (double)func_0x00014012d320(pdVar2);
  }
  func_0x0001401755c0(param_1,0x59,(longlong)dVar7,_UNK_14043b00c,0x43b40000,
                      (float)(double)CONCAT44(uVar10,uVar5),(float)(double)CONCAT44(uVar9,uVar4),0,
                      0xffffff,(float)(double)CONCAT44(uVar8,uVar3));
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d8;
  return;
}
END DECOMPILED REFERENCE */
