/// @description FNAFN Obj_Night_Radio_Spinner / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Radio_Spinner / Step
if (turn == 1) turn_speed = lerp(turn_speed, 4, 0.04 * delta_factor);
if (turn == 0) turn_speed = lerp(turn_speed, 0, 0.055 * delta_factor); // TODO target
image_angle += turn_speed * delta_factor;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Radio_Spinner_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  undefined4 uVar7;
  uint in_stack_fffffffffffffec8;
  undefined8 **in_stack_fffffffffffffed0;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  undefined4 uStack_58;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_c8 = &UNK_14043d3c9;
  uStack_c0 = 0;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c0 = 1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18798);
  uStack_54 = 0;
  uStack_60 = 0x3ff0000000000000;
  uVar7 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar3,&uStack_60,uVar7,0);
  if (iVar1 == 0) {
    uStack_c0 = 3;
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0;
    uStack_64 = 5;
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18799);
    func_0x000140001490(&uStack_b8,uVar4);
    puStack_128 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x1405c60f0);
    uStack_54 = 0;
    uStack_60 = 0x3fa47ae147ae147b;
    puStack_120 = &uStack_a8;
    func_0x0001400053f0(&uStack_60,uVar2);
    func_0x000140001490(&uStack_98,&uStack_60);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    in_stack_fffffffffffffed0 = &puStack_128;
    in_stack_fffffffffffffec8 = uRam00000001405c8cc0;
    puStack_118 = &uStack_98;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8cc0,
                                in_stack_fffffffffffffed0);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar4,uVar5);
    func_0x000140141c50(1);
    uVar7 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_c0 = 5;
  uStack_54 = 0;
  uStack_60 = 0;
  iVar1 = func_0x00014015be60(uVar3,&uStack_60,uVar7,0);
  if (iVar1 == 0) {
    uStack_c0 = 7;
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0;
    uStack_64 = 5;
    (**(code **)(*param_1 + 8))(param_1,0x18798);
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18799);
    func_0x000140001490(&uStack_b8,uVar3);
    puStack_128 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x140657060);
    uStack_54 = 0;
    uStack_60 = 0x3fac28f5c28f5c29;
    puStack_120 = &uStack_a8;
    func_0x0001400053f0(&uStack_60,uVar2);
    func_0x000140001490(&uStack_98,&uStack_60);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    in_stack_fffffffffffffed0 = &puStack_128;
    in_stack_fffffffffffffec8 = uRam00000001405c8cc0;
    puStack_118 = &uStack_98;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uRam00000001405c8cc0,
                                in_stack_fffffffffffffed0);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar3,uVar4);
    func_0x000140141c50(1);
  }
  uStack_c0 = 10;
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18799);
  func_0x00014015f1a0(param_1,uRam00000001405c7c58,0x80000000,&uStack_80,
                      in_stack_fffffffffffffec8 & 0xffffff00,
                      (ulonglong)in_stack_fffffffffffffed0 & 0xffffffffffffff00);
  uStack_54 = *(uint *)((longlong)puVar6 + 0xc);
  uStack_58 = *(undefined4 *)(puVar6 + 1);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) == 0) {
    uStack_60 = *puVar6;
  }
  else {
    func_0x0001400fc7f0(&uStack_60,puVar6);
  }
  func_0x0001400053f0(&uStack_60,uVar2);
  func_0x000140005290(&uStack_80,&uStack_60);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  func_0x000140160140(param_1,uRam00000001405c7c58,0x80000000,&uStack_80);
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return;
}
END DECOMPILED REFERENCE */