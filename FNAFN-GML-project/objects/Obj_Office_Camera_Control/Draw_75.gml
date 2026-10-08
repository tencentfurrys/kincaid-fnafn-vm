/// @description FNAFN Obj_Office_Camera_Control / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Office_Camera_Control_Draw_75 (425 B @0x14004a460)
// Fullscreen fade overlay, window-sized (compare Obj_Menu_Fade/Draw which
// uses constants 1280x720):
//   fade_alpha (id 0x18718) read by id-fetch,
//   window_get_height() = slot 0x1405c8d10, window_get_width() = slot
//     0x1405c8d00 (EXE-REGISTRY.md) — both 0-arg calls,
//   draw_sprite_ext(Spr_UI_Fade_Black, 0, 0, 0, window_get_width(),
//     window_get_height(), 0, c_black, fade_alpha).
//   - sprite 0x55 = 85 = SPRT index 85 = Spr_UI_Fade_Black (sprite_names.json,
//     PROVEN 2026-10-06 — same 1px overlay as Fade/Shift_End).
//   - xscale = window_get_width(), yscale = window_get_height()
//     (CONCAT44(uVar9=0, float) shape = f32 of the call results).
//   - colour 0 = c_black, alpha = fade_alpha.
draw_sprite_ext(Spr_UI_Fade_Black, 0, 0, 0, window_get_width(), window_get_height(), 0, c_black, fade_alpha);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Camera_Control_Draw_75(longlong *param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  double *pdVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  undefined4 uVar7;
  undefined4 uVar8;
  double dVar6;
  undefined4 uVar9;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043a81c;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_78 = 6;
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  plRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18718);
  if ((*(uint *)((longlong)puVar1 + 0xc) & 0xffffff) == 0) {
    uVar3 = (undefined4)*puVar1;
    uVar7 = (undefined4)((ulonglong)*puVar1 >> 0x20);
  }
  else {
    uVar5 = func_0x00014012d320(puVar1);
    uVar3 = (undefined4)uVar5;
    uVar7 = (undefined4)((ulonglong)uVar5 >> 0x20);
  }
  puVar1 = (undefined8 *)func_0x0001401445d0(param_1,param_2,&uStack_60,0,uRam00000001405c8d10,0);
  if ((*(uint *)((longlong)puVar1 + 0xc) & 0xffffff) == 0) {
    uVar4 = (undefined4)*puVar1;
    uVar8 = (undefined4)((ulonglong)*puVar1 >> 0x20);
  }
  else {
    uVar5 = func_0x00014012d320(puVar1);
    uVar4 = (undefined4)uVar5;
    uVar8 = (undefined4)((ulonglong)uVar5 >> 0x20);
  }
  uVar9 = 0;
  pdVar2 = (double *)func_0x0001401445d0(param_1,param_2,&uStack_70,0,uRam00000001405c8d00,0);
  if ((*(uint *)((longlong)pdVar2 + 0xc) & 0xffffff) == 0) {
    dVar6 = *pdVar2;
  }
  else {
    dVar6 = (double)func_0x00014012d320(pdVar2);
  }
  func_0x0001401755c0(param_1,0x55,0,0,0,CONCAT44(uVar9,(float)dVar6),
                      (float)(double)CONCAT44(uVar8,uVar4),0,0,(float)(double)CONCAT44(uVar7,uVar3))
  ;
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */
