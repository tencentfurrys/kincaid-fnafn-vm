/// @description FNAFN Obj_Night_Shift_End / Step — PORTED from C
// Ground truth: gml_Object_Obj_Night_Shift_End_Step_0 (3340 B @0x1400b1b00)
// Decoded, in order (uStack_98 = GML line markers):
//   3. for (i = 0; i < array_length(Scr_Camera_Update); i += 1) — the
//      PORTING.md for-loop shape (counter init 0.0; bound via array_length,
//      slot 0x1405c8ba0; `r==-2||-1<r`-break = `>=`; typed-increment switch
//      with _UNK_140439dd0 = 1.0 is the single `i += 1`):
//        Scr_Camera_Update id 0x186d5 is the 12-element array (PORTING.md);
//        element fetch via func_0x00014002fbe0 with int index
//        (func_0x00014012cd90 best-fit).
//        if (Scr_Camera_Update[i] <= 0) (`< 1` covers `<=` + incomparable):
//          if (round(Scr_Camera_Update[i]) <= 0) (slot 0x1405c89b0 = round;
//            `r<1`-plus-`!=-2` = `<=`):
//            if (round(...) > -100) (-100.0 = 0xc059000000000000;
//              `0 < r` = `>`):
//              Scr_Camera_Update[i] = -100;
//              event_perform(ev_alarm, i) (helper 0x140181c50, TYPE 2 =
//              ev_alarm; counter double -> longlong).
//        else Scr_Camera_Update[i] -= delta_factor (id 0x1870b, global fetch
//          once at top; -= helper 0x14000bdb0).
//   0x14. if (room == 4) (slot 0x1405c7b38 = room, 4.0 = 0x4010000000000000;
//      `r==0` = `==`):
//        0x16. if (fade_alpha < 1) (id 0x18718; `r<0` = `<`):
//          fade_alpha += 0.004 * delta_factor (0.004 = 0x3f70624dd2f1a9fc
//          via MUL helper 0x1400053f0, then += helper 0x140005290).
//        0x1a. if (fade_alpha >= 1) (`-1 < r` = `>=`):
//          room_goto(2) (slot 0x1405c8cb0 = room_goto, exe const 2.0
//          @0x1405c4ee0; bare fade_alpha fetch beside it is discarded).
//   0x20. switch (text_fade) (id 0x18789) on runtime-pool cases
//      @0x140656410/@0x140656424 (guarded init seeds 1.0 = 0x3ff0000000000000;
//      outside the exe image) with flag table @0x140656420 (stride 0x14):
//        flag == 1: if (text_alpha < 1) (id 0x18787)
//          text_alpha += 0.0035 * delta_factor (0.0035 = 0x3f6cac083126e979).
//        flag == 0: if (text_alpha > 0)
//          text_alpha -= 0.005 * delta_factor (0.005 = 0x3f747ae147ae147b
//          via -= helper).
//      Mapping below assumes case 1.0 -> fade-in, case 0 -> fade-out;
//      TODO(calibrate): confirm case values + table in-game.
//   0x2f. night_size = lerp(night_size, 1, 0.01) (id 0x1874a; lerp slot
//      0x1405c8cc0; 1.0 @0x1405c4ef0, 0.01 @0x1405c4f00, both verified exe
//      .data doubles; fixed amount, not delta-scaled).
// TODO(calibrate): runtime consts @0x140656410/@0x140656424 + flag table
// @0x140656420 (outside the mapped exe image) — verify in-game.
// Ported: Obj_Night_Shift_End / Step_0
for (var i = 0; i < array_length(Scr_Camera_Update); i += 1) {
    if (Scr_Camera_Update[i] <= 0) {
        if (round(Scr_Camera_Update[i]) <= 0) {
            if (round(Scr_Camera_Update[i]) > -100) {
                Scr_Camera_Update[i] = -100;
                event_perform(ev_alarm, i);
            }
        }
    } else {
        Scr_Camera_Update[i] -= delta_factor;
    }
}
if (room == 4) {
    if (fade_alpha < 1) {
        fade_alpha += 0.004 * delta_factor;
    }
    if (fade_alpha >= 1) {
        room_goto(2);
    }
}
switch (text_fade) {
    case 1: // TODO(calibrate): runtime pool @0x140656410; assumes 1 -> fade-in
        if (text_alpha < 1) {
            text_alpha += 0.0035 * delta_factor;
        }
        break;
    case 0: // TODO(calibrate): runtime pool @0x140656424; assumes 0 -> fade-out
        if (text_alpha > 0) {
            text_alpha -= 0.005 * delta_factor;
        }
        break;
}
night_size = lerp(night_size, 1, 0.01);

// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Night_Shift_End_Step_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 uVar7;
  longlong lVar8;
  longlong unaff_GS_OFFSET;
  double dVar9;
  undefined4 uVar10;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
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
  undefined4 uStack_d0;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043c0e8;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  uStack_c8 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_78._4_4_ = 0xffffff;
  uStack_80 = 0;
  uStack_b8 = CONCAT44(0xffffff,(undefined4)uStack_b8);
  uStack_c0 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_98 = 3;
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  dVar1 = _UNK_140439dd0;
  uStack_84 = 0;
  uStack_90 = 0.0;
  while( true ) {
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78._0_4_ = 0;
    uStack_78._4_4_ = 5;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_108,uVar4);
    puStack_128 = &uStack_108;
    uVar4 = func_0x0001401445d0(param_1,uStack_b0,&uStack_80,1,uRam00000001405c8ba0,&puStack_128);
    iVar2 = func_0x00014015be60(&uStack_90,uVar4,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_98 = 6;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_90);
    uVar4 = func_0x00014002fbe0(uVar4,uVar3);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_98 = 0xb;
      if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78._0_4_ = 0;
      uStack_78._4_4_ = 5;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar4 = func_0x00014002fbe0(uVar4,uVar3);
      func_0x000140001490(&uStack_108,uVar4);
      puStack_128 = &uStack_108;
      uVar4 = func_0x0001401445d0(param_1,uStack_b0,&uStack_80,1,uRam00000001405c89b0,&puStack_128);
      uStack_64 = 0;
      uStack_70 = 0;
      iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_c0);
        }
        uStack_c0 = 0;
        uStack_b8 = 0x500000000;
        uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_90);
        uVar4 = func_0x00014002fbe0(uVar4,uVar3);
        func_0x000140001490(&uStack_f8,uVar4);
        puStack_120 = &uStack_f8;
        uVar4 = func_0x0001401445d0(param_1,uStack_b0,&uStack_c0,1,uRam00000001405c89b0,&puStack_120
                                   );
        uStack_64 = 0;
        uStack_70 = 0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_98 = 0xd;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_90);
          puVar6 = (undefined8 *)func_0x00014012b840(puVar5,uVar3);
          func_0x000140141d00(*puVar5);
          if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar6);
          }
          *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
          *puVar6 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_98 = 0xe;
          dVar9 = uStack_90;
          if ((uStack_84 & 0xffffff) != 0) {
            dVar9 = (double)func_0x00014012d320(&uStack_90);
          }
          func_0x000140181c50(param_1,uStack_b0,2,(longlong)dVar9);
        }
      }
    }
    else {
      uStack_98 = 8;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar4 = func_0x00014012b840(puVar5,uVar3);
      func_0x000140141d00(*puVar5);
      func_0x00014000bdb0(uVar4,uStack_c8);
      func_0x000140141c50(2);
    }
    switch(uStack_84 & 0xffffff) {
    case 1:
      uStack_90 = (double)func_0x00014012d320(&uStack_90);
      uStack_90 = uStack_90 + dVar1;
      uStack_84 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_90,&uStack_90);
      break;
    case 7:
      uStack_90 = (double)CONCAT44(uStack_90._4_4_,(int)uStack_90 + 1);
      break;
    case 10:
      uStack_90 = (double)((longlong)uStack_90 + 1);
      break;
    case 0xd:
      uStack_84 = 0;
    case 0:
      uStack_90 = uStack_90 + dVar1;
    }
  }
  uStack_98 = 0x14;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_138);
  uStack_64 = 0;
  uStack_70 = 0x4010000000000000;
  iVar2 = func_0x00014015be60(&uStack_138,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_98 = 0x16;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18718);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    uVar3 = (undefined4)uRam00000001405cd9c0;
    uVar10 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_98 = 0x18;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18718);
      uStack_64 = 0;
      uStack_70 = 0x3f70624dd2f1a9fc;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x000140005290(uVar4,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uVar3 = (undefined4)uRam00000001405cd9c0;
      uVar10 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    }
    uStack_98 = 0x1a;
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,CONCAT44(uVar10,uVar3),1);
    if (-1 < iVar2) {
      uStack_98 = 0x1c;
      if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78._0_4_ = 0;
      uStack_78._4_4_ = 5;
      (**(code **)(*param_1 + 0x10))(param_1,0x18718);
      func_0x00014000bee0(&uStack_108,0x1405c4ee0);
      puStack_128 = &uStack_108;
      func_0x0001401445d0(param_1,uStack_b0,&uStack_80,1,uRam00000001405c8cb0,&puStack_128);
    }
  }
  uStack_98 = 0x20;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18789);
  uStack_cc = *(uint *)((longlong)puVar5 + 0xc);
  uStack_d0 = *(undefined4 *)(puVar5 + 1);
  if ((0x46U >> (uStack_cc & 0x1f) & 1) == 0) {
    uStack_d8 = *puVar5;
  }
  else {
    func_0x0001400b2f20(&uStack_d8,puVar5);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656438) &&
     (func_0x0001403f6320(0x140656438), iRam0000000140656438 == -1)) {
    auRam000000014065641c = ZEXT816(0);
    uRam0000000140656410 = 0x3ff0000000000000;
    uRam0000000140656430 = 0x100000000;
    func_0x0001403f6668(&DAT_1400b2e90);
    func_0x0001403f62c0(0x140656438);
  }
  uVar4 = uRam00000001405cd9c0;
  lVar8 = 0;
  iVar2 = func_0x00014015be60(0x140656410,&uStack_d8,uRam00000001405cd9c0,0);
  if (iVar2 != 0) {
    iVar2 = func_0x00014015be60(0x140656424,&uStack_d8,uVar4,0);
    if (iVar2 != 0) goto code_r0x0001400b25bc;
    lVar8 = 1;
  }
  iVar2 = *(int *)(lVar8 * 0x14 + 0x140656420);
  if (iVar2 == 1) {
    uStack_98 = 0x27;
    uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18787);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_98 = 0x29;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18787);
      uStack_64 = 0;
      uStack_70 = 0x3f6cac083126e979;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x000140005290(uVar4,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
    }
  }
  else if (iVar2 == 0) {
    uStack_98 = 0x22;
    uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18787);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      uStack_98 = 0x24;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18787);
      uStack_64 = 0;
      uStack_70 = 0x3f747ae147ae147b;
      func_0x0001400053f0(&uStack_70,uStack_c8);
      func_0x00014000bdb0(uVar4,&uStack_70);
      if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
    }
  }
code_r0x0001400b25bc:
  uStack_98 = 0x2f;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x1874a);
  func_0x000140001490(&uStack_108,uVar4);
  puStack_128 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x1405c4ef0);
  puStack_120 = &uStack_f8;
  func_0x00014000bee0(&uStack_e8,0x1405c4f00);
  puStack_118 = &uStack_e8;
  uVar7 = func_0x0001401445d0(param_1,uStack_b0,&uStack_80,3,uRam00000001405c8cc0,&puStack_128);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar4,uVar7);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_b8._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
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
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
