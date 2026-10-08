/// @description FNAFN Obj_Office_Front_Buttons_Red / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Office_Front_Buttons_Red / Step
// TODO: case consts runtime
if (image_index == 0) {
    if (Night_door_left == 0) { if (Night_power_amount < 3) image_alpha = 0; else image_alpha = 1; } else image_alpha = 0;
} else {
    if (Night_door_right == 0) { if (Night_power_amount < 3) image_alpha = 0; else image_alpha = 1; } else image_alpha = 0;
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Front_Buttons_Red_Step_0(undefined8 param_1)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  longlong lVar5;
  longlong unaff_GS_OFFSET;
  undefined4 uVar6;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined4 uStack_90;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined4 uStack_7c;
  undefined8 uStack_78;
  undefined *puStack_70;
  undefined4 uStack_68;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_70 = &UNK_14043b16b;
  uStack_68 = 0;
  uStack_78 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_78;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18742);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18748);
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18741);
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_68 = 1;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_98,0,0);
  uStack_9c = uStack_8c;
  uStack_a0 = uStack_90;
  if ((0x46U >> (uStack_8c & 0x1f) & 1) == 0) {
    uStack_a8 = uStack_98;
  }
  else {
    func_0x00014006cee0(&uStack_a8,&uStack_98);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655918) &&
     (func_0x0001403f6320(0x140655918), iRam0000000140655918 == -1)) {
    uRam00000001406558fc = 0;
    uRam00000001406558f0 = 0;
    uRam0000000140655910 = 0x100000000;
    uRam0000000140655904 = 0x3ff0000000000000;
    func_0x0001403f6668(&DAT_14006ce50);
    func_0x0001403f62c0(0x140655918);
  }
  uVar6 = (undefined4)uRam00000001405cd9c0;
  lVar5 = 0;
  iVar1 = func_0x00014015be60(0x1406558f0,&uStack_a8,uVar6,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140655904,&uStack_a8,uVar6,0);
    if (iVar1 != 0) goto joined_r0x00014006cb04;
    lVar5 = 1;
  }
  iVar1 = *(int *)(lVar5 * 0x14 + 0x140655900);
  if (iVar1 == 1) {
    uStack_68 = 0x13;
    uStack_7c = 0;
    uStack_88 = 0;
    iVar1 = func_0x00014015be60(uVar4,&uStack_88,uVar6,0);
    if (iVar1 == 0) {
      uStack_68 = 0x15;
      uStack_7c = 0;
      uStack_88 = 0x4008000000000000;
      iVar1 = func_0x00014015be60(uVar3,&uStack_88,uVar6,1);
      if (iVar1 < 0) {
        uStack_68 = 0x1b;
        if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_60);
        }
        uStack_54 = 0;
        uStack_60 = 0;
        func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
      }
      else {
        uStack_68 = 0x17;
        if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_60);
        }
        uStack_54 = 0;
        uStack_60 = 0x3ff0000000000000;
        func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
      }
    }
    else {
      uStack_68 = 0x20;
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_60);
      }
      uStack_54 = 0;
      uStack_60 = 0;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
    }
    uStack_68 = 0x22;
  }
  else if (iVar1 == 0) {
    uStack_68 = 3;
    uStack_7c = 0;
    uStack_88 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_88,uVar6,0);
    if (iVar1 == 0) {
      uStack_68 = 5;
      uStack_7c = 0;
      uStack_88 = 0x4008000000000000;
      iVar1 = func_0x00014015be60(uVar3,&uStack_88,uVar6,1);
      if (iVar1 < 0) {
        uStack_68 = 0xb;
        if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_60);
        }
        uStack_54 = 0;
        uStack_60 = 0;
        func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
      }
      else {
        uStack_68 = 7;
        if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_60);
        }
        uStack_54 = 0;
        uStack_60 = 0x3ff0000000000000;
        func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
      }
    }
    else {
      uStack_68 = 0x10;
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_60);
      }
      uStack_54 = 0;
      uStack_60 = 0;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
    }
    uStack_68 = 0x12;
  }
joined_r0x00014006cb04:
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
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
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puRam0000000140657668 = (undefined8 *)uStack_78;
  return;
}
END DECOMPILED REFERENCE */