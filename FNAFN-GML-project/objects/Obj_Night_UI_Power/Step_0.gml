/// @description FNAFN Obj_Night_UI_Power / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_UI_Power_Step_0
// Power-bar opacity driver. power_bar_opacity (id 0x1875a) is an ARRAY —
// indexed 0/1/2 for the three bar segments (same as Create/Draw).
// Decoded control flow (line markers uStack_48 in parens):
//   (1) game[0] element read via the func_0x000140147980(array, index)
//     accessor idiom, compared (3-way helper 0x14015be60, r == 0 means ==)
//     against the runtime case const @0x140655630.
//   if branch (3-4,13): Night_power_amount (id 0x18748) = clamp(
//     Night_power_amount, <min @0x140655620>, 2.0) [slot 0x1405c8a00 = clamp
//     via EXE-REGISTRY.md; max @0x1405c3e10 = 2.0 via exe_strings.py]; then
//     a two-threshold dispatch on Night_power_amount (@0x140655650 /
//     @0x140655664) selects row 0/1 of the runtime table @0x140655660, and
//     the row value picks the opacity triple: 1 -> (1,1,1); 0 -> (1,0.25,0);
//     otherwise (0.25,0.25,0). No threshold matches -> (0.25,0.25,0).
//   else branch (14-15,28): same clamp with max 3.0 (@0x1405c3e20); then a
//     three-threshold dispatch (@0x140655680/@0x140655694/@0x1406556a8, plus
//     the @0x1406556b4 flag == 2 check) selects a row of the runtime table
//     @0x140655690: 2 -> (1,1,1); 1 -> (1,1,0.25); 0 -> (1,0.25,0.25);
//     otherwise (0.25,0.25,0.25).
// TODO(calibrate): every @0x14065xxxx const above lives in BSS (runtime-
//   populated switch tables, outside the mapped exe image), so the exact
//   threshold values must be confirmed in-game; the opacity triples and the
//   clamp bounds 2.0/3.0 are exact. Dropped: array bounds-check fallbacks,
//   one-shot BSS static-init guards, RValue destructors.
if (game[0] == 0 /* TODO(calibrate): case const @0x140655630 (BSS, unreadable offline) */) {
    Night_power_amount = clamp(Night_power_amount, 0 /* TODO(calibrate): min @0x140655620 (BSS) */, 2);
    var _sel_a = -1;
    if (Night_power_amount == 0 /* TODO(calibrate): case @0x140655650 (BSS) */) _sel_a = 0 /* TODO(calibrate): row of table @0x140655660 (BSS) */;
    else if (Night_power_amount == 0 /* TODO(calibrate): case @0x140655664 (BSS) */) _sel_a = 0 /* TODO(calibrate): row of table @0x140655660 (BSS) */;
    if (_sel_a == 1) {
        power_bar_opacity[0] = 1;
        power_bar_opacity[1] = 1;
        power_bar_opacity[2] = 1;
    } else if (_sel_a == 0) {
        power_bar_opacity[0] = 1;
        power_bar_opacity[1] = 0.25;
        power_bar_opacity[2] = 0;
    } else {
        power_bar_opacity[0] = 0.25;
        power_bar_opacity[1] = 0.25;
        power_bar_opacity[2] = 0;
    }
} else {
    Night_power_amount = clamp(Night_power_amount, 0 /* TODO(calibrate): min @0x140655620 (BSS) */, 3);
    var _sel_b = -1;
    if (Night_power_amount == 0 /* TODO(calibrate): case @0x140655680 (BSS) */) _sel_b = 0 /* TODO(calibrate): row of table @0x140655690 (BSS) */;
    else if (Night_power_amount == 0 /* TODO(calibrate): case @0x140655694 (BSS) */) _sel_b = 0 /* TODO(calibrate): row of table @0x140655690 (BSS) */;
    else if (Night_power_amount == 0 /* TODO(calibrate): case @0x1406556a8 (BSS) */) _sel_b = 0 /* TODO(calibrate): row of table @0x140655690 (BSS) */;
    if (_sel_b == 2) {
        power_bar_opacity[0] = 1;
        power_bar_opacity[1] = 1;
        power_bar_opacity[2] = 1;
    } else if (_sel_b == 1) {
        power_bar_opacity[0] = 1;
        power_bar_opacity[1] = 1;
        power_bar_opacity[2] = 0.25;
    } else if (_sel_b == 0) {
        power_bar_opacity[0] = 1;
        power_bar_opacity[1] = 0.25;
        power_bar_opacity[2] = 0.25;
    } else {
        power_bar_opacity[0] = 0.25;
        power_bar_opacity[1] = 0.25;
        power_bar_opacity[2] = 0.25;
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_UI_Power_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  longlong lVar8;
  longlong unaff_GS_OFFSET;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
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
  longlong lStack_88;
  undefined4 uStack_80;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined4 uStack_60;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined *puStack_50;
  undefined4 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_50 = &UNK_14043ac22;
  uStack_48 = 0;
  uStack_58 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_58;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  plRam0000000140657680 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  puVar5 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18748);
  uStack_70 = CONCAT44(0xffffff,(undefined4)uStack_70);
  uStack_78 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
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
  uStack_7c = *(uint *)((longlong)plVar4 + 0xc);
  uStack_80 = *(undefined4 *)(plVar4 + 1);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) == 0) {
    lStack_88 = *plVar4;
  }
  else {
    func_0x00014005ba90(&lStack_88,plVar4);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655644) &&
     (func_0x0001403f6320(0x140655644), iRam0000000140655644 == -1)) {
    uRam000000014065563c = 0;
    uRam0000000140655630 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_14005b8f0);
    func_0x0001403f62c0(0x140655644);
  }
  uVar2 = func_0x00014015be60(0x140655630,&lStack_88,uRam00000001405cd9c0,0);
  puStack_f0 = &uStack_a8;
  if ((uVar2 | uRam000000014065563c._4_4_) == 0) {
    uStack_48 = 3;
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_78 = 0;
    uStack_70 = 0x500000000;
    func_0x000140001490(&uStack_b8,puVar5);
    puStack_f8 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x140655620);
    func_0x00014000bee0(&uStack_98,0x1405c3e10);
    puStack_e8 = &uStack_98;
    uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_78,3,uRam00000001405c8a00,&puStack_f8);
    func_0x000140141d00(plRam000000014065e080);
    func_0x000140001490(puVar5,uVar6);
    func_0x000140141c50(1);
    uStack_48 = 4;
    uStack_5c = *(uint *)((longlong)puVar5 + 0xc);
    uStack_60 = *(undefined4 *)(puVar5 + 1);
    if ((0x46U >> (uStack_5c & 0x1f) & 1) == 0) {
      uStack_68 = *puVar5;
    }
    else {
      func_0x00014005ba90(&uStack_68,puVar5);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam0000000140655678) &&
       (func_0x0001403f6320(0x140655678), iRam0000000140655678 == -1)) {
      uRam000000014065565c = 0;
      uRam0000000140655650 = 0x3ff0000000000000;
      uRam0000000140655670 = 0x100000000;
      uRam0000000140655664 = 0x4000000000000000;
      func_0x0001403f6668(&DAT_14005b950);
      func_0x0001403f62c0(0x140655678);
    }
    uVar6 = uRam00000001405cd9c0;
    lVar8 = 0;
    iVar1 = func_0x00014015be60(0x140655650,&uStack_68,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x00014005ad64:
      iVar1 = *(int *)(lVar8 * 0x14 + 0x140655660);
      if (iVar1 == 1) {
        uStack_48 = 10;
        plRam0000000140657680 = (longlong *)0x28796;
        puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
        func_0x000140141d00(param_1);
        puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
        func_0x000140141d00(*puVar5);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0x3ff0000000000000;
        func_0x000140141c50(2);
        uStack_48 = 0xb;
        puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
        func_0x000140141d00(param_1);
        puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
        func_0x000140141d00(*puVar5);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0x3ff0000000000000;
        func_0x000140141c50(2);
        uStack_48 = 0xc;
        puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
        func_0x000140141d00(param_1);
        puVar5 = (undefined8 *)func_0x00014012b840(puVar7,2);
        func_0x000140141d00(*puVar7);
        if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar5);
        }
      }
      else {
        if (iVar1 != 0) goto code_r0x00014005aeb1;
        uStack_48 = 6;
        plRam0000000140657680 = (longlong *)0x28796;
        puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
        func_0x000140141d00(param_1);
        puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
        func_0x000140141d00(*puVar5);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0x3ff0000000000000;
        func_0x000140141c50(2);
        uStack_48 = 7;
        puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
        func_0x000140141d00(param_1);
        puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
        func_0x000140141d00(*puVar5);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0x3fd0000000000000;
        func_0x000140141c50(2);
        uStack_48 = 8;
        puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
        func_0x000140141d00(param_1);
        puVar5 = (undefined8 *)func_0x00014012b840(puVar7,2);
        func_0x000140141d00(*puVar7);
        if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar5);
        }
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x140655664,&uStack_68,uVar6,0);
      if (iVar1 == 0) {
        lVar8 = 1;
        goto code_r0x00014005ad64;
      }
