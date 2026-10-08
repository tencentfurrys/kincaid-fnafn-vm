/// @description FNAFN Obj_Menu_Options / Destroy_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Destroy_0 (1406 B @0x140076350)
// Globals fetched: game_settings (0x18727, +8 on the runner context).
// Decoded, in order (uStack_78 = 1/2/3/4/6/8/10 are GML line markers):
//   1. line 1: 1-arg call, slot uRam00000001405c8bf0 (REGISTRY-CONFIRMED
//      instance_deactivate_object), arg = exe const 0x1405c4500 (= 50.0 --
//      an object index; the exe has no resource-name table, so the source
//      object name is unknown offline).
//   2. line 2: 2-arg call, slot uRam00000001405c8b50 (REGISTRY-CONFIRMED
//      display_reset), args = game_settings[3] then game_settings[2]
//      (each indexed with an array bounds check via the standard helpers).
//   3. line 3: 1-arg call, slot uRam00000001405c8b60 (REGISTRY-CONFIRMED
//      window_set_fullscreen), arg = game_settings[1].
//   4. line 4-6: with() block over object 46 (helpers
//      func_0x000140144bd0/0x0001401451f0/0x0001401449f0; its "repeat
//      const" 0x4047000000000000 = 46.0 is the OBJECT INDEX
//      46 = Obj_Menu_Options_Preview, NOT a loop count — proven
//      2026-10-06). Body = instance_destroy() (func_0x00014017c070(self,
//      other, 0, 0): scope -1 = self, fires ev_destroy + ev_cleanup).
//      Reading: leaving the options screen destroys every options-preview
//      instance the screen had spawned.
//   5. line 8: read room (slot uRam00000001405c7b38) and compare == 4.0
//      (0x4010000000000000). Branch when equal.
//   6. line 10: 2-arg call, slot uRam00000001405c8ed0 (REGISTRY-CONFIRMED
//      object_set_visible), args = exe consts 0x1405c4510 (= 48.0, object
//      index) and 0x1405c4520 (= 1.0).
// Reading: leaving the options screen deactivates a system object, applies
// the saved display/fullscreen settings, destroys every options-preview
// instance, and (only in room 4) re-shows object 48.
// RESOLVED 2026-10-06 via obj_names.json: 50 = Obj_Menu_Options_Icons,
// 48 = Obj_Menu_Pause.
// TODO(calibrate): display_reset is documented 0-arg in GMS2 but the C
// stages 2 args -- the source may have passed settings the runner ignores.
instance_deactivate_object(Obj_Menu_Options_Icons);
display_reset(game_settings[3], game_settings[2]);
window_set_fullscreen(game_settings[1]);
with (Obj_Menu_Options_Preview) {
    instance_destroy();
}
if (room == 4) {
    object_set_visible(Obj_Menu_Pause, 1);
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Options_Destroy_0(undefined8 param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined4 uVar3;
  longlong *plVar4;
  longlong *plVar5;
  undefined auStack_118 [16];
  longlong lStack_108;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043b3cb;
  uStack_78 = 0;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uRam0000000140657680 = param_1;
  uStack_60 = param_2;
  uStack_58 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_78 = 1;
  uStack_50 = 0;
  uStack_48 = 0x500000000;
  func_0x00014000bee0(&uStack_a8,0x1405c4500);
  puStack_c8 = &uStack_a8;
  func_0x0001401445d0(uStack_58,uStack_60,&uStack_50,1,uRam00000001405c8bf0,&puStack_c8);
  uStack_78 = 2;
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_50 = 0;
  uStack_48 = 0x500000000;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 4) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,3,uVar3);
      plVar5 = (longlong *)0x0;
    }
    else {
      plVar5 = (longlong *)func_0x000140147980(*plVar4,3);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar5 = plVar4;
  }
  func_0x000140001490(&uStack_a8,plVar5);
  puStack_c8 = &uStack_a8;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 3) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,2,uVar3);
      plVar5 = (longlong *)0x0;
    }
    else {
      plVar5 = (longlong *)func_0x000140147980(*plVar4,2);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar5 = plVar4;
  }
  func_0x000140001490(&uStack_98,plVar5);
  puStack_c0 = &uStack_98;
  func_0x0001401445d0(uStack_58,uStack_60,&uStack_50,2,uRam00000001405c8b50,&puStack_c8);
  uStack_78 = 3;
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_50 = 0;
  uStack_48 = 0x500000000;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plVar4);
    if (iVar2 < 2) {
      uVar3 = func_0x000140147990(*plVar4);
      func_0x000140144260(&UNK_140439ca6,1,uVar3);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  func_0x000140001490(&uStack_a8,plVar4);
  puStack_c8 = &uStack_a8;
  func_0x0001401445d0(uStack_58,uStack_60,&uStack_50,1,uRam00000001405c8b60,&puStack_c8);
  uStack_78 = 4;
  uStack_64 = 0;
  uStack_70 = 0x4047000000000000;
  iVar2 = func_0x000140144bd0(auStack_118,&uStack_58,&uStack_60,&uStack_70);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (0 < iVar2) {
    do {
      uStack_78 = 6;
      func_0x00014017c070(uStack_58,uStack_60,0,0);
      cVar1 = func_0x0001401451f0(auStack_118,&uStack_58);
    } while (cVar1 != '\0');
  }
  func_0x0001401449f0(auStack_118,&uStack_58,&uStack_60);
  uStack_78 = 8;
  func_0x00014015ef90(uStack_58,uRam00000001405c7b38,0x80000000,&uStack_b8);
  uStack_64 = 0;
  uStack_70 = 0x4010000000000000;
  iVar2 = func_0x00014015be60(&uStack_b8,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_78 = 10;
    if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_50);
    }
    uStack_50 = 0;
    uStack_48 = 0x500000000;
    func_0x00014000bee0(&uStack_a8,0x1405c4510);
    puStack_c8 = &uStack_a8;
    func_0x00014000bee0(&uStack_98,0x1405c4520);
    puStack_c0 = &uStack_98;
    func_0x0001401445d0(uStack_58,uStack_60,&uStack_50,2,uRam00000001405c8ed0,&puStack_c8);
  }
  if (lStack_108 != 0) {
    func_0x00014012ec70();
    lStack_108 = 0;
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */
