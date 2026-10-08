/// @description FNAFN Obj_Night_1_5_Mangle_AI / Alarm — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Mangle_AI_Alarm_0
// Decoded, in order (uStack_88 = GML line markers):
//   2. show_debug_message("Mangle has a movement opportunity!") (exe const
//      @0x1405c57c0 via the 0x1401453a0 + 0x140181c60 pair — PROVEN by the
//      ported customfunct_game_music_clear "music cleared" site).
//   3. movement = irandom_range(0, 30) (func_0x000140168970 best-fit; 0,0x1e).
//   5. if (Time_without_move >= -30) (-30.0 = 0xc03e000000000000 literal;
//      `>=` via the `r >= 0` test per PORTING.md compare calibration):
//        if (movement < Mangle_AI_Level (id 0x18735) && Time_without_move <= 0
//          (`<` via `r < 0`, `<=` via `r < 1`)) -> movement opportunity;
//        else Time_without_move -= 1 (0x21; -= helper func_0x00014000bdb0
//          with 1.0 literal).
//      else (Time_without_move < -30) -> forced movement opportunity.
//      Movement opportunity (label code_r0x0001400dc5d1):
//        switch (Night_mangle_location) (id 0x18745) on runtime-pool cases
//        5.0/5.1/5.2/5.3 (@0x140656dc0/d4/e8/fc; guarded init; 5.0 =
//        0x4014000000000000 etc. — outside the mapped exe image).
//        Jumptable @0x1400dd75c unrecoverable — each matched branch calls
//        through and returns directly (no fallthrough to the timer reset).
//        Fallthrough (no case matched, uVar5 >= 4): Time_without_move =
//          irandom_range(20, 27) - Mangle_AI_Level * 0.2
//          (0.2 = _UNK_140439eb0 .rdata double via exe_strings.py;
//          MUL best-fit func_0x00014001fa10, -= best-fit).
//   0x23. switch (alarm_type) (id 0x186d8) on cases 0 / 1.0 (runtime pool
//      @0x140656e20/e34; mapping provable by the zeroed label table per the
//      PORTING.md two-case flag-switch rule):
//        case 0: Scr_Camera_Update[0] = 30 (0x403e000000000000);
//        case 1: Scr_Camera_Update[1] = random_range(300, 500)
//          (300.0 = _UNK_14043cbe8, 500.0 = _UNK_14043bbb8 .rdata doubles;
//          func_0x000140168cf0 best-fit random_range).
// TODO(calibrate): func_0x000140168970 best-fit irandom_range;
// func_0x000140168cf0 best-fit random_range; func_0x00014001fa10 best-fit
// MUL; runtime consts @0x140656dc0/@0x140656e20 (outside the mapped exe
// image) and the jumptable branch bodies — verify in-game.
// Ported: Obj_Night_1_5_Mangle_AI / Alarm
show_debug_message("Mangle has a movement opportunity!");
movement = irandom_range(0, 30);
var _move = false;
if (Time_without_move >= -30) {
    if (movement < Mangle_AI_Level && Time_without_move <= 0) {
        _move = true;
    } else {
        Time_without_move -= 1;
    }
} else {
    _move = true;
}
if (_move) {
    switch (Night_mangle_location) {
        case 5.0: // TODO(calibrate): runtime pool @0x140656dc0; jumptable branch — verify in-game
            // TODO(calibrate): branch body unrecoverable (jumptable @0x1400dd75c); C returns here
            exit;
        case 5.1: // TODO(calibrate): runtime pool @0x140656dd4
            // TODO(calibrate): branch body unrecoverable; C returns here
            exit;
        case 5.2: // TODO(calibrate): runtime pool @0x140656de8
            // TODO(calibrate): branch body unrecoverable; C returns here
            exit;
        case 5.3: // TODO(calibrate): runtime pool @0x140656dfc
            // TODO(calibrate): branch body unrecoverable; C returns here
            exit;
        default:
            Time_without_move = irandom_range(20, 27) - Mangle_AI_Level * 0.2;
            break;
    }
}
switch (alarm_type) {
    case 0:
        Scr_Camera_Update[0] = 30;
        break;
    case 1: // TODO(calibrate): runtime pool @0x140656e20 mapping per two-case rule
        Scr_Camera_Update[1] = random_range(300, 500);
        break;
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_1_5_Mangle_AI_Alarm_0(longlong *param_1)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  ulonglong uVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined8 uVar7;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined auStack_118 [12];
  uint uStack_10c;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043cbf0;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18735);
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18745);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_88 = 2;
  func_0x0001401453a0(&uStack_70,0x1405c57c0);
  func_0x000140181c60(&uStack_70);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_88 = 3;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18738);
  uVar7 = func_0x000140168970(0,0x1e);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = uVar7;
  uStack_88 = 5;
  uVar7 = (**(code **)(*param_1 + 8))(param_1,0x18792);
  uStack_64 = 0;
  uStack_70 = 0xc03e000000000000;
  iVar1 = func_0x00014015be60(uVar7,&uStack_70,uRam00000001405cd9c0,1);
  if ((iVar1 == -2) || (-1 < iVar1)) {
    uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18738);
    iVar1 = func_0x00014015be60(uVar7,uVar2,uRam00000001405cd9c0,1);
    if ((iVar1 != -2) && (iVar1 < 0)) {
      uVar7 = (**(code **)(*param_1 + 8))(param_1,0x18792);
      uStack_64 = 0;
      uStack_70 = 0;
      iVar1 = func_0x00014015be60(uVar7,&uStack_70,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) goto code_r0x0001400dc5d1;
    }
    uStack_88 = 0x21;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    func_0x00014000bdb0(uVar2,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
  }
  else {
code_r0x0001400dc5d1:
    uStack_88 = 7;
    uStack_64 = *(uint *)((longlong)puVar3 + 0xc);
    uStack_68 = *(undefined4 *)(puVar3 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar3;
    }
    else {
      func_0x0001400dd8d0(&uStack_70,puVar3);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam0000000140656e10) &&
       (func_0x0001403f6320(0x140656e10), iRam0000000140656e10 == -1)) {
      uRam0000000140656dcc = 0;
      uRam0000000140656dc0 = 0x4014000000000000;
      uRam0000000140656de0 = 0x100000000;
      uRam0000000140656dd4 = 0x4014666666666666;
      uRam0000000140656df4 = 0x200000000;
      uRam0000000140656de8 = 0x4014cccccccccccd;
      uRam0000000140656e08 = 0x300000000;
      uRam0000000140656dfc = 0x4015333333333333;
      func_0x0001403f6668(&DAT_1400dd770);
      func_0x0001403f62c0(0x140656e10);
    }
    uVar7 = uRam00000001405cd9c0;
    lVar6 = 0;
    iVar1 = func_0x00014015be60(0x140656dc0,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x0001400dc7c3:
      uVar5 = (ulonglong)*(uint *)(lVar6 * 0x14 + 0x140656dd0);
joined_r0x0001400dcffb:
      if (uVar5 < 4) {
                    // (Ghidra note) WARNING: Could not recover jumptable at 0x0001400dc7e4. Too many branches
                    // (Ghidra note) WARNING: Treating indirect jump as call
        (*(code *)(&UNK_1400dd75c + *(int *)(&UNK_1400dd75c + uVar5 * 4)))();
        return;
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x140656dd4,&uStack_70,uVar7,0);
      if (iVar1 == 0) {
        lVar6 = 1;
        goto code_r0x0001400dc7c3;
      }
      iVar1 = func_0x00014015be60(0x140656de8,&uStack_70,uVar7,0);
      if (iVar1 == 0) {
        uVar5 = uRam0000000140656df4 >> 0x20;
        goto joined_r0x0001400dcffb;
      }
      iVar1 = func_0x00014015be60(0x140656dfc,&uStack_70,uVar7,0);
      if (iVar1 == 0) {
        uVar5 = uRam0000000140656e08 >> 0x20;
        goto joined_r0x0001400dcffb;
      }
    }
    uStack_88 = 0x1d;
    uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
    func_0x00014001fa10(auStack_118,uVar2,_UNK_140439eb0);
    uStack_a8 = func_0x000140168970(0x14,0x1b);
    uStack_9c = 0;
    func_0x00014000bdb0(&uStack_a8,auStack_118);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar7,&uStack_a8);
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_118);
    }
    func_0x000140141c50(1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
  }
  uStack_88 = 0x23;
  puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
  uStack_64 = *(uint *)((longlong)puVar3 + 0xc);
  uStack_68 = *(undefined4 *)(puVar3 + 1);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
    uStack_70 = *puVar3;
  }
  else {
    func_0x0001400dd8d0(&uStack_70,puVar3);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656e48) &&
     (func_0x0001403f6320(0x140656e48), iRam0000000140656e48 == -1)) {
    uRam0000000140656e2c = 0;
    uRam0000000140656e20 = 0;
    uRam0000000140656e40 = 0x100000000;
    uRam0000000140656e34 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_1400dd840);
    func_0x0001403f62c0(0x140656e48);
  }
  uVar2 = uRam00000001405cd9c0;
  lVar6 = 0;
  iVar1 = func_0x00014015be60(0x140656e20,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140656e34,&uStack_70,uVar2,0);
    if (iVar1 != 0) goto code_r0x0001400dcef4;
    lVar6 = 1;
  }
  iVar1 = *(int *)(lVar6 * 0x14 + 0x140656e30);
  if (iVar1 == 1) {
    uStack_88 = 0x26;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    uVar2 = func_0x000140168cf0(_UNK_14043cbe8,_UNK_14043bbb8);
    func_0x000140141d00(param_1);
    puVar4 = (undefined8 *)func_0x00014012b840(puVar3,1);
    func_0x000140141d00(*puVar3);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = uVar2;
  }
  else {
    if (iVar1 != 0) goto code_r0x0001400dcef4;
    uStack_88 = 0x25;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar4 = (undefined8 *)func_0x00014012b840(puVar3,0);
    func_0x000140141d00(*puVar3);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
    *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
    *puVar4 = 0x403e000000000000;
  }
  func_0x000140141c50(2);
code_r0x0001400dcef4:
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
