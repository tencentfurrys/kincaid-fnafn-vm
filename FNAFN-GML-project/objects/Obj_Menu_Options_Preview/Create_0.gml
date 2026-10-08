/// @description FNAFN Obj_Menu_Options_Preview / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Preview_Create_0 (@0x1400b45a0)
// Decoded, in order (uStack_40 = 2..8 are GML line markers):
//   1. `text` (id 0x18785 — builtin_ids.json) = string constant @0x1406567dc
//      via the string-assign helper func_0x0001401441e0.
//      TODO(calibrate): 0x1406567dc is in the exe's runtime-patched RValue
//      area (VA unmapped on disk) — likely a settings label like
//      "windowed"/"fullscreen"; confirm in-game.
//   2. `arrow_surface` (id 0x186e3 — builtin_ids.json) = -1
//      (0xbff0000000000000; same -1 surface sentinel as Menu_Pause Create).
//   3. `select` (id 0x1876a) = 0.
//   4. image_alpha (slot uRam00000001405c7b98 — registry @0x1405c7b90)
//      = 0 via assignment helper func_0x000140160140.
//   5. `arrow_alpha` (id 0x186e1) = 0.
//   6. `select_min` (id 0x1876c) = 0.
//   7. `select_max` (id 0x1876b) = 0.
// => options-preview entry starts hidden with its selector clamped to a
//    0..0 range until its Alarm event seeds the real values.
text = "<runtime const 0x1406567dc>"; // TODO(calibrate): see header
arrow_surface = -1;
select = 0;
image_alpha = 0;
arrow_alpha = 0;
select_min = 0;
select_max = 0;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Options_Preview_Create_0(longlong *param_1)

{
  longlong lVar1;
  undefined8 *puVar2;
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
  undefined *puStack_48;
  undefined4 uStack_40;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_48 = &UNK_14043c793;
  uStack_40 = 0;
  uStack_50 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_50;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  plRam0000000140657680 = param_1;
  lVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18785);
  if ((0x46U >> (*(uint *)(lVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar1);
  }
  func_0x0001401441e0(lVar1,0x1406567dc);
  uStack_40 = 2;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e3);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0xbff0000000000000;
  uStack_40 = 3;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0;
  uStack_40 = 4;
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  uStack_2c = 0;
  uStack_38 = 0;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_38);
  uStack_40 = 5;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0;
  uStack_40 = 6;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876c);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0;
  uStack_40 = 8;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876b);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0;
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  puRam0000000140657668 = (undefined8 *)uStack_50;
  return;
}
END DECOMPILED REFERENCE */
