/// @description FNAFN Obj_Night_Camera_Flash / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// ground truth: gml_Object_Obj_Night_Camera_Flash_Step_0 (4286 B @0x14011cc30)
// Ported: Obj_Night_Camera_Flash / Step_0
// Decoded, in order (uStack_90 = GML line markers 2..0x33; ids via
// builtin_ids.json, slots via EXE-REGISTRY.md, doubles verified
// big-endian):
//   2. if (Night_camera_location == 5) [id 0x1873c; `==`-exit]:
//   4.   hover test — mouse_x/mouse_y (slots 0x1405c7bc8/0x1405c7bd8 via
//      0x14015ef90) against the x/y + scaled sprite box (x/y slots
//      0x1405c7b78/0x1405c7b88, image_xscale/yscale slots 0x1405c7c18/
//      0x1405c7c08 via 0x14015f1a0; MUL helper 0x1400053f0, ADD helper
//      0x140005290):
//        mouse_x > x && mouse_x < x + image_xscale * 237
//          (0x406da00000000000 = 237.0)
//        mouse_y > y && mouse_y < y + image_yscale * 54
//          (0x404b000000000000 = 54.0)
//      All four hold -> image_alpha = 0.95 (0x3fee666666666666), jumping
//      over the dim assignment (C goto code_r0x00014011d2d7); else
//   10. image_alpha = 0.6 (0x3fe3333333333333; slot 0x1405c7b98 self-write
//      via 0x140160140).
//      (The nested C ifs are combined with && — provably equivalent: the
//      bright branch runs iff all four compares hold.)
//      else (camera not on 5):
//   0xf. image_alpha = 0.1 (0x3fb999999999999a).
//   0x11. recharge (id 0x1875e) = clamp(recharge, <min>, 60) [clamp = slot
//      0x1405c8a00 via 0x1401445d0 argc=3; max 60.0 = exe const
//      @0x1405c6910; min is runtime const @0x1406574b0].
//   0x13. if (recharge != 0):
//   0x15.   recharge -= 0.1 * delta_factor [id 0x1870b; 0.1 literal;
//        MUL + -= (0x14000bdb0) helpers].
//   0x17. if (sprite_index == Spr_Night_Camera_Flash_Recharge)
//        [0x4057c00000000000 = 95.0 = SPRT 95; the flash-click handler
//        (Mouse_4) sets this sprite while firing, so Step animates the
//        recharge bar only in that state]:
//   0x19-0x2f. recharge window -> charge-frame image_index (each window is
//        `recharge > lo && recharge <= hi`, sequential C ifs over disjoint
//        ranges; image_index slot 0x1405c7aa8 self-write):
//          (> 50, <= 60) -> 0; (> 40, <= 50) -> 1; (> 30, <= 40) -> 2;
//          (> 20, <= 30) -> 3; (> 10, <= 20) -> 4; (> 0, <= 10) -> 5.
//   0x31-0x33. if (recharge <= 0) sprite_index = Spr_Night_Camera_Flash
//        (0x4033000000000000 = 19.0 = SPRT 19; back to the idle sprite).
// TODO(calibrate): clamp min runtime const @0x1406574b0 (assumed 0 below)
// — verify in-game.
if (Night_camera_location == 5) {
    if (mouse_x > x && mouse_x < x + image_xscale * 237
            && mouse_y > y && mouse_y < y + image_yscale * 54) {
        image_alpha = 0.95;
    } else {
        image_alpha = 0.6;
    }
} else {
    image_alpha = 0.1;
}
recharge = clamp(recharge, 0 /* TODO(calibrate): runtime const @0x1406574b0 */, 60);
if (recharge != 0) {
    recharge -= 0.1 * delta_factor;
}
if (sprite_index == Spr_Night_Camera_Flash_Recharge) { // SPRT 95
    if (recharge > 50 && recharge <= 60) {
        image_index = 0;
    }
    if (recharge > 40 && recharge <= 50) {
        image_index = 1;
    }
    if (recharge > 30 && recharge <= 40) {
        image_index = 2;
    }
    if (recharge > 20 && recharge <= 30) {
        image_index = 3;
    }
    if (recharge > 10 && recharge <= 20) {
        image_index = 4;
    }
    if (recharge > 0 && recharge <= 10) {
        image_index = 5;
    }
    if (recharge <= 0) {
        sprite_index = Spr_Night_Camera_Flash; // SPRT 19
    }
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Flash_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  uint in_stack_fffffffffffffe18;
  uint uVar5;
  ulonglong in_stack_fffffffffffffe20;
  undefined8 **ppuVar6;
  undefined8 *puStack_1d8;
  undefined8 *puStack_1d0;
  undefined8 *puStack_1c8;
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
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_120;
  uint uStack_114;
  undefined8 uStack_110;
  uint uStack_104;
  undefined8 uStack_100;
  uint uStack_f4;
  undefined8 uStack_f0;
  uint uStack_e4;
  undefined8 uStack_e0;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined4 uStack_c8;
  uint uStack_c4;
  undefined8 uStack_c0;
  undefined4 uStack_b8;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  undefined *puStack_98;
  undefined4 uStack_90;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined4 uStack_50;
  uint uStack_4c;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_98 = &UNK_14043db6e;
  uStack_90 = 0;
  uStack_a0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873c);
  uStack_f4 = 0xffffff;
  uStack_100 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_114 = 0xffffff;
  uStack_120 = 0;
  uStack_e4 = 0xffffff;
  uStack_f0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_d8 = CONCAT44(0xffffff,(undefined4)uStack_d8);
  uStack_e0 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_19c = 0xffffff;
  uStack_1a8 = 0;
  uStack_18c = 0xffffff;
  uStack_198 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_90 = 2;
  uStack_4c = 0;
  uStack_58 = 0x4014000000000000;
  iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_90 = 4;
    func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_100);
    in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
    in_stack_fffffffffffffe18 = in_stack_fffffffffffffe18 & 0xffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_d0,in_stack_fffffffffffffe18
                        ,in_stack_fffffffffffffe20);
    iVar1 = func_0x00014015be60(&uStack_100,&uStack_d0,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_100);
      in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
      in_stack_fffffffffffffe18 = in_stack_fffffffffffffe18 & 0xffffff00;
      func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_d0,
                          in_stack_fffffffffffffe18,in_stack_fffffffffffffe20);
      in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
      in_stack_fffffffffffffe18 = in_stack_fffffffffffffe18 & 0xffffff00;
      func_0x00014015f1a0(param_1,uRam00000001405c7c18,0x80000000,&uStack_120,
                          in_stack_fffffffffffffe18,in_stack_fffffffffffffe20);
      uStack_7c = 0;
      uStack_88 = 0x406da00000000000;
      func_0x0001400053f0(&uStack_88,&uStack_120);
      uStack_4c = uStack_c4;
      uStack_50 = uStack_c8;
      if ((0x46U >> (uStack_c4 & 0x1f) & 1) == 0) {
        uStack_58 = uStack_d0;
      }
      else {
        func_0x00014011e5f0(&uStack_58,&uStack_d0);
      }
      func_0x000140005290(&uStack_58,&uStack_88);
      iVar1 = func_0x00014015be60(&uStack_100,&uStack_58,uRam00000001405cd9c0,1);
      if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_58);
      }
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar1 != -2 && iVar1 < 0) {
        func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_f0);
        in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
        in_stack_fffffffffffffe18 = in_stack_fffffffffffffe18 & 0xffffff00;
        func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_c0,
                            in_stack_fffffffffffffe18,in_stack_fffffffffffffe20);
        iVar1 = func_0x00014015be60(&uStack_f0,&uStack_c0,uRam00000001405cd9c0,1);
        if (0 < iVar1) {
          func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_f0);
          in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
          in_stack_fffffffffffffe18 = in_stack_fffffffffffffe18 & 0xffffff00;
          func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_c0,
                              in_stack_fffffffffffffe18,in_stack_fffffffffffffe20);
          func_0x00014015f1a0(param_1,uRam00000001405c7c08,0x80000000,&uStack_110,
                              in_stack_fffffffffffffe18 & 0xffffff00,
                              in_stack_fffffffffffffe20 & 0xffffffffffffff00);
          uStack_7c = 0;
          uStack_88 = 0x404b000000000000;
          func_0x0001400053f0(&uStack_88,&uStack_110);
          uStack_4c = uStack_b4;
          uStack_50 = uStack_b8;
          if ((0x46U >> (uStack_b4 & 0x1f) & 1) == 0) {
            uStack_58 = uStack_c0;
          }
          else {
            func_0x00014011e5f0(&uStack_58,&uStack_c0);
          }
          func_0x000140005290(&uStack_58,&uStack_88);
          iVar1 = func_0x00014015be60(&uStack_f0,&uStack_58,uRam00000001405cd9c0,1);
          if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_58);
          }
          if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_88);
          }
          if (iVar1 != -2 && iVar1 < 0) {
            uStack_90 = 6;
            if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_78);
            }
            uStack_6c = 0;
            uStack_78 = 0x3fee666666666666;
            func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_78);
            goto code_r0x00014011d2d7;
          }
        }
      }
    }
    uStack_90 = 10;
    if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_6c = 0;
    uStack_78 = 0x3fe3333333333333;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_78);
  }
  else {
    uStack_90 = 0xf;
    if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_78);
    }
    uStack_6c = 0;
    uStack_78 = 0x3fb999999999999a;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_78);
  }
