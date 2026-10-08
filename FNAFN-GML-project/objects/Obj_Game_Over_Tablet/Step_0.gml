/// @description FNAFN Obj_Game_Over_Tablet / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Game_Over_Tablet / Step
customfunct_image_speed_delta(Tablet_Sprite_Speed);
if (Tablet_Sprite_Speed == -0.99) {
    if (image_index < 1) {
        instance_destroy();
    }
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Game_Over_Tablet_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 **ppuVar3;
  undefined8 *puStack_d8;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined8 uStack_b8;
  undefined4 uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined8 uStack_60;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_40;
  uint uStack_34;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_c8 = &UNK_14043c205;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_c0 = 1;
  uStack_68 = 0;
  uStack_60 = 0x500000000;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x1877e);
  func_0x000140001490(&uStack_58,uVar2);
  ppuVar3 = &puStack_d8;
  puStack_d8 = &uStack_58;
  gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_68,1,ppuVar3);
  uStack_c0 = 3;
  uStack_ac = 0;
  uStack_b8 = 0xbfefae147ae147ae;
  iVar1 = func_0x00014015be60(uVar2,&uStack_b8,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    (**(code **)(*param_1 + 8))(param_1,0x1877e);
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_40,
                        (ulonglong)ppuVar3 & 0xffffffffffffff00,0);
    uStack_ac = 0;
    uStack_b8 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(&uStack_40,&uStack_b8,uRam00000001405cd9c0,1);
    if ((iVar1 != -2) && (iVar1 < 0)) {
      uStack_c0 = 5;
      func_0x00014017c070(param_1,param_2,0,0);
    }
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
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_60._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return;
}
END DECOMPILED REFERENCE */