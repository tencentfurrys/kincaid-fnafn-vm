/// @description FNAFN Obj_Office_Back / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Office_Back / Step
// TODO: cases runtime
if (door_speed == 0) {
    if (image_index <= 1) sprite_index = 96;
    else customfunct_image_speed_delta(door_speed);
} else {
    if (image_index >= 13) customfunct_image_speed_delta(0);
    else customfunct_image_speed_delta(door_speed);
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Back_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 uVar3;
  longlong lVar4;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_ffffffffffffff08;
  uint7 uVar5;
  undefined8 uStack_e8;
  undefined4 uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a0;
  undefined *puStack_98;
  undefined4 uStack_90;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 *puStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_98 = &UNK_14043adfc;
  uStack_a0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_48 = CONCAT44(0xffffff,(undefined4)uStack_48);
  uStack_50 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_90 = 1;
  plRam0000000140657680 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18710);
  uStack_6c = *(uint *)((longlong)puVar2 + 0xc);
  uStack_70 = *(undefined4 *)(puVar2 + 1);
  if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
    uStack_78 = *puVar2;
  }
  else {
    func_0x00014005da30(&uStack_78,puVar2);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140655718) &&
     (func_0x0001403f6320(0x140655718), iRam0000000140655718 == -1)) {
    uRam00000001406556fc = 0;
    uRam00000001406556f0 = 0x3fe51eb851eb851f;
    uRam0000000140655710 = 0x100000000;
    uRam0000000140655704 = 0xbfe51eb851eb851f;
    func_0x0001403f6668(&DAT_14005d9a0);
    func_0x0001403f62c0(0x140655718);
  }
  uVar3 = uRam00000001405cd9c0;
  lVar4 = 0;
  iVar1 = func_0x00014015be60(0x1406556f0,&uStack_78,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140655704,&uStack_78,uVar3,0);
    if (iVar1 != 0) goto joined_r0x00014005d6d4;
    lVar4 = 1;
  }
  iVar1 = *(int *)(lVar4 * 0x14 + 0x140655700);
  uVar5 = (uint7)((ulonglong)in_stack_ffffffffffffff08 >> 8);
  if (iVar1 == 1) {
    uStack_90 = 0xc;
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_88,(ulonglong)uVar5 << 8,0);
    uStack_dc = 0;
    uStack_e8 = 0x3ff0000000000000;
    iVar1 = func_0x00014015be60(&uStack_88,&uStack_e8,uRam00000001405cd9c0,1);
    if (iVar1 < 1) {
      uStack_90 = 0x12;
      if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_68);
      }
      uStack_5c = 0;
      uStack_68 = 0x4058000000000000;
      func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_68);
    }
    else {
      uStack_90 = 0xe;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18710);
      func_0x000140001490(&uStack_b8,uVar3);
      puStack_58 = &uStack_b8;
      gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_50,1,&puStack_58);
    }
    uStack_90 = 0x14;
  }
  else if (iVar1 == 0) {
    uStack_90 = 3;
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_88,(ulonglong)uVar5 << 8,0);
    uStack_dc = 0;
    uStack_e8 = 0x402a000000000000;
    iVar1 = func_0x00014015be60(&uStack_88,&uStack_e8,uRam00000001405cd9c0,1);
    if ((iVar1 == -2) || (-1 < iVar1)) {
      uStack_90 = 9;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      func_0x00014000bee0(&uStack_b8,0x1406556e0);
      puStack_58 = &uStack_b8;
      gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_50,1,&puStack_58);
    }
    else {
      uStack_90 = 5;
      if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0x500000000;
      uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18710);
      func_0x000140001490(&uStack_b8,uVar3);
      puStack_58 = &uStack_b8;
      gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_50,1,&puStack_58);
    }
    uStack_90 = 0xb;
  }
joined_r0x00014005d6d4:
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a0;
  return;
}
END DECOMPILED REFERENCE */