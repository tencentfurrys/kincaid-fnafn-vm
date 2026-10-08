/// @description FNAFN Obj_System_Stats_Check / Step — PORTED from C
// Ground truth: gml_Object_Obj_System_Stats_Check_Step_0
// Decoded, in order:
//   string(delta_factor) (id 0x1870b via builtin_ids.json; slot
//     0x1405c8840 = string); room_get_name(room) (slot 0x1405c9010,
//     room = slot 0x1405c7b38); string(code_is_compiled())
//     (slot 0x1405c9000); string(gpu_get_tex_filter()) (slot 0x1405c8ff0);
//     string(fps) (slot 0x1405c7c78 = fps). Chained ADD
//     (func_0x000140005290) builds:
//     "Five Nights at Freddy's Nightshift TEST BUILD | FPS: " (@0x1405c6830)
//     + string(fps) + " | tex filtering: " (@0x1405c6870)
//     + string(gpu_get_tex_filter()) + " | YYC compiled: " (@0x1405c6890)
//     + string(code_is_compiled()) + " | room: " (@0x1405c68a2)
//     + room_get_name(room) + " | delta: " (@0x1405c68ac)
//     + string(delta_factor).
//   func_0x0001401756c0(final) best-fit show_debug_message (single-string
//     debug print; the only other debug-print helper 0x140181c60 is PROVEN
//     show_debug_message — prove 0x1401756c0 via disassembly).
// Ported: Obj_System_Stats_Check / Step
show_debug_message("Five Nights at Freddy's Nightshift TEST BUILD | FPS: " + string(fps) + " | tex filtering: " + string(gpu_get_tex_filter()) + " | YYC compiled: " + string(code_is_compiled()) + " | room: " + room_get_name(room) + " | delta: " + string(delta_factor)); // TODO(calibrate): func_0x0001401756c0 best-fit show_debug_message — prove via disassembly
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_System_Stats_Check_Step_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 uStack_250;
  undefined *puStack_248;
  undefined4 uStack_240;
  undefined8 *puStack_238;
  undefined8 *puStack_230;
  undefined8 *puStack_228;
  undefined8 *puStack_220;
  undefined8 *apuStack_218 [2];
  undefined auStack_208 [12];
  uint uStack_1fc;
  undefined auStack_1f8 [12];
  uint uStack_1ec;
  undefined auStack_1e8 [12];
  uint uStack_1dc;
  undefined auStack_1d8 [12];
  uint uStack_1cc;
  undefined8 uStack_1c8;
  undefined8 uStack_1c0;
  undefined8 uStack_1b8;
  undefined8 uStack_1b0;
  undefined8 uStack_1a8;
  undefined8 uStack_1a0;
  undefined8 uStack_198;
  undefined8 uStack_190;
  undefined8 uStack_188;
  undefined8 uStack_180;
  undefined8 uStack_178;
  undefined8 uStack_170;
  undefined8 uStack_168;
  undefined8 uStack_160;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 *puStack_e0;
  undefined4 uStack_d8;
  uint uStack_d4;
  undefined8 *puStack_d0;
  undefined4 uStack_c8;
  uint uStack_c4;
  undefined8 *puStack_c0;
  undefined4 uStack_b8;
  uint uStack_b4;
  undefined8 *puStack_b0;
  undefined4 uStack_a8;
  uint uStack_a4;
  undefined8 *puStack_a0;
  undefined4 uStack_98;
  uint uStack_94;
  undefined8 *puStack_90;
  undefined4 uStack_88;
  uint uStack_84;
  undefined8 *puStack_80;
  undefined4 uStack_78;
  uint uStack_74;
  undefined8 *puStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 *puStack_60;
  undefined4 uStack_58;
  uint uStack_54;
  undefined8 *puStack_50;
  undefined4 uStack_48;
  uint uStack_44;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_248 = &UNK_14043da65;
  uStack_240 = 0;
  uStack_250 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_250;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uRam0000000140657680 = param_1;
  uVar1 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_1c8 = 0;
  uStack_1c0 = 0x500000000;
  uStack_1b8 = 0;
  uStack_1b0 = 0x500000000;
  uStack_1a8 = 0;
  uStack_1a0 = 0x500000000;
  uStack_198 = 0;
  uStack_190 = 0x500000000;
  uStack_188 = 0;
  uStack_180 = 0x500000000;
  uStack_178 = 0;
  uStack_170 = 0x500000000;
  uStack_168 = 0;
  uStack_160 = 0x500000000;
  func_0x00014015ef90(param_1,uRam00000001405c7c78,0x80000000,&uStack_100);
  func_0x000140001490(&uStack_158,&uStack_100);
  puStack_238 = &uStack_158;
  uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_1a8,0,uRam00000001405c8ff0,0);
  func_0x000140001490(&uStack_148,uVar2);
  puStack_230 = &uStack_148;
  uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_188,0,uRam00000001405c9000,0);
  func_0x000140001490(&uStack_138,uVar2);
  puStack_228 = &uStack_138;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_f0);
  func_0x000140001490(&uStack_128,&uStack_f0);
  puStack_220 = &uStack_128;
  func_0x000140001490(&uStack_118,uVar1);
  apuStack_218[0] = &uStack_118;
  uVar1 = func_0x0001401445d0(param_1,param_2,&uStack_168,1,uRam00000001405c8840,apuStack_218);
  func_0x0001401453a0(auStack_208,0x1405c68ac);
  uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_178,1,uRam00000001405c9010,&puStack_220);
  func_0x0001401453a0(auStack_1f8,0x1405c68a2);
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_198,1,uRam00000001405c8840,&puStack_228);
  func_0x0001401453a0(auStack_1e8,0x1405c6890);
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_1b8,1,uRam00000001405c8840,&puStack_230);
  func_0x0001401453a0(auStack_1d8,0x1405c6870);
  uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_1c8,1,uRam00000001405c8840,&puStack_238);
  func_0x0001401453a0(&puStack_e0,0x1405c6830);
  uStack_44 = uStack_d4;
  uStack_48 = uStack_d8;
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) == 0) {
    puStack_50 = puStack_e0;
  }
  else {
    func_0x00014011aa80(&puStack_50,&puStack_e0);
  }
  func_0x000140005290(&puStack_50,uVar5);
  uStack_54 = uStack_44;
  uStack_58 = uStack_48;
  if ((0x46U >> (uStack_44 & 0x1f) & 1) == 0) {
    puStack_60 = puStack_50;
  }
  else {
    func_0x00014011aa80(&puStack_60,&puStack_50);
  }
  func_0x000140005290(&puStack_60,auStack_1d8);
  uStack_64 = uStack_54;
  uStack_68 = uStack_58;
  if ((0x46U >> (uStack_54 & 0x1f) & 1) == 0) {
    puStack_70 = puStack_60;
  }
  else {
    func_0x00014011aa80(&puStack_70,&puStack_60);
  }
  func_0x000140005290(&puStack_70,uVar4);
  uStack_74 = uStack_64;
  uStack_78 = uStack_68;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
    puStack_80 = puStack_70;
  }
  else {
    func_0x00014011aa80(&puStack_80,&puStack_70);
  }
  func_0x000140005290(&puStack_80,auStack_1e8);
  uStack_84 = uStack_74;
  uStack_88 = uStack_78;
  if ((0x46U >> (uStack_74 & 0x1f) & 1) == 0) {
    puStack_90 = puStack_80;
  }
  else {
    func_0x00014011aa80(&puStack_90,&puStack_80);
  }
  func_0x000140005290(&puStack_90,uVar3);
  uStack_94 = uStack_84;
  uStack_98 = uStack_88;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) == 0) {
    puStack_a0 = puStack_90;
  }
  else {
    func_0x00014011aa80(&puStack_a0,&puStack_90);
  }
  func_0x000140005290(&puStack_a0,auStack_1f8);
  uStack_a4 = uStack_94;
  uStack_a8 = uStack_98;
  if ((0x46U >> (uStack_94 & 0x1f) & 1) == 0) {
    puStack_b0 = puStack_a0;
  }
  else {
    func_0x00014011aa80(&puStack_b0,&puStack_a0);
  }
  func_0x000140005290(&puStack_b0,uVar2);
  uStack_b4 = uStack_a4;
  uStack_b8 = uStack_a8;
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) == 0) {
    puStack_c0 = puStack_b0;
  }
  else {
    func_0x00014011aa80(&puStack_c0,&puStack_b0);
  }
  func_0x000140005290(&puStack_c0,auStack_208);
  uStack_c4 = uStack_b4;
  uStack_c8 = uStack_b8;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
    puStack_d0 = puStack_c0;
  }
  else {
    func_0x00014011aa80(&puStack_d0,&puStack_c0);
  }
  func_0x000140005290(&puStack_d0,uVar1);
  if (((uStack_c4 & 0xffffff) == 1) && (puStack_d0 != (undefined8 *)0x0)) {
    uVar1 = *puStack_d0;
  }
  else {
    uVar1 = 0;
  }
  func_0x0001401756c0(uVar1);
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_d0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_c0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_b0);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_a0);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_90);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_80);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_70);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_60);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_50);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&puStack_e0);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_1d8);
  }
  if ((0x46U >> (uStack_1dc & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_1e8);
  }
  if ((0x46U >> (uStack_1ec & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_1f8);
  }
  if ((0x46U >> (uStack_1fc & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_208);
  }
  if ((0x46U >> (uStack_160._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_170._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_180._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_190._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  if ((0x46U >> (uStack_1a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_1b0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  if ((0x46U >> (uStack_1c0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
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
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  puRam0000000140657668 = (undefined8 *)uStack_250;
  return;
}
END DECOMPILED REFERENCE */
