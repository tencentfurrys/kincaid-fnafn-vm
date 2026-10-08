/// @description FNAFN Obj_Night_UI_Camera_Button / Create - PORTED from C
// PORTED from C
// Ground truth: gml_Object_Obj_Night_UI_Camera_Button_Create_0 (1821 B @0x140061eb0)
// Decoded (uStack_48 = 0..22 are the original GML line markers):
//   line 1: if (game[0] == <runtime @0x140655770>) [global `game` (0x18724),
//     array-index [0] via the 1479b0/7990/7980 shape; equality via the
//     (compare-result | flags) == 0 shape; the const is BSS, so the exact
//     value is a TODO(calibrate) — assumed 0 below].
//   lines 3/4: power_threshold = 2.0 / 3.0 [raw 8-byte payloads @0x140439e68
//     (= 2.0) / @0x14043add0 (= 3.0), read via exe_strings.py].
//   lines 7-8: button_alpha[0] = 0.75; button_alpha[1] = 0.75;
//     [fetch 0x186ea + element-ref 0x14012b840 + write 0x3fe8... = 0.75].
//   line 9: button_index = 0; [0x186eb]
//   lines 10-11: button_toggle[0] = 0; button_toggle[1] = 0; [0x186ec]
//   line 12: button_y = 20; [0x186ed, 0x4034... = 20.0]
//   line 14: alert_alpha = 0; [0x186d9]
//   line 16: image_alpha = 0; [slot 0x1405c7b98 via 0x140160140]
//   lines 18-22: key_alpha[0..3] = 1; [0x1872d, 0x3ff0... = 1.0]
if (game[0] == 0 /* TODO(calibrate): runtime const @0x140655770 */) {
    power_threshold = 2;
} else {
    power_threshold = 3;
}
button_alpha[0] = 0.75;
button_alpha[1] = 0.75;
button_index = 0;
button_toggle[0] = 0;
button_toggle[1] = 0;
button_y = 20;
alert_alpha = 0;
image_alpha = 0;
key_alpha[0] = 1;
key_alpha[1] = 1;
key_alpha[2] = 1;
key_alpha[3] = 1;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_UI_Camera_Button_Create_0(longlong *param_1)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  longlong unaff_GS_OFFSET;
  undefined4 uVar7;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  longlong lStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined *puStack_50;
  undefined4 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_50 = &UNK_14043af74;
  uStack_48 = 0;
  uStack_58 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_58;
  plRam0000000140657680 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_48 = 1;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 1) {
      uVar3 = func_0x000140147990(*plVar4);
      plVar4 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_6c = *(uint *)((longlong)plVar4 + 0xc);
  uStack_70 = *(undefined4 *)(plVar4 + 1);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
    lStack_78 = *plVar4;
  }
  else {
    func_0x000140062860(&lStack_78,plVar4);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140655784) {
    func_0x0001403f6320(0x140655784);
    if (iRam0000000140655784 == -1) {
      uRam000000014065577c = 0;
      uRam0000000140655770 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_140062800);
      func_0x0001403f62c0(0x140655784);
    }
  }
  uVar2 = func_0x00014015be60(0x140655770,&lStack_78,uRam00000001405cd9c0,0);
  if ((uVar2 | uRam000000014065577c._4_4_) == 0) {
    uStack_48 = 3;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875b);
    uVar3 = (undefined4)_UNK_140439e68;
    uVar7 = (undefined4)((ulonglong)_UNK_140439e68 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
  }
  else {
    uStack_48 = 4;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875b);
    uVar3 = (undefined4)_UNK_14043add0;
    uVar7 = (undefined4)((ulonglong)_UNK_14043add0 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = CONCAT44(uVar7,uVar3);
  uStack_48 = 7;
  plRam0000000140657680 = (longlong *)0x2879c;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,0);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0x3fe8000000000000;
  func_0x000140141c50(2);
  uStack_48 = 8;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,1);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0x3fe8000000000000;
  func_0x000140141c50(2);
  uStack_48 = 9;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186eb);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_48 = 10;
  plRam0000000140657680 = (longlong *)0x2879d;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ec);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,0);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0;
  func_0x000140141c50(2);
  uStack_48 = 0xb;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ec);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,1);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0;
  func_0x000140141c50(2);
  uStack_48 = 0xc;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ed);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x4034000000000000;
  uStack_48 = 0xe;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d9);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_48 = 0x10;
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_5c = 0;
  uStack_68 = 0;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_68);
  uStack_48 = 0x12;
  plRam0000000140657680 = (longlong *)0x287a0;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,0);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  uStack_48 = 0x13;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,1);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  uStack_48 = 0x14;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,2);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  uStack_48 = 0x16;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1872d);
  func_0x000140141d00(param_1);
  puVar6 = (undefined8 *)func_0x00014012b840(puVar5,3);
  func_0x000140141d00(*puVar5);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0x3ff0000000000000;
  func_0x000140141c50(2);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_78);
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
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  puRam0000000140657668 = (undefined8 *)uStack_58;
  return;
}
END DECOMPILED REFERENCE */
