/// @description FNAFN Obj_Menu_Night_Display / Create — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Night_Display_Create_0 (2451 B @0x140057b60)
// Night-splash setup: room-gated fade/alpha seeding, then a 6-way switch on
// game[0] (which night), then a timer-array reset. uStack_88 = 1..0x19 are
// GML line markers. Decoded in order:
//   1-4. if (room == 4) { fade = 1; alpha = 1; }: room read via
//      func_0x00014015ef90 on slot 0x1405c7b38 (registry room); const 4.0 =
//      0x4010000000000000 literal; compare via func_0x00014015be60, branch
//      on == 0; fade = id 0x18717, alpha = id 0x186da, both via the direct
//      +0x10 id-fetch write with 1.0 = 0x3ff0000000000000.
//   6-9. if (room == 5) { alpha = 1; fade = 0; }: same shape, const 5.0 =
//      0x4014000000000000 literal; second write is the literal 0.
//   0xc. game[0]: game = id 0x18724 via the +8 runner-global fetch, element
//      [0] via the length-check/index dance (func_0x0001401479b0/7990/7980,
//      cf. game_font[1] in Disclaimer/Draw).
//   Switch on game[0] against six guarded-pool consts @0x140655590 (1.0),
//      @0x1406555a4 (2.0), @0x1406555b8 (3.0), @0x1406555cc (4.0),
//      @0x1406555e0 (5.0), @0x1406555f4 (6.0) — values from the pool-init
//      block (uRam...5590 = 1.0, ...55a4 = 2.0, ...55b8 = 3.0, ...55cc = 4.0,
//      ...55e0 = 5.0, ...55f4 = 6.0); every address is outside the exe image:
//      TODO(calibrate) each case const. The label table at 0x1406555a0 feeds
//      the indirect jumptable at 0x1400587dc, which Ghidra could not recover
//      ("Too many branches"), so each per-night case body is unrecoverable
//      offline: TODO(calibrate) in-game (each case returns immediately after
//      its indirect call). Only the fall-through default is inline.
//   Default (game matches none of 1..6, or table index >= 6):
//      image_alpha = 0 via func_0x000140160140 on slot 0x1405c7b98
//      (registry image_alpha, SELF write); then for (i = 0; i < 12; i += 1)
//      Scr_Camera_Update[i] = -100 — bound 12.0 = 0x4028000000000000 literal,
//      Scr_Camera_Update = id 0x186d5 (ARRAY, PROVEN), sentinel -100 =
//      0xc059000000000000, direct +0x10 id-fetch array-write shape (cf.
//      Disclaimer/Step timer sweep; the closing type switch collapses to
//      i += 1 per PORTING.md).
// No 3D/camera/shader/3D-audio state here — plain menu Create.
if (room == 4) {
    fade = 1;
    alpha = 1;
}
if (room == 5) {
    alpha = 1;
    fade = 0;
}
switch (game[0]) {
    case 1: // TODO(calibrate): runtime const @0x140655590; body is jumptable target @0x1400587dc (unrecovered offline)
        break;
    case 2: // TODO(calibrate): runtime const @0x1406555a4; body is jumptable target @0x1400587dc
        break;
    case 3: // TODO(calibrate): runtime const @0x1406555b8; body is jumptable target @0x1400587dc
        break;
    case 4: // TODO(calibrate): runtime const @0x1406555cc; body is jumptable target @0x1400587dc
        break;
    case 5: // TODO(calibrate): runtime const @0x1406555e0; body is jumptable target @0x1400587dc
        break;
    case 6: // TODO(calibrate): runtime const @0x1406555f4; body is jumptable target @0x1400587dc
        break;
    default:
        image_alpha = 0;
        for (var i = 0; i < 12; i += 1) {
            Scr_Camera_Update[i] = -100;
        }
        break;
}
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Night_Display_Create_0(longlong *param_1)

