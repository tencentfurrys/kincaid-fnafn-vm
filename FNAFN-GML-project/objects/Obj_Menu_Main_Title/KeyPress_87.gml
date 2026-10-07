/// @description FNAFN Obj_Menu_Main_Title / KeyPress_87 - PORTED from C
// ---- sub-event KeyPress_87 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Menu_Main_Title_KeyPress_87 (5953 B @0x140107c40)
// W = move selection up: mirror of KeyPress_83. Head: if (select > 0) {
// select -= 1; } (-= via PROVEN helper 0x14000bdb0; the compared bound is a
// stack-reused slot — assumed 0 by symmetry with the S-key < 3 bound).
// The four if (select == N) visual-apply blocks and the shared
// selector/secondary_x/draw_alpha + glitching tail are identical to
// KeyPress_83.
// TODO(calibrate): lower bound assumed 0; == consts assumed 0/1/2/3;
// glitch case consts @0x140657210/@0x140657224 + dispatch @0x140657220 and
// glitch_type targets @0x140657240..@0x14065727c + dispatch @0x140657250
// (jumptable not recovered).
if (select > 0) { // TODO(calibrate): lower bound is a stack-reused slot, assumed 0
    select -= 1;
}
if (select == 0) {
    Obj_Menu_Selector.select_y = 340;
    Obj_Menu_Main_Back.image_index = 0;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 1) {
    Obj_Menu_Selector.select_y = 385;
    Obj_Menu_Main_Back.image_index = 1;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 2) {
    Obj_Menu_Selector.select_y = 430;
    Obj_Menu_Main_Back.image_index = 2;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 3) {
    Obj_Menu_Selector.select_y = 475;
    Obj_Menu_Main_Back.image_index = 3;
    Obj_Menu_Main_Back.image_alpha = 0;
}
Obj_Menu_Selector.y = lerp(Obj_Menu_Selector.y, Obj_Menu_Selector.select_y, 0.2 * delta_factor);
Obj_Menu_Selector.secondary_x = lerp(Obj_Menu_Selector.secondary_x, 94 + string_width(text_menu[select]), 0.2 * delta_factor);
draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor);
if (glitching == 1) { // TODO(calibrate): case const is runtime @0x140657210/@0x140657224 (assumed 0/1)
    y = lerp(y, 160, 0.5 * delta_factor);
    x = lerp(x, 32, 0.5 * delta_factor);
    image_alpha = lerp(image_alpha, 1, 0.3 * delta_factor);
} else {
    image_alpha = random_range(0, 0); // TODO(calibrate): args _UNK_140439e78/_UNK_14043b078; helper 0x140168cf0
    // TODO: glitch_type 4-way switch (@0x140657240..@0x14065727c, dispatch @0x140657250) — jumptable not recovered.
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void gml_Object_Obj_Menu_Main_Title_KeyPress_87(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  ulonglong uVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  uint in_stack_fffffffffffffe08;
  uint uVar8;
  ulonglong in_stack_fffffffffffffe10;
  undefined8 **ppuVar9;
  undefined8 uStack_1e8;
  uint uStack_1dc;
  undefined8 uStack_1d8;
  uint uStack_1cc;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 uStack_1a8;
  uint uStack_19c;
  undefined8 uStack_198;
  uint uStack_18c;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  undefined8 uStack_160;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 uStack_130;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined auStack_118 [8];
  undefined8 uStack_110;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  undefined *puStack_d8;
  undefined4 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined8 uStack_a0;
  undefined8 uStack_98;
  undefined4 uStack_90;
  uint uStack_8c;
  undefined auStack_88 [8];
  undefined8 uStack_80;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_d8 = &UNK_14043d5d1;
  uStack_d0 = 0;
  uStack_e0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  plRam0000000140657680 = param_1;
  uStack_130 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_a0 = CONCAT44(0xffffff,(undefined4)uStack_a0);
  uStack_a8 = 0;
  uStack_160 = CONCAT44(0xffffff,(undefined4)uStack_160);
  uStack_168 = 0;
  uStack_1dc = 0xffffff;
  uStack_1e8 = 0;
  uStack_1cc = 0xffffff;
  uStack_1d8 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_d0 = 1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
  _auStack_88 = ZEXT416(SUB124(_auStack_88,8)) << 0x40;
  uVar2 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar3,auStack_88,uVar2,1);
  if (0 < iVar1) {
    uStack_d0 = 3;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3ff0000000000000;
    func_0x00014000bdb0(uVar3,auStack_88);
    if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_88);
    }
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_d0 = 5;
  _auStack_88 = ZEXT416(SUB124(_auStack_88,8)) << 0x40;
  iVar1 = func_0x00014015be60(uVar3,auStack_88,uVar2,0);
  if (iVar1 == 0) {
    uStack_d0 = 7;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_88 = ZEXT816(0x4075400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_88);
    uStack_d0 = 8;
    if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_c8);
    }
    uStack_bc = 0;
    uStack_c8 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_c8);
    uStack_d0 = 9;
    if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b8);
    }
    uStack_ac = 0;
    uStack_b8 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_b8);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_d0 = 0xc;
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_88,uVar2,0);
  if (iVar1 == 0) {
    uStack_d0 = 0xe;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_88 = ZEXT816(0x4078100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_88);
    uStack_d0 = 0xf;
    if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_c8);
    }
    uStack_bc = 0;
    uStack_c8 = 0x3ff0000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_c8);
    uStack_d0 = 0x10;
    if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b8);
    }
    uStack_ac = 0;
    uStack_b8 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_b8);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_d0 = 0x13;
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x4000000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_88,uVar2,0);
  if (iVar1 == 0) {
    uStack_d0 = 0x15;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_88 = ZEXT816(0x407ae00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_88);
    uStack_d0 = 0x16;
    if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_c8);
    }
    uStack_bc = 0;
    uStack_c8 = 0x4000000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_c8);
    uStack_d0 = 0x17;
    if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b8);
    }
    uStack_ac = 0;
    uStack_b8 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_b8);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_d0 = 0x1a;
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x4008000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_88,uVar2,0);
  if (iVar1 == 0) {
    uStack_d0 = 0x1c;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_88 = ZEXT816(0x407db00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_88);
    uStack_d0 = 0x1d;
    if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_c8);
    }
    uStack_bc = 0;
    uStack_c8 = 0x4008000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_c8);
    uStack_d0 = 0x1e;
    if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_b8);
    }
    uStack_ac = 0;
    uStack_b8 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_b8);
  }
  uStack_d0 = 0x22;
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_a8 = 0;
  uStack_a0 = 0x500000000;
  _auStack_88 = ZEXT816(0);
  func_0x000140144a40(0x23,uRam00000001405c7b88,0x80000000,&uStack_178);
  func_0x000140160480(0x23,0x1876d,0x80000000,auStack_88,in_stack_fffffffffffffe08 & 0xffffff00,
                      in_stack_fffffffffffffe10 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_1b8,&uStack_178);
  puStack_158 = &uStack_1b8;
  func_0x000140001490(&uStack_1a8,auStack_88);
  uStack_110._4_4_ = 0;
  uStack_110._0_4_ = SUB124(_auStack_118,8);
  auStack_118 = (undefined  [8])0x3fc999999999999a;
  puStack_150 = &uStack_1a8;
  func_0x0001400053f0(auStack_118,uStack_130);
  func_0x000140001490(&uStack_198,auStack_118);
  if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_118);
  }
  ppuVar9 = &puStack_158;
  uVar8 = uRam00000001405c8cc0;
  puStack_148 = &uStack_198;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,ppuVar9);
  func_0x000140001490(&uStack_178,uVar4);
  func_0x00014015fea0(0x23,uRam00000001405c7b88,0x80000000,&uStack_178);
  uStack_d0 = 0x23;
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_a8 = 0;
  uStack_a0 = 0x500000000;
  if ((0x46U >> (uStack_160._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  uStack_168 = 0;
  uStack_160 = 0x500000000;
  _auStack_118 = ZEXT816(0);
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1878b);
  func_0x000140160480(0x23,0x18769,0x80000000,auStack_118,uVar8 & 0xffffff00,
                      (ulonglong)ppuVar9 & 0xffffffffffffff00);
  uVar2 = func_0x00014012cd90(uVar3);
  uVar3 = func_0x00014002fbe0(uVar4,uVar2);
  func_0x000140001490(&uStack_1b8,uVar3);
  puStack_158 = &uStack_1b8;
  func_0x000140001490(&uStack_1a8,auStack_118);
  puStack_150 = &uStack_1a8;
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_168,1,uRam00000001405c8d80,&puStack_158);
  uStack_8c = 0;
  uStack_98 = 0x4057800000000000;
  func_0x000140005290(&uStack_98,uVar3);
  func_0x000140001490(&uStack_198,&uStack_98);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  uStack_8c = 0;
  uStack_98 = 0x3fc999999999999a;
  puStack_148 = &uStack_198;
  func_0x0001400053f0(&uStack_98,uStack_130);
  func_0x000140001490(&uStack_188,&uStack_98);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  puStack_140 = &uStack_188;
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,&puStack_150);
  uVar4 = func_0x000140160290(0x23);
  func_0x000140141d00(uVar4);
  func_0x000140001490(auStack_118,uVar3);
  func_0x000140141c50(1);
  func_0x000140160b90(0x23,0x18769,0x80000000,auStack_118);
  uStack_d0 = 0x25;
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_a8 = 0;
  uStack_a0 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
  func_0x000140001490(&uStack_1b8,uVar3);
  puStack_158 = &uStack_1b8;
  func_0x00014000bee0(&uStack_1a8,0x1405c63f0);
  uStack_8c = 0;
  uStack_98 = 0x3fa999999999999a;
  puStack_150 = &uStack_1a8;
  func_0x0001400053f0(&uStack_98,uStack_130);
  func_0x000140001490(&uStack_198,&uStack_98);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  ppuVar9 = &puStack_158;
  uVar8 = uRam00000001405c8cc0;
  puStack_148 = &uStack_198;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,ppuVar9);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar3,uVar4);
  func_0x000140141c50(1);
  uStack_d0 = 0x27;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18729);
  uStack_8c = *(uint *)((longlong)puVar5 + 0xc);
  uStack_90 = *(undefined4 *)(puVar5 + 1);
  if ((0x46U >> (uStack_8c & 0x1f) & 1) == 0) {
    uStack_98 = *puVar5;
  }
  else {
    func_0x00014010a150(&uStack_98,puVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140657238) &&
     (func_0x0001403f6320(0x140657238), iRam0000000140657238 == -1)) {
    auRam000000014065721c = ZEXT816(0);
    uRam0000000140657210 = 0x3ff0000000000000;
    uRam0000000140657230 = 0x100000000;
    func_0x0001403f6668(&DAT_140109ff0);
    func_0x0001403f62c0(0x140657238);
  }
  uVar2 = (undefined4)uRam00000001405cd9c0;
  lVar7 = 0;
  iVar1 = func_0x00014015be60(0x140657210,&uStack_98,uVar2,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140657224,&uStack_98,uVar2,0);
    if (iVar1 != 0) goto joined_r0x000140108de2;
    lVar7 = 1;
  }
  iVar1 = *(int *)(lVar7 * 0x14 + 0x140657220);
  if (iVar1 == 1) {
    uStack_d0 = 0x32;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_100,uVar8 & 0xffffff00,
                        (ulonglong)ppuVar9 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_1b8,&uStack_100);
    puStack_158 = &uStack_1b8;
    func_0x00014000bee0(&uStack_1a8,0x1405c6400);
    uStack_64 = 0;
    uStack_70 = 0x3fe0000000000000;
    puStack_150 = &uStack_1a8;
    func_0x0001400053f0(&uStack_70,uStack_130);
    func_0x000140001490(&uStack_198,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    ppuVar9 = &puStack_158;
    uVar8 = uRam00000001405c8cc0;
    puStack_148 = &uStack_198;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,ppuVar9);
    func_0x000140001490(&uStack_100,uVar3);
    func_0x000140160140(param_1,uRam00000001405c7b88,0x80000000,&uStack_100);
    uStack_d0 = 0x33;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_f0,uVar8 & 0xffffff00,
                        (ulonglong)ppuVar9 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_1b8,&uStack_f0);
    puStack_158 = &uStack_1b8;
    func_0x00014000bee0(&uStack_1a8,0x1405c6410);
    uStack_64 = 0;
    uStack_70 = 0x3fe0000000000000;
    puStack_150 = &uStack_1a8;
    func_0x0001400053f0(&uStack_70,uStack_130);
    func_0x000140001490(&uStack_198,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    ppuVar9 = &puStack_158;
    uVar8 = uRam00000001405c8cc0;
    puStack_148 = &uStack_198;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,ppuVar9);
    func_0x000140001490(&uStack_f0,uVar3);
    func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_f0);
    uStack_d0 = 0x34;
    if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    uStack_a8 = 0;
    uStack_a0 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_128,uVar8 & 0xffffff00,
                        (ulonglong)ppuVar9 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_1b8,&uStack_128);
    puStack_158 = &uStack_1b8;
    func_0x00014000bee0(&uStack_1a8,0x1405c63f0);
    uStack_64 = 0;
    uStack_70 = 0x3fd3333333333333;
    puStack_150 = &uStack_1a8;
    func_0x0001400053f0(&uStack_70,uStack_130);
    func_0x000140001490(&uStack_198,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_148 = &uStack_198;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_a8,3,uRam00000001405c8cc0,&puStack_158);
    func_0x000140001490(&uStack_128,uVar3);
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_128);
    uStack_d0 = 0x35;
    goto joined_r0x000140108de2;
  }
  if (iVar1 != 0) goto joined_r0x000140108de2;
  uStack_d0 = 0x29;
  (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
  uVar3 = func_0x000140168cf0((int)_UNK_140439e78,_UNK_14043b078);
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  uStack_11c = 0;
  uStack_128 = uVar3;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_128);
  uStack_d0 = 0x2a;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18728);
  uStack_64 = *(uint *)((longlong)puVar5 + 0xc);
  uStack_68 = *(undefined4 *)(puVar5 + 1);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
    uStack_70 = *puVar5;
  }
  else {
    func_0x00014010a150(&uStack_70,puVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140657290) &&
     (func_0x0001403f6320(0x140657290), iRam0000000140657290 == -1)) {
    uRam000000014065724c = 0;
    uRam0000000140657240 = 0x3ff0000000000000;
    uRam0000000140657260 = 0x100000000;
    uRam0000000140657254 = 0x4000000000000000;
    uRam0000000140657274 = 0x200000000;
    uRam0000000140657268 = 0x4008000000000000;
    uRam0000000140657288 = 0x300000000;
    uRam000000014065727c = 0x4010000000000000;
    func_0x0001403f6668(&DAT_14010a080);
    func_0x0001403f62c0(0x140657290);
  }
  uVar2 = (undefined4)uRam00000001405cd9c0;
  lVar7 = 0;
  iVar1 = func_0x00014015be60(0x140657240,&uStack_70,uVar2,0);
  if (iVar1 == 0) {
code_r0x000140108ec2:
    uVar6 = (ulonglong)*(uint *)(lVar7 * 0x14 + 0x140657250);
joined_r0x000140109258:
    if (uVar6 < 4) {
                    /* WARNING: Could not recover jumptable at 0x000140108ee2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)(&UNK_140109fdc + *(int *)(&UNK_140109fdc + uVar6 * 4)))();
      return;
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140657254,&uStack_70,uVar2,0);
    if (iVar1 == 0) {
      lVar7 = 1;
      goto code_r0x000140108ec2;
    }
    iVar1 = func_0x00014015be60(0x140657268,&uStack_70,uVar2,0);
    if (iVar1 == 0) {
      uVar6 = uRam0000000140657274 >> 0x20;
      goto joined_r0x000140109258;
    }
    iVar1 = func_0x00014015be60(0x14065727c,&uStack_70,uVar2,0);
    if (iVar1 == 0) {
      uVar6 = uRam0000000140657288 >> 0x20;
      goto joined_r0x000140109258;
    }
  }
  uStack_d0 = 0x31;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
joined_r0x000140108de2:
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_1bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c8);
  }
  if ((0x46U >> (uStack_1cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1d8);
  }
  if ((0x46U >> (uStack_1dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1e8);
  }
  if ((0x46U >> (uStack_160._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_a0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_18c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_198);
  }
  if ((0x46U >> (uStack_19c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a8);
  }
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_e0;
  return;
}
END DECOMPILED REFERENCE */
