/// @description FNAFN Obj_Office_Front_Middle / Create — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Middle_Create_0
// Ambience controller init. Opens with the standard 12-timer disable sweep
// (PROVEN shape in Night_Time/Create; bound 0x4028000000000000 = 12.0,
// body 0xc059000000000000 = -100.0 sentinel; id 0x186d5 =
// Scr_Camera_Update is an ARRAY per 2026-10-06 proof):
//   for (var i = 0; i < 12; i += 1) Scr_Camera_Update[i] = -100;
// then arms timer 0: Scr_Camera_Update[0] = irandom_range(3, 5)
// (func_0x000140168970 best-fit irandom_range, same helper/shape as
// Front_Middle/Alarm_0 — TODO prove via disassembly).
// Then two 3D audio emitters (slots via EXE-REGISTRY.md: 0x1405c8e80 =
// audio_emitter_create, 0x1405c8e90 = audio_falloff_set_model, 0x1405c8e30
// = audio_emitter_position, 0x1405c8ea0 = audio_emitter_falloff,
// 0x1405c8eb0 = audio_emitter_gain, 0x1405c8980 = audio_play_sound_on;
// ids 0x1874f = office_emitter, 0x18739 = music_emitter, 0x186dc =
// animate_speed per builtin_ids.json):
//   office_emitter = audio_emitter_create() + falloff/position/falloff;
//   music_emitter = audio_emitter_create() + falloff/position/falloff;
//   animate_speed = 0; audio_emitter_gain(office_emitter, animate_speed);
//   audio_play_sound_on(office_emitter, ...) x2 (two looping ambience
//   sounds on the office emitter).
//   TODO(calibrate): all @0x1405c50xx exe-numeric consts (falloff model,
//   positions, sound args — below the EXE-CONSTANTS.md dump range) and the
//   @0x1406565b0 runtime const. NOTE the animate_speed registry name is
//   suspect here (it feeds audio_emitter_gain; neighbor id 0x186dd is
//   ambient_gain) — true name TODO.
for (var i = 0; i < 12; i += 1) { Scr_Camera_Update[i] = -100; }
Scr_Camera_Update[0] = irandom_range(3, 5); // TODO: prove 0x140168970 = irandom_range
office_emitter = audio_emitter_create();
audio_falloff_set_model(0); // TODO(calibrate): exe-numeric const @0x1405c50a8
audio_emitter_position(office_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c50b8/@0x1406565b0/@0x1406565b0
audio_emitter_falloff(office_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c50b8/@0x1405c50c8/@0x1405c50d8
music_emitter = audio_emitter_create();
audio_falloff_set_model(0); // TODO(calibrate): const @0x1405c50a8 again
audio_emitter_position(music_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c50e8/@0x1406565b0/@0x1406565b0
audio_emitter_falloff(music_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c50e8/@0x1405c50f8/@0x1405c50d8
animate_speed = 0; // TODO: id 0x186dc true name suspect (feeds gain below; 0x186dd is ambient_gain)
audio_emitter_gain(office_emitter, animate_speed);
audio_play_sound_on(office_emitter, 0, 0, 0); // TODO(calibrate): sound/loop/priority consts @0x1405c5108/@0x1405c5118/@0x1406565b0
audio_play_sound_on(office_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c5128/@0x1405c5118/@0x1406565b0
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Front_Middle_Create_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  undefined8 uStack_158;
  undefined4 uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
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
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 *puStack_98;
  undefined8 *puStack_90;
  undefined8 *puStack_88;
  undefined8 *puStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  dVar1 = _UNK_140439dd0;
  uStack_60 = 0xfffffffffffffffe;
  puStack_c0 = &UNK_14043c4db;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_b8 = 4;
  uStack_9c = 0;
  uStack_a8 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_78 = param_2;
  while( true ) {
    uStack_14c = 0;
    uStack_158 = 0x4028000000000000;
    iVar2 = func_0x00014015be60(&uStack_a8,&uStack_158,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_b8 = 6;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012cd90(&uStack_a8);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,uVar3);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_9c & 0xffffff) {
    case 1:
      uStack_a8 = (double)func_0x00014012d320(&uStack_a8);
      uStack_a8 = uStack_a8 + dVar1;
      uStack_9c = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_a8,&uStack_a8);
      break;
    case 7:
      uStack_a8 = (double)CONCAT44(uStack_a8._4_4_,(int)uStack_a8 + 1);
      break;
    case 10:
      uStack_a8 = (double)((longlong)uStack_a8 + 1);
      break;
    case 0xd:
      uStack_9c = 0;
    case 0:
      uStack_a8 = uStack_a8 + dVar1;
    }
  }
  uStack_b8 = 10;
  plRam0000000140657680 = (longlong *)0x28795;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
  uVar7 = func_0x000140168970(3,5);
  func_0x000140141d00(param_1);
  puVar5 = (undefined8 *)func_0x00014012b840(puVar4,0);
  func_0x000140141d00(*puVar4);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = uVar7;
  func_0x000140141c50(2);
  uStack_b8 = 0xc;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uStack_b0 = (**(code **)(*param_1 + 0x10))(param_1,0x1874f);
  uVar7 = func_0x0001401445d0(param_1,uStack_78,&uStack_70,0,uRam00000001405c8e80,0);
  func_0x000140141d00(param_1);
  func_0x000140001490(uStack_b0,uVar7);
  func_0x000140141c50(1);
  uStack_b8 = 0xd;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x1405c50a8);
  puStack_98 = &uStack_108;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,1,uRam00000001405c8e90,&puStack_98);
  uStack_b8 = 0xe;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uStack_b0);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c50b8);
  puStack_90 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1406565b0);
  puStack_88 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406565b0);
  puStack_80 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8e30,&puStack_98);
  uStack_b8 = 0xf;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uStack_b0);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c50b8);
  puStack_90 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c50c8);
  puStack_88 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c50d8);
  puStack_80 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8ea0,&puStack_98);
  uStack_b8 = 0x11;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar7 = (**(code **)(*param_1 + 0x10))(param_1,0x18739);
  uVar6 = func_0x0001401445d0(param_1,uStack_78,&uStack_70,0,uRam00000001405c8e80,0);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar7,uVar6);
  func_0x000140141c50(1);
  uStack_b8 = 0x12;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x1405c50a8);
  puStack_98 = &uStack_108;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,1,uRam00000001405c8e90,&puStack_98);
  uStack_b8 = 0x13;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar7);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c50e8);
  puStack_90 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1406565b0);
  puStack_88 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406565b0);
  puStack_80 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8e30,&puStack_98);
  uStack_b8 = 0x14;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar7);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c50e8);
  puStack_90 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c50f8);
  puStack_88 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c50d8);
  puStack_80 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8ea0,&puStack_98);
  uStack_b8 = 0x16;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186dc);
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0;
  uStack_b8 = 0x17;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uStack_b0);
  puStack_98 = &uStack_108;
  func_0x000140001490(&uStack_f8,puVar4);
  puStack_90 = &uStack_f8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,2,uRam00000001405c8eb0,&puStack_98);
  uStack_b8 = 0x19;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uStack_b0);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5108);
  puStack_90 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c5118);
  puStack_88 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406565b0);
  puStack_80 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8980,&puStack_98);
  uStack_b8 = 0x1b;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uStack_b0);
  puStack_98 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c5128);
  puStack_90 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c5118);
  puStack_88 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1406565b0);
  puStack_80 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8980,&puStack_98);
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
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
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */
