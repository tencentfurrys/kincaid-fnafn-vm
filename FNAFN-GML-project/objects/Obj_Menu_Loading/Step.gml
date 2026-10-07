/// @description FNAFN Obj_Menu_Loading / Step — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Loading_Step_1 (3228 B @0x140091220)
// The loading-screen controller, part 2. uStack_a0 = 3..0x37 are GML source
// line markers; delta_factor (id 0x1870b) is read once into uStack_110.
//   lines 6-14: the SAME timer sweep as Obj_Night_Time/Step:
//     for (var i = 0; i < array_length(Scr_Camera_Update); i += 1). A
//     timer still > 0 counts down by delta_factor (func_0x00014000bdb0 =
//     the -= op helper); a timer that has reached <= 0 (round()ed) and is
//     not the -100 "disabled" sentinel is set to -100 and fires
//     event_perform(ev_alarm, i) (func_0x000140181c50, PROVEN 2026-10-06).
//     array_length (0x1405c8ba0) + round (0x1405c89b0) are registry-
//     confirmed. This drives the loading screen's own timed sequence
//     (Create arms Scr_Camera_Update[1] = 250).
//   lines 20-21: if (Loading == 1) { Load_Cooldown -= delta_factor; if
//     (Load_Cooldown <= 0) event_perform(ev_alarm, 0); } — the load-tick:
//     compare flags 0 + result == 0 for Loading vs 1.0, flags 1 +
//     result < 1 (=> <=) for Load_Cooldown vs 0.
//   lines 25-31: two-case switch on fading (id 0x18719), case constants
//     0 (pool const @0x140655cd0) and 1.0 (@0x140655ce4) with the case
//     table at 0x140655ce0 (table[1] = 1 written explicitly => table[0] =
//     0), the same guarded-pool shape as Obj_Night_Time/Step:
//     fading == 0: alpha = lerp(alpha, 1, 0.015*delta) — the fade-IN
//       target is the .data double @0x1405c4998 = 1.0 (0x3f8eb851eb851eb8
//       = 0.015; lerp = slot 0x1405c8cc0).
//     fading == 1: alpha = lerp(alpha, <runtime pool const @0x140655cc0>,
//       0.015*delta) — the fade-OUT target is seeded at load time, not
//       readable from the exe: TODO(calibrate) (a fade-out, so 0 is the
//       likely value). Then if (alpha < 0.005) (0x3f747ae147ae147b):
//       Switches_to_room (0x1877d) == 1 -> room_goto(Room_to_go_to)
//       (0x18760; slot 0x1405c8cb0), else instance_destroy()
//       (func_0x00014017c070, PROVEN 2026-10-06).
//   line 0x37 (last): spinner_angle (0x18772) -= 15 (0x402e000000000000)
//     — unconditional, spins the loading spinner sprite every step.
for (var i = 0; i < array_length(Scr_Camera_Update); i += 1) {
    if (Scr_Camera_Update[i] <= 0) {
        if (round(Scr_Camera_Update[i]) <= 0) {
            if (round(Scr_Camera_Update[i]) > -100) {
                Scr_Camera_Update[i] = -100;
                event_perform(ev_alarm, i);
            }
        }
    } else {
        Scr_Camera_Update[i] -= delta_factor;
    }
}
if (Loading == 1) {
    Load_Cooldown -= delta_factor;
    if (Load_Cooldown <= 0) {
        event_perform(ev_alarm, 0);
    }
}
if (fading == 0) {
    alpha = lerp(alpha, 1, 0.015 * delta_factor);
} else if (fading == 1) {
    alpha = lerp(alpha, 0 /* TODO(calibrate): runtime const @0x140655cc0 (fade-out target) */, 0.015 * delta_factor);
    if (alpha < 0.005) {
        if (Switches_to_room == 1) {
            room_goto(Room_to_go_to);
        } else {
            instance_destroy();
        }
    }
}
spinner_angle -= 15;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_Loading_Step_1(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  longlong lVar8;
  longlong unaff_GS_OFFSET;
  double dVar9;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
  uint uStack_124;
  undefined8 uStack_120;
  undefined4 uStack_118;
  uint uStack_114;
  undefined8 uStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 *puStack_d8;
  undefined8 *puStack_d0;
  undefined8 *puStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043b86e;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_98 = param_2;
  uStack_110 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_b8 = CONCAT44(0xffffff,(undefined4)uStack_b8);
  uStack_c0 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_a0 = 3;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  dVar1 = _UNK_140439dd0;
  uStack_84 = 0;
  uStack_90 = 0.0;
  while( true ) {
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0;
    uStack_74 = 5;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_108,uVar4);
    puStack_d8 = &uStack_108;
    uVar4 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8ba0,&puStack_d8);
    iVar2 = func_0x00014015be60(&uStack_90,uVar4,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_a0 = 6;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_90);
    uVar4 = func_0x00014002fbe0(uVar4,uVar3);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_a0 = 0xb;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar4 = func_0x00014002fbe0(uVar4,uVar3);
      func_0x000140001490(&uStack_108,uVar4);
      puStack_d8 = &uStack_108;
      uVar4 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c89b0,&puStack_d8);
      uStack_64 = 0;
      uStack_70 = 0;
      iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_c0);
        }
        uStack_c0 = 0;
        uStack_b8 = 0x500000000;
        uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_90);
        uVar4 = func_0x00014002fbe0(uVar4,uVar3);
        func_0x000140001490(&uStack_f8,uVar4);
        puStack_d0 = &uStack_f8;
        uVar4 = func_0x0001401445d0(param_1,uStack_98,&uStack_c0,1,uRam00000001405c89b0,&puStack_d0)
        ;
        uStack_64 = 0;
        uStack_70 = 0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_a0 = 0xd;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_90);
          puVar6 = (undefined8 *)func_0x00014012b840(puVar5,uVar3);
          func_0x000140141d00(*puVar5);
          if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar6);
          }
          *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
          *puVar6 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_a0 = 0xe;
          dVar9 = uStack_90;
          if ((uStack_84 & 0xffffff) != 0) {
            dVar9 = (double)func_0x00014012d320(&uStack_90);
          }
          func_0x000140181c50(param_1,uStack_98,2,(longlong)dVar9);
        }
      }
    }
    else {
      uStack_a0 = 8;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar4 = func_0x00014012b840(puVar5,uVar3);
      func_0x000140141d00(*puVar5);
      func_0x00014000bdb0(uVar4,uStack_110);
      func_0x000140141c50(2);
    }
    switch(uStack_84 & 0xffffff) {
    case 1:
      uStack_90 = (double)func_0x00014012d320(&uStack_90);
      uStack_90 = uStack_90 + dVar1;
      uStack_84 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_90,&uStack_90);
      break;
    case 7:
      uStack_90 = (double)CONCAT44(uStack_90._4_4_,(int)uStack_90 + 1);
      break;
    case 10:
      uStack_90 = (double)((longlong)uStack_90 + 1);
      break;
    case 0xd:
      uStack_84 = 0;
    case 0:
      uStack_90 = uStack_90 + dVar1;
    }
  }
  uStack_a0 = 0x14;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18733);
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_a0 = 0x1e;
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18731);
    func_0x000140141d00(param_1);
    func_0x00014000bdb0(uVar4,uStack_110);
    func_0x000140141c50(1);
    uStack_a0 = 0x1f;
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 1)) {
      uStack_a0 = 0x21;
      (**(code **)(*param_1 + 0x10))(param_1,0x18731);
      func_0x000140181c50(param_1,uStack_98,2,0);
    }
  }
  uStack_a0 = 0x25;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18719);
  uStack_114 = *(uint *)((longlong)puVar5 + 0xc);
  uStack_118 = *(undefined4 *)(puVar5 + 1);
  if ((0x46U >> (uStack_114 & 0x1f) & 1) == 0) {
    uStack_120 = *puVar5;
  }
  else {
    func_0x0001400924e0(&uStack_120,puVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655cf8) &&
     (func_0x0001403f6320(0x140655cf8), iRam0000000140655cf8 == -1)) {
    uRam0000000140655cdc = 0;
    uRam0000000140655cd0 = 0;
    uRam0000000140655cf0 = 0x100000000;
    uRam0000000140655ce4 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_140092450);
    func_0x0001403f62c0(0x140655cf8);
  }
  uVar4 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar2 = func_0x00014015be60(0x140655cd0,&uStack_120,uRam00000001405cd9c0,0);
  if (iVar2 != 0) {
    iVar2 = func_0x00014015be60(0x140655ce4,&uStack_120,uVar4,0);
    if (iVar2 != 0) goto code_r0x000140091d25;
    lVar8 = 1;
  }
  iVar2 = *(int *)(lVar8 * 0x14 + 0x140655ce0);
  if (iVar2 == 1) {
    uStack_a0 = 0x28;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0;
    uStack_74 = 5;
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186da);
    func_0x000140001490(&uStack_108,uVar4);
    puStack_d8 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x140655cc0);
    uStack_64 = 0;
    uStack_70 = 0x3f8eb851eb851eb8;
    puStack_d0 = &uStack_f8;
    func_0x0001400053f0(&uStack_70,uStack_110);
    func_0x000140001490(&uStack_e8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_c8 = &uStack_e8;
    uVar7 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8cc0,&puStack_d8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar4,uVar7);
    func_0x000140141c50(1);
    uStack_a0 = 0x29;
    uStack_64 = 0;
    uStack_70 = 0x3f747ae147ae147b;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_a0 = 0x2b;
      (**(code **)(*param_1 + 0x10))(param_1,0x186da);
      uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1877d);
      uStack_64 = 0;
      uStack_70 = 0x3ff0000000000000;
      iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
      if (iVar2 == 0) {
        uStack_a0 = 0x2d;
        if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_80);
        }
        uStack_80 = 0;
        uStack_78 = 0;
        uStack_74 = 5;
        uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18760);
        func_0x000140001490(&uStack_108,uVar4);
        puStack_d8 = &uStack_108;
        func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8cb0,&puStack_d8);
      }
      else {
        uStack_a0 = 0x31;
        func_0x00014017c070(param_1,uStack_98,0,0);
      }
    }
  }
  else if (iVar2 == 0) {
    uStack_a0 = 0x27;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0;
    uStack_74 = 5;
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186da);
    func_0x000140001490(&uStack_108,uVar4);
    puStack_d8 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c4998);
    uStack_64 = 0;
    uStack_70 = 0x3f8eb851eb851eb8;
    puStack_d0 = &uStack_f8;
    func_0x0001400053f0(&uStack_70,uStack_110);
    func_0x000140001490(&uStack_e8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_c8 = &uStack_e8;
    uVar7 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8cc0,&puStack_d8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar4,uVar7);
    func_0x000140141c50(1);
  }
code_r0x000140091d25:
  uStack_a0 = 0x37;
  uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18772);
  uStack_64 = 0;
  uStack_70 = 0x402e000000000000;
  func_0x00014000bdb0(uVar4,&uStack_70);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_120);
  }
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
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
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */
