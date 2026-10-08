/// @description FNAFN obj_OLDTVFilter_PresetBase / Draw — PORTED from C
// Ground truth: gml_Object_obj_OLDTVFilter_PresetBase_Draw_75 (515 B @0x1400980d0)
//   sprite_index (slot 0x1405c7be8, registry) = -1.0 (0xbff0000000000000)
//     via self-write helper — disables the default sprite draw.
//   script_execute(scr_OLDTVFilter_Draw) — slot 0x1405c8e50 = script_execute
//     (registry); arg is (double)iRam@0x1405c8f30 where 0x1405c8f30 =
//     gml_Script_scr_OLDTVFilter_Draw (EXE-REGISTRY.md).
sprite_index = -1;
script_execute(scr_OLDTVFilter_Draw);

/* BEGIN DECOMPILED REFERENCE
void gml_Object_obj_OLDTVFilter_PresetBase_Draw_75(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  double *pdStack_c8;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
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
  undefined8 uStack_50;
  double dStack_48;
  uint uStack_3c;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043b9ed;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_3c = 0xffffff;
  dStack_48 = 0.0;
  uStack_50._4_4_ = 0xffffff;
  uStack_58 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_b0 = 2;
  uStack_5c = 0;
  uStack_68 = 0xbff0000000000000;
  uRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_68);
  uStack_b0 = 4;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  iVar1 = iRam00000001405c8f30;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_48);
  }
  uStack_3c = 0;
  dStack_48 = (double)iVar1;
  pdStack_c8 = &dStack_48;
  func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8e50,&pdStack_c8);
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
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_48);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */
