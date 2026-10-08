/// @description FNAFN Obj_Jumpscare / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Jumpscare / Step
if (round(image_index) != Animation_end) { customfunct_image_speed_delta(0.88); stopped = 0; }
else if (stopped != 1) { instance_create_layer(0, 0, "UI", Obj_Game_Over); stopped = 1; }

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Jumpscare_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 *puVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  ulonglong in_stack_fffffffffffffe88;
  undefined8 uVar7;
  ulonglong in_stack_fffffffffffffe90;
  undefined8 uStack_168;
  undefined4 uStack_15c;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 uStack_130;
  uint uStack_124;
  undefined8 uStack_120;
  uint uStack_114;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  undefined *puStack_d8;
  undefined4 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
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
  undefined8 uStack_58;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_d8 = &UNK_14043dd9d;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_114 = 0xffffff;
  uStack_120 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_d0 = 1;
  uStack_60 = 0;
  uStack_58 = 0x500000000;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x186de);
  in_stack_fffffffffffffe88 = in_stack_fffffffffffffe88 & 0xffffffffffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_80,in_stack_fffffffffffffe88,
                      in_stack_fffffffffffffe90 & 0xffffffffffffff00);
  uVar5 = (undefined4)(in_stack_fffffffffffffe88 >> 0x20);
  func_0x000140001490(&uStack_c8,&uStack_80);
  uVar7 = CONCAT44(uVar5,uRam00000001405c89b0);
  puStack_158 = &uStack_c8;
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_60,1,uVar7,&puStack_158);
  uVar5 = (undefined4)((ulonglong)uVar7 >> 0x20);
  iVar1 = func_0x00014015be60(uVar3,uVar2,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_d0 = 8;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18778);
    uStack_15c = 0;
    uStack_168 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_168,uRam00000001405cd9c0,0);
    if (iVar1 == 0) goto code_r0x0001401276c5;
    uStack_d0 = 10;
    if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    uStack_60 = 0;
    uStack_58 = 0x500000000;
    func_0x00014000bee0(&uStack_c8,0x140657648);
    puStack_158 = &uStack_c8;
    func_0x00014000bee0(&uStack_b8,0x140657648);
    puStack_150 = &uStack_b8;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    func_0x0001401441e0(&uStack_a8,0x1405c6a88);
    puStack_148 = &uStack_a8;
    func_0x00014000bee0(&uStack_98,0x1405c6aa0);
    puStack_140 = &uStack_98;
    func_0x0001401445d0(param_1,param_2,&uStack_60,4,CONCAT44(uVar5,uRam00000001405c8d90),
                        &puStack_158);
    uStack_d0 = 0xb;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18778);
    uVar5 = (undefined4)_UNK_140439dd0;
    uVar6 = (undefined4)((ulonglong)_UNK_140439dd0 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
  }
  else {
    uStack_d0 = 3;
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0;
    uStack_64 = 5;
    func_0x00014000bee0(&uStack_b8,0x1405c6a90);
    puStack_150 = &uStack_b8;
    gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_70,1,&puStack_150);
    uStack_d0 = 4;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18778);
    uVar5 = 0;
    uVar6 = 0;
    if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar4);
    }
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = CONCAT44(uVar6,uVar5);
code_r0x0001401276c5:
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
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
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_58._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
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
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_e0;
  return;
}
END DECOMPILED REFERENCE */