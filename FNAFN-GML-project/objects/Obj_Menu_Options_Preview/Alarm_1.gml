/// @description FNAFN Obj_Menu_Options_Preview / Alarm_1 - PORTED from C
// Ground truth: gml_Object_Obj_Menu_Options_Preview_Alarm_1 (8439 B @0x1400cad50)
// Options-menu preview updater: mirrors Obj_Menu_Options state (menu/tab +
// select) into the preview text + arrow. menu (0x18737) and the dispatch
// select (0x1876a) are read from object 17 = Obj_Menu_Options via the
// object-tagged read helper 0x140160480; text (0x18785), arrow_alpha
// (0x186e1) and the stored select (0x1876a) are Preview's OWN instance vars.
//   switch (Obj_Menu_Options.menu) on "video" (@0x1405c53e0) / "audio"
//   (@0x1405c53e6) via pool @0x1406569f0/@0x140656a04 + tag table @0x140656a00:
//     - "video" branch: switch (Obj_Menu_Options.select) on 1.0/2.0/3.0/4.0/
//       5.0 (pool @0x140656a20..a70, identity-ish tags) -- jumptable
//       @0x1400cd72c UNRECOVERABLE, each branch returns directly (house
//       pattern: case exit). Fallthrough (select out of range; also the
//       likely return-target of the missing branches):
//         image_alpha = 0;
//         game_settings[9] = select;  // Volume <- current select value
//         text = game_settings[9];
//         game_settings[9] = clamp(game_settings[9],
//             0 /* TODO(calibrate): runtime const @0x1406569e0 */, 100);
//         audio_master_gain(game_settings[9] / 100);  // TODO(calibrate):
//           helper 0x14001f910(dst, val, 100.0) decoded as /100 by shape;
//           slot 0x1405c8a10 = audio_master_gain. Verify in-game.
//         arrow_alpha = 1;
//     - "audio" branch: image_alpha = 0; switch (Obj_Menu_Options.select)
//       on 0 / 1.0 (pool @0x140656bc0/@0x140656bd4):
//         game_settings[8] = "enabled" (select == 1) / "disabled"
//         (select == 0) [string consts @0x1405c53fe/@0x1405c53ec; mapping
//         derived from explicit tag-init writes, high confidence];
//         text = game_settings[8];  // Ambience
//         arrow_alpha = 1.
//   TODO(calibrate): all case<->branch mappings are derived from tag inits,
//   NOT observed; the 5 video-branch bodies are unrecoverable (in-game
//   calibration will fill them, same as Foxy/Bonnie/Chica _s switches).
switch (Obj_Menu_Options.menu) {
    case "video": // TODO(calibrate): tag dispatch derived, see above
        switch (Obj_Menu_Options.select) {
            case 1: // TODO(calibrate): jumptable branch - verify in-game
                exit;
            case 2: // TODO(calibrate): jumptable branch - verify in-game
                exit;
            case 3: // TODO(calibrate): jumptable branch - verify in-game
                exit;
            case 4: // TODO(calibrate): jumptable branch - verify in-game
                exit;
            case 5: // TODO(calibrate): jumptable branch - verify in-game
                exit;
        }
        image_alpha = 0;
        game_settings[9] = select;
        text = game_settings[9];
        game_settings[9] = clamp(game_settings[9], 0 /* TODO(calibrate): runtime const @0x1406569e0 */, 100);
        audio_master_gain(game_settings[9] / 100); // TODO(calibrate): verify scaling in-game
        arrow_alpha = 1;
        break;
    case "audio": // TODO(calibrate): tag dispatch derived, see above
        image_alpha = 0;
        switch (Obj_Menu_Options.select) {
            case 0:
                game_settings[8] = "disabled";
                break;
            case 1:
                game_settings[8] = "enabled";
                break;
        }
        text = game_settings[8];
        arrow_alpha = 1;
        break;
}

