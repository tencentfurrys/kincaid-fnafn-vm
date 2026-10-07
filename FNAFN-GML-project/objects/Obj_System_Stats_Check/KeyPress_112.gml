/// @description FNAFN Obj_System_Stats_Check / KeyPress_112 - PORTED from C
// ---- sub-event KeyPress_112 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_System_Stats_Check_KeyPress_112 (560 B @0x14011c150)
// Decoded (uStack_c0 = 1,4 are the original GML line markers):
//   `tex_filter_toggle = !tex_filter_toggle` [`tex_filter_toggle`
//   (0x18784), same bool-negation shape as KeyPress_16]; then
//   gpu_set_tex_filter(tex_filter_toggle) [slot 0x1405c8a30, 1-arg call].
// Reading: F1 toggles GPU texture filtering at runtime.
tex_filter_toggle = !tex_filter_toggle;
gpu_set_tex_filter(tex_filter_toggle);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_System_Stats_Check_KeyPress_112(longlong *param_1,undefined8 param_2)

{
  byte bVar1;
  double *pdVar2;
  undefined8 *puStack_d8;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  
  uStack_38 = 0xfffffffffffffffe;
  puStack_c8 = &UNK_14043dae6;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_40 = CONCAT44(0xffffff,(undefined4)uStack_40);
  uStack_48 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_c0 = 1;
  plRam0000000140657680 = param_1;
  pdVar2 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18784);
  bVar1 = func_0x00014012bb70(pdVar2);
  if ((0x46U >> (*(uint *)((longlong)pdVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar2);
  }
  *(undefined4 *)((longlong)pdVar2 + 0xc) = 0;
  *pdVar2 = (double)(uint)(bVar1 ^ 1);
  uStack_c0 = 4;
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  func_0x000140001490(&uStack_58,pdVar2);
  puStack_d8 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8a30,&puStack_d8);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return;
}
END DECOMPILED REFERENCE */
