/// @description FNAFN Obj_Menu_Disclaimer / KeyPress_1 (any key) — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Disclaimer_KeyPress_1 (418 B @0x1400f2740)
// Decoded (CORRECTED 2026-10-01: slot uRam00000001405c7b98 = image_alpha
// via EXE-REGISTRY.md name-pointer rule — NOT `fading`; the old note
// conflated variable id 0x18719 with the slot it feeds):
//   1. op-helper read of image_alpha (slot 0x1405c7b98, operand preset 0),
//      then 3-way compare against 0.5 (func_0x00014015be60; 0x3fe0...),
//      branch taken when 0 < result  =>  image_alpha > 0.5.
//   2. on branch: event service func_0x000140181c50(self, other, 2, 1) =
//      event_perform(ev_alarm, 1) (PROVEN 2026-10-06: 0x140181c50 tail-calls
//      the runner's event-fire routine with the standard GM event-type
//      constants; type 2 = ev_alarm). Alarm_1 of this object runs
//      surface_free(surface) + room_goto(1) => any key advances
//      Disclaimer -> Rm_Menu once the fade-in is far enough along.
if (image_alpha > 0.5) {
    event_perform(ev_alarm, 1);
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Disclaimer_KeyPress_1(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uStack_a8;
  undefined4 uStack_9c;
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
  puStack_90 = &UNK_14043d0be;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_24 = 0xffffff;
  uStack_30 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_88 = 1;
  uRam0000000140657680 = param_1;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_30,0,0);
  uStack_9c = 0;
  uStack_a8 = 0x3fe0000000000000;
  iVar1 = func_0x00014015be60(&uStack_30,&uStack_a8,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    uStack_88 = 3;
    func_0x000140181c50(param_1,param_2,2,1);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
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
  if ((0x46U >> (uStack_24 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_30);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */