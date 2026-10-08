/// @description FNAFN Obj_Menu_Disclaimer / Step — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Disclaimer_Step_0 (2858 B @0x1400f06b0)
// Fade controller + timer sweep; byte-twin of Obj_Menu_Warning/Step_0
// (same size, same shape, different pool addrs).
//   Two-case switch on fading (id 0x18719): case consts 1.0 (@0x140656ef0)
//   and 0 (@0x140656f04) with the label table at 0x140656f00 — the same
//   guarded-pool shape as Obj_Menu_Loading/Step (table[0] = 0 from the
//   zeroed region, table[1] = 1 via 0x100000000 @0x140656f10), so:
//     fading == 0: image_alpha = lerp(image_alpha, 1, 0.02 * delta) —
//       fade-IN toward the exe .data const 1.0 (@0x1405c5d28, verified).
//     fading == 1: image_alpha = lerp(image_alpha, <runtime @0x140656ee0>,
//       0.02 * delta) — fade-OUT target seeded at load time:
//       TODO(calibrate) (0 is the likely value).
//   Rate 0x3f947ae147ae147b = 0.02 via MUL helper func_0x0001400053f0 with
//   delta_factor (id 0x1870b, read once); lerp = slot 0x1405c8cc0
//   (registry); write-back via func_0x000140160140 on slot 0x1405c7b98
//   (image_alpha, registry).
//   Then the standard timer sweep (cf. Obj_Night_Time/Step,
//   Obj_Menu_Night_Display/Step): for each Scr_Camera_Update[i] (id
//   0x186d5 is an ARRAY — array_length slot 0x1405c8ba0, round slot
//   0x1405c89b0, both registry): timers > 0 count down -= delta_factor
//   (op helper func_0x00014000bdb0); a timer at <= 0 (round()ed) that is
//   not the -100 sentinel is set to -100 (0xc059000000000000) and fires
//   event_perform(ev_alarm, i) (func_0x000140181c50, type 2 = ev_alarm,
//   PROVEN 2026-10-06).
if (fading == 0) {
    image_alpha = lerp(image_alpha, 1, 0.02 * delta_factor);
} else if (fading == 1) {
    image_alpha = lerp(image_alpha, 0 /* TODO(calibrate): runtime const @0x140656ee0 (fade-out target) */, 0.02 * delta_factor);
}
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
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Menu_Disclaimer_Step_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  double dVar8;
  uint in_stack_fffffffffffffe78;
  ulonglong in_stack_fffffffffffffe80;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  uint uStack_154;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_100;
  undefined *puStack_f8;
  undefined4 uStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 *puStack_d8;
  undefined8 uStack_c8;
  undefined4 uStack_c0;
  uint uStack_bc;
  undefined8 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  undefined8 uStack_78;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_f8 = &UNK_14043d072;
  uStack_f0 = 0;
  uStack_100 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_100;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  plRam0000000140657680 = param_1;
  uStack_98 = param_2;
  uStack_140 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_84 = 0xffffff;
  uStack_90 = 0.0;
  uStack_78 = CONCAT44(0xffffff,(undefined4)uStack_78);
  uStack_80 = 0;
  uStack_b0 = CONCAT44(0xffffff,(undefined4)uStack_b0);
  uStack_b8 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uStack_154 = 0xffffff;
  uStack_160 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_f0 = 1;
  puVar4 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18719);
  uStack_bc = *(uint *)((longlong)puVar4 + 0xc);
  uStack_c0 = *(undefined4 *)(puVar4 + 1);
  if ((0x46U >> (uStack_bc & 0x1f) & 1) == 0) {
    uStack_c8 = *puVar4;
  }
  else {
    func_0x0001400f1800(&uStack_c8,puVar4);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140656f18) &&
     (func_0x0001403f6320(0x140656f18), iRam0000000140656f18 == -1)) {
    auRam0000000140656efc = ZEXT816(0);
    uRam0000000140656ef0 = 0x3ff0000000000000;
    uRam0000000140656f10 = 0x100000000;
    func_0x0001403f6668(&DAT_1400f1770);
    func_0x0001403f62c0(0x140656f18);
  }
  uVar5 = uRam00000001405cd9c0;
  lVar7 = 0;
  iVar2 = func_0x00014015be60(0x140656ef0,&uStack_c8,uRam00000001405cd9c0,0);
  if (iVar2 != 0) {
    iVar2 = func_0x00014015be60(0x140656f04,&uStack_c8,uVar5,0);
    if (iVar2 != 0) goto code_r0x0001400f0b2e;
    lVar7 = 1;
  }
  iVar2 = *(int *)(lVar7 * 0x14 + 0x140656f00);
  if (iVar2 == 1) {
    uStack_f0 = 4;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_a8,
                        in_stack_fffffffffffffe78 & 0xffffff00,
                        in_stack_fffffffffffffe80 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_138,&uStack_a8);
    puStack_e8 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x1405c5d28);
    uStack_64 = 0;
    uStack_70 = 0x3f947ae147ae147b;
    puStack_e0 = &uStack_128;
    func_0x0001400053f0(&uStack_70,uStack_140);
    func_0x000140001490(&uStack_118,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_d8 = &uStack_118;
    uVar5 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8cc0,&puStack_e8);
    func_0x000140001490(&uStack_a8,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_a8);
  }
  else if (iVar2 == 0) {
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_a8,
                        in_stack_fffffffffffffe78 & 0xffffff00,
                        in_stack_fffffffffffffe80 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_138,&uStack_a8);
    puStack_e8 = &uStack_138;
    func_0x00014000bee0(&uStack_128,0x140656ee0);
    uStack_64 = 0;
    uStack_70 = 0x3f947ae147ae147b;
    puStack_e0 = &uStack_128;
    func_0x0001400053f0(&uStack_70,uStack_140);
    func_0x000140001490(&uStack_118,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    puStack_d8 = &uStack_118;
    uVar5 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,3,uRam00000001405c8cc0,&puStack_e8);
    func_0x000140001490(&uStack_a8,uVar5);
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_a8);
  }
