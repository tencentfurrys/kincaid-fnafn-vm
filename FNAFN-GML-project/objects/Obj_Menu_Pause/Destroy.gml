/// @description FNAFN Obj_Menu_Pause / Destroy_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Pause_Destroy_0 (929 B @0x1400d6570)
// Decoded, in order:
//   1. 1-arg call, funcid slot uRam00000001405c8c20 (high co-fetch with
//      arrow_surface/audio_surface/main_surface/video_surface/pause_surface
//      => a surface-free function; best fit surface_free), argument =
//      fetch(+8) of `pause_surface` (0x18752).
//   2. same callee, argument = `back_surface` (0x186e5).
//   3. with() block over object 49 (helpers func_0x000140144bd0/
//      0x0001401451f0/0x0001401449f0; the "repeat const"
//      0x4044800000000000 = 49.0 is the OBJECT INDEX 49 = Obj_RoundedRoom,
//      NOT a loop count — proven 2026-10-06). Body = instance_destroy()
//      (func_0x00014017c070(self, other, 0, 0): scope -1 = self, fires
//      ev_destroy + ev_cleanup).
//   4. second with() block over object 48 (const 0x4040000000000000 =
//      48.0 = Obj_Menu_Pause), same instance_destroy() body.
// Reading: closing the pause menu frees its surfaces, then destroys every
// RoundedRoom overlay instance and every Menu_Pause instance (including
// itself).
// TODO(calibrate): exact callee of slot 0x1405c8c20 (surface_free shape).
surface_free(pause_surface);
surface_free(back_surface);

with (Obj_RoundedRoom) {
    instance_destroy();
}
with (Obj_Menu_Pause) {
    instance_destroy();
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Pause_Destroy_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 uVar3;
  undefined auStack_108 [16];
  longlong lStack_f8;
  undefined8 *puStack_e8;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  longlong lStack_90;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined *puStack_68;
  undefined4 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  longlong *plStack_30;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_68 = &UNK_14043ca04 / * "gml_Object_Obj_Menu_Pause_Destroy_0" * /;
  uStack_70 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_70;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_60 = 1;
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  plRam0000000140657680 = param_1;
  uStack_38 = param_2;
  plStack_30 = param_1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18752 / * "pause_surface" * /);
  func_0x000140001490(&uStack_58,uVar3);
  puStack_e8 = &uStack_58;
  func_0x0001401445d0(plStack_30,uStack_38,&uStack_48,1,uRam00000001405c8c20,&puStack_e8);
  uStack_60 = 2;
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  uStack_48 = 0;
  uStack_40 = 0x500000000;
  uVar3 = (**(code **)(*plStack_30 + 8))(plStack_30,0x186e5 / * "back_surface" * /);
  func_0x000140001490(&uStack_58,uVar3);
  puStack_e8 = &uStack_58;
  func_0x0001401445d0(plStack_30,uStack_38,&uStack_48,1,uRam00000001405c8c20,&puStack_e8);
  uStack_60 = 3;
  uStack_94 = 0;
  uStack_a0 = 0x4044800000000000;
  iVar2 = func_0x000140144bd0(auStack_108,&plStack_30,&uStack_38,&uStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if (0 < iVar2) {
    do {
      uStack_60 = 5;
      func_0x00014017c070(plStack_30,uStack_38,0,0);
      cVar1 = func_0x0001401451f0(auStack_108,&plStack_30);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_108,&plStack_30,&uStack_38);
  uStack_60 = 7;
  uStack_74 = 0;
  uStack_80 = 0x4040000000000000;
  iVar2 = func_0x000140144bd0(&uStack_a0,&plStack_30,&uStack_38,&uStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if (0 < iVar2) {
    do {
      uStack_60 = 9;
      func_0x00014017c070(plStack_30,uStack_38,0,0);
      cVar1 = func_0x0001401451f0(&uStack_a0,&plStack_30);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(&uStack_a0,&plStack_30,&uStack_38);
  if (lStack_90 != 0) {
    func_0x00014012ec70();
    lStack_90 = 0;
  }
  if (lStack_f8 != 0) {
    func_0x00014012ec70();
    lStack_f8 = 0;
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puRam0000000140657668 = (undefined8 *)uStack_70;
  return;
}
END DECOMPILED REFERENCE */
