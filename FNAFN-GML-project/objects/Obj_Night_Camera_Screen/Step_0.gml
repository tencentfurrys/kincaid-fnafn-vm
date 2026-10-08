/// @description FNAFN Obj_Night_Camera_Screen / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Screen_Step_0 (2804 B @0x1400b55b0)
// Two independent two-case switches (case consts are runtime-pool strings,
// TODO(calibrate): @0x140656460/@0x140656474 from @0x1405c4f80/@0x1405c4f88,
// and @0x140656490/@0x1406564a4; label tables @0x140656470/@0x1406564a0 static.
// Branch polarity below assumes table routes case0 -> first branch listed,
// case1 -> second; verify in-game).
// 1. switch (Night_camera_mode):
//      case <c0>: y = <rand helper>(TODO_calibrate_args @0x14043c2b0/b8)
//      case <c1>: y = <rand helper>(TODO_calibrate_args @0x14043c2c0/c8)
//    (func_0x000140168cf0, same 2-arg random helper as Office_Light_Back.)
// 2. switch (Night_recording):
//      case <c0>: image_yscale = lerp(image_yscale, <const @0x1405c4fa0>,
//                     0.25 * delta_factor);
//                 image_xscale = lerp(image_xscale, <const @0x1405c4fa0>,
//                     0.25 * delta_factor);
//      case <c1>: image_xscale = lerp(image_xscale, <const @0x1405c4f90>,
//                     0.1 * delta_factor);
//                 image_yscale = lerp(image_yscale, <const @0x1405c4f90>,
//                     0.1 * delta_factor);
//    (0x3fd0000000000000 = 0.25, 0x3fb999999999999a = 0.1; MUL helper
//    0x1400053f0; lerp = slot 0x1405c8cc0, registry-proven. Note the else
//    branch updates xscale first, then yscale.)
// (Slots: 0x1405c7b88 = y, 0x1405c7c08 = image_yscale, 0x1405c7c18 =
// image_xscale, per EXE-REGISTRY.md.)
if (Night_camera_mode == TODO_calibrate_case_0x140656460) {
    y = TODO_calibrate_random_0x14043c2b0;  // func_0x000140168cf0(...)
} else if (Night_camera_mode == TODO_calibrate_case_0x140656474) {
    y = TODO_calibrate_random_0x14043c2c0;  // func_0x000140168cf0(...)
}
if (Night_recording == TODO_calibrate_case_0x140656490) {
    image_yscale = lerp(image_yscale, TODO_calibrate_0x1405c4fa0, 0.25 * delta_factor);
    image_xscale = lerp(image_xscale, TODO_calibrate_0x1405c4fa0, 0.25 * delta_factor);
} else if (Night_recording == TODO_calibrate_case_0x1406564a4) {
    image_xscale = lerp(image_xscale, TODO_calibrate_0x1405c4f90, 0.1 * delta_factor);
    image_yscale = lerp(image_yscale, TODO_calibrate_0x1405c4f90, 0.1 * delta_factor);
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Camera_Screen_Step_0(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 *puVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined4 uVar7;
  uint in_stack_fffffffffffffe68;
  uint uVar8;
  ulonglong in_stack_fffffffffffffe70;
  undefined8 **ppuVar9;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
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
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 uStack_e8;
  undefined4 uStack_e0;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined4 uStack_d0;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_c0 = &UNK_14043c2d0;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uRam0000000140657680 = param_1;
  puVar2 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  puVar3 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_b8 = 1;
  uStack_dc = *(uint *)((longlong)puVar2 + 0xc);
  uStack_e0 = *(undefined4 *)(puVar2 + 1);
  if ((0x46U >> (uStack_dc & 0x1f) & 1) == 0) {
    uStack_e8 = *puVar2;
  }
  else {
    func_0x0001400b6b20(&uStack_e8,puVar2);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656488) &&
     (func_0x0001403f6320(0x140656488), iRam0000000140656488 == -1)) {
    func_0x0001401453a0(0x140656460,0x1405c4f80);
    uRam0000000140656470 = 0;
    func_0x0001401453a0(0x140656474,0x1405c4f88);
    uRam0000000140656484 = 1;
    func_0x0001403f6668(&DAT_1400b6a00);
    func_0x0001403f62c0(0x140656488);
  }
  uVar7 = (undefined4)uRam00000001405cd9c0;
  lVar6 = 0;
  iVar1 = func_0x00014015be60(0x140656460,&uStack_e8,uVar7,0);
  if (iVar1 == 0) {
code_r0x0001400b57b5:
    iVar1 = *(int *)(lVar6 * 0x14 + 0x140656470);
    if (iVar1 == 1) {
      uStack_b8 = 4;
      uVar5 = func_0x000140168cf0((int)_UNK_14043c2b0,_UNK_14043c2b8);
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = uVar5;
      func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_90);
    }
    else if (iVar1 == 0) {
      uStack_b8 = 3;
      uVar5 = func_0x000140168cf0((int)_UNK_14043c2c0,_UNK_14043c2c8);
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = uVar5;
      func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_90);
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140656474,&uStack_e8,uVar7,0);
    if (iVar1 == 0) {
      lVar6 = 1;
      goto code_r0x0001400b57b5;
    }
  }
  uStack_b8 = 10;
  uStack_cc = *(uint *)((longlong)puVar3 + 0xc);
  uStack_d0 = *(undefined4 *)(puVar3 + 1);
  if ((0x46U >> (uStack_cc & 0x1f) & 1) == 0) {
    uStack_d8 = *puVar3;
  }
  else {
    func_0x0001400b6b20(&uStack_d8,puVar3);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam00000001406564b8) &&
     (func_0x0001403f6320(0x1406564b8), iRam00000001406564b8 == -1)) {
    auRam000000014065649c = ZEXT816(0);
    uRam0000000140656490 = 0x3ff0000000000000;
    uRam00000001406564b0 = 0x100000000;
    func_0x0001403f6668(&DAT_1400b6a90);
    func_0x0001403f62c0(0x1406564b8);
  }
  uVar7 = (undefined4)uRam00000001405cd9c0;
  lVar6 = 0;
  iVar1 = func_0x00014015be60(0x140656490,&uStack_d8,uVar7,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x1406564a4,&uStack_d8,uVar7,0);
    if (iVar1 != 0) goto joined_r0x0001400b5fbb;
    lVar6 = 1;
  }
  iVar1 = *(int *)(lVar6 * 0x14 + 0x1406564a0);
  if (iVar1 == 1) {
    uStack_b8 = 0xf;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0,
                        in_stack_fffffffffffffe68 & 0xffffff00,
                        in_stack_fffffffffffffe70 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_138,&uStack_a0);
    puStack_108 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c4fa0);
    uStack_64 = 0;
    uStack_70 = 0x3fd0000000000000;
    puStack_100 = &uStack_128;
    func_0x0001400053f0(&uStack_70,uVar4);
    func_0x000140001490(&uStack_118,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uVar8 = uRam00000001405c8cc0;
    ppuVar9 = &puStack_108;
    puStack_f8 = &uStack_118;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_108);
    func_0x000140001490(&uStack_a0,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0);
    uStack_b8 = 0x10;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_b0,uVar8 & 0xffffff00,
                        (ulonglong)ppuVar9 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_138,&uStack_b0);
    puStack_108 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c4fa0);
    uStack_64 = 0;
    uStack_70 = 0x3fd0000000000000;
    puStack_100 = &uStack_128;
    func_0x0001400053f0(&uStack_70,uVar4);
    func_0x000140001490(&uStack_118,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_f8 = &uStack_118;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_108);
    func_0x000140001490(&uStack_b0,uVar4);
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_b0);
    uStack_b8 = 0x11;
  }
  else if (iVar1 == 0) {
    uStack_b8 = 0xc;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_b0,
                        in_stack_fffffffffffffe68 & 0xffffff00,
                        in_stack_fffffffffffffe70 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_138,&uStack_b0);
    puStack_108 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c4f90);
    uStack_64 = 0;
    uStack_70 = 0x3fb999999999999a;
    puStack_100 = &uStack_128;
    func_0x0001400053f0(&uStack_70,uVar4);
    func_0x000140001490(&uStack_118,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uVar8 = uRam00000001405c8cc0;
    ppuVar9 = &puStack_108;
    puStack_f8 = &uStack_118;
    uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_108);
    func_0x000140001490(&uStack_b0,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_b0);
    uStack_b8 = 0xd;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0,uVar8 & 0xffffff00,
                        (ulonglong)ppuVar9 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_138,&uStack_a0);
    puStack_108 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c4f90);
    uStack_64 = 0;
    uStack_70 = 0x3fb999999999999a;
    puStack_100 = &uStack_128;
    func_0x0001400053f0(&uStack_70,uVar4);
    func_0x000140001490(&uStack_118,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_f8 = &uStack_118;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_108);
    func_0x000140001490(&uStack_a0,uVar4);
    func_0x000140160140(param_1,uRam00000001405c7c08,0x80000000,&uStack_a0);
    uStack_b8 = 0xe;
  }
joined_r0x0001400b5fbb:
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
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
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */
