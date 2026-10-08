/// @description FNAFN Obj_Menu_Main_Music / Mouse_4 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_4  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_4 — PORTED from C ----
// ground truth: gml_Object_Obj_Menu_Main_Music_Mouse_4 (1112 B @0x1400ed420)
// line 1: instance_create_layer(640, 360, "Main_menu", 54) — exe consts
//   @0x1405c5cc8 = 640.0, @0x1405c5cd8 = 360.0, @0x1405c5cb8 = "Main_menu",
//   @0x1405c5ce8 = 54.0 = Obj_Menu_Radio_Cassette (obj_names.json);
//   slot 0x1405c8d90 = instance_create_layer (EXE-REGISTRY.md).
// lines 2/4/6/8/11 are GML line markers: two with-destroy loops
// (repeat const 63.0 = Obj_Menu_Main_Title, 76.0 = Obj_Menu_Main_Options;
// PROVEN with() shape + instance_destroy helper 0x14017c070) + self
// instance_destroy().
// Ported: Obj_Menu_Main_Music / Mouse_4
instance_create_layer(640, 360, "Main_menu", Obj_Menu_Radio_Cassette);
with (Obj_Menu_Main_Title) { instance_destroy(); }
with (Obj_Menu_Main_Options) { instance_destroy(); }
instance_destroy();

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Music_Mouse_4(undefined8 param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined auStack_138 [16];
  longlong lStack_128;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
  longlong lStack_b8;
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
  undefined8 uStack_50;
  undefined *puStack_48;
  undefined4 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_48 = &UNK_14043cf0a;
  uStack_50 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_50;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_40 = 1;
  uStack_d8 = 0;
  uStack_d0 = 0x500000000;
  uRam0000000140657680 = param_1;
  uStack_38 = param_2;
  uStack_30 = param_1;
  func_0x00014000bee0(&uStack_98,0x1405c5cc8);
  puStack_158 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x1405c5cd8);
  puStack_150 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c5cb8);
  puStack_148 = &uStack_78;
  func_0x00014000bee0(&uStack_68,0x1405c5ce8);
  puStack_140 = &uStack_68;
  func_0x0001401445d0(uStack_30,uStack_38,&uStack_d8,4,uRam00000001405c8d90,&puStack_158);
  uStack_40 = 2;
  uStack_bc = 0;
  uStack_c8 = 0x404f800000000000;
  iVar2 = func_0x000140144bd0(auStack_138,&uStack_30,&uStack_38,&uStack_c8);
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if (0 < iVar2) {
    do {
      uStack_40 = 4;
      func_0x00014017c070(uStack_30,uStack_38,0,0);
      cVar1 = func_0x0001401451f0(auStack_138,&uStack_30);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_138,&uStack_30,&uStack_38);
  uStack_40 = 6;
  uStack_9c = 0;
  uStack_a8 = 0x4053000000000000;
  iVar2 = func_0x000140144bd0(&uStack_c8,&uStack_30,&uStack_38,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if (0 < iVar2) {
    do {
      uStack_40 = 8;
      func_0x00014017c070(uStack_30,uStack_38,0,0);
      cVar1 = func_0x0001401451f0(&uStack_c8,&uStack_30);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(&uStack_c8,&uStack_30,&uStack_38);
  uStack_40 = 0xb;
  func_0x00014017c070(uStack_30,uStack_38,0,0);
  if (lStack_b8 != 0) {
    func_0x00014012ec70();
    lStack_b8 = 0;
  }
  if (lStack_128 != 0) {
    func_0x00014012ec70();
    lStack_128 = 0;
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_50;
  return;
}
END DECOMPILED REFERENCE */