code_r0x0001400f0b2e:
  uStack_f0 = 9;
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
    uStack_78 = 0x500000000;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    func_0x000140001490(&uStack_138,uVar5);
    puStack_e8 = &uStack_138;
    uVar5 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c8ba0,&puStack_e8);
    iVar2 = func_0x00014015be60(&uStack_90,uVar5,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_f0 = 0xc;
    uVar5 = (**(code **)(*param_1 + 8))(param_1,0x186d5);
    uVar3 = func_0x00014012cd90(&uStack_90);
    uVar5 = func_0x00014002fbe0(uVar5,uVar3);
    uStack_64 = 0;
    uStack_70 = 0;
    iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_f0 = 0x11;
      if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uStack_80 = 0;
      uStack_78 = 0x500000000;
      uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar5 = func_0x00014002fbe0(uVar5,uVar3);
      func_0x000140001490(&uStack_138,uVar5);
      puStack_e8 = &uStack_138;
      uVar5 = func_0x0001401445d0(param_1,uStack_98,&uStack_80,1,uRam00000001405c89b0,&puStack_e8);
      uStack_64 = 0;
      uStack_70 = 0;
      iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 1)) {
        if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_b8);
        }
        uStack_b8 = 0;
        uStack_b0 = 0x500000000;
        uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x186d5);
        uVar3 = func_0x00014012cd90(&uStack_90);
        uVar5 = func_0x00014002fbe0(uVar5,uVar3);
        func_0x000140001490(&uStack_128,uVar5);
        puStack_e0 = &uStack_128;
        uVar5 = func_0x0001401445d0(param_1,uStack_98,&uStack_b8,1,uRam00000001405c89b0,&puStack_e0)
        ;
        uStack_64 = 0;
        uStack_70 = 0xc059000000000000;
        iVar2 = func_0x00014015be60(uVar5,&uStack_70,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          uStack_f0 = 0x13;
          plRam0000000140657680 = (longlong *)0x28795;
          puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
          func_0x000140141d00(param_1);
          uVar3 = func_0x00014012cd90(&uStack_90);
          puVar6 = (undefined8 *)func_0x00014012b840(puVar4,uVar3);
          func_0x000140141d00(*puVar4);
          if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar6);
          }
          *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
          *puVar6 = 0xc059000000000000;
          func_0x000140141c50(2);
          uStack_f0 = 0x14;
          dVar8 = uStack_90;
          if ((uStack_84 & 0xffffff) != 0) {
            dVar8 = (double)func_0x00014012d320(&uStack_90);
          }
          func_0x000140181c50(param_1,uStack_98,2,(longlong)dVar8);
        }
      }
    }
    else {
      uStack_f0 = 0xe;
      plRam0000000140657680 = (longlong *)0x28795;
      puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
      func_0x000140141d00(param_1);
      uVar3 = func_0x00014012cd90(&uStack_90);
      uVar5 = func_0x00014012b840(puVar4,uVar3);
      func_0x000140141d00(*puVar4);
      func_0x00014000bdb0(uVar5,uStack_140);
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
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_154 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_160);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_b0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
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
  puRam0000000140657668 = (undefined8 *)uStack_100;
  return;
}
END DECOMPILED REFERENCE */
