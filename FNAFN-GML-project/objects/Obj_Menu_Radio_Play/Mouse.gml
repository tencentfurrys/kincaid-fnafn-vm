/// @description FNAFN Obj_Menu_Radio_Play / Mouse — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_4  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_4 — PORTED ----
// ground truth: gml_Object_Obj_Menu_Radio_Play_Mouse_4 (2446 B @0x1400ee760)
// Decoded, in order (uStack_c0 = GML line markers):
//   1. play = play ^ 1 (id 0x18755; bool-conv XOR 1, same shape as
//      Obj_Pause/KeyPress_27 paused toggle).
//   two-case switch on play (cases runtime @0x140656eb0/@0x140656ec4,
//      labels @0x140656ec0 stride 0x14, per PORTING.md two-case rule):
//     play == 1: image_index = 1 (slot 0x1405c7aa8 self-write);
//        var _snd = custom_music[track_select]
//        (custom_music id 0x186fc; track_select id 0x18794 read off
//        Obj_Menu_Radio_Cassette, obj 54, tag 0x36, via 0x140160480;
//        array-element accessor shape with bounds guards);
//        audio_play_sound(_snd, <runtime @0x140656ea0>, 1)
//        (slot 0x1405c8970; 1.0 = @0x1405c5d08);
//        image_xscale = 0.85 (0x3feb333333333333; slot 0x1405c7c18).
//     play == 0: image_index = 0;
//        for (var i = array_length(custom_music); i >= 0; i -= 1)
//          audio_stop_sound(custom_music[i])
//        (slot 0x1405c8ba0 = array_length, slot 0x1405c8960 =
//        audio_stop_sound; counter shape `i -= 1` per PORTING.md);
//        image_xscale = 0.85.
// TODO(calibrate): play case/label pool @0x14065xxxx (mapping above
// assumes play==1 -> play-sound like the paused==1/0 split in
// Obj_Pause/KeyPress_27; prove via the guarded pool init); play-sound
// priority runtime const @0x140656ea0 — verify in-game.
// Ported: Obj_Menu_Radio_Play / Mouse_4
play = play ^ 1;
if (play == 1) { // TODO(calibrate): runtime pool @0x140656eb0/@0x140656ec4/@0x140656ec0 mapping — verify in-game
    image_index = 1;
    var _snd = custom_music[Obj_Menu_Radio_Cassette.track_select];
    audio_play_sound(_snd, 0, 1); // TODO(calibrate): priority is runtime const @0x140656ea0
    image_xscale = 0.85;
} else if (play == 0) {
    image_index = 0;
    for (var i = array_length(custom_music); i >= 0; i -= 1) {
        audio_stop_sound(custom_music[i]);
    }
    image_xscale = 0.85;
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_Radio_Play_Mouse_4(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  double *pdVar5;
  longlong *plVar6;
  undefined8 uVar7;
  longlong lVar8;
  longlong unaff_GS_OFFSET;
  uint in_stack_fffffffffffffe58;
  ulonglong in_stack_fffffffffffffe60;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 *puStack_188;
  undefined8 uStack_178;
  uint uStack_16c;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined auStack_138 [12];
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  double dStack_e0;
  undefined4 uStack_d8;
  uint uStack_d4;
  undefined8 uStack_d0;
  undefined *puStack_c8;
  undefined4 uStack_c0;
  undefined auStack_b8 [24];
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_c8 = &UNK_14043cfaa;
  uStack_c0 = 0;
  uStack_d0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  plRam0000000140657680 = param_1;
  uStack_e8 = param_2;
  uStack_f0 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fc);
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0.0;
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_c0 = 1;
  pdVar5 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x18755);
  uVar2 = func_0x00014012bb70(pdVar5);
  if ((0x46U >> (*(uint *)((longlong)pdVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar5);
  }
  *(undefined4 *)((longlong)pdVar5 + 0xc) = 0;
  *pdVar5 = (double)((uVar2 ^ 1) & 0xff);
  uStack_c0 = 3;
  uStack_d4 = 0;
  uStack_d8 = *(undefined4 *)(pdVar5 + 1);
  dStack_e0 = *pdVar5;
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656ed8) &&
     (func_0x0001403f6320(0x140656ed8), iRam0000000140656ed8 == -1)) {
    auRam0000000140656ebc = ZEXT816(0);
    uRam0000000140656eb0 = 0x3ff0000000000000;
    uRam0000000140656ed0 = 0x100000000;
    func_0x0001403f6668(&DAT_1400ef610);
    func_0x0001403f62c0(0x140656ed8);
  }
  uVar7 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar3 = func_0x00014015be60(0x140656eb0,&dStack_e0,uRam00000001405cd9c0,0);
  if (iVar3 != 0) {
    iVar3 = func_0x00014015be60(0x140656ec4,&dStack_e0,uVar7,0);
    if (iVar3 != 0) goto joined_r0x0001400ef060;
    lVar8 = 1;
  }
  iVar3 = *(int *)(lVar8 * 0x14 + 0x140656ec0);
  if (iVar3 == 1) {
    uStack_c0 = 9;
    if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_84 = 0;
    uStack_90 = 0;
    func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_90);
    uStack_c0 = 10;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    func_0x000140001490(&uStack_128,uStack_f0);
    puStack_198 = &uStack_128;
    uVar7 = func_0x0001401445d0(param_1,uStack_e8,&uStack_70,1,uRam00000001405c8ba0,&puStack_198);
    func_0x00014002fc60(auStack_b8,uVar7,1);
    func_0x000140001490(&uStack_a0,auStack_b8);
    if ((0x46U >> (auStack_b8._12_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_b8);
    }
    dVar1 = _UNK_14043a218;
    while( true ) {
      auStack_b8._0_16_ = ZEXT416(SUB164(auStack_b8._0_16_,8)) << 0x40;
      iVar3 = func_0x00014015be60(&uStack_a0,auStack_b8,uRam00000001405cd9c0,1);
      if (iVar3 < 0) break;
      uStack_c0 = 0xc;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      uVar4 = func_0x00014012cd90(&uStack_a0);
      plVar6 = (longlong *)func_0x00014002fbe0(uStack_f0,uVar4);
      if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
        func_0x0001401479b0();
        iVar3 = func_0x000140147990(*plVar6);
        if (iVar3 < 1) {
          uVar4 = func_0x000140147990(*plVar6);
          func_0x000140144260(&UNK_140439ca6,0,uVar4);
          plVar6 = (longlong *)0x0;
        }
        else {
          plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
      }
      func_0x000140001490(&uStack_128,plVar6);
      puStack_198 = &uStack_128;
      func_0x0001401445d0(param_1,uStack_e8,&uStack_70,1,uRam00000001405c8960,&puStack_198);
      switch(uStack_94 & 0xffffff) {
      case 0:
      case 0xd:
        uStack_a0 = uStack_a0 + dVar1;
        break;
      case 1:
        uStack_a0 = (double)func_0x00014012d320(&uStack_a0);
        uStack_a0 = uStack_a0 + dVar1;
        uStack_94 = 0;
        break;
      default:
        func_0x000140005560(&UNK_14043a32c,&uStack_a0,&uStack_a0);
        break;
      case 7:
        uStack_a0 = (double)CONCAT44(uStack_a0._4_4_,(int)uStack_a0 + -1);
        break;
      case 10:
        uStack_a0 = (double)((longlong)uStack_a0 + -1);
      }
    }
    uStack_c0 = 0xf;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_74 = 0;
    uStack_80 = 0x3feb333333333333;
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_80);
    uStack_c0 = 0x10;
  }
  else if (iVar3 == 0) {
    uStack_c0 = 5;
    (**(code **)(*param_1 + 0x10))(param_1,0x18755);
    if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    uStack_84 = 0;
    uStack_90 = 0x3ff0000000000000;
    func_0x000140160140(param_1,uRam00000001405c7aa8,0x80000000,&uStack_90);
    uStack_c0 = 6;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    auStack_b8._0_16_ = ZEXT816(0);
    func_0x000140160480(0x36,0x18794,0x80000000,auStack_b8,in_stack_fffffffffffffe58 & 0xffffff00,
                        in_stack_fffffffffffffe60 & 0xffffffffffffff00);
    func_0x00014002fc60(auStack_138,auStack_b8,1);
    uVar4 = func_0x00014012cd90(auStack_138);
    plVar6 = (longlong *)func_0x00014002fbe0(uStack_f0,uVar4);
    if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
      func_0x0001401479b0();
      iVar3 = func_0x000140147990(*plVar6);
      if (iVar3 < 1) {
        uVar4 = func_0x000140147990(*plVar6);
        plVar6 = (longlong *)0x0;
        func_0x000140144260(&UNK_140439ca6,0,uVar4);
      }
      else {
        plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
      }
    }
    else {
      func_0x000140144260(&UNK_140439cd8);
    }
    func_0x000140001490(&uStack_128,plVar6);
    if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
      func_0x000140001410(auStack_138);
    }
    puStack_198 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x140656ea0);
    puStack_190 = &uStack_118;
    func_0x00014000bee0(&uStack_108,0x1405c5d08);
    puStack_188 = &uStack_108;
    func_0x0001401445d0(param_1,uStack_e8,&uStack_70,3,uRam00000001405c8970,&puStack_198);
    uStack_c0 = 7;
    if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_74 = 0;
    uStack_80 = 0x3feb333333333333;
    func_0x000140160140(param_1,uRam00000001405c7c18,0x80000000,&uStack_80);
    uStack_c0 = 8;
  }
joined_r0x0001400ef060:
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_e0);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d0;
  return;
}
END DECOMPILED REFERENCE */
