/// @description FNAFN Obj_Menu_Fade / Step_0 — PORTED from C (rebuilt 2026-10-01)
// Ground truth: gml_Object_Obj_Menu_Fade_Step_0 (544 B @0x14006bd30)
// Decoded, in order (uStack_90 = 1 / 3 / 5 are GML line markers):
//   1. global fetch `delta_factor` (id 0x1870b, +8 on the global context).
//   2. line 1: read image_alpha (slot uRam00000001405c7b98 — registry name
//      @0x1405c7b90, EXE-REGISTRY.md; NOT `fading`) via op helper
//      func_0x00014015f1a0; multiply 0.0065 (0x3f7a9fbe76c8b439) by
//      delta_factor (func_0x0001400053f0 = MUL); subtract from image_alpha
//      (func_0x00014000bdb0 = SUB op helper); write back
//      (func_0x000140160140).
//   3. line 3: re-read image_alpha (op helper), 3-way compare against 0
//      (func_0x00014015be60, flags=1). Branch taken when
//      (iVar1 != -2) && (iVar1 < 0)  =>  image_alpha < 0 exactly
//      (== 0 does NOT branch; incomparable does NOT branch).
//   4. line 5: instance_destroy() — helper func_0x00014017c070(self, other,
//      0, 0) (PROVEN 2026-10-06 by disassembly: it iterates instances with
//      scope -1 = self and fires event types 1 (ev_destroy) and 12
//      (ev_cleanup) through the same event-fire routine used by
//      event_perform). The old "room_goto_next()" best-fit guess was wrong
//      — the fade controller simply removes itself once the fade completes.
// CORRECTIONS vs the old port: variable is image_alpha (registry), the
// branch is strictly < 0 (not <=), and the C contains NO zero-clamp
// assignment inside the branch (the old `fading = 0;` line was invented).
image_alpha -= 0.0065 * delta_factor;
if (image_alpha < 0) {
    instance_destroy();
}

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Menu_Fade_Step_0  va=0x14006bd30  size=544 ====

void gml_Object_Obj_Menu_Fade_Step_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uStack_a0;
  undefined *puStack_98;
  undefined4 uStack_90;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_98 = &UNK_14043b106 / * "gml_Object_Obj_Menu_Fade_Step_0" * /;
  uStack_90 = 0;
  uStack_a0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b / * delta_factor * /);
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_90 = 1;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_48,0,0);
  uStack_2c = 0;
  uStack_38 = 0x3f7a9fbe76c8b439;
  func_0x0001400053f0(&uStack_38,uVar2);
  func_0x00014000bdb0(&uStack_48,&uStack_38);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_48);
  uStack_90 = 3;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_48,0,0);
  uStack_2c = 0;
  uStack_38 = 0;
  iVar1 = func_0x00014015be60(&uStack_48,&uStack_38,uRam00000001405cd9c0,1);
  if ((iVar1 != -2) && (iVar1 < 0)) {
    uStack_90 = 5;
    func_0x00014017c070(param_1,param_2,0,0);
  }
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
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a0;
  return;
}
END DECOMPILED REFERENCE */
