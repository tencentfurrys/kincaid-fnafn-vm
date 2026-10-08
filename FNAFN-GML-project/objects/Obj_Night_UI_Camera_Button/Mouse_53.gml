/// @description FNAFN Obj_Night_UI_Camera_Button / Mouse_53 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_53 — PORTED (one GML block above its reference
//  block; per-sub-event ---- header marked PORTED)

// ---- sub-event Mouse_53 — PORTED from C ----
// ground truth: gml_Object_Obj_Night_UI_Camera_Button_Mouse_53 (612 B @0x140066cc0)
// Decoded, in order (uStack_68 = GML line markers). Slot per
// EXE-REGISTRY.md: 0x1405c7bd8 = mouse_y (fast-path read 0x14015ef90).
// Id per builtin_ids.json: 0x18749 Night_recording. Helper per PORTING.md:
// func_0x000140181c50(self, other, 9, N) = event_perform(ev_keypress, N),
// TYPE 9 = ev_keypress, N = 0x57 (87, W) / 0x53 (83, S). Compare per
// PORTING.md calibration: `iVar1 < 0` = `<`, `0 < iVar1` = `>`,
// `iVar1 == 0` = `==`.
//   1. if (mouse_y < 55.0 (0x404b800000000000 literal)) {
//        if (Night_recording == 0) event_perform(ev_keypress, 87); }
//   2. if (mouse_y > 635.0 (0x4083d80000000000 literal)) {
//        if (Night_recording == 0) event_perform(ev_keypress, 83); }
// No 0x14065xxxx/0x1405c3xxx consts — all constants are literals.
// Ported: Obj_Night_UI_Camera_Button / Mouse_53
if (mouse_y < 55) {
    if (Night_recording == 0) {
        event_perform(ev_keypress, 87);
    }
}
if (mouse_y > 635) {
    if (Night_recording == 0) {
        event_perform(ev_keypress, 83);
    }
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_UI_Camera_Button_Mouse_53(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined *puStack_70;
  undefined4 uStack_68;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  undefined4 uStack_44;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_70 = &UNK_14043afd0;
  uStack_68 = 0;
  uStack_78 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_78;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_68 = 1;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_60);
  uStack_44 = 0;
  uStack_50 = 0x404b800000000000;
  uVar3 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(&uStack_60,&uStack_50,uVar3,1);
  if ((iVar1 != -2) && (iVar1 < 0)) {
    uStack_44 = 0;
    uStack_50 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_50,uVar3,0);
    if (iVar1 == 0) {
      uStack_68 = 3;
      func_0x000140181c50(param_1,param_2,9,0x57);
    }
  }
  uStack_68 = 6;
  func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_60);
  uStack_44 = 0;
  uStack_50 = 0x4083d80000000000;
  uVar3 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(&uStack_60,&uStack_50,uVar3,1);
  if (0 < iVar1) {
    uStack_44 = 0;
    uStack_50 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_50,uVar3,0);
    if (iVar1 == 0) {
      uStack_68 = 8;
      func_0x000140181c50(param_1,param_2,9,0x53);
    }
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
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  puRam0000000140657668 = (undefined8 *)uStack_78;
  return;
}
END DECOMPILED REFERENCE */