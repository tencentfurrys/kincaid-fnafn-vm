/// @description FNAFN Obj_Camera_Static / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Camera_Static_Create_0 (@0x1400a92b0)
// Decoded, in order:
//   1. image_xscale (slot uRam00000001405c7c18 — registry name @0x1405c7c10,
//      EXE-REGISTRY.md) = 1.35 (0x3ff599999999999a), via the assignment
//      write helper func_0x000140160140.
//   2. image_yscale (slot uRam00000001405c7c08 — registry name @0x1405c7c00)
//      = image_xscale: the line-2 read helper func_0x00014015f1a0 READS
//      image_xscale (its result feeds the copy helper func_0x000140001490
//      and then the yscale write; the read semantics are proven by this
//      object's own Step event, where the same helper result feeds lerp's
//      first argument).
//   3. instance fetch `alpha` (id 0x186da — builtin_ids.json) and zero it
//      (write of 0; stored for the Step event's lerp target).
// Remaining func_0x000140001410 calls are RValue destructor/release noise;
// the puStack_90 save/restore is the self-context push/pop.
image_xscale = 1.35;
image_yscale = image_xscale;
alpha = 0;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Camera_Static_Create_0(longlong *param_1)

{
  undefined8 *puVar1;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  uint uStack_24;
  undefined8 uStack_20;
  
  uStack_20 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043b76a;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_24 = 0;
  uStack_30 = 0x3ff599999999999a;
  plRam0000000140657680 = param_1;
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_30);
  uStack_88 = 2;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_30,0,0);
  func_0x000140001490(&uStack_40,&uStack_30);
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_40);
  uStack_88 = 4;
  puVar1 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186da);
  if ((0x46U >> (*(uint *)((longlong)puVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar1);
  }
  *(undefined4 *)((longlong)puVar1 + 0xc) = 0;
  *puVar1 = 0;
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
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
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_24 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