/* BEGIN DECOMPILED REFERENCE
// #### gml_Object_Obj_Menu_Options_Preview_Alarm_1  va=0x1400cad50  size=8439 ====

/ * WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_Options_Preview_Alarm_1(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined4 uVar2;
  longlong *plVar3;
  undefined8 *puVar4;
  ulonglong uVar5;
  undefined8 uVar6;
  longlong *plVar7;
  undefined8 uVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  uint in_stack_fffffffffffffe78;
  uint3 uVar10;
  ulonglong in_stack_fffffffffffffe80;
  uint7 uVar11;
  undefined8 *puStack_178;
  undefined8 *puStack_170;
  undefined8 *puStack_168;
  undefined8 uStack_160;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined auStack_118 [12];
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined4 uStack_d0;
  uint uStack_cc;
  undefined auStack_c8 [12];
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined4 uStack_a0;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined *puStack_90;
  undefined4 uStack_88;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_90 = &UNK_14043c7ec;
  uStack_88 = 0;
  uStack_98 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_98;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  plRam0000000140657680 = param_1;
  plVar3 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18727);
  uStack_b0 = CONCAT44(0xffffff,(undefined4)uStack_b0);
  uStack_b8 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_88 = 1;
  _auStack_118 = ZEXT816(0);
  in_stack_fffffffffffffe80 = in_stack_fffffffffffffe80 & 0xffffffffffffff00;
  in_stack_fffffffffffffe78 = in_stack_fffffffffffffe78 & 0xffffff00;
  func_0x000140160480(0x11,0x18737,0x80000000,auStack_118,in_stack_fffffffffffffe78,
                      in_stack_fffffffffffffe80);
  uStack_cc = uStack_10c;
  uStack_d0 = auStack_118._8_4_;
  if ((0x46U >> (uStack_10c & 0x1f) & 1) == 0) {
    uStack_d8 = auStack_118._0_8_;
  }
  else {
    func_0x0001400cdcc0(&uStack_d8,auStack_118);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656a18) &&
     (func_0x0001403f6320(0x140656a18), iRam0000000140656a18 == -1)) {
    uStack_160 = 0x1406569f0;
    func_0x0001401453a0(0x1406569f0,0x1405c53e0);
    uRam0000000140656a00 = 0;
    uStack_160 = 0x140656a04;
    func_0x0001401453a0(0x140656a04,0x1405c53e6);
    uRam0000000140656a14 = 1;
    func_0x0001403f6668(&DAT_1400cd740);
    func_0x0001403f62c0(0x140656a18);
  }
  uVar8 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar1 = func_0x00014015be60(0x1406569f0,&uStack_d8,uRam00000001405cd9c0,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140656a04,&uStack_d8,uVar8,0);
    if (iVar1 != 0) goto code_r0x0001400cc8a7;
    lVar9 = 1;
  }
  iVar1 = *(int *)(lVar9 * 0x14 + 0x140656a00);
  uVar11 = (uint7)(in_stack_fffffffffffffe80 >> 8);
  uVar10 = (uint3)(in_stack_fffffffffffffe78 >> 8);
  if (iVar1 != 1) {
    if (iVar1 != 0) goto code_r0x0001400cc8a7;
    uStack_88 = 3;
    _auStack_c8 = ZEXT816(0);
    func_0x000140160480(0x11,0x1876a,0x80000000,auStack_c8,(uint)uVar10 << 8,(ulonglong)uVar11 << 8)
    ;
    uStack_9c = uStack_bc;
    uStack_a0 = auStack_c8._8_4_;
    if ((0x46U >> (uStack_bc & 0x1f) & 1) == 0) {
      uStack_a8 = auStack_c8._0_8_;
    }
    else {
      func_0x0001400cdcc0(&uStack_a8,auStack_c8);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam0000000140656a84) &&
       (func_0x0001403f6320(0x140656a84), iRam0000000140656a84 == -1)) {
      uRam0000000140656a2c = 0;
      uRam0000000140656a20 = 0x3ff0000000000000;
      uRam0000000140656a40 = 0x100000000;
      uRam0000000140656a34 = 0x4000000000000000;
      uRam0000000140656a54 = 0x200000000;
      uRam0000000140656a48 = 0x4008000000000000;
      uRam0000000140656a68 = 0x300000000;
      uRam0000000140656a5c = 0x4010000000000000;
      uRam0000000140656a7c = 0x400000000;
      uRam0000000140656a70 = 0x4014000000000000;
      func_0x0001403f6668(&DAT_1400cd7d0);
      func_0x0001403f62c0(0x140656a84);
    }
    uVar8 = uRam00000001405cd9c0;
    lVar9 = 0;
    iVar1 = func_0x00014015be60(0x140656a20,&uStack_a8,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x0001400cb24f:
      uVar5 = (ulonglong)*(uint *)(lVar9 * 0x14 + 0x140656a30);
joined_r0x0001400cb6de:
      if (uVar5 < 5) {
                    / * WARNING: Could not recover jumptable at 0x0001400cb26f. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
        (*(code *)(&UNK_1400cd72c + *(int *)(&UNK_1400cd72c + uVar5 * 4)))();
        return;
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x140656a34,&uStack_a8,uVar8,0);
      if (iVar1 == 0) {
        lVar9 = 1;
        goto code_r0x0001400cb24f;
      }
      iVar1 = func_0x00014015be60(0x140656a48,&uStack_a8,uVar8,0);
      uVar5 = uRam0000000140656a54;
      if ((iVar1 == 0) ||
         (iVar1 = func_0x00014015be60(0x140656a5c,&uStack_a8,uVar8,0), uVar5 = uRam0000000140656a68,
         iVar1 == 0)) {
        uVar5 = uVar5 >> 0x20;
        goto joined_r0x0001400cb6de;
      }
      iVar1 = func_0x00014015be60(0x140656a70,&uStack_a8,uVar8,0);
      if (iVar1 == 0) {
        uVar5 = uRam0000000140656a7c >> 0x20;
        goto joined_r0x0001400cb6de;
      }
    }
    uStack_88 = 0x32;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    goto code_r0x0001400cc8a7;
  }
  uStack_88 = 0x33;
  _auStack_c8 = ZEXT816(0);
  func_0x000140160480(0x11,0x1876a,0x80000000,auStack_c8,(uint)uVar10 << 8,(ulonglong)uVar11 << 8);
  uStack_9c = uStack_bc;
  uStack_a0 = auStack_c8._8_4_;
  if ((0x46U >> (uStack_bc & 0x1f) & 1) == 0) {
    uStack_a8 = auStack_c8._0_8_;
  }
  else {
    func_0x0001400cdcc0(&uStack_a8,auStack_c8);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656bb8) &&
     (func_0x0001403f6320(0x140656bb8), iRam0000000140656bb8 == -1)) {
    uRam0000000140656b9c = 0;
    uRam0000000140656b90 = 0x3ff0000000000000;
    uRam0000000140656bb0 = 0x100000000;
    uRam0000000140656ba4 = 0x4000000000000000;
    func_0x0001403f6668(&DAT_1400cdba0);
    func_0x0001403f62c0(0x140656bb8);
  }
  uVar8 = uRam00000001405cd9c0;
  lVar9 = 0;
  iVar1 = func_0x00014015be60(0x140656b90,&uStack_a8,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
code_r0x0001400cb18e:
    iVar1 = *(int *)(lVar9 * 0x14 + 0x140656ba0);
    if (iVar1 == 1) {
      uStack_88 = 0x3e;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
      uStack_88 = 0x3f;
      plRam0000000140657680 = (longlong *)0x386a2;
      uVar8 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
      func_0x000140141d00(plRam000000014065e080);
      uVar6 = func_0x00014012b840(plVar3,9);
      func_0x000140141d00(*plVar3);
      func_0x000140001490(uVar6,uVar8);
      func_0x000140141c50(2);
      uStack_88 = 0x40;
      uVar8 = (**(code **)(*param_1 + 0x10))(param_1,0x18785);
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 10) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,9,uVar2);
          plVar7 = (longlong *)0x0;
        }
        else {
          plVar7 = (longlong *)func_0x000140147980(*plVar3,9);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar7 = plVar3;
      }
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar8,plVar7);
      func_0x000140141c50(1);
      uStack_88 = 0x41;
      if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b8);
      }
      uStack_b8 = 0;
      uStack_b0 = 0x500000000;
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 10) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,9,uVar2);
          plVar7 = (longlong *)0x0;
        }
        else {
          plVar7 = (longlong *)func_0x000140147980(*plVar3,9);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
        plVar7 = plVar3;
      }
      func_0x000140001490(&uStack_108,plVar7);
      puStack_178 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x1406569e0);
      puStack_170 = &uStack_f8;
      func_0x00014000bee0(&uStack_e8,0x1405c5410);
      puStack_168 = &uStack_e8;
      uVar8 = func_0x0001401445d0(param_1,param_2,&uStack_b8,3,uRam00000001405c8a00,&puStack_178);
      func_0x000140141d00(plRam000000014065e080);
      uVar6 = func_0x00014012b840(plVar3,9);
      func_0x000140141d00(*plVar3);
      func_0x000140001490(uVar6,uVar8);
      func_0x000140141c50(2);
      uStack_88 = 0x42;
      if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_b8);
      }
      uStack_b8 = 0;
      uStack_b0 = 0x500000000;
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 10) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,9,uVar2);
          plVar3 = (longlong *)0x0;
        }
        else {
          plVar3 = (longlong *)func_0x000140147980(*plVar3,9);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
      }
      func_0x00014001f910(&uStack_70,plVar3,_UNK_14043a0c0);
      func_0x000140001490(&uStack_108,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      puStack_178 = &uStack_108;
      func_0x0001401445d0(param_1,param_2,&uStack_b8,1,uRam00000001405c8a10,&puStack_178);
      uStack_88 = 0x43;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
    }
    else if (iVar1 == 0) {
      uStack_88 = 0x35;
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_74 = 0;
      uStack_80 = 0;
      func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_80);
      uStack_88 = 0x36;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x1876a);
      uStack_64 = *(uint *)((longlong)puVar4 + 0xc);
      uStack_68 = *(undefined4 *)(puVar4 + 1);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
        uStack_70 = *puVar4;
      }
      else {
        func_0x0001400cdcc0(&uStack_70,puVar4);
      }
      if ((*(int *)(*(longlong *)
                     (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
           iRam0000000140656be8) && (func_0x0001403f6320(0x140656be8), iRam0000000140656be8 == -1))
      {
        uRam0000000140656bcc = 0;
        uRam0000000140656bc0 = 0;
        uRam0000000140656be0 = 0x100000000;
        uRam0000000140656bd4 = 0x3ff0000000000000;
        func_0x0001403f6668(&DAT_1400cdc30);
        func_0x0001403f62c0(0x140656be8);
      }
      uVar8 = uRam00000001405cd9c0;
      lVar9 = 0;
      iVar1 = func_0x00014015be60(0x140656bc0,&uStack_70,uRam00000001405cd9c0,0);
      if (iVar1 == 0) {
code_r0x0001400cba0d:
        iVar1 = *(int *)(lVar9 * 0x14 + 0x140656bd0);
        if (iVar1 == 1) {
          uStack_88 = 0x39;
          plRam0000000140657680 = (longlong *)0x386a2;
          func_0x000140141d00(plRam000000014065e080);
          lVar9 = func_0x00014012b840(plVar3,8);
          func_0x000140141d00(*plVar3);
          if ((0x46U >> (*(uint *)(lVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(lVar9);
          }
          func_0x0001401441e0(lVar9,0x1405c53fe);
        }
        else {
          if (iVar1 != 0) goto code_r0x0001400cc04e;
          uStack_88 = 0x38;
          plRam0000000140657680 = (longlong *)0x386a2;
          func_0x000140141d00(plRam000000014065e080);
          lVar9 = func_0x00014012b840(plVar3,8);
          func_0x000140141d00(*plVar3);
          if ((0x46U >> (*(uint *)(lVar9 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(lVar9);
          }
          func_0x0001401441e0(lVar9,0x1405c53ec);
        }
        func_0x000140141c50(2);
      }
      else {
        iVar1 = func_0x00014015be60(0x140656bd4,&uStack_70,uVar8,0);
        if (iVar1 == 0) {
          lVar9 = 1;
          goto code_r0x0001400cba0d;
        }
      }
code_r0x0001400cc04e:
      uStack_88 = 0x3b;
      uVar8 = (**(code **)(*param_1 + 0x10))(param_1,0x18785);
      if (((*(uint *)((longlong)plVar3 + 0xc) & 0xffffff) == 2) && (*plVar3 != 0)) {
        func_0x0001401479b0();
        iVar1 = func_0x000140147990(*plVar3);
        if (iVar1 < 9) {
          uVar2 = func_0x000140147990(*plVar3);
          func_0x000140144260(&UNK_140439ca6,8,uVar2);
          plVar3 = (longlong *)0x0;
        }
        else {
          plVar3 = (longlong *)func_0x000140147980(*plVar3,8);
        }
      }
      else {
        func_0x000140144260(&UNK_140439cd8);
      }
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar8,plVar3);
      func_0x000140141c50(1);
      uStack_88 = 0x3c;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186e1);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
      uStack_88 = 0x3d;
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
    }
  }
  else {
    iVar1 = func_0x00014015be60(0x140656ba4,&uStack_a8,uVar8,0);
    if (iVar1 == 0) {
      lVar9 = 1;
      goto code_r0x0001400cb18e;
    }
  }
  uStack_88 = 0x46;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
code_r0x0001400cc8a7:
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
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
  puRam0000000140657668 = (undefined8 *)uStack_98;
  return;
}
END DECOMPILED REFERENCE */
