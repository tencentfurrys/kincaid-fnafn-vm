/// @description FNAFN Obj_Night_Shift_End / Create_0 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Shift_End_Create_0 (@0x1400de930)
// Decoded, in order (uStack_78 = 3..0x21 are GML source-LINE markers):
//   line 3: `var time = 0` (stack accumulator, YYC typed-increment switch
//           in the loop = generic `+= 1`).
//   line 4/5: while (time < 12)  [3-way compare vs 12.0 (0x4028000000000000);
//           loop continues while result < 0]  { <call/indexed write>; time += 1 }
//           The loop body fetches id 0x186d5 via the +0x10 (VARIABLE) path,
//           creates an accessor with key = time, writes -100.0
//           (0xc059000000000000) into it, then finalizes with argc 2:
//           `Scr_Camera_Update[time] = -100`. RESOLVED 2026-10-06:
//           Obj_Night_Time calls array_length() on this same id 0x186d5
//           and indexes it the same way, so it is an ARRAY (the registered
//           name just happens to look like a script). -100 is the "disabled"
//           timer sentinel Obj_Night_Time/Step tests for.
//   line 9:  image_alpha (slot uRam00000001405c7b98 — registry) = 0.
//   line 10: night_size (id 0x1874a) = 1.
//   line 11: fade_alpha (id 0x18718) = 1.
//   line 12: text_alpha (id 0x18787) = 0.
//   line 13: text_fade (id 0x18789) = 0.
//   line 14: if (room == 4)  [room slot uRam00000001405c7b38 — registry;
//           0x4010000000000000 = 4.0]:
//     line 16: instance_deactivate_layer("AI")   [slot 0x1405c8d50 —
//              registry-confirmed; const @0x1405c4eb8 = "AI"]
//     line 17: instance_deactivate_layer("HUD")  [const @0x1405c4ebb = "HUD"]
//     line 18: audio_stop_all()                  [slot 0x1405c8c10 — registry]
//     line 19: fade_alpha = 0
//     line 20: text_alpha = 0
//     line 21: text_fade = 0
//     line 22: if (instance_exists(Obj_Pause))  [func_0x00014017c0e0
//              (self, other, 0x2d) — PROVEN 2026-10-06 = instance_exists;
//              0x2d = 45 = Obj_Pause, obj_names.json]
//       line 24: instance_deactivate_object(45)  [slot 0x1405c8bf0 —
//              registry-confirmed; 45.0 (const @0x1405c4ec0) = object index
//              = Obj_Pause]
//     (2026-10-06 correction: was misread as keyboard_check(ord("-")).)
//     line 26: night_size = 0.95 (0x3fee666666666666)
//   line 28: if (room == 2)  [0x4000000000000000 = 2.0]:
//     line 30: fade_alpha = 0
//     line 31: text_alpha = 1
//     line 32: text_fade = 0
//     line 33: same 0x186d5-owner indexed write with key 0 and value 120
//              (0x406e000000000000): `owner[0] = 120` — alarm[0] = 120
//              (2 s at 60 fps) fits a night-restart setup.
var time = 0;
while (time < 12) {
    Scr_Camera_Update[time] = -100;
    time += 1;
}
image_alpha = 0;
night_size = 1;
fade_alpha = 1;
text_alpha = 0;
text_fade = 0;
if (room == 4) {
    instance_deactivate_layer("AI");
    instance_deactivate_layer("HUD");
    audio_stop_all();
    fade_alpha = 0;
    text_alpha = 0;
    text_fade = 0;
    if (instance_exists(Obj_Pause)) {
        instance_deactivate_object(Obj_Pause);
    }
    night_size = 0.95;
}
if (room == 2) {
    fade_alpha = 0;
    text_alpha = 1;
    text_fade = 0;
    // line 33: Scr_Camera_Update[0] = 120 — alarm[0] = 120 (2 s at 60 fps)
    // fits a night-restart setup (same array-write shape as the loop).
    Scr_Camera_Update[0] = 120;
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// — line neutralized: a literal slash-star here would close this block
// comment early (GML block comments do not nest).

void gml_Object_Obj_Night_Shift_End_Create_0(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  undefined8 *puVar5;
  undefined8 *puVar6;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 *puStack_e8;
  undefined8 uStack_e0;
  undefined4 uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  uint uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  undefined *puStack_80;
  undefined4 uStack_78;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  dVar1 = _UNK_140439dd0;
  uStack_60 = 0xfffffffffffffffe;
  puStack_80 = &UNK_14043c072;
  uStack_88 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_88;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_68 = CONCAT44(0xffffff,(undefined4)uStack_68);
  uStack_70 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_78 = 3;
  uStack_8c = 0;
  uStack_98 = 0.0;
  plRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  while( true ) {
    uStack_d4 = 0;
    uStack_e0 = 0x4028000000000000;
    iVar3 = func_0x00014015be60(&uStack_98,&uStack_e0,uRam00000001405cd9c0,1);
    if ((iVar3 == -2) || (-1 < iVar3)) break;
    uStack_78 = 5;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar4 = func_0x00014012cd90(&uStack_98);
    puVar6 = (undefined8 *)func_0x00014012b840(puVar5,uVar4);
    func_0x000140141d00(*puVar5);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_8c & 0xffffff) {
    case 1:
      uStack_98 = (double)func_0x00014012d320(&uStack_98);
      uStack_98 = uStack_98 + dVar1;
      uStack_8c = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_98,&uStack_98);
      break;
    case 7:
      uStack_98 = (double)CONCAT44(uStack_98._4_4_,(int)uStack_98 + 1);
      break;
    case 10:
      uStack_98 = (double)((longlong)uStack_98 + 1);
      break;
    case 0xd:
      uStack_8c = 0;
    case 0:
      uStack_98 = uStack_98 + dVar1;
    }
  }
  uStack_78 = 9;
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  uStack_b4 = 0;
  uStack_c0 = 0;
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_c0);
  uStack_78 = 10;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1874a);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3ff0000000000000;
  uStack_78 = 0xb;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18718);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0x3ff0000000000000;
  uStack_78 = 0xc;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18787);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_78 = 0xd;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18789);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_78 = 0xe;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_d0);
  uStack_d4 = 0;
  uStack_e0 = 0x4010000000000000;
  iVar3 = func_0x00014015be60(&uStack_d0,&uStack_e0,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
    uStack_78 = 0x10;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    func_0x0001401441e0(&uStack_a8,0x1405c4eb8);
    puStack_e8 = &uStack_a8;
    func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,uRam00000001405c8d50,&puStack_e8);
    uStack_78 = 0x11;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_a8);
    }
    func_0x0001401441e0(&uStack_a8,0x1405c4ebb);
    puStack_e8 = &uStack_a8;
    func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,uRam00000001405c8d50,&puStack_e8);
    uStack_78 = 0x12;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    func_0x0001401445d0(param_1,uStack_b0,&uStack_70,0,uRam00000001405c8c10,0);
    uStack_78 = 0x13;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18718);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
    uStack_78 = 0x14;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18787);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
    uStack_78 = 0x15;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18789);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
    uStack_78 = 0x16;
    cVar2 = func_0x00014017c0e0(param_1,uStack_b0,0x2d);
    if (cVar2 != '\0') {
      uStack_78 = 0x18;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_a8,0x1405c4ec0);
      puStack_e8 = &uStack_a8;
      func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,uRam00000001405c8bf0,&puStack_e8);
    }
    uStack_78 = 0x1a;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1874a);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0x3fee666666666666;
  }
  uStack_78 = 0x1c;
  func_0x00014015ef90(param_1,uRam00000001405c7b38,0x80000000,&uStack_d0);
  uStack_d4 = 0;
  uStack_e0 = 0x4000000000000000;
  iVar3 = func_0x00014015be60(&uStack_d0,&uStack_e0,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
    uStack_78 = 0x1e;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18718);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
    uStack_78 = 0x1f;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18787);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0x3ff0000000000000;
    uStack_78 = 0x20;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18789);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
    uStack_78 = 0x21;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    puVar6 = (undefined8 *)func_0x00014012b840(puVar5,0);
    func_0x000140141d00(*puVar5);
    if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar6);
    }
    *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
    *puVar6 = 0x406e000000000000;
    func_0x000140141c50(2);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
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
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_88;
  return;
}
END DECOMPILED REFERENCE */
