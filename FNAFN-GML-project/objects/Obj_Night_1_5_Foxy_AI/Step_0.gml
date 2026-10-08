/// @description FNAFN Obj_Night_1_5_Foxy_AI / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Foxy_AI_Step_0
// Camera-timer sweep, same array_length/round/-100/event_perform shape as
// the ported Bonnie/Chica/Mangle Steps, Foxy variant (no explicit 1.0 * MUL
// in the countdown — direct `-= delta_factor`, like the ported Mangle Step).
// Decoded:
//   for i over array_length(Scr_Camera_Update) (slot 0x1405c8ba0):
//     if (Scr_Camera_Update[i] <= 0):
//       if (round(Scr_Camera_Update[i]) <= 0):            // slot 0x1405c89b0
//         if (round(Scr_Camera_Update[i]) > -100):       // -100 = fired sentinel
//           Scr_Camera_Update[i] = -100;
//           event_perform(ev_alarm, i);                  // helper 0x140181c50, TYPE 2
//     else Scr_Camera_Update[i] -= delta_factor;
//   Loop increment shape = `i += 1` per PORTING.md.
//   0x15. if (door_wait_count > 0) (id 0x18711):
//     door_wait_count -= 1 * delta_factor (explicit 1.0 * MUL node
//       func_0x0001400053f0 with delta_factor id 0x1870b, then -= helper
//       func_0x00014000bdb0).
//     0x18. if (Night_door_left == 0) (id 0x18741):
//       show_message("Jumpscared by Foxy!") (exe const @0x1405c4ea0 via
//         string loader 0x1401441e0, slot 0x1405c8f80 show_message);
//       func_0x00014017bd60(0, 0) — unknown; TODO(calibrate).
// TODO(calibrate): func_0x00014017bd60(0,0) identity (single site repo-wide;
//   runs right after the Foxy jumpscare message) — verify in-game.
// Ported: Obj_Night_1_5_Foxy_AI / Step
for (var i = 0; i < array_length(Scr_Camera_Update); i += 1) {
    if (Scr_Camera_Update[i] <= 0) {
        if (round(Scr_Camera_Update[i]) <= 0) {
            if (round(Scr_Camera_Update[i]) > -100) { Scr_Camera_Update[i] = -100; event_perform(ev_alarm, i); }
        }
    } else { Scr_Camera_Update[i] -= delta_factor; }
}
if (door_wait_count > 0) {
    door_wait_count -= 1 * delta_factor;
    if (Night_door_left == 0) {
        show_message("Jumpscared by Foxy!");
        // TODO(calibrate): func_0x00014017bd60(0, 0) — unknown helper after jumpscare message, verify in-game
    }
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_1_5_Foxy_AI_Step_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 *puVar7;
  double dVar8;
  undefined8 uStack_120;
  uint uStack_114;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043bfaa;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_f0 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18741);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_b0 = CONCAT44(0xffffff,(undefined4)uStack_b0);
  uStack_b8 = 0;
  uStack_114 = 0xffffff;
  uStack_120 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_98 = 4;
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
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_d8,uVar5);
    puStack_e8 = &uStack_d8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c8ba0,&puStack_e8);
    iVar2 = func_0x00014015be60(&uStack_90,uVar5,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_98 = 7;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_90);
    uVar5 = func_0x00014002fbe0(uVar5,uVar3);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_98 = 0xc;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar5 = func_0x00014002fbe0(uVar5,uVar3);
      func_0x000140001490(&uStack_d8,uVar5);
      puStack_e8 = &uStack_d8;
      uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c89b0,&puStack_e8);
      uStack_64 = 0;
      uStack_70 = 0;
      iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_b8);
        }
        uStack_b8 = 0;
        uStack_b0 = 0x500000000;
        uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_90);
        uVar5 = func_0x00014002fbe0(uVar5,uVar3);
        func_0x000140001490(&uStack_c8,uVar5);
        puStack_e0 = &uStack_c8;
        uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_b8,1,uRam00000001405c89b0,&puStack_e0);
        uStack_64 = 0;
        uStack_70 = 0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_98 = 0xe;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_90);
          puVar7 = (undefined8 *)func_0x00014012b840(puVar6,uVar3);
          func_0x000140141d00(*puVar6);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar7);
          }
          *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
          *puVar7 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_98 = 0xf;
          dVar8 = uStack_90;
          if ((uStack_84 & 0xffffff) != 0) {
            dVar8 = (double)func_0x00014012d320(&uStack_90);
          }
          func_0x000140181c50(param_1,param_2,2,(longlong)dVar8);
        }
      }
    }
    else {
      uStack_98 = 9;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar5 = func_0x00014012b840(puVar6,uVar3);
      func_0x000140141d00(*puVar6);
      func_0x00014000bdb0(uVar5,uStack_f0);
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
  uStack_98 = 0x15;
  uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18711);
  uStack_64 = 0;
  uStack_70 = 0;
  iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
  if (0 < iVar2) {
    uStack_98 = 0x17;
    uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18711);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    func_0x0001400053f0(&uStack_70,uStack_f0);
    func_0x00014000bdb0(uVar5,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_98 = 0x18;
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar2 == 0) {
      uStack_98 = 0x1a;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_d8);
      }
      func_0x0001401441e0(&uStack_d8,0x1405c4ea0);
      puStack_e8 = &uStack_d8;
      func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c8f80,&puStack_e8);
      uStack_98 = 0x1b;
      func_0x00014017bd60(0,0);
    }
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_120);
  }
  if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