{
  double dVar1;
  undefined8 uVar2;
  int iVar3;
  undefined4 uVar4;
  longlong *plVar5;
  undefined8 *puVar6;
  ulonglong uVar7;
  undefined8 *puVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined4 uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  longlong lStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043ab25;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  plRam0000000140657680 = param_1;
  plVar5 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0.0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_88 = 1;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_c8);
  uStack_cc = 0;
  uStack_d8 = 0x4010000000000000;
  iVar3 = func_0x00014015be60(&uStack_c8,&uStack_d8,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
    uStack_88 = 3;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18717);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x3ff0000000000000;
    uStack_88 = 4;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186da);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x3ff0000000000000;
  }
  uStack_88 = 6;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_c8);
  uStack_cc = 0;
  uStack_d8 = 0x4014000000000000;
  iVar3 = func_0x00014015be60(&uStack_c8,&uStack_d8,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
    uStack_88 = 8;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186da);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x3ff0000000000000;
    uStack_88 = 9;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18717);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0;
  }
  uStack_88 = 0xc;
  if (((*(uint *)((longlong)plVar5 + 0xc) & 0xffffff) == 2) && (*plVar5 != 0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*plVar5);
    if (iVar3 < 1) {
      uVar4 = func_0x000140147990(*plVar5);
      plVar5 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar4);
    }
    else {
      plVar5 = (longlong *)func_0x000140147980(*plVar5,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_9c = *(uint *)((longlong)plVar5 + 0xc);
  uStack_a0 = *(undefined4 *)(plVar5 + 1);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) == 0) {
    lStack_a8 = *plVar5;
  }
  else {
    func_0x000140058930(&lStack_a8,plVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655608) &&
     (func_0x0001403f6320(0x140655608), iRam0000000140655608 == -1)) {
    uRam000000014065559c = 0;
    uRam0000000140655590 = 0x3ff0000000000000;
    uRam00000001406555b0 = 0x100000000;
    uRam00000001406555a4 = 0x4000000000000000;
    uRam00000001406555c4 = 0x200000000;
    uRam00000001406555b8 = 0x4008000000000000;
    uRam00000001406555d8 = 0x300000000;
    uRam00000001406555cc = 0x4010000000000000;
    uRam00000001406555ec = 0x400000000;
    uRam00000001406555e0 = 0x4014000000000000;
    uRam0000000140655600 = 0x500000000;
    uRam00000001406555f4 = 0x4018000000000000;
    func_0x0001403f6668(&DAT_140058830);
    func_0x0001403f62c0(0x140655608);
  }
  uVar2 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar3 = func_0x00014015be60(0x140655590,&lStack_a8,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
code_r0x000140057f48:
    uVar7 = (ulonglong)*(uint *)(lVar9 * 0x14 + 0x1406555a0);
  }
  else {
    iVar3 = func_0x00014015be60(0x1406555a4,&lStack_a8,uVar2,0);
    if (iVar3 == 0) {
      lVar9 = 1;
      goto code_r0x000140057f48;
    }
    iVar3 = func_0x00014015be60(0x1406555b8,&lStack_a8,uVar2,0);
    if (iVar3 == 0) {
      uVar7 = uRam00000001406555c4 >> 0x20;
    }
    else {
      iVar3 = func_0x00014015be60(0x1406555cc,&lStack_a8,uVar2,0);
      uVar7 = uRam00000001406555d8;
      if ((iVar3 == 0) ||
         (iVar3 = func_0x00014015be60(0x1406555e0,&lStack_a8,uVar2,0), uVar7 = uRam00000001406555ec,
         iVar3 == 0)) {
        uVar7 = uVar7 >> 0x20;
      }
      else {
        iVar3 = func_0x00014015be60(0x1406555f4,&lStack_a8,uVar2,0);
        if (iVar3 != 0) goto code_r0x00014005813a;
        uVar7 = uRam0000000140655600 >> 0x20;
      }
    }
  }
  if (uVar7 < 6) {
                    // (Ghidra note) WARNING: Could not recover jumptable at 0x000140057f68. Too many branches
                    // (Ghidra note) WARNING: Treating indirect jump as call
    (*(code *)(&UNK_1400587dc + *(int *)(&UNK_1400587dc + uVar7 * 4)))();
    return;
  }
code_r0x00014005813a:
  uStack_88 = 0x15;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  uStack_ac = 0;
  uStack_b8 = 0;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_b8);
  uStack_88 = 0x19;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  dVar1 = _UNK_140439dd0;
  uStack_74 = 0;
  uStack_80 = 0.0;
  while( true ) {
    uStack_cc = 0;
    uStack_d8 = 0x4028000000000000;
    iVar3 = func_0x00014015be60(&uStack_80,&uStack_d8,uRam00000001405cd9c0,1);
    if ((iVar3 == -2) || (-1 < iVar3)) break;
    uStack_88 = 0x1b;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar4 = func_0x00014012cd90(&uStack_80);
    puVar8 = (undefined8 *)func_0x00014012b840(puVar6,uVar4);
    func_0x000140141d00(*puVar6);
    if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar8);
    }
    *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
    *puVar8 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_74 & 0xffffff) {
    case 1:
      uStack_80 = (double)func_0x00014012d320(&uStack_80);
      uStack_80 = uStack_80 + dVar1;
      uStack_74 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_80,&uStack_80);
      break;
    case 7:
      uStack_80 = (double)CONCAT44(uStack_80._4_4_,(int)uStack_80 + 1);
      break;
    case 10:
      uStack_80 = (double)((longlong)uStack_80 + 1);
      break;
    case 0xd:
      uStack_74 = 0;
    case 0:
      uStack_80 = uStack_80 + dVar1;
    }
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_a8);
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
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
