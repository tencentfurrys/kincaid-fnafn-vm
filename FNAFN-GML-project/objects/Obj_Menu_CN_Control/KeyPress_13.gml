/// @description FNAFN Obj_Menu_CN_Control / KeyPress_13 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): KeyPress_13  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event KeyPress_13 - PORTED from C ----
// ground truth: gml_Object_Obj_Menu_CN_Control_KeyPress_13 (944 B @0x1400b3c80)
// Ported: Obj_Menu_CN_Control / KeyPress_13
// Decoded: 3-arg direct call gml_Script_customfunct_audio_play_sound_single
// (snd 22.0 @0x1405c4f50 + two runtime consts @0x140656440); 4-arg call slot
// 0x1405c8d90 (instance_create_layer) with (0, 0, "Fade", 2.0) — x/y are the
// same runtime const @0x140656440, layer string @0x1405c4f48, object 2.0
// @0x1405c4f60 = obj_names.json 2 = Obj_Menu_Transition; then game = 2
// (0x4000000000000000 into global 0x18724) and object-tagged write
// func_0x000140160b90(2, 0x18760) = Obj_Menu_Transition.Room_to_go_to = 5
// (0x4014000000000000; 5 = Rm_Loading).
customfunct_audio_play_sound_single(Snd_Menu_Confirm, 0, false); // TODO(calibrate): priority+loop are runtime const @0x140656440 (0x14065xxxx, outside exe image); loop assumed false, priority assumed 0
instance_create_layer(0, 0, "Fade", Obj_Menu_Transition); // TODO(calibrate): x/y are runtime const @0x140656440 (assumed 0, 0)
game = 2;
Obj_Menu_Transition.Room_to_go_to = 5;

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_CN_Control_KeyPress_13(undefined8 param_1,undefined8 param_2)

{
  undefined8 *puVar1;
  undefined8 *puVar2;
  undefined8 **ppuVar3;
  undefined4 uVar4;
  undefined8 uStack_128;
  undefined8 uStack_120;
  undefined8 *puStack_118;
  undefined8 *puStack_110;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined *puStack_a8;
  undefined4 uStack_a0;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_a8 = &UNK_14043c186;
  uStack_a0 = 0;
  uStack_b0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_b0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uRam0000000140657680 = param_1;
  puVar1 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a0 = 1;
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_98,0x1405c4f50);
  puStack_118 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x140656440);
  puStack_110 = &uStack_88;
  func_0x00014000bee0(&uStack_78,0x140656440);
  ppuVar3 = &puStack_118;
  puStack_108 = &uStack_78;
  gml_Script_customfunct_audio_play_sound_single(param_1,param_2,&uStack_58,3,&puStack_118);
  uVar4 = (undefined4)((ulonglong)ppuVar3 >> 0x20);
  uStack_a0 = 2;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_98,0x140656440);
  puStack_118 = &uStack_98;
  func_0x00014000bee0(&uStack_88,0x140656440);
  puStack_110 = &uStack_88;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  func_0x0001401441e0(&uStack_78,0x1405c4f48);
  puStack_108 = &uStack_78;
  func_0x00014000bee0(&uStack_68,0x1405c4f60);
  puStack_100 = &uStack_68;
  func_0x0001401445d0(param_1,param_2,&uStack_58,4,CONCAT44(uVar4,uRam00000001405c8d90),&puStack_118
                     );
  uStack_a0 = 3;
  uRam0000000140657680 = 0x386a1;
  func_0x000140141d00(plRam000000014065e080);
  puVar2 = (undefined8 *)func_0x00014012b840(puVar1,0);
  func_0x000140141d00(*puVar1);
  if ((0x46U >> (*(uint *)((longlong)puVar2 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar2);
  }
  *(undefined4 *)((longlong)puVar2 + 0xc) = 0;
  *puVar2 = 0x4000000000000000;
  func_0x000140141c50(2);
  uStack_a0 = 5;
  uStack_120 = 0;
  uStack_128 = 0x4014000000000000;
  func_0x000140160b90(2,0x18760,0x80000000,&uStack_128);
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_b0;
  return;
}
END DECOMPILED REFERENCE */