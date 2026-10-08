/// @description FNAFN Obj_Game_Over / KeyPress_13 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): KeyPress_13  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event KeyPress_13 — PORTED from C ----
// ground truth: gml_Object_Obj_Game_Over_KeyPress_13 (602 B @0x14006f980)
// line 1: instance_create_layer(<rt>, <rt>, "Fade", 2) — layer @0x1405c4208
//   = "Fade", obj @0x1405c4210 = 2.0 = Obj_Menu_Transition (obj_names.json);
//   slot 0x1405c8d90 = instance_create_layer (EXE-REGISTRY.md).
// line 3: Obj_Menu_Transition.Room_to_go_to = 1 (id 0x18760 via tag-2
//   object write helper 0x140160b90; 1 = Rm_Menu per room_names.json).
// Ported: Obj_Game_Over / KeyPress_13
instance_create_layer(0 /* TODO(calibrate): runtime const @0x140655940 */, 0 /* TODO(calibrate): runtime const @0x140655940 */, "Fade", Obj_Menu_Transition);
Obj_Menu_Transition.Room_to_go_to = 1; // Rm_Menu

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Game_Over_KeyPress_13(undefined8 param_1,undefined8 param_2)

{
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
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
  undefined8 uStack_70;
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
  puStack_b8 = &UNK_14043b263;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_b0 = 1;
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  uRam0000000140657680 = param_1;
  func_0x00014000bee0(&uStack_68,0x140655940);
  puStack_f8 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x140655940);
  puStack_f0 = &uStack_58;
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  func_0x0001401441e0(&uStack_48,0x1405c4208);
  puStack_e8 = &uStack_48;
  func_0x00014000bee0(&uStack_38,0x1405c4210);
  puStack_e0 = &uStack_38;
  func_0x0001401445d0(param_1,param_2,&uStack_78,4,uRam00000001405c8d90,&puStack_f8);
  uStack_b0 = 3;
  uStack_c8 = 0;
  uStack_d0 = 0x3ff0000000000000;
  func_0x000140160b90(2,0x18760,0x80000000,&uStack_d0);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */