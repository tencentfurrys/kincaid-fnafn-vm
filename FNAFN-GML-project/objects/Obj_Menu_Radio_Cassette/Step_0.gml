/// @description FNAFN Obj_Menu_Radio_Cassette / Step — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Radio_Cassette_Step_0
// Decoded, in order (uStack_70 = GML line markers):
//   1. arrow_size[0] = lerp(arrow_size[0], 1, 0.3 * delta_factor)
//      (id 0x186e2 arrow_size, element 0 via the length-check/index dance;
//      1.0 = exe const @0x1405c5b60; 0.3 = 0x3fd3333333333333 literal via
//      the PROVEN MUL helper func_0x0001400053f0 with delta_factor id
//      0x1870b; lerp = slot 0x1405c8cc0, registry).
//   2. arrow_size[1] = lerp(arrow_size[1], 1, 0.3 * delta_factor) (same,
//      element 1).
//   4. track_select switch (id 0x18794; 1.0 literal, 10.0 = 0x4024000000000000
//      literal; `<=` via `r < 1`, `>=` via `0 < r`, `==` via `r == 0` per
//      PORTING.md compare calibration):
//        if (track_select > 1 && track_select < 10):
//          arrow_alpha[0] = 1; arrow_alpha[1] = 1 (id 0x186e1);
//        else (track_select <= 1 || track_select >= 10):
//          if (track_select == 1): arrow_alpha[1] = 0.5; arrow_alpha[0] = 1;
//          if (track_select == 10): arrow_alpha[0] = 0.5; arrow_alpha[1] = 1.
//      (0.5 = 0x3fe0000000000000 literal; edge arrows dim the inactive side.)
// Ported: Obj_Menu_Radio_Cassette / Step
arrow_size[0] = lerp(arrow_size[0], 1, 0.3 * delta_factor);
arrow_size[1] = lerp(arrow_size[1], 1, 0.3 * delta_factor);
if (track_select > 1 && track_select < 10) {
    arrow_alpha[0] = 1;
    arrow_alpha[1] = 1;
} else {
    if (track_select == 1) {
        arrow_alpha[1] = 0.5;
        arrow_alpha[0] = 1;
    }
    if (track_select == 10) {
        arrow_alpha[0] = 0.5;
        arrow_alpha[1] = 1;
    }
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Radio_Cassette_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  longlong *plVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_80;
  undefined *puStack_78;
  undefined4 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043cde1;
  uStack_70 = 0;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  plRam0000000140657680 = param_1;
  uStack_c0 = param_2;
  uStack_c8 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_70 = 1;
  plRam0000000140657680 = (longlong *)0x287df;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  plVar3 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x186e2);
  if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar3);
    if (iVar1 < 1) {
      uVar2 = func_0x000140147990(*plVar3);
      func_0x000140144260(&UNK_140439ca6,0,uVar2);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar3,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar3;
  }
  func_0x000140001490(&uStack_b8,plVar4);
  puStack_128 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1405c5b60);
  uStack_4c = 0;
  uStack_58 = 0x3fd3333333333333;
  puStack_120 = &uStack_a8;
  func_0x0001400053f0(&uStack_58,uStack_c8);
  func_0x000140001490(&uStack_98,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puStack_118 = &uStack_98;
  uVar5 = func_0x0001401445d0(param_1,uStack_c0,&uStack_68,3,uRam00000001405c8cc0,&puStack_128);
  func_0x000140141d00(param_1);
  uVar6 = func_0x00014012b840(plVar3,0);
  func_0x000140141d00(*plVar3);
  func_0x000140001490(uVar6,uVar5);
  func_0x000140141c50(2);
  uStack_70 = 2;
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  plVar3 = (longlong *)(**(code **)(*param_1 + 0x10))(param_1,0x186e2);
  if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar3);
    if (iVar1 < 2) {
      uVar2 = func_0x000140147990(*plVar3);
      func_0x000140144260(&UNK_140439ca6,1,uVar2);
      plVar4 = (longlong *)0x0;
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar3,1);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    plVar4 = plVar3;
  }
  func_0x000140001490(&uStack_b8,plVar4);
  puStack_128 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x1405c5b60);
  uStack_4c = 0;
  uStack_58 = 0x3fd3333333333333;
  puStack_120 = &uStack_a8;
  func_0x0001400053f0(&uStack_58,uStack_c8);
  func_0x000140001490(&uStack_98,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puStack_118 = &uStack_98;
  uVar5 = func_0x0001401445d0(param_1,uStack_c0,&uStack_68,3,uRam00000001405c8cc0,&puStack_128);
  func_0x000140141d00(param_1);
  uVar6 = func_0x00014012b840(plVar3,1);
  func_0x000140141d00(*plVar3);
  func_0x000140001490(uVar6,uVar5);
  func_0x000140141c50(2);
  uStack_70 = 4;
  uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18794);
  uStack_4c = 0;
  uStack_58 = 0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar5,&uStack_58,uRam00000001405cd9c0,1);
  if (iVar1 < 1) {
code_r0x0001400e63d5:
    uStack_70 = 0xb;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18794);
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar5,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_70 = 0xd;
      plRam0000000140657680 = (longlong *)0x287b8;
      puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
      func_0x000140141d00(param_1);
      puVar8 = (undefined8 *)func_0x00014012b840(puVar7,1);
      func_0x000140141d00(*puVar7);
      if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar8);
      }
      *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
      *puVar8 = 0x3fe0000000000000;
      func_0x000140141c50(2);
      uStack_70 = 0xe;
      puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
      func_0x000140141d00(param_1);
      puVar8 = (undefined8 *)func_0x00014012b840(puVar7,0);
      func_0x000140141d00(*puVar7);
      if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar8);
      }
      *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
      *puVar8 = 0x3ff0000000000000;
      func_0x000140141c50(2);
    }
    uStack_70 = 0x10;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18794);
    uStack_4c = 0;
    uStack_58 = 0x4024000000000000;
    iVar1 = func_0x00014015be60(uVar5,&uStack_58,uRam00000001405cd9c0,0);
    if (iVar1 != 0) goto joined_r0x0001400e654a;
    uStack_70 = 0x12;
    puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
    func_0x000140141d00(param_1);
    puVar8 = (undefined8 *)func_0x00014012b840(puVar7,0);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar8);
    }
    *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
    *puVar8 = 0x3fe0000000000000;
    func_0x000140141c50(2);
    uStack_70 = 0x13;
    puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
    func_0x000140141d00(param_1);
    puVar7 = (undefined8 *)func_0x00014012b840(puVar8,1);
    func_0x000140141d00(*puVar8);
    if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar7);
    }
  }
  else {
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18794);
    uStack_4c = 0;
    uStack_58 = 0x4024000000000000;
    iVar1 = func_0x00014015be60(uVar5,&uStack_58,uRam00000001405cd9c0,1);
    if ((iVar1 == -2) || (-1 < iVar1)) goto code_r0x0001400e63d5;
    uStack_70 = 6;
    plRam0000000140657680 = (longlong *)0x287b8;
    puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
    func_0x000140141d00(param_1);
    puVar8 = (undefined8 *)func_0x00014012b840(puVar7,0);
    func_0x000140141d00(*puVar7);
    if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar8);
    }
    *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
    *puVar8 = 0x3ff0000000000000;
    func_0x000140141c50(2);
    uStack_70 = 7;
    puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
    func_0x000140141d00(param_1);
    puVar7 = (undefined8 *)func_0x00014012b840(puVar8,1);
    func_0x000140141d00(*puVar8);
    if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar7);
    }
  }
  *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
  *puVar7 = 0x3ff0000000000000;
  func_0x000140141c50(2);
joined_r0x0001400e654a:
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
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
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */
