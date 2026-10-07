/// @description FNAFN Obj_Night_Shift_End / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Night_Shift_End_Draw_75 (929 B @0x1400b2fa0)
// Two draws (uStack_c8 = 1..7 are GML line markers):
//   line 1-3 (gated): if (room == 4) draw the fullscreen black overlay.
//     room = slot 0x1405c7b38 (registry), 0x4010000000000000 = 4.0.
//     fade_alpha (id 0x18718), room_width (slot 0x1405c7b08), room_height
//     (slot 0x1405c7b18) — same slots as Create's room==4 branch.
//     draw_sprite_ext(Spr_UI_Fade_Black, 0, 0, 0, room_width, room_height,
//       0, c_white, fade_alpha).
//     - sprite 0x55 = 85 = Spr_UI_Fade_Black (sprite_names.json).
//   line 7 (always): the "night complete" stamp at screen center.
//     night_size (id 0x1874a, 1.0 normally / 0.95 in room 4 — see Create),
//     text_alpha (id 0x18787).
//     _UNK_14043b00c = 640.0, 0x43b40000 = 360.0f (screen center, same consts
//     as Obj_Night_Time/Draw), sprite 9 = SPRT 9 = Spr_UI_Night_Complete.
//     draw_sprite_ext(Spr_UI_Night_Complete, 0, 640, 360, night_size,
//       night_size, 0, c_white, text_alpha).
if (room == 4) {
    draw_sprite_ext(Spr_UI_Fade_Black, 0, 0, 0, room_width, room_height, 0, c_white, fade_alpha);
}
draw_sprite_ext(Spr_UI_Night_Complete, 0, 640, 360, night_size, night_size, 0, c_white, text_alpha);

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Shift_End_Draw_75(longlong *param_1)

{
  uint uVar1;
  int iVar2;
  undefined8 *puVar3;
  double *pdVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined8 uVar7;
  undefined4 uVar9;
  undefined4 uVar10;
  double dVar8;
  undefined8 uStack_e8;
  undefined4 uStack_dc;
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
  double dStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_d0 = &UNK_14043c10e;
  uStack_d8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d8;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  dStack_60 = 0.0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_c8 = 1;
  plRam0000000140657680 = param_1;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_70);
  uStack_dc = 0;
  uStack_e8 = 0x4010000000000000;
  iVar2 = func_0x00014015be60(&uStack_70,&uStack_e8,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x0001400b31ad;
  uStack_c8 = 3;
  puVar3 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18718);
  func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&dStack_60);
  func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_50);
  if ((*(uint *)((longlong)puVar3 + 0xc) & 0xffffff) == 0) {
    uVar5 = (undefined4)*puVar3;
    uVar9 = (undefined4)((ulonglong)*puVar3 >> 0x20);
    if ((uStack_44 & 0xffffff) == 0) goto code_r0x0001400b314e;
code_r0x0001400b3121:
    uVar7 = func_0x00014012d320(&uStack_50);
    uVar6 = (undefined4)uVar7;
    uVar10 = (undefined4)((ulonglong)uVar7 >> 0x20);
    dVar8 = dStack_60;
  }
  else {
    uVar7 = func_0x00014012d320(puVar3);
    uVar5 = (undefined4)uVar7;
    uVar9 = (undefined4)((ulonglong)uVar7 >> 0x20);
    if ((uStack_44 & 0xffffff) != 0) goto code_r0x0001400b3121;
code_r0x0001400b314e:
    uVar6 = (undefined4)uStack_50;
    uVar10 = (undefined4)((ulonglong)uStack_50 >> 0x20);
    dVar8 = dStack_60;
  }
  dStack_60 = dVar8;
  if ((uStack_54 & 0xffffff) != 0) {
    dVar8 = (double)func_0x00014012d320(&dStack_60);
  }
  func_0x0001401755c0(param_1,0x55,0,0,0,(float)dVar8,(float)(double)CONCAT44(uVar10,uVar6),0,
                      0xffffff,(float)(double)CONCAT44(uVar9,uVar5));
code_r0x0001400b31ad:
  uStack_c8 = 7;
  pdVar4 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1874a);
  puVar3 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18787);
  if ((*(uint *)((longlong)puVar3 + 0xc) & 0xffffff) == 0) {
    uVar5 = (undefined4)*puVar3;
    uVar9 = (undefined4)((ulonglong)*puVar3 >> 0x20);
    uVar1 = *(uint *)((longlong)pdVar4 + 0xc);
  }
  else {
    uVar7 = func_0x00014012d320(puVar3);
    uVar5 = (undefined4)uVar7;
    uVar9 = (undefined4)((ulonglong)uVar7 >> 0x20);
    uVar1 = *(uint *)((longlong)pdVar4 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    uVar6 = SUB84(*pdVar4,0);
    uVar10 = (undefined4)((ulonglong)*pdVar4 >> 0x20);
  }
  else {
    uVar7 = func_0x00014012d320(pdVar4);
    uVar6 = (undefined4)uVar7;
    uVar10 = (undefined4)((ulonglong)uVar7 >> 0x20);
    uVar1 = *(uint *)((longlong)pdVar4 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    dVar8 = *pdVar4;
  }
  else {
    dVar8 = (double)func_0x00014012d320(pdVar4);
  }
  func_0x0001401755c0(param_1,9,0,_UNK_14043b00c,0x43b40000,(float)dVar8,
                      (float)(double)CONCAT44(uVar10,uVar6),0,0xffffff,
                      (float)(double)CONCAT44(uVar9,uVar5));
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
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
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_60);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d8;
  return;
}
END DECOMPILED REFERENCE */
