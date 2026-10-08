/// @description FNAFN Obj_Night_1_5_Freddy_AI / Draw — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_1_5_Freddy_AI / Draw
draw_sprite_ext(Spr_Night_UI_Freddy_Alert, image_index, Freddy_warning_x, Freddy_warning_y, 0.85, 0.85, 0, c_white, button_alpha);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_1_5_Freddy_AI_Draw_0(longlong *param_1)

{
  uint uVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  undefined8 uVar8;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 uVar12;
  double dVar9;
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
  double dStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_d0 = &UNK_14043c988;
  uStack_d8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d8;
  uStack_64 = 0xffffff;
  dStack_70 = 0.0;
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
  uStack_c8 = 2;
  plRam0000000140657680 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18720);
  puVar3 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18721);
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x186ea);
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&dStack_70,
                      in_stack_fffffffffffffef8 & 0xffffff00,in_stack_ffffffffffffff00 & 0xffffff00)
  ;
  if ((*(uint *)((longlong)puVar4 + 0xc) & 0xffffff) == 0) {
    uVar5 = (undefined4)*puVar4;
    uVar10 = (undefined4)((ulonglong)*puVar4 >> 0x20);
    uVar1 = *(uint *)((longlong)puVar3 + 0xc);
  }
  else {
    uVar8 = func_0x00014012d320(puVar4);
    uVar5 = (undefined4)uVar8;
    uVar10 = (undefined4)((ulonglong)uVar8 >> 0x20);
    uVar1 = *(uint *)((longlong)puVar3 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    uVar6 = (undefined4)*puVar3;
    uVar11 = (undefined4)((ulonglong)*puVar3 >> 0x20);
    uVar1 = *(uint *)((longlong)puVar2 + 0xc);
  }
  else {
    uVar8 = func_0x00014012d320(puVar3);
    uVar6 = (undefined4)uVar8;
    uVar11 = (undefined4)((ulonglong)uVar8 >> 0x20);
    uVar1 = *(uint *)((longlong)puVar2 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    uVar7 = (undefined4)*puVar2;
    uVar12 = (undefined4)((ulonglong)*puVar2 >> 0x20);
    dVar9 = dStack_70;
  }
  else {
    uVar8 = func_0x00014012d320(puVar2);
    uVar7 = (undefined4)uVar8;
    uVar12 = (undefined4)((ulonglong)uVar8 >> 0x20);
    dVar9 = dStack_70;
  }
  dStack_70 = dVar9;
  if ((uStack_64 & 0xffffff) != 0) {
    dVar9 = (double)func_0x00014012d320(&dStack_70);
  }
  func_0x0001401755c0(param_1,99,(longlong)dVar9,(float)(double)CONCAT44(uVar12,uVar7),
                      (float)(double)CONCAT44(uVar11,uVar6),0x3f59999a,0x3f59999a,0,0xffffff,
                      (float)(double)CONCAT44(uVar10,uVar5));
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
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_70);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d8;
  return;
}
END DECOMPILED REFERENCE */