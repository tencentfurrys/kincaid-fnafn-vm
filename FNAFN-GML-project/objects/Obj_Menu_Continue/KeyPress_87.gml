/// @description FNAFN Obj_Menu_Continue / KeyPress_87 - PORTED from C
// ---- sub-event KeyPress_87 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Menu_Continue_KeyPress_87 (4518 B @0x1400546c0)
// Mirror of KeyPress_83 (S) with the up direction. uStack_118 =
// delta_factor (global 0x1870b) fetched once at the top.
//   1. line 1: read select; compare > 0.0 (the `<< 0x40` zero operand,
//      `0 < iVar1`). In the branch: select -= 1 via
//      func_0x00014000bdb0(var, 1.0) — the -= op helper.
//   2. lines 5..0x3a: same eight equality branches as KeyPress_83
//      (operands 0..7), each setting Obj_Menu_Selector.select_y /
//      Obj_Menu_Main_Back.image_index / image_alpha to the same
//      295/340/385/430/475/520/565/610 and 0..7 values.
//   3. line 0x3d: Obj_Menu_Selector.y = lerp(y, select_y, 0.2*delta).
//   4. line 0x3e: Obj_Menu_Selector.secondary_x = lerp(secondary_x, 94 +
//      string_width(text_night[select]), 0.2*delta) — here the first
//      operand IS the secondary_x read (auStack_e8), matching the Step
//      event (contrast KeyPress_83's TODO(calibrate) note).
//   5. line 0x40: draw_alpha = lerp(draw_alpha, 1, 0.05*delta) — const
//      0x1405c3d38 = 1.0.
if (select > 0) {
    select -= 1;
}
if (select == 0) {
    Obj_Menu_Selector.select_y = 295;
    Obj_Menu_Main_Back.image_index = 0;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 1) {
    Obj_Menu_Selector.select_y = 340;
    Obj_Menu_Main_Back.image_index = 1;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 2) {
    Obj_Menu_Selector.select_y = 385;
    Obj_Menu_Main_Back.image_index = 2;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 3) {
    Obj_Menu_Selector.select_y = 430;
    Obj_Menu_Main_Back.image_index = 3;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 4) {
    Obj_Menu_Selector.select_y = 475;
    Obj_Menu_Main_Back.image_index = 4;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 5) {
    Obj_Menu_Selector.select_y = 520;
    Obj_Menu_Main_Back.image_index = 5;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 6) {
    Obj_Menu_Selector.select_y = 565;
    Obj_Menu_Main_Back.image_index = 6;
    Obj_Menu_Main_Back.image_alpha = 0;
}
if (select == 7) {
    Obj_Menu_Selector.select_y = 610;
    Obj_Menu_Main_Back.image_index = 7;
    Obj_Menu_Main_Back.image_alpha = 0;
}
Obj_Menu_Selector.y = lerp(Obj_Menu_Selector.y, Obj_Menu_Selector.select_y, 0.2 * delta_factor);
Obj_Menu_Selector.secondary_x = lerp(Obj_Menu_Selector.secondary_x, 94 + string_width(text_night[select]), 0.2 * delta_factor);
draw_alpha = lerp(draw_alpha, 1, 0.05 * delta_factor);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_KeyPress_87(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  uint in_stack_fffffffffffffe68;
  uint uVar5;
  ulonglong in_stack_fffffffffffffe70;
  undefined8 **ppuVar6;
  undefined8 uStack_188;
  uint uStack_17c;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  undefined auStack_e8 [8];
  undefined8 uStack_e0;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined auStack_78 [8];
  undefined8 uStack_70;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043aa25;
  uStack_b0 = 0;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  plRam0000000140657680 = param_1;
  uStack_100 = param_2;
  uStack_118 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_c8 = CONCAT44(0xffffff,(undefined4)uStack_c8);
  uStack_d0 = 0;
  uStack_f0 = CONCAT44(0xffffff,(undefined4)uStack_f0);
  uStack_f8 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_b0 = 1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
  _auStack_78 = ZEXT416(SUB124(_auStack_78,8)) << 0x40;
  uVar2 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,1);
  if (0 < iVar1) {
    uStack_b0 = 3;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    uStack_70._4_4_ = 0;
    auStack_78 = (undefined  [8])0x3ff0000000000000;
    func_0x00014000bdb0(uVar3,auStack_78);
    if ((0x46U >> (uStack_70._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_78);
    }
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 5;
  _auStack_78 = ZEXT416(SUB124(_auStack_78,8)) << 0x40;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 7;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x4072700000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 8;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 9;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0xc;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x3ff0000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0xe;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x4075400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0xf;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x3ff0000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x10;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0x13;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x4000000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x15;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x4078100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x16;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x4000000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x17;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0x1a;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x4008000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x1c;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x407ae00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x1d;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x4008000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x1e;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0x21;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x4010000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x23;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x407db00000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x24;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x4010000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x25;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0x28;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x4014000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x2a;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x4080400000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x2b;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x4014000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x2c;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0x2f;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x4018000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x31;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x4081a80000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x32;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x4018000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x33;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
    uVar2 = (undefined4)uRam00000001405cd9c0;
  }
  uStack_b0 = 0x36;
  uStack_70._4_4_ = 0;
  uStack_70._0_4_ = SUB124(_auStack_78,8);
  auStack_78 = (undefined  [8])0x401c000000000000;
  iVar1 = func_0x00014015be60(uVar3,auStack_78,uVar2,0);
  if (iVar1 == 0) {
    uStack_b0 = 0x38;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1876a);
    _auStack_78 = ZEXT816(0x4083100000000000);
    func_0x000140160b90(0x23,0x1876d,0x80000000,auStack_78);
    uStack_b0 = 0x39;
    if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_98);
    }
    uStack_8c = 0;
    uStack_98 = 0x401c000000000000;
    func_0x00014015fea0(0x1d,uRam00000001405c7aa8,0x80000000,&uStack_98);
    uStack_b0 = 0x3a;
    if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_88);
    }
    uStack_7c = 0;
    uStack_88 = 0;
    func_0x00014015fea0(0x1d,uRam00000001405c7b98,0x80000000,&uStack_88);
  }
  uStack_b0 = 0x3d;
  if ((0x46U >> (uStack_c8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  uStack_d0 = 0;
  uStack_c8 = 0x500000000;
  _auStack_78 = ZEXT816(0);
  func_0x000140144a40(0x23,uRam00000001405c7b88,0x80000000,&uStack_110);
  func_0x000140160480(0x23,0x1876d,0x80000000,auStack_78,in_stack_fffffffffffffe68 & 0xffffff00,
                      in_stack_fffffffffffffe70 & 0xffffffffffffff00);
  func_0x000140001490(&uStack_158,&uStack_110);
  puStack_178 = &uStack_158;
  func_0x000140001490(&uStack_148,auStack_78);
  uStack_e0._4_4_ = 0;
  uStack_e0._0_4_ = SUB124(_auStack_e8,8);
  auStack_e8 = (undefined  [8])0x3fc999999999999a;
  puStack_170 = &uStack_148;
  func_0x0001400053f0(auStack_e8,uStack_118);
  func_0x000140001490(&uStack_138,auStack_e8);
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_e8);
  }
  ppuVar6 = &puStack_178;
  uVar5 = uRam00000001405c8cc0;
  puStack_168 = &uStack_138;
  uVar4 = func_0x0001401445d0(param_1,uStack_100,&uStack_d0,3,uRam00000001405c8cc0,ppuVar6);
  func_0x000140001490(&uStack_110,uVar4);
  func_0x00014015fea0(0x23,uRam00000001405c7b88,0x80000000,&uStack_110);
  uStack_b0 = 0x3e;
  if ((0x46U >> (uStack_c8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  uStack_d0 = 0;
  uStack_c8 = 0x500000000;
  if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  uStack_f8 = 0;
  uStack_f0 = 0x500000000;
  _auStack_e8 = ZEXT816(0);
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x1878c);
  func_0x000140160480(0x23,0x18769,0x80000000,auStack_e8,uVar5 & 0xffffff00,
                      (ulonglong)ppuVar6 & 0xffffffffffffff00);
  uVar2 = func_0x00014012cd90(uVar3);
  uVar3 = func_0x00014002fbe0(uVar4,uVar2);
  func_0x000140001490(&uStack_158,uVar3);
  puStack_178 = &uStack_158;
  func_0x000140001490(&uStack_148,auStack_e8);
  puStack_170 = &uStack_148;
  uVar3 = func_0x0001401445d0(param_1,uStack_100,&uStack_f8,1,uRam00000001405c8d80,&puStack_178);
  uStack_9c = 0;
  uStack_a8 = 0x4057800000000000;
  func_0x000140005290(&uStack_a8,uVar3);
  func_0x000140001490(&uStack_138,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  uStack_9c = 0;
  uStack_a8 = 0x3fc999999999999a;
  puStack_168 = &uStack_138;
  func_0x0001400053f0(&uStack_a8,uStack_118);
  func_0x000140001490(&uStack_128,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puStack_160 = &uStack_128;
  uVar3 = func_0x0001401445d0(param_1,uStack_100,&uStack_d0,3,uRam00000001405c8cc0,&puStack_170);
  uVar4 = func_0x000140160290(0x23);
  func_0x000140141d00(uVar4);
  func_0x000140001490(auStack_e8,uVar3);
  func_0x000140141c50(1);
  func_0x000140160b90(0x23,0x18769,0x80000000,auStack_e8);
  uStack_b0 = 0x40;
  if ((0x46U >> (uStack_c8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  uStack_d0 = 0;
  uStack_c8 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18712);
  func_0x000140001490(&uStack_158,uVar3);
  puStack_178 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c3d38);
  uStack_9c = 0;
  uStack_a8 = 0x3fa999999999999a;
  puStack_170 = &uStack_148;
  func_0x0001400053f0(&uStack_a8,uStack_118);
  func_0x000140001490(&uStack_138,&uStack_a8);
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puStack_168 = &uStack_138;
  uVar4 = func_0x0001401445d0(param_1,uStack_100,&uStack_d0,3,uRam00000001405c8cc0,&puStack_178);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar3,uVar4);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_c8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */
