/// @description FNAFN Obj_Night_1_5_Freddy_AI / Alarm — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_0 (2661 B @0x1400d11b0)
// Decoded, in order (uStack_88 = GML line markers), following the PORTED
// Obj_Night_1_5_Mangle_AI/Alarm template (same movement-gate shape):
//   3. movement = irandom_range(0, 30) (func_0x000140168970 best-fit; 0,0x1e).
//   5. if (Time_without_move >= -30) (-30.0 = 0xc03e000000000000 literal;
//      `>=` via the `r >= 0` test per PORTING.md compare calibration):
//        if (movement < Freddy_AI_Level (id 0x1871d) && Time_without_move <= 0
//          (`<` via `r < 0`, `<=` via `r < 1`)) -> movement opportunity;
//        else Time_without_move -= 1 (0x1e; -= helper func_0x00014000bdb0
//          with 1.0 literal).
//      else (Time_without_move < -30) -> forced movement opportunity.
//      Movement opportunity:
//        switch (Night_freddy_location) (id 0x18744) on runtime-pool cases
//        2.0/2.1/2.2 (@0x140656c20/0x140656c34/0x140656c48; guarded init;
//        2.0 = 0x4000000000000000, 2.1 = 0x4000cccccccccccd,
//        2.2 = 0x400199999999999a — outside the mapped exe image).
//        Branch bodies ARE recoverable here (explicit if/else, not a
//        jumptable like Mangle/Bonnie):
//          location 2.0 -> Night_freddy_location = 2.1; Scr_Camera_Update(39)
//            (exe const 39.0 @0x1405c54b8); alarm_type = 0;
//            audio_emitter_gain(Freddy_emitter, 0.3) (slot 0x1405c8eb0 =
//            audio_emitter_gain; 0.3 = raw `333333\xc3?` bytes @0x1405c54c8,
//            the IEEE-mantissa trap per PORTING.md).
//          location 2.1 -> Night_freddy_location = 2.2; same script/sound.
//          location 2.2 -> alarm_type = 1 (id 0x186d8).
//        Mapping above assumes 2.0->2.1->2.2->alarm progression;
//        TODO(calibrate): confirm case->branch mapping in-game (pool +
//        label table @0x140656c30, stride 0x14).
//        Fallthrough (no case matched): Time_without_move =
//          irandom_range(30, 35) (0x1e,0x23 best-fit) - Freddy_AI_Level * 0.2
//          (MUL best-fit func_0x00014001fa10 with .rdata double
//          _UNK_140439e78; TODO(calibrate) factor).
//   0x20. switch (alarm_type) on cases 0 / 1.0 (runtime pool
//      @0x140656c60/@0x140656c74; mapping per the PORTING.md two-case
//      flag-switch rule):
//        case 0: Scr_Camera_Update[0] = 30 (0x403e000000000000);
//        case 1: Scr_Camera_Update[1] = 15 (0x402e000000000000).
//      (Scr_Camera_Update id 0x186d5 is the 12-element array per PORTING.md;
//      index selects via func_0x00014012b840 second arg.)
// TODO(calibrate): func_0x000140168970 best-fit irandom_range;
// runtime consts @0x140656c20/@0x140656c60 (outside the mapped exe image)
// and the 0.2 factor — verify in-game.
// Ported: Obj_Night_1_5_Freddy_AI / Alarm_0
movement = irandom_range(0, 30);
var _move = false;
if (Time_without_move >= -30) {
    if (movement < Freddy_AI_Level && Time_without_move <= 0) {
        _move = true;
    } else {
        Time_without_move -= 1;
    }
} else {
    _move = true;
}
if (_move) {
    switch (Night_freddy_location) {
        case 2.0: // TODO(calibrate): runtime pool @0x140656c20; assumes 2.0 -> advance to 2.1
            Night_freddy_location = 2.1;
            Scr_Camera_Update(39);
            alarm_type = 0;
            audio_emitter_gain(Freddy_emitter, 0.3);
            break;
        case 2.1: // TODO(calibrate): runtime pool @0x140656c34; assumes 2.1 -> advance to 2.2
            Night_freddy_location = 2.2;
            Scr_Camera_Update(39);
            alarm_type = 0;
            audio_emitter_gain(Freddy_emitter, 0.3);
            break;
        case 2.2: // TODO(calibrate): runtime pool @0x140656c48; assumes 2.2 -> alarm
            alarm_type = 1;
            break;
        default:
            Time_without_move = irandom_range(30, 35) - Freddy_AI_Level * 0.2; // TODO(calibrate): 0.2 factor (_UNK_140439e78)
            break;
    }
}
switch (alarm_type) {
    case 0:
        Scr_Camera_Update[0] = 30;
        break;
    case 1: // TODO(calibrate): runtime pool @0x140656c60 mapping per two-case rule
        Scr_Camera_Update[1] = 15;
        break;
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_1_5_Freddy_AI_Alarm_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined4 uVar8;
  undefined8 **ppuVar7;
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
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
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
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043c8cc;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1871d);
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18744);
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_88 = 3;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18738);
  uVar5 = func_0x000140168970(0,0x1e);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = uVar5;
  uStack_88 = 5;
  uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18792);
  uStack_64 = 0;
  uStack_70 = 0xc03e000000000000;
  iVar1 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
  if ((iVar1 == -2) || (-1 < iVar1)) {
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18738);
    iVar1 = func_0x00014015be60(uVar5,uVar2,uRam00000001405cd9c0,1);
    if ((iVar1 != -2) && (iVar1 < 0)) {
      uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18792);
      uStack_64 = 0;
      uStack_70 = 0;
      iVar1 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) goto code_r0x0001400d1333;
    }
    uStack_88 = 0x1e;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    func_0x00014000bdb0(uVar5,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
  }
  else {
code_r0x0001400d1333:
    uStack_88 = 7;
    uStack_64 = *(uint *)((longlong)puVar3 + 0xc);
    uStack_68 = *(undefined4 *)(puVar3 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar3;
    }
    else {
      func_0x0001400d22c0(&uStack_70,puVar3);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam0000000140656c5c) &&
       (func_0x0001403f6320(0x140656c5c), iRam0000000140656c5c == -1)) {
      uRam0000000140656c2c = 0;
      uRam0000000140656c20 = 0x4000000000000000;
      uRam0000000140656c40 = 0x100000000;
      uRam0000000140656c34 = 0x4000cccccccccccd;
      uRam0000000140656c54 = 0x200000000;
      uRam0000000140656c48 = 0x400199999999999a;
      func_0x0001403f6668(&DAT_1400d2180);
      func_0x0001403f62c0(0x140656c5c);
    }
    uVar5 = uRam00000001405cd9c0;
    lVar6 = 0;
    iVar1 = func_0x00014015be60(0x140656c20,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x0001400d14d4:
      iVar1 = *(int *)(lVar6 * 0x14 + 0x140656c30);
      if (iVar1 == 2) {
code_r0x0001400d1654:
        uStack_88 = 0x17;
        puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
        if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar3);
        }
        *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
        *puVar3 = 0x3ff0000000000000;
      }
      else {
code_r0x0001400d14e5:
        if (iVar1 == 1) {
          uStack_88 = 0x10;
          if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar3);
          }
          *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
          *puVar3 = 0x400199999999999a;
          uStack_88 = 0x11;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_c8,0x1405c54b8);
          ppuVar7 = &puStack_d8;
          puStack_d8 = &uStack_c8;
          gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_80,1,&puStack_d8);
          uVar8 = (undefined4)((ulonglong)ppuVar7 >> 0x20);
          uStack_88 = 0x12;
          puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
          if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar3);
          }
          *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
          *puVar3 = 0;
          uStack_88 = 0x14;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1871f);
          func_0x000140001490(&uStack_c8,uVar5);
          puStack_d8 = &uStack_c8;
          func_0x00014000bee0(&uStack_b8,0x1405c54c8);
          puStack_d0 = &uStack_b8;
          func_0x0001401445d0(param_1,param_2,&uStack_80,2,CONCAT44(uVar8,uRam00000001405c8eb0),
                              &puStack_d8);
        }
        else if (iVar1 == 0) {
          uStack_88 = 10;
          if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar3);
          }
          *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
          *puVar3 = 0x4000cccccccccccd;
          uStack_88 = 0xb;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014000bee0(&uStack_c8,0x1405c54b8);
          ppuVar7 = &puStack_d8;
          puStack_d8 = &uStack_c8;
          gml_Script_Scr_Camera_Update(param_1,param_2,&uStack_80,1,&puStack_d8);
          uVar8 = (undefined4)((ulonglong)ppuVar7 >> 0x20);
          uStack_88 = 0xc;
          puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
          if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar3);
          }
          *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
          *puVar3 = 0;
          uStack_88 = 0xe;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          uVar5 = (**(code **)(*param_1 + 8))(param_1,0x1871f);
          func_0x000140001490(&uStack_c8,uVar5);
          puStack_d8 = &uStack_c8;
          func_0x00014000bee0(&uStack_b8,0x1405c54c8);
          puStack_d0 = &uStack_b8;
          func_0x0001401445d0(param_1,param_2,&uStack_80,2,CONCAT44(uVar8,uRam00000001405c8eb0),
                              &puStack_d8);
        }
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x140656c34,&uStack_70,uVar5,0);
      if (iVar1 == 0) {
        lVar6 = 1;
        goto code_r0x0001400d14d4;
      }
      iVar1 = func_0x00014015be60(0x140656c48,&uStack_70,uVar5,0);
      if (iVar1 == 0) {
        iVar1 = uRam0000000140656c54._4_4_;
        if (uRam0000000140656c54._4_4_ != 2) goto code_r0x0001400d14e5;
        goto code_r0x0001400d1654;
      }
    }
    uStack_88 = 0x1a;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
    func_0x00014001fa10(auStack_e8,uVar2,_UNK_140439e78);
    uStack_a8 = func_0x000140168970(0x1e,0x23);
    uStack_9c = 0;
    func_0x00014000bdb0(&uStack_a8,auStack_e8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar5,&uStack_a8);
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_e8);
    }
    func_0x000140141c50(1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
  }
  uStack_88 = 0x20;
  puVar3 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
  uStack_64 = *(uint *)((longlong)puVar3 + 0xc);
  uStack_68 = *(undefined4 *)(puVar3 + 1);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
    uStack_70 = *puVar3;
  }
  else {
    func_0x0001400d22c0(&uStack_70,puVar3);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656c88) &&
     (func_0x0001403f6320(0x140656c88), iRam0000000140656c88 == -1)) {
    uRam0000000140656c6c = 0;
    uRam0000000140656c60 = 0;
    uRam0000000140656c80 = 0x100000000;
    uRam0000000140656c74 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_1400d2230);
    func_0x0001403f62c0(0x140656c88);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar6 = 0;
  iVar1 = func_0x00014015be60(0x140656c60,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140656c74,&uStack_70,uVar5,0);
    if (iVar1 != 0) goto code_r0x0001400d1a4b;
    lVar6 = 1;
  }
  iVar1 = *(int *)(lVar6 * 0x14 + 0x140656c70);
  if (iVar1 == 1) {
    uStack_88 = 0x23;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar3 = (undefined8 *)func_0x00014012b840(puVar4,1);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar3);
    }
    *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
    uVar5 = 0x402e000000000000;
  }
  else {
    if (iVar1 != 0) goto code_r0x0001400d1a4b;
    uStack_88 = 0x22;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar3 = (undefined8 *)func_0x00014012b840(puVar4,0);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar3 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar3);
    }
    *(undefined4 *)((longlong)puVar3 + 0xc) = 0;
    uVar5 = 0x403e000000000000;
  }
  *puVar3 = uVar5;
  func_0x000140141c50(2);
code_r0x0001400d1a4b:
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
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
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
