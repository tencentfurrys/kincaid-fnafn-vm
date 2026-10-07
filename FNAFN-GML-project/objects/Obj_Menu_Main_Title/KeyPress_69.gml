/// @description FNAFN Obj_Menu_Main_Title / KeyPress_69 - PORTED from C
// ---- sub-event KeyPress_69 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Menu_Main_Title_KeyPress_69 (2540 B @0x14010a1d0)
// E = confirm the keyboard selection. Mirrors Mouse_53 buttons 0/1/2 but
// dispatches on select (0/1/2) instead of button hit-tests; the extras row
// (text_menu[3]) has no confirm block. Gate: draw_alpha > 0.975
// (0x3fef333333333333). Exe consts: "Fade" @0x1405c6420 + 2.0 @0x1405c6430
// (obj 2 = Obj_Menu_Transition), "Main_menu" @0x1405c6425 + 3.0 @0x1405c6440
// (obj 3 = Obj_Menu_Continue) / 53.0 @0x1405c6450 (obj 53 =
// Obj_Menu_Customize); with-destroy consts 76.0 = Obj_Menu_Main_Options,
// 55.0 = Obj_Menu_Main_Music; Room_to_go_to 5.0.
// TODO(calibrate): draw_alpha threshold exact value (0.975 assumed);
// instance_create_layer x/y are runtime const @0x140657298 (assumed 0, 0).
if (draw_alpha > 0.975) {
    if (select == 0) {
        instance_create_layer(0, 0, "Fade", Obj_Menu_Transition); // TODO(calibrate): x/y are runtime const @0x140657298
        Obj_Menu_Transition.Room_to_go_to = 5;
    }
    if (select == 1) {
        instance_create_layer(0, 0, "Main_menu", Obj_Menu_Continue); // TODO(calibrate): x/y are runtime const @0x140657298
        with (Obj_Menu_Main_Options) {
            instance_destroy();
        }
        with (Obj_Menu_Main_Music) {
            instance_destroy();
        }
        instance_destroy();
    }
    if (select == 2) {
        instance_create_layer(0, 0, "Main_menu", Obj_Menu_Customize); // TODO(calibrate): x/y are runtime const @0x140657298
        with (Obj_Menu_Main_Options) {
            instance_destroy();
        }
        with (Obj_Menu_Main_Music) {
            instance_destroy();
        }
        instance_destroy();
    }
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Main_Title_KeyPress_69(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
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
  undefined8 *puStack_110;
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
  longlong lStack_b8;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  ulonglong uStack_90;
  longlong lStack_88;
  undefined8 uStack_78;
  undefined *puStack_70;
  undefined4 uStack_68;
  undefined8 uStack_60;
  undefined4 uStack_58;
  uint uStack_54;
  undefined8 uStack_50;
  longlong *plStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_70 = &UNK_14043d5fc;
  uStack_78 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_78;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_68 = 1;
  plRam0000000140657680 = param_1;
  uStack_50 = param_2;
  plStack_48 = param_1;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18712);
  uStack_90 = (ulonglong)(uint)uStack_90;
  uStack_98 = 0x3fef333333333333;
  iVar2 = func_0x00014015be60(uVar3,&uStack_98,uRam00000001405cd9c0,1);
  if (0 < iVar2) {
    uStack_68 = 3;
    uVar3 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
    uStack_90 = uStack_90 & 0xffffffff;
    uStack_98 = 0;
    uVar4 = (undefined4)uRam00000001405cd9c0;
    uVar5 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    iVar2 = func_0x00014015be60(uVar3,&uStack_98,uRam00000001405cd9c0,0);
    if (iVar2 == 0) {
      uStack_68 = 5;
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_60);
      }
      uStack_60 = 0;
      uStack_58 = 0;
      uStack_54 = 5;
      func_0x00014000bee0(&uStack_108,0x140657298);
      puStack_128 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x140657298);
      puStack_120 = &uStack_f8;
      if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_e8);
      }
      func_0x0001401441e0(&uStack_e8,0x1405c6420);
      puStack_118 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1405c6430);
      puStack_110 = &uStack_d8;
      func_0x0001401445d0(plStack_48,uStack_50,&uStack_60,4,uRam00000001405c8d90,&puStack_128);
      uStack_68 = 6;
      uStack_90 = 0;
      uStack_98 = 0x4014000000000000;
      func_0x000140160b90(2,0x18760,0x80000000,&uStack_98);
      uVar4 = (undefined4)uRam00000001405cd9c0;
      uVar5 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    }
    uStack_68 = 9;
    uStack_90 = uStack_90 & 0xffffffff;
    uStack_98 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(uVar3,&uStack_98,CONCAT44(uVar5,uVar4),0);
    if (iVar2 == 0) {
      uStack_68 = 0xb;
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_60);
      }
      uStack_60 = 0;
      uStack_58 = 0;
      uStack_54 = 5;
      uVar3 = (**(code **)(*plStack_48 + 8))(plStack_48,0x1876a);
      func_0x00014000bee0(&uStack_108,0x140657298);
      puStack_128 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x140657298);
      puStack_120 = &uStack_f8;
      if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_e8);
      }
      func_0x0001401441e0(&uStack_e8,0x1405c6425);
      puStack_118 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1405c6440);
      puStack_110 = &uStack_d8;
      func_0x0001401445d0(plStack_48,uStack_50,&uStack_60,4,uRam00000001405c8d90,&puStack_128);
      uStack_68 = 0xc;
      uStack_bc = 0;
      uStack_c8 = 0x4053000000000000;
      iVar2 = func_0x000140144bd0(&uStack_98,&plStack_48,&uStack_50,&uStack_c8);
      if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_c8);
      }
      if (0 < iVar2) {
        do {
          uStack_68 = 0xe;
          func_0x00014017c070(plStack_48,uStack_50,0,0);
          cVar1 = func_0x0001401451f0(&uStack_98,&plStack_48);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_98,&plStack_48,&uStack_50);
      uStack_68 = 0x10;
      uStack_9c = 0;
      uStack_a8 = 0x404b800000000000;
      iVar2 = func_0x000140144bd0(&uStack_c8,&plStack_48,&uStack_50,&uStack_a8);
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      if (0 < iVar2) {
        do {
          uStack_68 = 0x12;
          func_0x00014017c070(plStack_48,uStack_50,0,0);
          cVar1 = func_0x0001401451f0(&uStack_c8,&plStack_48);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_c8,&plStack_48,&uStack_50);
      uStack_68 = 0x14;
      func_0x00014017c070(plStack_48,uStack_50,0,0);
      if (lStack_b8 != 0) {
        func_0x00014012ec70();
        lStack_b8 = 0;
      }
      if (lStack_88 != 0) {
        func_0x00014012ec70();
        lStack_88 = 0;
      }
      uVar4 = (undefined4)uRam00000001405cd9c0;
      uVar5 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    }
    uStack_68 = 0x17;
    uStack_90 = uStack_90 & 0xffffffff;
    uStack_98 = 0x4000000000000000;
    iVar2 = func_0x00014015be60(uVar3,&uStack_98,CONCAT44(uVar5,uVar4),0);
    if (iVar2 == 0) {
      uStack_68 = 0x19;
      if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_60);
      }
      uStack_60 = 0;
      uStack_58 = 0;
      uStack_54 = 5;
      (**(code **)(*plStack_48 + 8))(plStack_48,0x1876a);
      func_0x00014000bee0(&uStack_108,0x140657298);
      puStack_128 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x140657298);
      puStack_120 = &uStack_f8;
      if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_e8);
      }
      func_0x0001401441e0(&uStack_e8,0x1405c6425);
      puStack_118 = &uStack_e8;
      func_0x00014000bee0(&uStack_d8,0x1405c6450);
      puStack_110 = &uStack_d8;
      func_0x0001401445d0(plStack_48,uStack_50,&uStack_60,4,uRam00000001405c8d90,&puStack_128);
      uStack_68 = 0x1a;
      uStack_bc = 0;
      uStack_c8 = 0x4053000000000000;
      iVar2 = func_0x000140144bd0(&uStack_98,&plStack_48,&uStack_50,&uStack_c8);
      if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_c8);
      }
      if (0 < iVar2) {
        do {
          uStack_68 = 0x1c;
          func_0x00014017c070(plStack_48,uStack_50,0,0);
          cVar1 = func_0x0001401451f0(&uStack_98,&plStack_48);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_98,&plStack_48,&uStack_50);
      uStack_68 = 0x1e;
      uStack_9c = 0;
      uStack_a8 = 0x404b800000000000;
      iVar2 = func_0x000140144bd0(&uStack_c8,&plStack_48,&uStack_50,&uStack_a8);
      if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_a8);
      }
      if (0 < iVar2) {
        do {
          uStack_68 = 0x20;
          func_0x00014017c070(plStack_48,uStack_50,0,0);
          cVar1 = func_0x0001401451f0(&uStack_c8,&plStack_48);
        } while (cVar1 != '\0');
      }
      func_0x0001401449f0(&uStack_c8,&plStack_48,&uStack_50);
      uStack_68 = 0x22;
      func_0x00014017c070(plStack_48,uStack_50,0,0);
      if (lStack_b8 != 0) {
        func_0x00014012ec70();
        lStack_b8 = 0;
      }
      if (lStack_88 != 0) {
        func_0x00014012ec70();
        lStack_88 = 0;
      }
    }
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
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
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
  puRam0000000140657668 = (undefined8 *)uStack_78;
  return;
}
END DECOMPILED REFERENCE */

