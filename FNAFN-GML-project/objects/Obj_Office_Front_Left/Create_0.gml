/// @description FNAFN Obj_Office_Front_Left / Create — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Left_Create_0
// Door/light controller init. Head mirrors Obj_Office_Back/Create (same
// game[0] -> power_threshold shape; ids via builtin_ids.json: 0x18724 =
// game, 0x1875b = power_threshold, 0x18793 = toggle, 0x18710 = door_speed):
//   game[0] == 0 ? power_threshold = 2 : power_threshold = 0.
//   The ==0 test is the 3-way compare (func_0x00014015be60) tested == 0;
//   the 2.0 branch const is _UNK_140439e68 = 2.0 (PROVEN divisor in
//   Night_Display/Draw), the else const _UNK_14043add0 reads as 0 per
//   Back/Create.
//   TODO(calibrate): runtime-pool compare const @0x140655960 (guarded init
//   @0x140655974 seeds 1.0 nearby; exe image gone, Back/Create reads it as 0).
// Then two 3D audio emitters (slots via EXE-REGISTRY.md:
//   0x1405c8e80 = audio_emitter_create, 0x1405c8e90 =
//   audio_falloff_set_model, 0x1405c8e30 = audio_emitter_position,
//   0x1405c8ea0 = audio_emitter_falloff, 0x1405c8eb0 = audio_emitter_gain).
//   door_emitter (0x1870f) = audio_emitter_create() + falloff/position/
//   falloff setup; second emitter (id 0x186d6) likewise. Follows the
//   fetch-then-call-then-copy assignment shape (uVar6 = id-fetch dest,
//   uVar7 = 0-arg create call, copy into dest).
//   TODO(calibrate): all @0x1405c42xx exe-numeric consts (falloff model,
//   emitter positions) + the @0x140655950 runtime const (gain/position
//   arg) — below the EXE-CONSTANTS.md dump range.
// Ids 0x186d6/0x186d7 registry-collide as __init_global (builtin_ids.json);
// __init_global is kept for 0x186d6 to match Other_5's
// audio_emitter_free pair; 0x186d7 (plain 0, read in Step) gets a distinct
// TODO placeholder since GML cannot hold two names.
if (game[0] == 0) { power_threshold = 2; } else { power_threshold = 0; } // TODO(calibrate): compare const @0x140655960
toggle = 0;
door_speed = 0;
door_emitter = audio_emitter_create();
audio_falloff_set_model(0); // TODO(calibrate): exe-numeric const @0x1405c4220
audio_emitter_position(door_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c4230/@0x1405c4240 + runtime @0x140655950
audio_emitter_falloff(door_emitter, 0, 0, 0); // TODO(calibrate): consts @0x1405c4250/@0x1405c4260/@0x1405c4270
__init_global = audio_emitter_create(); // TODO: id 0x186d6 true emitter name unknown (freed in Other_5)
audio_falloff_set_model(0); // TODO(calibrate): const @0x1405c4220 again
audio_emitter_position(__init_global, 0, 0, 0); // TODO(calibrate): consts @0x140655950/@0x1405c4240/@0x140655950
audio_emitter_falloff(__init_global, 0, 0, 0); // TODO(calibrate): consts @0x1405c4280/@0x1405c4290/@0x1405c4270
unk_186d7 = 0; // TODO: id 0x186d7 true name unknown (registry collides as __init_global; read in Step)
emitter_gain = 0;
audio_emitter_gain(__init_global, 0); // TODO(calibrate): runtime const @0x140655950 as gain
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Front_Left_Create_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  longlong unaff_GS_OFFSET;
  undefined4 uVar8;
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
  longlong lStack_c8;
  undefined4 uStack_c0;
  uint uStack_bc;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 *puStack_a8;
  undefined8 *puStack_a0;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043b2ad;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  plRam0000000140657680 = param_1;
  uStack_78 = param_2;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_80 = 1;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 1) {
      uVar3 = func_0x000140147990(*plVar4);
      plVar4 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_bc = *(uint *)((longlong)plVar4 + 0xc);
  uStack_c0 = *(undefined4 *)(plVar4 + 1);
  if ((0x46U >> (uStack_bc & 0x1f) & 1) == 0) {
    lStack_c8 = *plVar4;
  }
  else {
    func_0x000140070c90(&lStack_c8,plVar4);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140655974) {
    func_0x0001403f6320(0x140655974);
    if (iRam0000000140655974 == -1) {
      uRam000000014065596c = 0;
      uRam0000000140655960 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_140070c30);
      func_0x0001403f62c0(0x140655974);
    }
  }
  uVar2 = func_0x00014015be60(0x140655960,&lStack_c8,uRam00000001405cd9c0,0);
  if ((uVar2 | uRam000000014065596c._4_4_) == 0) {
    uStack_80 = 3;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875b);
    uVar3 = (undefined4)_UNK_140439e68;
    uVar8 = (undefined4)((ulonglong)_UNK_140439e68 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
  }
  else {
    uStack_80 = 4;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875b);
    uVar3 = (undefined4)_UNK_14043add0;
    uVar8 = (undefined4)((ulonglong)_UNK_14043add0 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = CONCAT44(uVar8,uVar3);
  uStack_80 = 7;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_80 = 8;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18710);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_80 = 10;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar6 = (**(code **)(*param_1 + 0x10))(param_1,0x1870f);
  uVar7 = func_0x0001401445d0(param_1,uStack_78,&uStack_70,0,uRam00000001405c8e80,0);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar6,uVar7);
  func_0x000140141c50(1);
  uStack_80 = 0xb;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x1405c4220);
  puStack_b8 = &uStack_108;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,1,uRam00000001405c8e90,&puStack_b8);
  uStack_80 = 0xc;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_b8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4230);
  puStack_b0 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4240);
  puStack_a8 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140655950);
  puStack_a0 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8e30,&puStack_b8);
  uStack_80 = 0xd;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_b8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4250);
  puStack_b0 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4260);
  puStack_a8 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c4270);
  puStack_a0 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8ea0,&puStack_b8);
  uStack_80 = 0xf;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar6 = (**(code **)(*param_1 + 0x10))(param_1,0x186d6);
  uVar7 = func_0x0001401445d0(param_1,uStack_78,&uStack_70,0,uRam00000001405c8e80,0);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar6,uVar7);
  func_0x000140141c50(1);
  uStack_80 = 0x10;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x00014000bee0(&uStack_108,0x1405c4220);
  puStack_b8 = &uStack_108;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,1,uRam00000001405c8e90,&puStack_b8);
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_b8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140655950);
  puStack_b0 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4240);
  puStack_a8 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x140655950);
  puStack_a0 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8e30,&puStack_b8);
  uStack_80 = 0x12;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_b8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4280);
  puStack_b0 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4290);
  puStack_a8 = &uStack_e8;
  func_0x00014000bee0(&uStack_d8,0x1405c4270);
  puStack_a0 = &uStack_d8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,4,uRam00000001405c8ea0,&puStack_b8);
  uStack_80 = 0x14;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d7);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_80 = 0x15;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18716);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_80 = 0x17;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_108,uVar6);
  puStack_b8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140655950);
  puStack_b0 = &uStack_f8;
  func_0x0001401445d0(param_1,uStack_78,&uStack_70,2,uRam00000001405c8eb0,&puStack_b8);
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_c8);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
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
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
