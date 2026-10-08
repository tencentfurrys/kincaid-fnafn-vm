/// @description FNAFN Obj_Night_Camera_Switch / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Camera_Switch / Step
if (Night_camera_mode == "cam") { image_alpha = lerp(image_alpha, 1, 0.4 * delta_factor); } // TODO consts
else if (Night_recording == 0) image_alpha = 1;
else image_alpha = 0.5;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Camera_Switch_Step_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  longlong lVar5;
  longlong unaff_GS_OFFSET;
  uint in_stack_fffffffffffffec8;
  ulonglong in_stack_fffffffffffffed0;
  undefined8 *puStack_128;
  undefined8 *puStack_120;
  undefined8 *puStack_118;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  undefined4 uStack_58;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043bd81;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_64 = 0xffffff;
  uStack_70 = 0;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_88 = 1;
  func_0x0001401453a0(&uStack_60,0x1405c4d58);
  iVar1 = func_0x00014015be60(uVar2,&uStack_60,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if (iVar1 == 0) {
    uStack_88 = 0xb;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_70,
                        in_stack_fffffffffffffec8 & 0xffffff00,
                        in_stack_fffffffffffffed0 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_c8,&uStack_70);
    puStack_128 = &uStack_c8;
    func_0x00014000bee0(&uStack_b8,0x140656280);
    uStack_54 = 0;
    uStack_60 = 0x3fd999999999999a;
    puStack_120 = &uStack_b8;
    func_0x0001400053f0(&uStack_60,uVar4);
    func_0x000140001490(&uStack_a8,&uStack_60);
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    puStack_118 = &uStack_a8;
    uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_128);
    func_0x000140001490(&uStack_70,uVar2);
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_70);
    goto code_r0x0001400a82d5;
  }
  uStack_88 = 3;
  uStack_54 = *(uint *)((longlong)puVar3 + 0xc);
  uStack_58 = *(undefined4 *)(puVar3 + 1);
  if ((0x46U >> (uStack_54 & 0x1f) & 1) == 0) {
    uStack_60 = *puVar3;
  }
  else {
    func_0x0001400a8930(&uStack_60,puVar3);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam00000001406562b8) {
    func_0x0001403f6320(0x1406562b8);
    if (iRam00000001406562b8 == -1) {
      auRam000000014065629c = ZEXT816(0);
      uRam0000000140656290 = 0x3ff0000000000000;
      uRam00000001406562b0 = 0x100000000;
      func_0x0001403f6668(&DAT_1400a88a0);
      func_0x0001403f62c0(0x1406562b8);
    }
  }
  uVar2 = uRam00000001405cd9c0;
  lVar5 = 0;
  iVar1 = func_0x00014015be60(0x140656290,&uStack_60,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x0001400a825d:
    iVar1 = *(int *)(lVar5 * 0x14 + 0x1406562a0);
    if (iVar1 == 1) {
      uStack_88 = 6;
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_64 = 0;
      uStack_70 = 0x3ff0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_70);
    }
    else if (iVar1 == 0) {
      uStack_88 = 5;
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_64 = 0;
      uStack_70 = 0x3fe0000000000000;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_70);
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x1406562a4,&uStack_60,uVar2,0);
    if (iVar1 == 0) {
      lVar5 = 1;
      goto code_r0x0001400a825d;
    }
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
code_r0x0001400a82d5:
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
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
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
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */