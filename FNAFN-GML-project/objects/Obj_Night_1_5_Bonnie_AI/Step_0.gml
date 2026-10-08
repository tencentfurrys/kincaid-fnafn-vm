/// @description FNAFN Obj_Night_1_5_Bonnie_AI / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Bonnie_AI_Step_0
// Camera-timer sweep, identical in shape to the already-ported
// Obj_Night_1_5_Mangle_AI Step (same array_length/round/-100/event_perform
// structure). Decoded:
//   for i over array_length(Scr_Camera_Update) (slot 0x1405c8ba0):
//     if (Scr_Camera_Update[i] <= 0):
//       if (round(Scr_Camera_Update[i]) <= 0):            // slot 0x1405c89b0
//         if (round(Scr_Camera_Update[i]) > -100):       // -100 = fired sentinel
//           Scr_Camera_Update[i] = -100;
//           event_perform(ev_alarm, i);                  // helper 0x140181c50, TYPE 2
//     else Scr_Camera_Update[i] -= 1 * delta_factor;     // explicit 1.0 * MUL
//        node (func_0x0001400053f0) in this object; Mangle omits the `1 *`.
//   Loop increment shape = `i += 1` per PORTING.md.
// Ported: Obj_Night_1_5_Bonnie_AI / Step
for (var i = 0; i < array_length(Scr_Camera_Update); i += 1) {
    if (Scr_Camera_Update[i] <= 0) {
        if (round(Scr_Camera_Update[i]) <= 0) {
            if (round(Scr_Camera_Update[i]) > -100) { Scr_Camera_Update[i] = -100; event_perform(ev_alarm, i); }
        }
    } else { Scr_Camera_Update[i] -= 1 * delta_factor; }
}

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_1_5_Bonnie_AI_Step_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 *puVar7;
  double dVar8;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 *puStack_f8;
  undefined8 *apuStack_f0 [2];
  undefined8 uStack_e0;
  undefined *puStack_d8;
  undefined4 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a0;
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
  puStack_d8 = &UNK_14043bae6;
  uStack_d0 = 0;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0.0;
  plRam0000000140657680 = param_1;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_98 = CONCAT44(0xffffff,(undefined4)uStack_98);
  uStack_a0 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_d0 = 4;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  dVar1 = _UNK_140439dd0;
  uStack_64 = 0;
  uStack_70 = 0.0;
  while( true ) {
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0;
    uStack_74 = 5;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_c8,uVar5);
    puStack_f8 = &uStack_c8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c8ba0,&puStack_f8);
    iVar2 = func_0x00014015be60(&uStack_70,uVar5,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_d0 = 7;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_70);
    uVar5 = func_0x00014002fbe0(uVar5,uVar3);
    uStack_84 = 0;
    uStack_90 = 0;
    iVar2 = func_0x00014015be60(uVar5,&uStack_90,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_d0 = 0xc;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_70);
      uVar5 = func_0x00014002fbe0(uVar5,uVar3);
      func_0x000140001490(&uStack_c8,uVar5);
      puStack_f8 = &uStack_c8;
      uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c89b0,&puStack_f8);
      uStack_84 = 0;
      uStack_90 = 0;
      iVar2 = func_0x00014015be60(uVar5,&uStack_90,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_a0);
        }
        uStack_a0 = 0;
        uStack_98 = 0x500000000;
        uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_70);
        uVar5 = func_0x00014002fbe0(uVar5,uVar3);
        func_0x000140001490(&uStack_b8,uVar5);
        apuStack_f0[0] = &uStack_b8;
        uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_a0,1,uRam00000001405c89b0,apuStack_f0);
        uStack_84 = 0;
        uStack_90 = 0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar5,&uStack_90,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_d0 = 0xe;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_70);
          puVar7 = (undefined8 *)func_0x00014012b840(puVar6,uVar3);
          func_0x000140141d00(*puVar6);
          if ((0x46U >> (*(uint *)((longlong)puVar7 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar7);
          }
          *(undefined4 *)((longlong)puVar7 + 0xc) = 0;
          *puVar7 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_d0 = 0xf;
          dVar8 = uStack_70;
          if ((uStack_64 & 0xffffff) != 0) {
            dVar8 = (double)func_0x00014012d320(&uStack_70);
          }
          func_0x000140181c50(param_1,param_2,2,(longlong)dVar8);
        }
      }
    }
    else {
      uStack_d0 = 9;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uStack_84 = 0;
      uStack_90 = 0x3ff0000000000000;
      func_0x0001400053f0(&uStack_90,uVar4);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_70);
      uVar5 = func_0x00014012b840(puVar6,uVar3);
      func_0x000140141d00(*puVar6);
      func_0x00014000bdb0(uVar5,&uStack_90);
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      func_0x000140141c50(2);
    }
    switch(uStack_64 & 0xffffff) {
    case 1:
      uStack_70 = (double)func_0x00014012d320(&uStack_70);
      uStack_70 = uStack_70 + dVar1;
      uStack_64 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_70,&uStack_70);
      break;
    case 7:
      uStack_70 = (double)CONCAT44(uStack_70._4_4_,(int)uStack_70 + 1);
      break;
    case 10:
      uStack_70 = (double)((longlong)uStack_70 + 1);
      break;
    case 0xd:
      uStack_64 = 0;
    case 0:
      uStack_70 = uStack_70 + dVar1;
    }
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
  if ((0x46U >> (uStack_98._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_e0;
  return;
}
END DECOMPILED REFERENCE */
