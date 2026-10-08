/// @description FNAFN Obj_Night_1_5_Chica_AI / Create — PORTED from C
// Ground truth: gml_Object_Obj_Night_1_5_Chica_AI_Create_0
// Mirror of Bonnie Create (same line markers, Chica ids/consts):
//   3. for i in 0..11: Scr_Camera_Update[i] = -100 (bound 12.0 literal).
//   9. if (Chica_AI_Level > 0) Scr_Camera_Update[0] = 30 (id 0x186f0).
//   0xd. Time_without_move = irandom_range(17, 25) - Chica_AI_Level * 0.5.
//   0xe. movement = 0; 0xf. alarm_type = 0.
//   0x12. Chica_emitter = audio_emitter_create() (slot 0x1405c8e80).
//   0x13. audio_falloff_set_model(5) (slot 0x1405c8e90, exe const 5.0).
//   0x14. audio_emitter_position(Chica_emitter, 3840, 360, <runtime>)
//        (slot 0x1405c8e30; exe consts 3840.0/360.0 resolved).
//   0x16. audio_emitter_falloff(Chica_emitter, 640, 2560, 0.1)
//        (slot 0x1405c8ea0; all exe consts resolved).
// TODO(calibrate): func_0x000140168970 best-fit irandom_range;
// func_0x00014001fa10 best-fit MUL (see Bonnie Create); runtime const
// @0x140656018 (emitter z, outside mapped exe image) — verify in-game.
for (var i = 0; i < 12; i += 1) {
    Scr_Camera_Update[i] = -100;
}
if (Chica_AI_Level > 0) {
    Scr_Camera_Update[0] = 30;
}
Time_without_move = irandom_range(17, 25) - Chica_AI_Level * 0.5;
movement = 0;
alarm_type = 0;
Chica_emitter = audio_emitter_create();
audio_falloff_set_model(5);
audio_emitter_position(Chica_emitter, 3840, 360, 0); // TODO(calibrate): z is runtime const @0x140656018
audio_emitter_falloff(Chica_emitter, 640, 2560, 0.1);

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_1_5_Chica_AI_Create_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 *puStack_188;
  undefined8 *puStack_180;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 uStack_160;
  uint uStack_154;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  uint uStack_134;
  undefined8 uStack_130;
  uint uStack_124;
  undefined auStack_120 [12];
  uint uStack_114;
  undefined8 uStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined *puStack_b0;
  undefined4 uStack_a8;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  
  uStack_70 = 0xfffffffffffffffe;
  puStack_b0 = &UNK_14043bc7f;
  uStack_a8 = 0;
  uStack_b8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_c0 = param_2;
  uStack_110 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186f0);
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_154 = 0xffffff;
  uStack_160 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_134 = 0xffffff;
  uStack_140 = 0;
  uStack_124 = 0xffffff;
  uStack_130 = 0;
  uStack_a8 = 3;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  dVar1 = _UNK_140439dd0;
  uStack_84 = 0;
  uStack_90 = 0.0;
  while( true ) {
    uVar6 = uRam00000001405cd9c0;
    uStack_94 = 0;
    uStack_a0 = 0x4028000000000000;
    iVar2 = func_0x00014015be60(&uStack_90,&uStack_a0,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_a8 = 5;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012cd90(&uStack_90);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,uVar3);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0xc059000000000000;
    func_0x000140141c50(2);
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
  uStack_a8 = 9;
  uStack_94 = 0;
  uStack_a0 = 0;
  iVar2 = func_0x00014015be60(uStack_110,&uStack_a0,uVar6,1);
  if (0 < iVar2) {
    uStack_a8 = 0xb;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0x403e000000000000;
    func_0x000140141c50(2);
  }
  uStack_a8 = 0xd;
  uVar6 = (**(code **)(*param_1 + 0x10))(param_1,0x18792);
  func_0x00014001fa10(auStack_120,uStack_110,_UNK_140439e78);
  uStack_a0 = func_0x000140168970(0x11,0x19);
  uStack_94 = 0;
  func_0x00014000bdb0(&uStack_a0,auStack_120);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar6,&uStack_a0);
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_120);
  }
  func_0x000140141c50(1);
  uStack_a8 = 0xe;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18738);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_a8 = 0xf;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d8);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_a8 = 0x12;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  uVar6 = (**(code **)(*param_1 + 0x10))(param_1,0x186f1);
  uVar7 = func_0x0001401445d0(param_1,uStack_c0,&uStack_80,0,uRam00000001405c8e80,0);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar6,uVar7);
  func_0x000140141c50(1);
  uStack_a8 = 0x13;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x1405c4c20);
  puStack_188 = &uStack_108;
  func_0x0001401445d0(param_1,uStack_c0,&uStack_80,1,uRam00000001405c8e90,&puStack_188);
  uStack_a8 = 0x14;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_188 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4c30);
  puStack_180 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4c40);
  puStack_178 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140656018);
  puStack_170 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_c0,&uStack_80,4,uRam00000001405c8e30,&puStack_188);
  uStack_a8 = 0x16;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_188 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4c50);
  puStack_180 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4c60);
  puStack_178 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c4c70);
  puStack_170 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_c0,&uStack_80,4,uRam00000001405c8ea0,&puStack_188);
  if ((0x46U >> (uStack_124 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_130);
  }
  if ((0x46U >> (uStack_134 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_140);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_160);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  puRam0000000140657668 = (undefined8 *)uStack_b8;
  return;
}
END DECOMPILED REFERENCE */
