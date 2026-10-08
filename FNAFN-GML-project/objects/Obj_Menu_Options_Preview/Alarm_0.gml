/// @description FNAFN Obj_Menu_Options_Preview / Alarm_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Preview_Alarm_0
// The preview instance refreshes itself from the options state each alarm
// tick. Decoded (uStack_78 = GML line markers):
//   1. menu = Obj_Menu_Options.menu (object-tagged read 0x140160480:
//      object 0x11 = 17 = Obj_Menu_Options, var id 0x18737 = menu). Outer dispatch is a string switch on menu:
//      "video" (exe-string @0x1405c53b0 via guarded const @0x1406567e0)
//      vs "audio" (@0x1405c53b6 via @0x1406567f4); anything else = done.
//   "video" branch (line 3): switch (Obj_Menu_Options.select) over the
//      guarded doubles 1.0..5.0 (@0x140656810/@0x140656824/@0x140656838
//      /@0x14065684c/@0x140656860 — values proven from the pool init
//      block). Each case ends in an indirect jump-table call
//      (Ghidra: table near @0x1400ca73c, unrecoverable) — bodies ported
//      as TODO stubs below; no match = done.
//   "audio" branch (line 0x3d): switch (Obj_Menu_Options.select) over
//      guarded 1.0 (@0x140656980) / 2.0 (@0x140656994):
//      select == 1 (quieter-ambience toggle preview):
//          image_alpha = 0; select_min = 0; select_max = 1;
//          select = (game_settings[8] == "enabled") ? 1 : 0
//            ("disabled" @0x1405c53bc / "enabled" @0x1405c53ce via
//            guarded @0x1406569b0/@0x1406569c4; no-match falls into the
//            "disabled" slot, ported as else);
//          text = game_settings[8]; arrow_alpha = 1.
//      select == 2 (master-volume slider preview):
//          image_alpha = 0; select_min = 0; select_max = 100;
//          select = game_settings[9]; text = game_settings[9];
//          arrow_alpha = 1.
//   All writes in the audio branch are SELF (self id-fetch / self
//   property write 0x140160140 on slot image_alpha); game_settings is
//   the runner global (id 0x18727, +8 fetch), indexed 8/9 with the
//   standard array bounds checks.
// Reading: the preview panel shows the current value of whichever
// option row is selected (toggle state or slider value) as text, with
// the select range narrowed to match (0/1 toggle vs 0..100 volume).
// TODO(calibrate): video-branch case bodies (jump-table targets — needs
// in-game disassembly); menu/select const addresses are guarded-pool
// (@0x14065xxxx) but their VALUES are proven above from the pool init.
if (Obj_Menu_Options.menu == "video") {
    switch (Obj_Menu_Options.select) {
        case 1: break; // TODO(calibrate): video preview body 1 (jump-table target, unrecoverable offline)
        case 2: break; // TODO(calibrate): video preview body 2 (same)
        case 3: break; // TODO(calibrate): video preview body 3 (same)
        case 4: break; // TODO(calibrate): video preview body 4 (same)
        case 5: break; // TODO(calibrate): video preview body 5 (same)
    }
} else if (Obj_Menu_Options.menu == "audio") {
    if (Obj_Menu_Options.select == 1) {
        image_alpha = 0;
        select_min = 0;
        select_max = 1;
        if (game_settings[8] == "enabled") {
            select = 1;
        } else {
            select = 0;
        }
        text = game_settings[8];
        arrow_alpha = 1;
    } else if (Obj_Menu_Options.select == 2) {
        image_alpha = 0;
        select_min = 0;
        select_max = 100;
        select = game_settings[9];
        text = game_settings[9];
        arrow_alpha = 1;
    }
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Options_Preview_Alarm_0(longlong *param_1)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  undefined8 *puVar4;
  longlong *plVar5;
  ulonglong uVar6;
  undefined8 uVar7;
  longlong lVar8;
  longlong unaff_GS_OFFSET;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined auStack_e8 [12];
  uint uStack_dc;
  undefined8 uStack_c8;
  undefined4 uStack_c0;
  uint uStack_bc;
  undefined auStack_b8 [12];
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  longlong lStack_60;
  undefined4 uStack_58;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043c7c0;
  uStack_78 = 0;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  plRam0000000140657680 = param_1;
  plVar3 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_78 = 1;
  _auStack_e8 = ZEXT816(0);
  func_0x000140160480(0x11,0x18737,0x80000000,auStack_e8,0,0);
  uStack_bc = uStack_dc;
  uStack_c0 = auStack_e8._8_4_;
  if ((0x46U >> (uStack_dc & 0x1f) & 1) == 0) {
    uStack_c8 = auStack_e8._0_8_;
  }
  else {
    func_0x0001400cacd0(&uStack_c8,auStack_e8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656808) &&
     (func_0x0001403f6320(0x140656808), iRam0000000140656808 == -1)) {
    func_0x0001401453a0(0x1406567e0,0x1405c53b0);
    uRam00000001406567f0 = 0;
    func_0x0001401453a0(0x1406567f4,0x1405c53b6);
    uRam0000000140656804 = 1;
    func_0x0001403f6668(&DAT_1400ca750);
    func_0x0001403f62c0(0x140656808);
  }
  uVar2 = (undefined4)uRam00000001405cd9c0;
  lVar8 = 0;
  iVar1 = func_0x00014015be60(0x1406567e0,&uStack_c8,uVar2,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x1406567f4,&uStack_c8,uVar2,0);
    if (iVar1 != 0) goto code_r0x0001400c96e7;
    lVar8 = 1;
  }
  iVar1 = *(int *)(lVar8 * 0x14 + 0x1406567f0);
  if (iVar1 != 1) {
    if (iVar1 != 0) goto code_r0x0001400c96e7;
    uStack_78 = 3;
    _auStack_b8 = ZEXT816(0);
    func_0x000140160480(0x11,0x1876a,0x80000000,auStack_b8,0,0);
    uStack_9c = uStack_ac;
    uStack_a0 = auStack_b8._8_4_;
    if ((0x46U >> (uStack_ac & 0x1f) & 1) == 0) {
      uStack_a8 = auStack_b8._0_8_;
    }
    else {
      func_0x0001400cacd0(&uStack_a8,auStack_b8);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam0000000140656874) &&
       (func_0x0001403f6320(0x140656874), iRam0000000140656874 == -1)) {
      uRam000000014065681c = 0;
      uRam0000000140656810 = 0x3ff0000000000000;
      uRam0000000140656830 = 0x100000000;
      uRam0000000140656824 = 0x4000000000000000;
      uRam0000000140656844 = 0x200000000;
      uRam0000000140656838 = 0x4008000000000000;
      uRam0000000140656858 = 0x300000000;
      uRam000000014065684c = 0x4010000000000000;
      uRam000000014065686c = 0x400000000;
      uRam0000000140656860 = 0x4014000000000000;
      func_0x0001403f6668(&DAT_1400ca7e0);
      func_0x0001403f62c0(0x140656874);
    }
    uVar2 = (undefined4)uRam00000001405cd9c0;
    lVar8 = 0;
    iVar1 = func_0x00014015be60(0x140656810,&uStack_a8,uVar2,0);
    if (iVar1 == 0) {
code_r0x0001400c7d28:
      uVar6 = (ulonglong)*(uint *)(lVar8 * 0x14 + 0x140656820);
joined_r0x0001400c840e:
      if (uVar6 < 5) {
                    // (Ghidra note) WARNING: Could not recover jumptable at 0x0001400c7d48. Too many branches
                    // (Ghidra note) WARNING: Treating indirect jump as call
        (*(code *)(&UNK_1400ca73c + *(int *)(&UNK_1400ca73c + uVar6 * 4)))();
        return;
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x140656824,&uStack_a8,uVar2,0);
      if (iVar1 == 0) {
        lVar8 = 1;
        goto code_r0x0001400c7d28;
      }
      iVar1 = func_0x00014015be60(0x140656838,&uStack_a8,uVar2,0);
      uVar6 = uRam0000000140656844;
      if ((iVar1 == 0) ||
         (iVar1 = func_0x00014015be60(0x14065684c,&uStack_a8,uVar2,0), uVar6 = uRam0000000140656858,
         iVar1 == 0)) {
        uVar6 = uVar6 >> 0x20;
        goto joined_r0x0001400c840e;
      }
      iVar1 = func_0x00014015be60(0x140656860,&uStack_a8,uVar2,0);
      if (iVar1 == 0) {
        uVar6 = uRam000000014065686c >> 0x20;
        goto joined_r0x0001400c840e;
      }
    }
    uStack_78 = 0x3c;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    goto code_r0x0001400c96e7;
  }
  uStack_78 = 0x3d;
  _auStack_b8 = ZEXT816(0);
  func_0x000140160480(0x11,0x1876a,0x80000000,auStack_b8,0,0);
  uStack_9c = uStack_ac;
  uStack_a0 = auStack_b8._8_4_;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) == 0) {
    uStack_a8 = auStack_b8._0_8_;
  }
  else {
    func_0x0001400cacd0(&uStack_a8,auStack_b8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406569a8) &&
     (func_0x0001403f6320(0x1406569a8), iRam00000001406569a8 == -1)) {
    uRam000000014065698c = 0;
    uRam0000000140656980 = 0x3ff0000000000000;
    uRam00000001406569a0 = 0x100000000;
    uRam0000000140656994 = 0x4000000000000000;
    func_0x0001403f6668(&DAT_1400cabb0);
    func_0x0001403f62c0(0x1406569a8);
  }
  uVar2 = (undefined4)uRam00000001405cd9c0;
  lVar8 = 0;
  iVar1 = func_0x00014015be60(0x140656980,&uStack_a8,uVar2,0);
  if (iVar1 == 0) {
code_r0x0001400c7bee:
    iVar1 = *(int *)(lVar8 * 0x14 + 0x140656990);
    if (iVar1 == 1) {
      uStack_78 = 0x4a;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_78 = 0x4b;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876c);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0;
      uStack_78 = 0x4c;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876b);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x4059000000000000;
      uStack_78 = 0x4d;
      uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 10) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,9,uVar2);
          plVar5 = (longlong *)0x0;
        }
        else {
          plVar5 = (longlong *)func_0x000140147980(*plVar3,9);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar5 = plVar3;
      }
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar7,plVar5);
      func_0x000140141c50(1);
      uStack_78 = 0x4e;
      uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18785);
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 10) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,9,uVar2);
          plVar3 = (longlong *)0x0;
        }
        else {
          plVar3 = (longlong *)func_0x000140147980(*plVar3,9);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
      }
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar7,plVar3);
      func_0x000140141c50(1);
      uStack_78 = 0x4f;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
    }
    else if (iVar1 == 0) {
      uStack_78 = 0x3f;
      if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_8c = 0;
      uStack_98 = 0;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_98);
      uStack_78 = 0x40;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876c);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0;
      uStack_78 = 0x41;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876b);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
      uStack_78 = 0x42;
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 9) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,8,uVar2);
          plVar5 = (longlong *)0x0;
        }
        else {
          plVar5 = (longlong *)func_0x000140147980(*plVar3,8);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar5 = plVar3;
      }
      uStack_54 = *(uint *)((longlong)plVar5 + 0xc);
      uStack_58 = *(undefined4 *)(plVar5 + 1);
      if ((0x46U >> (uStack_54 & 0x1f) & 1) == 0) {
        lStack_60 = *plVar5;
      }
      else {
        func_0x0001400cacd0(&lStack_60);
      }
      if ((*(int *)(*(longlong *)
                     (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
           iRam00000001406569d8) && (func_0x0001403f6320(0x1406569d8), iRam00000001406569d8 == -1))
      {
        func_0x0001401453a0(0x1406569b0,0x1405c53bc);
        uRam00000001406569c0 = 0;
        func_0x0001401453a0(0x1406569c4,0x1405c53ce);
        uRam00000001406569d4 = 1;
        func_0x0001403f6668(&DAT_1400cac40);
        func_0x0001403f62c0(0x1406569d8);
      }
      uVar2 = (undefined4)uRam00000001405cd9c0;
      lVar8 = 0;
      iVar1 = func_0x00014015be60(0x1406569b0,&lStack_60,uVar2,0);
      if (iVar1 == 0) {
code_r0x0001400c873e:
        iVar1 = *(int *)(lVar8 * 0x14 + 0x1406569c0);
        if (iVar1 == 1) {
          uStack_78 = 0x45;
          puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
          if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar4);
          }
          *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
          *puVar4 = 0x3ff0000000000000;
        }
        else if (iVar1 == 0) {
          uStack_78 = 0x44;
          puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1876a);
          if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar4);
          }
          *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
          *puVar4 = 0;
        }
      }
      else {
        iVar1 = func_0x00014015be60(0x1406569c4,&lStack_60,uVar2,0);
        if (iVar1 == 0) {
          lVar8 = 1;
          goto code_r0x0001400c873e;
        }
      }
      uStack_78 = 0x47;
      uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18785);
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 9) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,8,uVar2);
          plVar3 = (longlong *)0x0;
        }
        else {
          plVar3 = (longlong *)func_0x000140147980(*plVar3,8);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
      }
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar7,plVar3);
      func_0x000140141c50(1);
      uStack_78 = 0x48;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
      uStack_78 = 0x49;
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&lStack_60);
      }
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140656994,&uStack_a8,uVar2,0);
    if (iVar1 == 0) {
      lVar8 = 1;
      goto code_r0x0001400c7bee;
    }
  }
  uStack_78 = 0x52;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
code_r0x0001400c96e7:
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */
