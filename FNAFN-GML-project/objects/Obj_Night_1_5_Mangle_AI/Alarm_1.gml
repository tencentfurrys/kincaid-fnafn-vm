/// @description FNAFN Obj_Night_1_5_Mangle_AI / Alarm_1 — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Mangle_AI_Alarm_1 (532 B @0x1400dd950)
// slot 0x1405c8c10 = audio_stop_all (0 args).
// global var 0x1872b 'Jumpscare' (global-scope fetch via *plRam...e080).
// string const @0x1405c5808 = "mangle" (inline .data string).
// numeric const @0x1405c5810 = 7.0 -> room 7 = Rm_Jumpscare.
audio_stop_all();
Jumpscare = "mangle";
room_goto(Rm_Jumpscare);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_1_5_Mangle_AI_Alarm_1(undefined8 param_1,undefined8 param_2)

{
  longlong lVar1;
  undefined8 *puStack_b8;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
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
  undefined8 uStack_40;
  undefined8 uStack_38;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043cc1b / * "gml_Object_Obj_Night_1_5_Mangle_AI_Alarm_1" * /;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uRam0000000140657680 = param_1;
  lVar1 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1872b / * Jumpscare * /);
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_a0 = 1;
  uStack_40 = 0;
  uStack_38 = 0x500000000;
  func_0x0001401445d0(param_1,param_2,&uStack_40,0,uRam00000001405c8c10,0);
  uStack_a0 = 2;
  if ((0x46U >> (*(uint *)(lVar1 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(lVar1);
  }
  func_0x0001401441e0(lVar1,0x1405c5808);
  uStack_a0 = 4;
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  uStack_40 = 0;
  uStack_38 = 0x500000000;
  func_0x00014000bee0(&uStack_58,0x1405c5810);
  puStack_b8 = &uStack_58;
  func_0x0001401445d0(param_1,param_2,&uStack_40,1,uRam00000001405c8cb0,&puStack_b8);
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
  if ((0x46U >> (uStack_38._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
