/// @description FNAFN Obj_Night_1_5_Freddy_AI / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Freddy_AI_Step_0 (4124 B @0x1400d3580)
// Decoded, in order (uStack_98 = GML line markers):
//   3. customfunct_image_speed_delta(0.05) (exe const 0.05 @0x1405c5550 per
//      EXE-CONSTANTS.md; 1-arg script per scripts/ported/
//      customfunct_image_speed_delta.gml).
//   7. Camera-timer sweep, same array_length/round/-100/event_perform shape
//      as the ported Bonnie Step (bound = array_length(Scr_Camera_Update),
//      slot 0x1405c8ba0 = array_length; round slot 0x1405c89b0; counter
//      shape = `i += 1` per PORTING.md):
//        for i over the array:
//          if (Scr_Camera_Update[i] <= 0) (`<=` via `r < 1`):
//            if (round(Scr_Camera_Update[i]) <= 0):
//              if (round(Scr_Camera_Update[i]) > -100) (-100.0 =
//              0xc059000000000000, the fired sentinel):
//                Scr_Camera_Update[i] = -100;
//                event_perform(ev_alarm, i) (helper 0x140181c50, TYPE 2 =
//                ev_alarm; counter passed as int).
//          else Scr_Camera_Update[i] -= delta_factor (id 0x1870b; -= helper
//          0x14000bdb0, no explicit 1.0 * MUL node here — unlike Bonnie).
//   0x18. if (Night_freddy_location (global id 0x18744) == 6.0 (literal
//      0x4018000000000000) || == 8.0 (0x4020000000000000) || == 9.0
//      (0x4022000000000000)):
//        0x1c. if (Night_recording (global id 0x18749) == 1 (literal)):
//          0x1e. Record_countup (id 0x1875f) += 0.5 * delta_factor
//                (MUL helper 0x1400053f0 into a temp, then ADD helper
//                0x140005290 in-place on the variable slot).
//          0x1f. if (Record_countup > 119.0 (0x405dc00000000000 literal)):
//            0x21. Night_freddy_location = 2.2 (0x400199999999999a; the
//                  line-0x21 fetch of id 0x18744 is discarded — the store
//                  goes to the id-0x18744 global slot, same YYC idiom as
//                  the KeyPress_87 power writes).
//            0x22. Record_countup = 0.
//            0x23. Scr_Camera_Update(39) (exe const 39.0 @0x1405c5560 per
//                  EXE-CONSTANTS.md; cf. the ported Freddy Alarm).
//            0x24. audio_stop_sound(4) (exe const 4.0 @0x1405c5570 per
//                  EXE-CONSTANTS.md; slot 0x1405c8960 = audio_stop_sound).
//            0x25. alarm_type (id 0x186d8) = 0.
//            0x26. Time_without_move (id 0x18792) = irandom_range(30, 35) -
//                  Freddy_AI_Level (id 0x1871d) * 0.2 (0x1e,0x23 best-fit;
//                  MUL with _UNK_140439e78; 0.2 per the ported Freddy
//                  Alarm fallthrough, same symbol).
//            0x27. Scr_Camera_Update[0] = 30 (0x403e000000000000).
//        0x2a. Record_countup = clamp(Record_countup, <rt @0x140656ce0>,
//              120.0) (slot 0x1405c8a00 = clamp; 120.0 = exe const
//              @0x1405c5580 per EXE-CONSTANTS.md).
//        0x2c. two-case switch on Night_camera (global id 0x1873b): case
//            1.0 is CERTAIN (pool const @0x140656cf0 = 1.0 literal in the
//            guarded init); second case @0x140656d04 is runtime (placeholder
//            0 below); the label table @0x140656d00 is runtime so the
//            case->branch mapping is assumed identity (cf. the ported
//            Freddy Alarm + Obj_Office_Front_Middle/Step precedents):
//              case 1.0: button_alpha (id 0x186ea, self) = 1;
//                        Obj_Night_UI_Camera_Button.alert_alpha = 0
//                        (object 0xb = 11 = Obj_Night_UI_Camera_Button per
//                        obj_names.json; alert_alpha owned by it per
//                        obj_var_ownership.md; dotted form per PORTING.md).
//              case 0 (placeholder): Obj_Night_UI_Camera_Button.alert_alpha
//                        = 1; button_alpha = 0.
//      else (location not 6/8/9):
//        0x38. button_alpha = 0.
//        0x39. Obj_Night_UI_Camera_Button.alert_alpha = 0 (zeroed RValue).
// TODO(calibrate): func_0x000140168970 best-fit irandom_range;
// clamp lower bound @0x140656ce0 (0 assumed); second switch case
// @0x140656d04 (0 assumed) + table @0x140656d00 mapping; _UNK_140439e78
// factor (0.2 per Freddy Alarm) — verify in-game.
// Ported: Obj_Night_1_5_Freddy_AI / Step_0
customfunct_image_speed_delta(0.05);
for (var i = 0; i < array_length(Scr_Camera_Update); i += 1) {
    if (Scr_Camera_Update[i] <= 0) {
        if (round(Scr_Camera_Update[i]) <= 0) {
            if (round(Scr_Camera_Update[i]) > -100) { Scr_Camera_Update[i] = -100; event_perform(ev_alarm, i); }
        }
    } else { Scr_Camera_Update[i] -= delta_factor; }
}
if (Night_freddy_location == 6 || Night_freddy_location == 8 || Night_freddy_location == 9) {
    if (Night_recording == 1) {
        Record_countup += 0.5 * delta_factor;
        if (Record_countup > 119) {
            Night_freddy_location = 2.2;
            Record_countup = 0;
            Scr_Camera_Update(39);
            audio_stop_sound(4);
            alarm_type = 0;
            Time_without_move = irandom_range(30, 35) - Freddy_AI_Level * 0.2; // TODO(calibrate): factor is _UNK_140439e78 (0.2 per Freddy Alarm) — verify in-game
            Scr_Camera_Update[0] = 30;
        }
    }
    Record_countup = clamp(Record_countup, 0 /* TODO(calibrate): runtime const @0x140656ce0 */, 120);
    if (Night_camera == 1) { // TODO(calibrate): table @0x140656d00 mapping assumed identity — verify in-game
        button_alpha = 1;
        Obj_Night_UI_Camera_Button.alert_alpha = 0;
    } else if (Night_camera == 0 /* TODO(calibrate): runtime case @0x140656d04, 0 assumed */) { // TODO(calibrate): same table
        Obj_Night_UI_Camera_Button.alert_alpha = 1;
        button_alpha = 0;
    }
} else {
    button_alpha = 0;
    Obj_Night_UI_Camera_Button.alert_alpha = 0;
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_1_5_Freddy_AI_Step_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 uVar8;
  undefined8 uVar9;
  undefined8 *puVar10;
  undefined8 *puVar11;
  longlong lVar12;
  longlong unaff_GS_OFFSET;
  double dVar13;
  undefined8 **ppuVar14;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  uint uStack_154;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined auStack_d0 [16];
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined auStack_80 [8];
  undefined8 uStack_78;
  undefined8 uStack_70;
  
  uStack_70 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043c95e;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_c0 = param_2;
  uStack_140 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  puStack_100 = (undefined8 *)
                (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18744);
  uVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uVar6 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1871d);
  puVar7 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_d8 = CONCAT44(0xffffff,(undefined4)uStack_d8);
  uStack_e0 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uStack_154 = 0xffffff;
  uStack_160 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_98 = 3;
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  func_0x00014000bee0(&uStack_138,0x1405c5550);
  ppuVar14 = &puStack_f8;
  puStack_f8 = &uStack_138;
  gml_Script_customfunct_image_speed_delta(param_1,uStack_c0,&uStack_90,1,ppuVar14);
  uStack_98 = 7;
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  dVar1 = _UNK_140439dd0;
  uStack_ac = 0;
  uStack_b8 = 0.0;
  while( true ) {
    uVar3 = (undefined4)((ulonglong)ppuVar14 >> 0x20);
    if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_90 = 0;
    uStack_88 = 0x500000000;
    uVar8 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_138,uVar8);
    ppuVar14 = (undefined8 **)CONCAT44(uVar3,uRam00000001405c8ba0);
    puStack_f8 = &uStack_138;
    uVar9 = func_0x0001401445d0(param_1,uStack_c0,&uStack_90,1,ppuVar14,&puStack_f8);
    uVar8 = uRam00000001405cd9c0;
    iVar2 = func_0x00014015be60(&uStack_b8,uVar9,uRam00000001405cd9c0,1);
    puVar10 = puStack_100;
    uVar3 = (undefined4)((ulonglong)ppuVar14 >> 0x20);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_98 = 10;
    uVar8 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_b8);
    uVar8 = func_0x00014002fbe0(uVar8,uVar3);
    _auStack_80 = ZEXT416(SUB164(_auStack_80,8)) << 0x40;
    iVar2 = func_0x00014015be60(uVar8,auStack_80,uRam00000001405cd9c0,1);
    uVar3 = (undefined4)((ulonglong)ppuVar14 >> 0x20);
    if (iVar2 < 1) {
      uStack_98 = 0xf;
      if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_90 = 0;
      uStack_88 = 0x500000000;
      uVar8 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar4 = func_0x00014012cd90(&uStack_b8);
      uVar8 = func_0x00014002fbe0(uVar8,uVar4);
      func_0x000140001490(&uStack_138,uVar8);
      ppuVar14 = (undefined8 **)CONCAT44(uVar3,uRam00000001405c89b0);
      puStack_f8 = &uStack_138;
      uVar8 = func_0x0001401445d0(param_1,uStack_c0,&uStack_90,1,ppuVar14,&puStack_f8);
      _auStack_80 = ZEXT416(SUB164(_auStack_80,8)) << 0x40;
      iVar2 = func_0x00014015be60(uVar8,auStack_80,uRam00000001405cd9c0,1);
      uVar3 = (undefined4)((ulonglong)ppuVar14 >> 0x20);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_e0);
        }
        uStack_e0 = 0;
        uStack_d8 = 0x500000000;
        uVar8 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar4 = func_0x00014012cd90(&uStack_b8);
        uVar8 = func_0x00014002fbe0(uVar8,uVar4);
        func_0x000140001490(&uStack_128,uVar8);
        puStack_f0 = &uStack_128;
        ppuVar14 = (undefined8 **)CONCAT44(uVar3,uRam00000001405c89b0);
        uVar8 = func_0x0001401445d0(param_1,uStack_c0,&uStack_e0,1,ppuVar14,&puStack_f0);
        uStack_78._4_4_ = 0;
        auStack_80 = (undefined  [8])0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar8,auStack_80,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_98 = 0x11;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar10 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_b8);
          puVar11 = (undefined8 *)func_0x00014012b840(puVar10,uVar3);
          func_0x000140141d00(*puVar10);
          if ((0x46U >> (*(uint *)((longlong)puVar11 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar11);
          }
          *(undefined4 *)((longlong)puVar11 + 0xc) = 0;
          *puVar11 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_98 = 0x12;
          dVar13 = uStack_b8;
          if ((uStack_ac & 0xffffff) != 0) {
            dVar13 = (double)func_0x00014012d320(&uStack_b8);
          }
          func_0x000140181c50(param_1,uStack_c0,2,(longlong)dVar13);
        }
      }
    }
    else {
      uStack_98 = 0xc;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar10 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_b8);
      uVar8 = func_0x00014012b840(puVar10,uVar3);
      func_0x000140141d00(*puVar10);
      func_0x00014000bdb0(uVar8,uStack_140);
      func_0x000140141c50(2);
    }
    switch(uStack_ac & 0xffffff) {
    case 1:
      uStack_b8 = (double)func_0x00014012d320(&uStack_b8);
      uStack_b8 = uStack_b8 + dVar1;
      uStack_ac = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_b8,&uStack_b8);
      break;
    case 7:
      uStack_b8 = (double)CONCAT44(uStack_b8._4_4_,(int)uStack_b8 + 1);
      break;
    case 10:
      uStack_b8 = (double)((longlong)uStack_b8 + 1);
      break;
    case 0xd:
      uStack_ac = 0;
    case 0:
      uStack_b8 = uStack_b8 + dVar1;
    }
  }
  uStack_98 = 0x18;
  uStack_78._4_4_ = 0;
  auStack_80 = (undefined  [8])0x4018000000000000;
  iVar2 = func_0x00014015be60(puStack_100,auStack_80,uVar8,0);
  if (iVar2 != 0) {
    uStack_78._4_4_ = 0;
    auStack_80 = (undefined  [8])0x4020000000000000;
    iVar2 = func_0x00014015be60(puVar10,auStack_80,uVar8,0);
    if (iVar2 != 0) {
      uStack_78._4_4_ = 0;
      auStack_80 = (undefined  [8])0x4022000000000000;
      iVar2 = func_0x00014015be60(puVar10,auStack_80,uVar8,0);
      if (iVar2 != 0) {
        uStack_98 = 0x38;
        puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0;
        uStack_98 = 0x39;
        _auStack_80 = SUB1612(ZEXT816(0),0);
        uStack_78._4_4_ = 0;
        func_0x000140160b90(0xb,0x186d9,0x80000000,auStack_80);
        goto code_r0x0001400d43be;
      }
    }
  }
  uStack_98 = 0x1c;
  uStack_78._4_4_ = 0;
  uStack_78._0_4_ = SUB124(_auStack_80,8);
  auStack_80 = (undefined  [8])0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar5,auStack_80,uVar8,0);
  if (iVar2 == 0) {
    uStack_98 = 0x1e;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1875f);
    uStack_78._4_4_ = 0;
    auStack_80 = (undefined  [8])0x3fe0000000000000;
    func_0x0001400053f0(auStack_80,uStack_140);
    func_0x000140005290(uVar5,auStack_80);
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_80);
    }
    uStack_98 = 0x1f;
    uStack_78._4_4_ = 0;
    uStack_78._0_4_ = SUB124(_auStack_80,8);
    auStack_80 = (undefined  [8])0x405dc00000000000;
    iVar2 = func_0x00014015be60(uVar5,auStack_80,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      uStack_98 = 0x21;
      (**(code **)(*param_1 + 0x10))(param_1,0x1875f);
      if ((0x46U >> (*(uint *)((longlong)puStack_100 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_100);
      }
      *(undefined4 *)((longlong)puStack_100 + 0xc) = 0;
      *puStack_100 = 0x400199999999999a;
      uStack_98 = 0x22;
      puVar10 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875f);
      if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar10);
      }
      *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
      *puVar10 = 0;
      uStack_98 = 0x23;
      if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_90 = 0;
      uStack_88 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x1405c5560);
      ppuVar14 = &puStack_f8;
      puStack_f8 = &uStack_138;
      gml_Script_Scr_Camera_Update(param_1,uStack_c0,&uStack_90,1,ppuVar14);
      uVar3 = (undefined4)((ulonglong)ppuVar14 >> 0x20);
      uStack_98 = 0x24;
      if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_90 = 0;
      uStack_88 = 0x500000000;
      func_0x00014000bee0(&uStack_138,0x1405c5570);
      uVar5 = CONCAT44(uVar3,uRam00000001405c8960);
      puStack_f8 = &uStack_138;
      func_0x0001401445d0(param_1,uStack_c0,&uStack_90,1,uVar5,&puStack_f8);
      uVar3 = (undefined4)((ulonglong)uVar5 >> 0x20);
      uStack_98 = 0x25;
      puVar10 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
      if ((0x46U >> (*(uint *)((longlong)puVar10 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar10);
      }
      *(undefined4 *)((longlong)puVar10 + 0xc) = 0;
      *puVar10 = 0;
      uStack_98 = 0x26;
      uVar8 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
      func_0x00014001fa10(auStack_d0,uVar6,_UNK_140439e78);
      uVar5 = func_0x000140168970(0x1e,0x23);
      uStack_78._0_4_ = SUB164(_auStack_80,8);
      auStack_80 = (undefined  [8])uVar5;
      uStack_78._4_4_ = 0;
      func_0x00014000bdb0(auStack_80,auStack_d0);
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar8,auStack_80);
      if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_80);
      }
      if ((0x46U >> (auStack_d0._12_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_d0);
      }
      func_0x000140141c50(1);
      uStack_98 = 0x27;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar10 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      puVar11 = (undefined8 *)func_0x00014012b840(puVar10,0);
      func_0x000140141d00(*puVar10);
      if ((0x46U >> (*(uint *)((longlong)puVar11 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar11);
      }
      *(undefined4 *)((longlong)puVar11 + 0xc) = 0;
      *puVar11 = 0x403e000000000000;
      func_0x000140141c50(2);
    }
  }
  uStack_98 = 0x2a;
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  uStack_90 = 0;
  uStack_88 = 0x500000000;
  uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x1875f);
  func_0x000140001490(&uStack_138,uVar5);
  puStack_f8 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x140656ce0);
  puStack_f0 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c5580);
  puStack_e8 = &uStack_118;
  uVar6 = func_0x0001401445d0(param_1,uStack_c0,&uStack_90,3,CONCAT44(uVar3,uRam00000001405c8a00),
                              &puStack_f8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar5,uVar6);
  func_0x000140141c50(1);
  uStack_98 = 0x2c;
  uStack_78._0_4_ = *(undefined4 *)(puVar7 + 1);
  uStack_78._4_4_ = *(uint *)((longlong)puVar7 + 0xc);
  if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) == 0) {
    auStack_80 = (undefined  [8])*puVar7;
  }
  else {
    func_0x0001400d4d20(auStack_80);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656d18) &&
     (func_0x0001403f6320(0x140656d18), iRam0000000140656d18 == -1)) {
    auRam0000000140656cfc = ZEXT816(0);
    uRam0000000140656cf0 = 0x3ff0000000000000;
    uRam0000000140656d10 = 0x100000000;
    func_0x0001403f6668(&DAT_1400d4c90);
    func_0x0001403f62c0(0x140656d18);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar12 = 0;
  iVar2 = func_0x00014015be60(0x140656cf0,auStack_80,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x0001400d4318:
    iVar2 = *(int *)(lVar12 * 0x14 + 0x140656d00);
    if (iVar2 != 1) {
      if (iVar2 == 0) {
        uStack_98 = 0x2e;
        puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
        if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar7);
        }
        *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
        *puVar7 = 0x3ff0000000000000;
        uStack_98 = 0x2f;
        auStack_d0._0_12_ = SUB1612(ZEXT816(0),0);
        auStack_d0._12_4_ = 0;
        func_0x000140160b90(0xb,0x186d9,0x80000000,auStack_d0);
        uStack_98 = 0x30;
      }
      goto code_r0x0001400d43a2;
    }
    uStack_98 = 0x31;
    auStack_d0 = ZEXT816(0x3ff0000000000000);
    func_0x000140160b90(0xb,0x186d9,0x80000000,auStack_d0);
    uStack_98 = 0x32;
    puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186ea);
    if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar7);
    }
    *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
    *puVar7 = 0;
    uStack_98 = 0x33;
  }
  else {
    iVar2 = func_0x00014015be60(0x140656d04,auStack_80,uVar5,0);
    if (iVar2 == 0) {
      lVar12 = 1;
      goto code_r0x0001400d4318;
    }
code_r0x0001400d43a2:
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_80);
  }
code_r0x0001400d43be:
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_160);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
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
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