code_r0x00014011d2d7:
  uStack_90 = 0x11;
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  uStack_e0 = 0;
  uStack_d8 = 0x500000000;
  uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
  func_0x000140001490(&uStack_158,uVar2);
  puStack_1d8 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1406574b0);
  puStack_1d0 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c6910);
  ppuVar6 = &puStack_1d8;
  uVar5 = uRam00000001405c8a00;
  puStack_1c8 = &uStack_138;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_e0,3,uRam00000001405c8a00,ppuVar6);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar2,uVar4);
  func_0x000140141c50(1);
  uStack_90 = 0x13;
  uStack_4c = 0;
  uStack_58 = 0;
  iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    uStack_90 = 0x15;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0x3fb999999999999a;
    func_0x0001400053f0(&uStack_58,uVar3);
    func_0x00014000bdb0(uVar2,&uStack_58);
    if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_58);
    }
  }
  uStack_90 = 0x17;
  func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_b0,uVar5 & 0xffffff00,
                      (ulonglong)ppuVar6 & 0xffffffffffffff00);
  uStack_4c = 0;
  uStack_58 = 0x4057c00000000000;
  iVar1 = func_0x00014015be60(&uStack_b0,&uStack_58,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_90 = 0x19;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0x4049000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
      uStack_4c = 0;
      uStack_58 = 0x404e000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) {
        uStack_90 = 0x1b;
        if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_68);
        }
        uStack_5c = 0;
        uStack_68 = 0;
        func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_68);
      }
    }
    uStack_90 = 0x1d;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0x4044000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
      uStack_4c = 0;
      uStack_58 = 0x4049000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) {
        uStack_90 = 0x1f;
        if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_68);
        }
        uStack_5c = 0;
        uStack_68 = 0x3ff0000000000000;
        func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_68);
      }
    }
    uStack_90 = 0x21;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0x403e000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
      uStack_4c = 0;
      uStack_58 = 0x4044000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) {
        uStack_90 = 0x23;
        if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_68);
        }
        uStack_5c = 0;
        uStack_68 = 0x4000000000000000;
        func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_68);
      }
    }
    uStack_90 = 0x25;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0x4034000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
      uStack_4c = 0;
      uStack_58 = 0x403e000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) {
        uStack_90 = 0x27;
        if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_68);
        }
        uStack_5c = 0;
        uStack_68 = 0x4008000000000000;
        func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_68);
      }
    }
    uStack_90 = 0x29;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0x4024000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
      uStack_4c = 0;
      uStack_58 = 0x4034000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) {
        uStack_90 = 0x2b;
        if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_68);
        }
        uStack_5c = 0;
        uStack_68 = 0x4010000000000000;
        func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_68);
      }
    }
    uStack_90 = 0x2d;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if (0 < iVar1) {
      uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
      uStack_4c = 0;
      uStack_58 = 0x4024000000000000;
      iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
      if ((iVar1 != -2) && (iVar1 < 1)) {
        uStack_90 = 0x2f;
        if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_68);
        }
        uStack_5c = 0;
        uStack_68 = 0x4014000000000000;
        func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_68);
      }
    }
    uStack_90 = 0x31;
    uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x1875e);
    uStack_4c = 0;
    uStack_58 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_58,uRam00000001405cd9c0,1);
    if ((iVar1 != -2) && (iVar1 < 1)) {
      uStack_90 = 0x33;
      if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b0);
      }
      uStack_a4 = 0;
      uStack_b0 = 0x4033000000000000;
      func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_b0);
    }
  }
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
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
  if ((0x46U >> (uStack_d8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_e4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f0);
  }
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_120);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_f4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_100);
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
  puRam0000000140657668 = (undefined8 *)uStack_a0;
  return;
}
END DECOMPILED REFERENCE */
