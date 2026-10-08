/// @description FNAFN Obj_Menu_Night_Display / Step — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Night_Display_Step_0
// Fade controller + timer sweep (same shapes as Obj_Night_Time/Step_1,
// Obj_Menu_Loading/Step). uStack_a0 = 1..0x1e are GML line markers,
// delta_factor (id 0x1870b) read once into uStack_110.
//   fade (id 0x18717) == 0: alpha (id 0x186da) = lerp(alpha, 1.0, 0.04*delta)
//     — target @0x1405c3e00 = 1.0 (exe_strings.py), rate 0x3fa47ae147ae147b
//     = 0.04, MUL helper 0x1400053f0, lerp slot 0x1405c8cc0.
//   fade == 1.0 (0x3ff0000000000000):
//     if (alpha != 0) alpha = lerp(alpha, <runtime @0x140655610>,
//       0.023*delta) — rate 0x3f96872b020c49ba ~= 0.023, target guarded-pool
//       TODO(calibrate).
//     if (alpha <= 0) instance_destroy() (func_0x00014017c070, PROVEN).
//   timer sweep: for (i in 0..array_length(Scr_Camera_Update)-1) — slot
//     0x1405c8ba0, id 0x186d5 is ARRAY (PROVEN). Timers >0 count down
//     -= delta_factor (0x14000bdb0); timers hitting <=0 that aren't -100
//     are set -100 (0xc059000000000000) and fire event_perform(ev_alarm,i)
//     (0x140181c50, type 2 = ev_alarm).
if (fade == 0) {
    alpha = lerp(alpha, 1, 0.04 * delta_factor);
}
if (fade == 1) {
    if (alpha != 0) {
        alpha = lerp(alpha, 0 /* TODO(calibrate): runtime const @0x140655610 */, 0.023 * delta_factor);
    }
    if (alpha <= 0) {
        instance_destroy();
    }
}
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

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Night_Display_Step_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uVar6;
  undefined8 *puVar7;
  undefined8 *puVar8;
  double dVar9;
  undefined4 uVar10;
  undefined8 uStack_120;
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
  puStack_a8 = &UNK_14043ab7a;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  plRam0000000140657680 = param_1;
  uStack_98 = param_2;
  uStack_110 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_b8 = CONCAT44(0xffffff,(undefined4)uStack_b8);
  uStack_c0 = 0;
  uStack_114 = 0xffffff;
  uStack_120 = 0;
  uStack_a0 = 1;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18717);
  uStack_64 = 0;
  uStack_70 = 0;
  uVar3 = (undefined4)uRam00000001405cd9c0;
  uVar10 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_a0 = 3;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0;
    uStack_74 = 5;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186da);
    func_0x000140001490(&uStack_108,uVar5);
    puStack_d8 = &uStack_108;
    func_0x00014000bee0(&uStack_f8,0x1405c3e00);
    uStack_64 = 0;
    uStack_70 = 0x3fa47ae147ae147b;
    puStack_d0 = &uStack_f8;
    func_0x0001400053f0(&uStack_70,uStack_110);
    func_0x000140001490(&uStack_e8,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_c8 = &uStack_e8;
    uVar6 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8cc0,&puStack_d8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar5,uVar6);
    func_0x000140141c50(1);
    uVar3 = (undefined4)uRam00000001405cd9c0;
    uVar10 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
  }
  uStack_a0 = 5;
  uStack_64 = 0;
  uStack_70 = 0x3ff0000000000000;
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,CONCAT44(uVar10,uVar3),0);
  if (iVar2 == 0) {
    uStack_a0 = 7;
    (**(code **)(*param_1 + 8))(param_1,0x18717);
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186da);
    uStack_64 = 0;
    uStack_70 = 0;
    uVar3 = (undefined4)uRam00000001405cd9c0;
    uVar10 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar2 != 0) {
      uStack_a0 = 9;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186da);
      func_0x000140001490(&uStack_108,uVar4);
      puStack_d8 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x140655610);
      uStack_64 = 0;
      uStack_70 = 0x3f96872b020c49ba;
      puStack_d0 = &uStack_f8;
      func_0x0001400053f0(&uStack_70,uStack_110);
      func_0x000140001490(&uStack_e8,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      puStack_c8 = &uStack_e8;
      uVar5 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8cc0,&puStack_d8);
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar4,uVar5);
      func_0x000140141c50(1);
      uVar3 = (undefined4)uRam00000001405cd9c0;
      uVar10 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    }
    uStack_a0 = 0xb;
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,CONCAT44(uVar10,uVar3),1);
    if ((iVar2 != -2) && (iVar2 < 1)) {
      uStack_a0 = 0xd;
      (**(code **)(*param_1 + 0x10))(param_1,0x186da);
      func_0x00014017c070(param_1,uStack_98,0,0);
    }
  }
  uStack_a0 = 0x13;
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
    uStack_a0 = 0x16;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_90);
    uVar4 = func_0x00014002fbe0(uVar4,uVar3);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_a0 = 0x1b;
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
          uStack_a0 = 0x1d;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_90);
          puVar8 = (undefined8 *)func_0x00014012b840(puVar7,uVar3);
          func_0x000140141d00(*puVar7);
          if ((0x46U >> (*(uint *)((longlong)puVar8 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar8);
          }
          *(undefined4 *)((longlong)puVar8 + 0xc) = 0;
          *puVar8 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_a0 = 0x1e;
          dVar9 = uStack_90;
          if ((uStack_84 & 0xffffff) != 0) {
            dVar9 = (double)func_0x00014012d320(&uStack_90);
          }
          func_0x000140181c50(param_1,uStack_98,2,(longlong)dVar9);
        }
      }
    }
    else {
      uStack_a0 = 0x18;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar7 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar4 = func_0x00014012b840(puVar7,uVar3);
      func_0x000140141d00(*puVar7);
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
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_120);
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
