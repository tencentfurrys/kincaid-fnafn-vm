/// @description FNAFN Obj_Jumpscare / Step_1 (Begin Step) - PORTED from C
// Ground truth: gml_Object_Obj_Jumpscare_Step_1 (1797 B @0x140127b70)
// Byte-identical timer-sweep shape to Obj_Menu_Main_Back/Step_1 (PROVEN
// decode, same uStack markers 3/6/0xb/0xd/0xe/8):
//   for i over array_length(Scr_Camera_Update): a timer <= 0 that rounds
//   to > -100 (not the -100 'disabled' sentinel) is set to -100 and fires
//   event_perform(ev_alarm, i); a timer still > 0 counts down by
//   delta_factor (func_0x00014000bdb0 -= helper).
//   Slot 0x1405c8ba0 = array_length, 0x1405c89b0 = round (EXE-REGISTRY.md).
// Wired as Begin Step (eventNum 1) per data.win OBJT (3,1) + C symbol.
// Obj_Jumpscare keeps its normal Step_0 too; this is the additional sweep.
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
// #### gml_Object_Obj_Jumpscare_Step_1  va=0x140127b70  size=1797 ====

/ * WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Jumpscare_Step_1(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 *puVar7;
  double dVar8;
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
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  undefined4 uStack_94;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined8 uStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043ddbd;
  uStack_a8 = 0;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0.0;
  plRam0000000140657680 = param_1;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_88 = CONCAT44(0xffffff,(undefined4)uStack_88);
  uStack_90 = 0;
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
  uStack_a8 = 3;
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
    func_0x000140001490(&uStack_d8,uVar5);
    puStack_e8 = &uStack_d8;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c8ba0,&puStack_e8);
    iVar2 = func_0x00014015be60(&uStack_70,uVar5,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_a8 = 6;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_70);
    uVar5 = func_0x00014002fbe0(uVar5,uVar3);
    uStack_94 = 0;
    uStack_a0 = 0;
    iVar2 = func_0x00014015be60(uVar5,&uStack_a0,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_a8 = 0xb;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0;
      uStack_74 = 5;
      uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_70);
      uVar5 = func_0x00014002fbe0(uVar5,uVar3);
      func_0x000140001490(&uStack_d8,uVar5);
      puStack_e8 = &uStack_d8;
      uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c89b0,&puStack_e8);
      uStack_94 = 0;
      uStack_a0 = 0;
      iVar2 = func_0x00014015be60(uVar5,&uStack_a0,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_90);
        }
        uStack_90 = 0;
        uStack_88 = 0x500000000;
        uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_70);
        uVar5 = func_0x00014002fbe0(uVar5,uVar3);
        func_0x000140001490(&uStack_c8,uVar5);
        puStack_e0 = &uStack_c8;
        uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_90,1,uRam00000001405c89b0,&puStack_e0);
        uStack_94 = 0;
        uStack_a0 = 0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar5,&uStack_a0,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_a8 = 0xd;
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
          uStack_a8 = 0xe;
          dVar8 = uStack_70;
          if ((uStack_64 & 0xffffff) != 0) {
            dVar8 = (double)func_0x00014012d320(&uStack_70);
          }
          func_0x000140181c50(param_1,param_2,2,(longlong)dVar8);
        }
      }
    }
    else {
      uStack_a8 = 8;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_70);
      uVar5 = func_0x00014012b840(puVar6,uVar3);
      func_0x000140141d00(*puVar6);
      func_0x00014000bdb0(uVar5,uVar4);
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
  if ((0x46U >> (uStack_88._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */
