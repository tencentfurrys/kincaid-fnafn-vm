/// @description FNAFN Obj_Filter_Camera / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Filter_Camera / Step
if (game_settings[0] == "full") {
    composite_distortion = lerp(composite_distortion, 0.3, 0.1 * delta_factor);
    composite_artifact = lerp(composite_artifact, 0.3, 0.1 * delta_factor);
    static_magnetude = lerp(static_magnetude, 0.1, 0.1 * delta_factor);
    static_offset += 0.005 * delta_factor;
    if (static_offset >= 1) static_offset = 0;
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Filter_Camera_Step_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a0;
  undefined8 *puStack_98;
  undefined8 *puStack_90;
  undefined8 *puStack_88;
  undefined8 uStack_80;
  undefined *puStack_78;
  undefined4 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_78 = &UNK_14043d9ed;
  uStack_70 = 0;
  uStack_80 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_80;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uRam0000000140657680 = param_1;
  uStack_a0 = param_2;
  plVar3 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f8);
  uVar5 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_e8 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f6);
  uStack_e0 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18774);
  puVar6 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18775);
  uStack_60 = CONCAT44(0xffffff,(undefined4)uStack_60);
  uStack_68 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_70 = 1;
  func_0x0001401453a0(&uStack_58,0x1405c6800);
  if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar3);
    if (iVar1 < 1) {
      uVar2 = func_0x000140147990(*plVar3);
      plVar3 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar2);
    }
    else {
      plVar3 = (longlong *)func_0x000140147980(*plVar3,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  iVar1 = func_0x00014015be60(plVar3,&uStack_58,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if (iVar1 == 0) {
    uStack_70 = 3;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    func_0x000140001490(&uStack_d8,uVar4);
    puStack_98 = &uStack_d8;
    func_0x00014000bee0(&uStack_c8,0x1405c6808);
    uStack_4c = 0;
    uStack_58 = 0x3fb999999999999a;
    puStack_90 = &uStack_c8;
    func_0x0001400053f0(&uStack_58,uVar5);
    func_0x000140001490(&uStack_b8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_88 = &uStack_b8;
    uVar7 = func_0x0001401445d0(param_1,uStack_a0,&uStack_68,3,uRam00000001405c8cc0,&puStack_98);
    func_0x000140141d00(plRam000000014065e080);
    func_0x000140001490(uVar4,uVar7);
    func_0x000140141c50(1);
    uStack_70 = 4;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    func_0x000140001490(&uStack_d8,uStack_e8);
    puStack_98 = &uStack_d8;
    func_0x00014000bee0(&uStack_c8,0x1405c6808);
    uStack_4c = 0;
    uStack_58 = 0x3fb999999999999a;
    puStack_90 = &uStack_c8;
    func_0x0001400053f0(&uStack_58,uVar5);
    func_0x000140001490(&uStack_b8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_88 = &uStack_b8;
    uVar4 = func_0x0001401445d0(param_1,uStack_a0,&uStack_68,3,uRam00000001405c8cc0,&puStack_98);
    func_0x000140141d00(plRam000000014065e080);
    func_0x000140001490(uStack_e8,uVar4);
    func_0x000140141c50(1);
    uStack_70 = 5;
    if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    uStack_68 = 0;
    uStack_60 = 0x500000000;
    func_0x000140001490(&uStack_d8,uStack_e0);
    puStack_98 = &uStack_d8;
    func_0x00014000bee0(&uStack_c8,0x1405c6818);
    uStack_4c = 0;
    uStack_58 = 0x3fb999999999999a;
    puStack_90 = &uStack_c8;
    func_0x0001400053f0(&uStack_58,uVar5);
    func_0x000140001490(&uStack_b8,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    puStack_88 = &uStack_b8;
    uVar4 = func_0x0001401445d0(param_1,uStack_a0,&uStack_68,3,uRam00000001405c8cc0,&puStack_98);
    func_0x000140141d00(plRam000000014065e080);
    func_0x000140001490(uStack_e0,uVar4);
    func_0x000140141c50(1);
    uStack_70 = 8;
    uStack_4c = 0;
    uStack_58 = 0x3f747ae147ae147b;
    func_0x0001400053f0(&uStack_58,uVar5);
    func_0x000140005290(puVar6,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
    uStack_70 = 9;
    uStack_4c = 0;
    uStack_58 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(puVar6,&uStack_58,uRam00000001405cd9c0,1);
    if (-1 < iVar1) {
      uStack_70 = 0xb;
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0;
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
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
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
  puRam0000000140657668 = (undefined8 *)uStack_80;
  return;
}
END DECOMPILED REFERENCE */