code_r0x00014005aeb1:
      uStack_48 = 0xe;
      plRam0000000140657680 = (longlong *)0x28796;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3fd0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0xf;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3fd0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x10;
      puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar5 = (undefined8 *)func_0x00014012b840(puVar7,2);
      func_0x000140141d00(*puVar7);
      if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar5);
      }
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
    func_0x000140141c50(2);
    uStack_48 = 0x13;
    if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    goto code_r0x00014005b3e3;
  }
  uStack_48 = 0x14;
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  uStack_78 = 0;
  uStack_70 = 0x500000000;
  func_0x000140001490(&uStack_b8,puVar5);
  puStack_f8 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140655620);
  func_0x00014000bee0(&uStack_98,0x1405c3e20);
  puStack_e8 = &uStack_98;
  uVar6 = func_0x0001401445d0(param_1,param_2,&uStack_78,3,uRam00000001405c8a00,&puStack_f8);
  func_0x000140141d00(plRam000000014065e080);
  func_0x000140001490(puVar5,uVar6);
  func_0x000140141c50(1);
  uStack_48 = 0x15;
  uStack_5c = *(uint *)((longlong)puVar5 + 0xc);
  uStack_60 = *(undefined4 *)(puVar5 + 1);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) == 0) {
    uStack_68 = *puVar5;
  }
  else {
    func_0x00014005ba90(&uStack_68,puVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406556bc) &&
     (func_0x0001403f6320(0x1406556bc), iRam00000001406556bc == -1)) {
    uRam000000014065568c = 0;
    uRam0000000140655680 = 0x3ff0000000000000;
    uRam00000001406556a0 = 0x100000000;
    uRam0000000140655694 = 0x4000000000000000;
    uRam00000001406556b4 = 0x200000000;
    uRam00000001406556a8 = 0x4008000000000000;
    func_0x0001403f6668(&DAT_14005b9e0);
    func_0x0001403f62c0(0x1406556bc);
  }
  uVar6 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar1 = func_0x00014015be60(0x140655680,&uStack_68,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x00014005aa68:
    iVar1 = *(int *)(lVar8 * 0x14 + 0x140655690);
    if (iVar1 == 2) {
code_r0x00014005b115:
      uStack_48 = 0x1f;
      plRam0000000140657680 = (longlong *)0x28796;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      uVar6 = 0x3ff0000000000000;
      *puVar7 = 0x3ff0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x20;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3ff0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x21;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,2);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      goto code_r0x00014005b236;
    }
code_r0x00014005aa79:
    if (iVar1 == 1) {
      uStack_48 = 0x1b;
      plRam0000000140657680 = (longlong *)0x28796;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3ff0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x1c;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3ff0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x1d;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,2);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3fd0000000000000;
    }
    else {
      if (iVar1 != 0) goto code_r0x00014005abc4;
      uStack_48 = 0x17;
      plRam0000000140657680 = (longlong *)0x28796;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3ff0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x18;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3fd0000000000000;
      func_0x000140141c50(2);
      uStack_48 = 0x19;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
      func_0x000140141d00(param_1);
      puVar7 = (undefined8 *)func_0x00014012b840(puVar5,2);
      func_0x000140141d00(*puVar5);
      if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar7);
      }
      *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
      *puVar7 = 0x3fd0000000000000;
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140655694,&uStack_68,uVar6,0);
    if (iVar1 == 0) {
      lVar8 = 1;
      goto code_r0x00014005aa68;
    }
    iVar1 = func_0x00014015be60(0x1406556a8,&uStack_68,uVar6,0);
    if (iVar1 == 0) {
      iVar1 = uRam00000001406556b4._4_4_;
      if (uRam00000001406556b4._4_4_ != 2) goto code_r0x00014005aa79;
      goto code_r0x00014005b115;
    }
code_r0x00014005abc4:
    uStack_48 = 0x23;
    plRam0000000140657680 = (longlong *)0x28796;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
    func_0x000140141d00(param_1);
    puVar7 = (undefined8 *)func_0x00014012b840(puVar5,0);
    func_0x000140141d00(*puVar5);
    if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar7);
    }
    *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
    uVar6 = 0x3fd0000000000000;
    *puVar7 = 0x3fd0000000000000;
    func_0x000140141c50(2);
    uStack_48 = 0x24;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
    func_0x000140141d00(param_1);
    puVar7 = (undefined8 *)func_0x00014012b840(puVar5,1);
    func_0x000140141d00(*puVar5);
    if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar7);
    }
    *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
    *puVar7 = 0x3fd0000000000000;
    func_0x000140141c50(2);
    uStack_48 = 0x25;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875a);
    func_0x000140141d00(param_1);
    puVar7 = (undefined8 *)func_0x00014012b840(puVar5,2);
    func_0x000140141d00(*puVar5);
    if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar7);
    }
code_r0x00014005b236:
    *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
    *puVar7 = uVar6;
  }
  func_0x000140141c50(2);
  uStack_48 = 0x28;
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
code_r0x00014005b3e3:
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_88);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
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
  puRam0000000140657668 = (undefined8 *)uStack_58;
  return;
}
END DECOMPILED REFERENCE */
