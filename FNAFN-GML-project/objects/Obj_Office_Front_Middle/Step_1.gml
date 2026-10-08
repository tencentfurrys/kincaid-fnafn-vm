/// @description FNAFN Obj_Office_Front_Middle / Step_1 — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Middle_Step_1 (4186 B @0x1400bee60)
// Middle-office ambience step. Globals: delta_factor (0x1870b),
// game_settings array (0x18727), Night_camera (0x1873b),
// Night_office_rotated (0x18747). Self: ambient_gain (0x186dc),
// office_emitter (0x1874f). Scr_Camera_Update (0x186d5) is the shared
// 12-element timer ARRAY (PROVEN: array_length + indexed writes).
// Helpers: slot 0x1405c8ba0 = array_length, 0x1405c89b0 = round,
// 0x1405c8cc0 = lerp, 0x1405c8eb0 = audio_emitter_gain,
// func_0x000140181c50 = event_perform(ev_alarm, N) (PROVEN),
// func_0x00014000bdb0 = -= op helper.
// TODO(calibrate): all @0x140656xxx runtime-pool consts (switch consts +
// tables @0x1406565d0/@0x140656600/@0x140656630, lerp-speed consts) and all
// @0x1405c51xx exe consts (below the EXE-CONSTANTS dump range: lerp targets
// @0x1405c5190/@0x1405c5160/@0x1405c5180/@0x1405c5170/@0x1405c5150).
// Inline const decoded: -100.0 (0xc059000000000000 sentinel), -0.0449
// (0x3fa7... guard), 1.0 lerp-compare const.
// 1. Timer sweep over Scr_Camera_Update (same shape as Obj_Night_Time/Step):
for (var i = 0; i < array_length(Scr_Camera_Update); i += 1) {
    if (Scr_Camera_Update[i] <= 0) {
        // C guards with round() on both sides: round(elem) <= 0, then
        // round(elem) <= 0 again, then round(elem) > -0.0449 fires.
        if (round(Scr_Camera_Update[i]) <= 0 && round(Scr_Camera_Update[i]) > -0.044921875) {
            Scr_Camera_Update[i] = -100;
            event_perform(ev_alarm, i);
        }
    } else {
        Scr_Camera_Update[i] -= delta_factor;
    }
}
// 2. game_settings[8] two-case switch (runtime consts/table TODO):
// case 1 lerps ambient_gain toward its pair, case 0 falls into the
// Night_camera / Night_office_rotated staging below.
if (game_settings[8] == /* TODO(calibrate runtime): @0x1406565c0 case 1 */ 1) {
    ambient_gain = lerp(ambient_gain, /* TODO @0x1405c5190 */ 0, /* TODO @0x1405c5160 */ 0);
} else {
    // Night_camera switch (runtime consts @0x1406565f0/@0x140656604 TODO):
    if (Night_camera == /* TODO(runtime) @0x1406565f0 case */ 0) {
        // Night_office_rotated switch (runtime consts @0x140656620 /
        // @0x140656634 TODO): each leaf lerps ambient_gain toward its own
        // exe-const pair.
        if (Night_office_rotated == /* TODO(runtime) @0x140656620 case */ 0) {
            ambient_gain = lerp(ambient_gain, /* TODO @0x1405c5170 */ 0, /* TODO @0x1405c5160 */ 0);
        } else {
            ambient_gain = lerp(ambient_gain, /* TODO @0x1405c5150 */ 0, /* TODO @0x1405c5160 */ 0);
        }
    } else {
        ambient_gain = lerp(ambient_gain, /* TODO @0x1405c5180 */ 0, /* TODO @0x1405c5160 */ 0);
    }
}
audio_emitter_gain(office_emitter, ambient_gain);
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// ground truth: gml_Object_Obj_Office_Front_Middle_Step_1 (4186 B @0x1400bee60)
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Office_Front_Middle_Step_1(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  undefined8 *puVar8;
  undefined8 *puVar9;
  longlong lVar10;
  longlong unaff_GS_OFFSET;
  double dVar11;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  undefined4 uStack_130;
  uint uStack_12c;
  undefined8 uStack_128;
  undefined4 uStack_120;
  uint uStack_11c;
  undefined8 uStack_118;
  undefined8 uStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined *puStack_d0;
  undefined4 uStack_c8;
  longlong *plStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  longlong lStack_98;
  undefined4 uStack_90;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_d0 = &UNK_14043c532;
  uStack_c8 = 0;
  uStack_d8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_88 = param_2;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  plStack_c0 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  puVar5 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  puVar6 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uStack_68._4_4_ = 0xffffff;
  uStack_70 = 0;
  uStack_110 = CONCAT44(0xffffff,(undefined4)uStack_110);
  uStack_118 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_c8 = 3;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  dVar1 = _UNK_140439dd0;
  uStack_74 = 0;
  uStack_80 = 0.0;
  while( true ) {
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68._0_4_ = 0;
    uStack_68._4_4_ = 5;
    uVar7 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_108,uVar7);
    puStack_b8 = &uStack_108;
    uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_70,1,uRam00000001405c8ba0,&puStack_b8);
    iVar2 = func_0x00014015be60(&uStack_80,uVar7,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_c8 = 6;
    uVar7 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_80);
    uVar7 = func_0x00014002fbe0(uVar7,uVar3);
    uStack_8c = 0;
    lStack_98 = 0;
    iVar2 = func_0x00014015be60(uVar7,&lStack_98,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_c8 = 0xb;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_80);
      uVar7 = func_0x00014002fbe0(uVar7,uVar3);
      func_0x000140001490(&uStack_108,uVar7);
      puStack_b8 = &uStack_108;
      uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_70,1,uRam00000001405c89b0,&puStack_b8);
      uStack_8c = 0;
      lStack_98 = 0;
      iVar2 = func_0x00014015be60(uVar7,&lStack_98,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_118);
        }
        uStack_118 = 0;
        uStack_110 = 0x500000000;
        uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_80);
        uVar7 = func_0x00014002fbe0(uVar7,uVar3);
        func_0x000140001490(&uStack_f8,uVar7);
        puStack_b0 = &uStack_f8;
        uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_118,1,uRam00000001405c89b0,&puStack_b0
                                   );
        uStack_8c = 0;
        lStack_98 = -0x3fa7000000000000;
        iVar2 = func_0x00014015be60(uVar7,&lStack_98,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_c8 = 0xd;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_80);
          puVar9 = (undefined8 *)func_0x00014012b840(puVar8,uVar3);
          func_0x000140141d00(*puVar8);
          if ((0x46U >> (*(uint *)((longlong)puVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar9);
          }
          *(undefined4 *)((longlong)puVar9 + 0xc) = 0;
          *puVar9 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_c8 = 0xe;
          dVar11 = uStack_80;
          if ((uStack_74 & 0xffffff) != 0) {
            dVar11 = (double)func_0x00014012d320(&uStack_80);
          }
          func_0x000140181c50(param_1,uStack_88,2,(longlong)dVar11);
        }
      }
    }
    else {
      uStack_c8 = 8;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar8 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_80);
      uVar7 = func_0x00014012b840(puVar8,uVar3);
      func_0x000140141d00(*puVar8);
      func_0x00014000bdb0(uVar7,uVar4);
      func_0x000140141c50(2);
    }
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
  uStack_c8 = 0x14;
  if (((*(uint *)((longlong)plStack_c0 + 0xc) & 0xffffff) == 2) && (*plStack_c0 != 0)) {
    func_0x0001401479b0();
    iVar2 = func_0x000140147990(*plStack_c0);
    if (iVar2 < 9) {
      uVar3 = func_0x000140147990(*plStack_c0);
      func_0x000140144260(&UNK_140439ca6,8,uVar3);
      plStack_c0 = (longlong *)0x0;
    }
    else {
      plStack_c0 = (longlong *)func_0x000140147980(*plStack_c0,8);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_8c = *(uint *)((longlong)plStack_c0 + 0xc);
  uStack_90 = *(undefined4 *)(plStack_c0 + 1);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) == 0) {
    lStack_98 = *plStack_c0;
  }
  else {
    func_0x0001400c05a0(&lStack_98);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406565e8) &&
     (func_0x0001403f6320(0x1406565e8), iRam00000001406565e8 == -1)) {
    func_0x0001401453a0(0x1406565c0,0x1405c5138);
    uRam00000001406565d0 = 0;
    func_0x0001401453a0(0x1406565d4,0x1405c5141);
    uRam00000001406565e4 = 1;
    func_0x0001403f6668(&DAT_1400c03f0);
    func_0x0001403f62c0(0x1406565e8);
  }
  uVar4 = uRam00000001405cd9c0;
  lVar10 = 0;
  iVar2 = func_0x00014015be60(0x1406565c0,&lStack_98,uRam00000001405cd9c0,0);
  if (iVar2 != 0) {
    iVar2 = func_0x00014015be60(0x1406565d4,&lStack_98,uVar4,0);
    if (iVar2 != 0) goto code_r0x0001400bfba5;
    lVar10 = 1;
  }
  iVar2 = *(int *)(lVar10 * 0x14 + 0x1406565d0);
  if (iVar2 == 1) {
    uStack_c8 = 0x21;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68._0_4_ = 0;
    uStack_68._4_4_ = 5;
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186dc);
    func_0x000140001490(&uStack_108,uVar4);
    puStack_b8 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c5190);
    puStack_b0 = &uStack_f8;
    func_0x00014000bee0(&uStack_e8,0x1405c5160);
    puStack_a8 = &uStack_e8;
    uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_70,3,uRam00000001405c8cc0,&puStack_b8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar4,uVar7);
    func_0x000140141c50(1);
    goto code_r0x0001400bfba5;
  }
  if (iVar2 != 0) goto code_r0x0001400bfba5;
  uStack_c8 = 0x16;
  uStack_12c = *(uint *)((longlong)puVar5 + 0xc);
  uStack_130 = *(undefined4 *)(puVar5 + 1);
  if ((0x46U >> (uStack_12c & 0x1f) & 1) == 0) {
    uStack_138 = *puVar5;
  }
  else {
    func_0x0001400c05a0(&uStack_138);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656618) &&
     (func_0x0001403f6320(0x140656618), iRam0000000140656618 == -1)) {
    uRam00000001406565fc = 0;
    uRam00000001406565f0 = 0;
    uRam0000000140656610 = 0x100000000;
    uRam0000000140656604 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_1400c0480);
    func_0x0001403f62c0(0x140656618);
  }
  uVar4 = uRam00000001405cd9c0;
  lVar10 = 0;
  iVar2 = func_0x00014015be60(0x1406565f0,&uStack_138,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x0001400bf7ce:
    iVar2 = *(int *)(lVar10 * 0x14 + 0x140656600);
    if (iVar2 == 1) {
      uStack_c8 = 0x1e;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186dc);
      func_0x000140001490(&uStack_108,uVar4);
      puStack_b8 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1405c5180);
      puStack_b0 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x1405c5160);
      puStack_a8 = &uStack_e8;
      uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_70,3,uRam00000001405c8cc0,&puStack_b8);
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar4,uVar7);
      func_0x000140141c50(1);
    }
    else if (iVar2 == 0) {
      uStack_c8 = 0x18;
      uStack_11c = *(uint *)((longlong)puVar6 + 0xc);
      uStack_120 = *(undefined4 *)(puVar6 + 1);
      if ((0x46U >> (uStack_11c & 0x1f) & 1) == 0) {
        uStack_128 = *puVar6;
      }
      else {
        func_0x0001400c05a0(&uStack_128);
      }
      if ((*(int *)(*(longlong *)
                     (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
           iRam0000000140656648) && (func_0x0001403f6320(0x140656648), iRam0000000140656648 == -1))
      {
        uRam000000014065662c = 0;
        uRam0000000140656620 = 0;
        uRam0000000140656640 = 0x100000000;
        uRam0000000140656634 = 0x3ff0000000000000;
        func_0x0001403f6668(&DAT_1400c0510);
        func_0x0001403f62c0(0x140656648);
      }
      uVar4 = uRam00000001405cd9c0;
      lVar10 = 0;
      iVar2 = func_0x00014015be60(0x140656620,&uStack_128,uRam00000001405cd9c0,0);
      if (iVar2 == 0) {
code_r0x0001400bf97e:
        iVar2 = *(int *)(lVar10 * 0x14 + 0x140656630);
        if (iVar2 == 1) {
          uStack_c8 = 0x1b;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68._0_4_ = 0;
          uStack_68._4_4_ = 5;
          uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186dc);
          func_0x000140001490(&uStack_108,uVar4);
          puStack_b8 = &uStack_108;
          func_0x00014000bee0(&uStack_f8,0x1405c5170);
          puStack_b0 = &uStack_f8;
          func_0x00014000bee0(&uStack_e8,0x1405c5160);
          puStack_a8 = &uStack_e8;
          uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_70,3,uRam00000001405c8cc0,
                                      &puStack_b8);
          func_0x000140141d00(param_1);
          func_0x000140001490(uVar4,uVar7);
        }
        else {
          if (iVar2 != 0) goto code_r0x0001400bfb6c;
          uStack_c8 = 0x1a;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68._0_4_ = 0;
          uStack_68._4_4_ = 5;
          uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186dc);
          func_0x000140001490(&uStack_108,uVar4);
          puStack_b8 = &uStack_108;
          func_0x00014000bee0(&uStack_f8,0x1405c5150);
          puStack_b0 = &uStack_f8;
          func_0x00014000bee0(&uStack_e8,0x1405c5160);
          puStack_a8 = &uStack_e8;
          uVar7 = func_0x0001401445d0(param_1,uStack_88,&uStack_70,3,uRam00000001405c8cc0,
                                      &puStack_b8);
          func_0x000140141d00(param_1);
          func_0x000140001490(uVar4,uVar7);
        }
        func_0x000140141c50(1);
      }
      else {
        iVar2 = func_0x00014015be60(0x140656634,&uStack_128,uVar4,0);
        if (iVar2 == 0) {
          lVar10 = 1;
          goto code_r0x0001400bf97e;
        }
      }
code_r0x0001400bfb6c:
      uStack_c8 = 0x1d;
      if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_128);
      }
    }
  }
  else {
    iVar2 = func_0x00014015be60(0x140656604,&uStack_138,uVar4,0);
    if (iVar2 == 0) {
      lVar10 = 1;
      goto code_r0x0001400bf7ce;
    }
  }
  uStack_c8 = 0x20;
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
code_r0x0001400bfba5:
  uStack_c8 = 0x25;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1874f);
  uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x186dc);
  func_0x000140001490(&uStack_108,uVar4);
  puStack_b8 = &uStack_108;
  func_0x000140001490(&uStack_f8,uVar7);
  puStack_b0 = &uStack_f8;
  func_0x0001401445d0(param_1,uStack_88,&uStack_70,2,uRam00000001405c8eb0,&puStack_b8);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_98);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
  puRam0000000140657668 = (undefined8 *)uStack_d8;
  return;
}
END DECOMPILED REFERENCE */
