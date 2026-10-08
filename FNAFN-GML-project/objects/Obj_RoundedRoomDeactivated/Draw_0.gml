/// @description FNAFN Obj_RoundedRoomDeactivated / Draw — PORTED from C
// Ground truth: gml_Object_Obj_RoundedRoomDeactivated_Draw_75 (581 B @0x140088f50)
// Manual compositor (compare Obj_RoundedRoom/Draw, postprocess/Create which
// disables auto-draw):
//   func_0x000140185890(6) — TODO(identity): same family as RoundedRoom's
//     185890(7) / 185840() pair (likely shader set/reset for rounded mask).
//   draw_surface(application_surface, 0, 0) — slot 0x1405c8ab0 = draw_surface
//     (registry), application_surface = slot 0x1405c7ba8; x/y consts
//     @0x140655c48 live in guarded pool (TODO(calibrate), likely 0).
//   func_0x000140185840() — TODO(identity, pair of above).
// TODO: prove 185890/185840 (shader?) via disassembly like draw_set_halign.
draw_surface(application_surface, 0, 0); // TODO: confirm x/y consts + 185890(6)/185840() wrappers

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_RoundedRoomDeactivated_Draw_75(undefined8 param_1,undefined8 param_2)

{
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
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
  uint uStack_4c;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  undefined8 uStack_30;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043b52b;
  uStack_b0 = 0;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_30._4_4_ = 0xffffff;
  uStack_38 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uRam0000000140657680 = param_1;
  func_0x000140185890(6);
  uStack_b0 = 2;
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  uStack_38 = 0;
  uStack_30 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7ba8,0x80000000,&uStack_48);
  func_0x000140001490(&uStack_78,&uStack_48);
  puStack_d8 = &uStack_78;
  func_0x00014000bee0(&uStack_68,0x140655c48);
  puStack_d0 = &uStack_68;
  func_0x00014000bee0(&uStack_58,0x140655c48);
  puStack_c8 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_38,3,uRam00000001405c8ab0,&puStack_d8);
  uStack_b0 = 3;
  func_0x000140185840();
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_30._4_4_ & 0x1f) & 1) != 0) {
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
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */
