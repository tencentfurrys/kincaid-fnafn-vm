/// @description FNAFN Obj_Menu_Static / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Static_Create_0 (1024 B @0x1400a9b80)
// Decoded, in order (uStack_58 values are GML source-line markers 2..12):
//   1. global fetch `game_settings` (id 0x18727, +8 on the global context).
//   2. instance fetch `alpha_current` (id 0x186db) and zero it (write of 0).
//   3. image_xscale (slot uRam00000001405c7c18 — registry name @0x1405c7c10,
//      EXE-REGISTRY.md) = 1.35 (0x3ff599999999999a), via the assignment
//      write helper func_0x000140160140.
//   4. image_yscale (slot uRam00000001405c7c08 — registry name @0x1405c7c00)
//      = image_xscale: line 3 READS image_xscale (func_0x00014015f1a0 is a
//      read/op-operand helper here — its result feeds the copy helper
//      func_0x000140001490 and then the yscale write; proven by
//      Obj_Camera_Static/Step where the same helper feeds lerp's argument).
//   5. string build of exe constant 0x1405c4da0 (func_0x0001401453a0 =
//      string format helper; exe_strings.py: the constant is "full").
//   6. game_settings[0] indexed (type==2 array guard + elem-0 fetch).
//   7. 3-way compare (func_0x00014015be60, uRam00000001405cd9c0 = runner
//      context) of game_settings[0] vs "full"; iVar==0 means EQUAL.
//   8a. EQUAL (fullscreen mode): animate_speed (id 0x186dd) = 0.35
//       (0x3fd6666666666666); image_alpha (slot uRam00000001405c7b98 —
//       registry name @0x1405c7b90) = alpha_current (fetch id 0x186db).
//   8b. NOT equal (windowed mode): animate_speed = 0; image_alpha = 0.
// The remaining func_0x000140001410 calls are RValue destructor/release
// noise; puStack_60/uStack_68 save/restore is the self-context push/pop.
alpha_current = 0;
image_xscale = 1.35;
image_yscale = image_xscale;

if (game_settings[0] == "full") {
    animate_speed = 0.35;
    image_alpha = alpha_current;
} else {
    animate_speed = 0;
    image_alpha = 0;
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Static_Create_0(longlong *param_1)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined auStack_88 [12];
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined *puStack_60;
  undefined4 uStack_58;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_60 = &UNK_14043be05;
  uStack_58 = 0;
  uStack_68 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_68;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  plRam0000000140657680 = param_1;
  plVar3 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186db);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_58 = 2;
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  uStack_44 = 0;
  uStack_50 = 0x3ff599999999999a;
  func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_50);
  uStack_58 = 3;
  func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_50,0,0);
  func_0x000140001490(&uStack_78,&uStack_50);
  func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_78);
  uStack_58 = 4;
  func_0x0001401453a0(auStack_88,0x1405c4da0);
  if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar3);
    if (iVar1 < 1) {
      uVar2 = func_0x000140147990(*plVar3);
      plVar3 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar2);
    }
    else {
      plVar3 = (longlong *)func_0x000140147980(*plVar3,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  iVar1 = func_0x00014015be60(plVar3,auStack_88,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_88);
  }
  if (iVar1 == 0) {
    uStack_58 = 0xb;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186dd);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0;
    uStack_58 = 0xc;
    if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_40);
    }
    uStack_34 = 0;
    uStack_40 = 0;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_40);
  }
  else {
    uStack_58 = 6;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186dd);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0x3fd6666666666666;
    uStack_58 = 7;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186db);
    func_0x000140001490(&uStack_40,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_40);
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
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  puRam0000000140657668 = (undefined8 *)uStack_68;
  return;
}
END DECOMPILED REFERENCE */
