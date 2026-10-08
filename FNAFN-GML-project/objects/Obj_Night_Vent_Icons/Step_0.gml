/// @description FNAFN Obj_Night_Vent_Icons / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Vent_Icons / Step
if (Night_camera_mode == 0) { // TODO const
    if (Night_camera_vent_location == image_index + 1) { image_alpha = 1; image_xscale = 1; image_yscale = 1; }
    else { image_alpha = 0.6; image_xscale = 0.85; image_yscale = 0.85; }
} else { image_alpha = 0; }

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Vent_Icons_Step_0(undefined8 param_1)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined4 uStack_60;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  uint uStack_3c;
  undefined8 uStack_38;
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043b943;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873e);
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_2c = 0xffffff;
  uStack_38 = 0;
  uStack_4c = 0xffffff;
  uStack_58 = 0;
  uStack_3c = 0xffffff;
  uStack_48 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_80 = 2;
  func_0x0001401453a0(&uStack_68,0x1405c4a10);
  iVar1 = func_0x00014015be60(uVar2,&uStack_68,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if (iVar1 == 0) {
    uStack_80 = 4;
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_78,0,0);
    uStack_5c = uStack_6c;
    uStack_60 = uStack_70;
    if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
      uStack_68 = uStack_78;
    }
    else {
      func_0x0001400959a0(&uStack_68,&uStack_78);
    }
    func_0x00014000bf90(&uStack_68,1);
    iVar1 = func_0x00014015be60(uVar3,&uStack_68,uRam00000001405cd9c0,0);
    if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    if (iVar1 == 0) {
      uStack_80 = 6;
      if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_38);
      }
      uStack_2c = 0;
      uStack_38 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_38);
      uStack_80 = 7;
      if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_58);
      }
      uStack_4c = 0;
      uStack_58 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_58);
      uStack_80 = 8;
      if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_48);
      }
      uStack_3c = 0;
      uStack_48 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_48);
    }
    else {
      uStack_80 = 0xc;
      if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_38);
      }
      uStack_2c = 0;
      uStack_38 = 0x3fe3333333333333;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_38);
      uStack_80 = 0xd;
      if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_58);
      }
      uStack_4c = 0;
      uStack_58 = 0x3feb333333333333;
      func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_58);
      uStack_80 = 0xe;
      if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_48);
      }
      uStack_3c = 0;
      uStack_48 = 0x3feb333333333333;
      func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_48);
    }
  }
  else {
    uStack_80 = 0x13;
    if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_38);
    }
    uStack_2c = 0;
    uStack_38 = 0;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_38);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_3c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_38);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */