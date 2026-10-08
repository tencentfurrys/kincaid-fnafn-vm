/// @description FNAFN Obj_Office_Front_Right / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Office_Front_Right_Step_0 (mirror of Front_Left)
// Door controller (right). Globals: delta_factor (0x1870b),
// Night_chica_location (0x1873f). Self: toggle (0x18793),
// emitter_gain (0x18716), door_speed (0x18710), sprite_index
// (slot 0x1405c7be8), image_speed (slot 0x1405c7c28), image_index
// (slot 0x1405c7aa8), unk_186d7 flag (id 0x186d7) + emitter_186d6
// (id 0x186d6; both collide as __init_global in builtin_ids.json —
// names follow the Create port: __init_global = emitter, unk_186d7 = flag).
// Helpers: 0x14018f790(0x11) = single-arg input check (TODO calibrate kind),
// 0x1401441e0/0x14000bee0/0x1401453a0 = string/numeric const loaders,
// slots 0x1405c86b0 = layer_get_visible, 0x1405c8cc0 = lerp,
// 0x1405c8960 = audio_stop_sound, 0x1405c8980 = audio_play_sound_on,
// 0x1405c8eb0 = audio_emitter_gain.
// TODO(calibrate): all @0x1405c60xx exe consts (layer name, lerp target,
// sound ids, location string, speed delta; 0x1405c60xx IS inside the
// EXE-CONSTANTS dump range but the raw bytes there are string-pool fragments,
// so values stay TODO) + all @0x140656fxx runtime-pool consts (lerp targets,
// door_speed switch consts/table @0x140656ff0). Inline doubles decoded:
// 74/3100/72/29/69/13/1/0.75/0.1/0.01.
if (toggle == 0 && sprite_index != 74) {
    // Original order: input(0x11) -> mouse_x > 3100 -> layer_get_visible == 1.
    var _active = /* TODO(calibrate): func_0x00014018f790(0x11) input check */ false
        && (mouse_x > 3100)
        && (layer_get_visible(/* TODO(calibrate): layer const @0x1405c6030 */ "TODO_layer") == 1);
    if (_active) {
        emitter_gain = lerp(emitter_gain, /* TODO(calibrate): num const @0x1405c6048 */ 0, 0.75 * delta_factor);
        if (unk_186d7 != 1) {
            audio_stop_sound(/* TODO(calibrate): snd const @0x1405c6058 */ 0);
            audio_play_sound_on(__init_global /* 0x186d6 emitter */, /* TODO @0x1405c6058 */ 0, /* TODO @0x1405c6068 */ 0, /* TODO(runtime) @0x140656fd0 */ 0);
            unk_186d7 = 1;
        }
        if (Night_chica_location == /* TODO(calibrate): str const @0x1405c603d */ "TODO_location") {
            sprite_index = 72;
        } else {
            sprite_index = 29;
        }
        customfunct_image_speed_delta(/* TODO(calibrate): const @0x1405c6078 */ 0);
        audio_emitter_gain(__init_global /* 0x186d6 */, emitter_gain);
    } else {
        // Quiet path (input false / mouse_x <= 3100 / layer hidden).
        emitter_gain = lerp(emitter_gain, /* TODO(calibrate runtime): @0x140656fd0 */ 0, 0.1 * delta_factor);
        sprite_index = 69;
        image_speed = 0;
        unk_186d7 = 0;
        if (emitter_gain < 0.01) {
            audio_stop_sound(/* TODO(calibrate): const @0x1405c6058 */ 0);
        }
        audio_emitter_gain(__init_global /* 0x186d6 */, emitter_gain);
    }
} else {
    // Door-speed path (toggle != 0, or toggle == 0 with sprite_index == 74).
    emitter_gain = lerp(emitter_gain, /* TODO(calibrate runtime): @0x140656fd0 */ 0, 0.1 * delta_factor);
    unk_186d7 = 0;
    if (emitter_gain < 0.01) {
        audio_stop_sound(/* TODO(calibrate): const @0x1405c6058 */ 0);
    }
    // Two-case switch on door_speed via runtime consts @0x140656fe0 /
    // @0x140656ff4, table @0x140656ff0 (TODO calibrate values).
    if (door_speed == /* TODO(calibrate runtime): @0x140656fe0 */ 0) {
        if (image_index >= 13) {
            customfunct_image_speed_delta(/* TODO(calibrate runtime): @0x140656fd0 */ 0);
        } else {
            customfunct_image_speed_delta(door_speed);
        }
    } else if (door_speed == /* TODO(calibrate runtime): @0x140656ff4 */ 0) {
        if (image_index <= 1) {
            sprite_index = 69;
        } else {
            customfunct_image_speed_delta(door_speed);
        }
    }
    audio_emitter_gain(__init_global /* 0x186d6 */, emitter_gain);
}
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Front_Right_Step_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  int iVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  undefined8 *puVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  ulonglong in_stack_fffffffffffffe68;
  undefined4 uVar12;
  undefined8 **ppuVar8;
  undefined8 uVar9;
  uint7 uVar11;
  undefined8 **ppuVar10;
  ulonglong in_stack_fffffffffffffe70;
  undefined8 **ppuVar13;
  uint7 uVar14;
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
  undefined4 uStack_130;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  undefined8 uStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 *puStack_c8;
  undefined8 *puStack_c0;
  undefined8 *puStack_b8;
  undefined8 *puStack_b0;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043d2c9;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  plRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873f);
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_68._4_4_ = 0xffffff;
  uStack_70 = 0;
  uStack_110 = CONCAT44(0xffffff,(undefined4)uStack_110);
  uStack_118 = 0;
  uStack_17c = 0xffffff;
  uStack_188 = 0;
  uStack_16c = 0xffffff;
  uStack_178 = 0;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_98 = 1;
  uVar5 = (**(code **)(*param_1 + 8))(param_1,0x18793);
  uStack_74 = 0;
  uStack_80 = 0;
  iVar2 = func_0x00014015be60(uVar5,&uStack_80,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    in_stack_fffffffffffffe68 = in_stack_fffffffffffffe68 & 0xffffffffffffff00;
    func_0x00014015f1a0(param_1,uRam00000001405c7be8,0x80000000,&uStack_90,in_stack_fffffffffffffe68
                        ,in_stack_fffffffffffffe70 & 0xffffffffffffff00);
    uStack_74 = 0;
    uStack_80 = 0x4052800000000000;
    iVar2 = func_0x00014015be60(&uStack_90,&uStack_80,uRam00000001405cd9c0,0);
    uVar12 = (undefined4)(in_stack_fffffffffffffe68 >> 0x20);
    if (iVar2 != 0) {
      uStack_98 = 3;
      cVar1 = func_0x00014018f790(0x11);
      if (cVar1 != '\0') {
        func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_158);
        uStack_74 = 0;
        uStack_80 = 0x40a8380000000000;
        iVar2 = func_0x00014015be60(&uStack_158,&uStack_80,uRam00000001405cd9c0,1);
        if (0 < iVar2) {
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68._0_4_ = 0;
          uStack_68._4_4_ = 5;
          if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_108);
          }
          func_0x0001401441e0(&uStack_108,0x1405c6030);
          uVar9 = CONCAT44(uVar12,uRam00000001405c86b0);
          puStack_c8 = &uStack_108;
          uVar5 = func_0x0001401445d0(param_1,param_2,&uStack_70,1,uVar9,&puStack_c8);
          uVar12 = (undefined4)((ulonglong)uVar9 >> 0x20);
          uStack_74 = 0;
          uStack_80 = 0x3ff0000000000000;
          iVar2 = func_0x00014015be60(uVar5,&uStack_80,uRam00000001405cd9c0,0);
          if (iVar2 == 0) {
            uStack_98 = 5;
            if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_118);
            }
            uStack_118 = 0;
            uStack_110 = 0x500000000;
            uVar5 = (**(code **)(*param_1 + 0x10))(param_1,0x18716);
            func_0x000140001490(&uStack_f8,uVar5);
            puStack_c0 = &uStack_f8;
            func_0x00014000bee0(&uStack_e8,0x1405c6048);
            puStack_b8 = &uStack_e8;
            uStack_74 = 0;
            uStack_80 = 0x3fe8000000000000;
            func_0x0001400053f0(&uStack_80,uVar3);
            func_0x000140001490(&uStack_d8,&uStack_80);
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            uVar9 = CONCAT44(uVar12,uRam00000001405c8cc0);
            puStack_b0 = &uStack_d8;
            uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_118,3,uVar9,&puStack_c0);
            uVar12 = (undefined4)((ulonglong)uVar9 >> 0x20);
            func_0x000140141d00(param_1);
            func_0x000140001490(uVar5,uVar3);
            func_0x000140141c50(1);
            uStack_98 = 6;
            uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186d7);
            uStack_74 = 0;
            uStack_80 = 0x3ff0000000000000;
            iVar2 = func_0x00014015be60(uVar3,&uStack_80,uRam00000001405cd9c0,0);
            if (iVar2 != 0) {
              uStack_98 = 8;
              if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_70);
              }
              uStack_70 = 0;
              uStack_68 = 0x500000000;
              func_0x00014000bee0(&uStack_108,0x1405c6058);
              uVar3 = CONCAT44(uVar12,uRam00000001405c8960);
              puStack_c8 = &uStack_108;
              func_0x0001401445d0(param_1,param_2,&uStack_70,1,uVar3,&puStack_c8);
              uVar12 = (undefined4)((ulonglong)uVar3 >> 0x20);
              uStack_98 = 9;
              if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_70);
              }
              uStack_70 = 0;
              uStack_68._0_4_ = 0;
              uStack_68._4_4_ = 5;
              uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186d6);
              func_0x000140001490(&uStack_108,uVar3);
              puStack_c8 = &uStack_108;
              func_0x00014000bee0(&uStack_f8,0x1405c6058);
              puStack_c0 = &uStack_f8;
              func_0x00014000bee0(&uStack_e8,0x1405c6068);
              puStack_b8 = &uStack_e8;
              func_0x00014000bee0(&uStack_d8,0x140656fd0);
              puStack_b0 = &uStack_d8;
              func_0x0001401445d0(param_1,param_2,&uStack_70,4,CONCAT44(uVar12,uRam00000001405c8980)
                                  ,&puStack_c8);
              uStack_98 = 10;
              puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d7);
              if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
                func_0x000140001410(puVar6);
              }
              *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
              *puVar6 = 0x3ff0000000000000;
            }
            uStack_98 = 0xc;
            func_0x0001401453a0(&uStack_80,0x1405c603d);
            iVar2 = func_0x00014015be60(uVar4,&uStack_80,uRam00000001405cd9c0,0);
            if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_80);
            }
            if (iVar2 == 0) {
              uStack_98 = 0xe;
              if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_90);
              }
              uStack_84 = 0;
              uStack_90 = 0x4052000000000000;
              func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_90);
            }
            else {
              uStack_98 = 0x12;
              if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
                func_0x000140001410(&uStack_90);
              }
              uStack_84 = 0;
              uStack_90 = 0x403d000000000000;
              func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_90);
            }
            uStack_98 = 0x14;
            if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_70);
            }
            uStack_70 = 0;
            uStack_68 = 0x500000000;
            func_0x00014000bee0(&uStack_108,0x1405c6078);
            ppuVar10 = &puStack_c8;
            puStack_c8 = &uStack_108;
            gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_70,1,ppuVar10);
            uVar12 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
            goto code_r0x0001400f8829;
          }
        }
      }
      uStack_98 = 0x18;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18716);
      func_0x000140001490(&uStack_108,uVar4);
      puStack_c8 = &uStack_108;
      func_0x00014000bee0(&uStack_f8,0x140656fd0);
      uStack_74 = 0;
      uStack_80 = 0x3fb999999999999a;
      puStack_c0 = &uStack_f8;
      func_0x0001400053f0(&uStack_80,uVar3);
      func_0x000140001490(&uStack_e8,&uStack_80);
      if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_80);
      }
      uVar5 = CONCAT44(uVar12,uRam00000001405c8cc0);
      puStack_b8 = &uStack_e8;
      uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,uVar5,&puStack_c8);
      uVar12 = (undefined4)((ulonglong)uVar5 >> 0x20);
      func_0x000140141d00(param_1);
      func_0x000140001490(uVar4,uVar3);
      func_0x000140141c50(1);
      uStack_98 = 0x19;
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = 0x4051400000000000;
      func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_90);
      uStack_98 = 0x1a;
      if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_128);
      }
      uStack_11c = 0;
      uStack_128 = 0;
      func_0x000140160140(param_1,uRam00000001405c7c28,0x80000000,&uStack_128);
      uStack_98 = 0x1b;
      puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d7);
      if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar6);
      }
      *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
      *puVar6 = 0;
      uStack_98 = 0x1c;
      uStack_74 = 0;
      uStack_80 = 0x3f847ae147ae147b;
      iVar2 = func_0x00014015be60(uVar4,&uStack_80,uRam00000001405cd9c0,1);
      if ((iVar2 != -2) && (iVar2 < 0)) {
        uStack_98 = 0x1e;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uStack_70 = 0;
        uStack_68 = 0x500000000;
        (**(code **)(*param_1 + 0x10))(param_1,0x18716);
        func_0x00014000bee0(&uStack_108,0x1405c6058);
        uVar3 = CONCAT44(uVar12,uRam00000001405c8960);
        puStack_c8 = &uStack_108;
        func_0x0001401445d0(param_1,param_2,&uStack_70,1,uVar3,&puStack_c8);
        uVar12 = (undefined4)((ulonglong)uVar3 >> 0x20);
      }
      goto code_r0x0001400f8829;
    }
  }
  uVar12 = (undefined4)(in_stack_fffffffffffffe68 >> 0x20);
  uStack_98 = 0x24;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18716);
  func_0x000140001490(&uStack_108,uVar4);
  puStack_c8 = &uStack_108;
  func_0x00014000bee0(&uStack_f8,0x140656fd0);
  uStack_74 = 0;
  uStack_80 = 0x3fb999999999999a;
  puStack_c0 = &uStack_f8;
  func_0x0001400053f0(&uStack_80,uVar3);
  func_0x000140001490(&uStack_e8,&uStack_80);
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  ppuVar10 = &puStack_c8;
  ppuVar8 = (undefined8 **)CONCAT44(uVar12,uRam00000001405c8cc0);
  ppuVar13 = ppuVar10;
  puStack_b8 = &uStack_e8;
  uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_70,3,ppuVar8,ppuVar10);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar4,uVar3);
  func_0x000140141c50(1);
  uStack_98 = 0x25;
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d7);
  if ((0x46U >> (*(uint *)((longlong)puVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar6);
  }
  *(undefined4 *)((longlong)puVar6 + 0xc) = 0;
  *puVar6 = 0;
  uStack_98 = 0x26;
  uStack_74 = 0;
  uStack_80 = 0x3f847ae147ae147b;
  iVar2 = func_0x00014015be60(uVar4,&uStack_80,uRam00000001405cd9c0,1);
  if ((iVar2 != -2) && (iVar2 < 0)) {
    uStack_98 = 0x28;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uVar12 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    (**(code **)(*param_1 + 0x10))(param_1,0x18716);
    func_0x00014000bee0(&uStack_108,0x1405c6058);
    ppuVar8 = (undefined8 **)CONCAT44(uVar12,uRam00000001405c8960);
    ppuVar13 = ppuVar10;
    puStack_c8 = &uStack_108;
    func_0x0001401445d0(param_1,param_2,&uStack_70,1,ppuVar8,ppuVar10);
  }
  uStack_98 = 0x2a;
  puVar6 = (undefined8 *)(**(code **)(*param_1 + 8))(param_1,0x18710);
  uStack_12c = *(uint *)((longlong)puVar6 + 0xc);
  uStack_130 = *(undefined4 *)(puVar6 + 1);
  if ((0x46U >> (uStack_12c & 0x1f) & 1) == 0) {
    uStack_138 = *puVar6;
  }
  else {
    func_0x0001400f9730(&uStack_138,puVar6);
  }
  if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) +
               4) < iRam0000000140657008) &&
     (func_0x0001403f6320(0x140657008), iRam0000000140657008 == -1)) {
    uRam0000000140656fec = 0;
    uRam0000000140656fe0 = 0x3fe3333333333333;
    uRam0000000140657000 = 0x100000000;
    uRam0000000140656ff4 = 0xbfdeb851eb851eb8;
    func_0x0001403f6668(&DAT_1400f96a0);
    func_0x0001403f62c0(0x140657008);
  }
  uVar3 = uRam00000001405cd9c0;
  lVar7 = 0;
  iVar2 = func_0x00014015be60(0x140656fe0,&uStack_138,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
code_r0x0001400f85b2:
    iVar2 = *(int *)(lVar7 * 0x14 + 0x140656ff0);
    uVar14 = (uint7)((ulonglong)ppuVar13 >> 8);
    uVar11 = (uint7)((ulonglong)ppuVar8 >> 8);
    if (iVar2 != 1) {
      if (iVar2 == 0) {
        uStack_98 = 0x2c;
        func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_148,
                            (ulonglong)uVar11 << 8,(ulonglong)uVar14 << 8);
        uStack_74 = 0;
        uStack_80 = 0x402a000000000000;
        iVar2 = func_0x00014015be60(&uStack_148,&uStack_80,uRam00000001405cd9c0,1);
        if ((iVar2 == -2) || (-1 < iVar2)) {
          uStack_98 = 0x32;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          func_0x00014000bee0(&uStack_108,0x140656fd0);
          puStack_c8 = &uStack_108;
          gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_70,1,ppuVar10);
        }
        else {
          uStack_98 = 0x2e;
          if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_70 = 0;
          uStack_68 = 0x500000000;
          uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18710);
          func_0x000140001490(&uStack_108,uVar3);
          puStack_c8 = &uStack_108;
          gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_70,1,ppuVar10);
        }
        uStack_98 = 0x34;
        ppuVar8 = ppuVar10;
      }
      goto code_r0x0001400f8814;
    }
    uStack_98 = 0x35;
    lVar7 = (ulonglong)uVar11 << 8;
    func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_148,lVar7,
                        (ulonglong)uVar14 << 8);
    uVar12 = (undefined4)((ulonglong)lVar7 >> 0x20);
    uStack_74 = 0;
    uStack_80 = 0x3ff0000000000000;
    iVar2 = func_0x00014015be60(&uStack_148,&uStack_80,uRam00000001405cd9c0,1);
    if (iVar2 < 1) {
      uStack_98 = 0x3b;
      if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_90);
      }
      uStack_84 = 0;
      uStack_90 = 0x4051400000000000;
      func_0x000140160140(param_1,uRam00000001405c7be8,0x80000000,&uStack_90);
    }
    else {
      uStack_98 = 0x37;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18710);
      func_0x000140001490(&uStack_108,uVar3);
      puStack_c8 = &uStack_108;
      gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_70,1,ppuVar10);
      uVar12 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
    }
    uStack_98 = 0x3d;
  }
  else {
    iVar2 = func_0x00014015be60(0x140656ff4,&uStack_138,uVar3,0);
    if (iVar2 == 0) {
      lVar7 = 1;
      goto code_r0x0001400f85b2;
    }
code_r0x0001400f8814:
    uVar12 = (undefined4)((ulonglong)ppuVar8 >> 0x20);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
code_r0x0001400f8829:
  uStack_98 = 0x41;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x186d6);
  uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x18716);
  func_0x000140001490(&uStack_108,uVar3);
  puStack_c8 = &uStack_108;
  func_0x000140001490(&uStack_f8,uVar4);
  puStack_c0 = &uStack_f8;
  func_0x0001401445d0(param_1,param_2,&uStack_70,2,CONCAT44(uVar12,uRam00000001405c8eb0),&puStack_c8
                     );
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  if ((0x46U >> (uStack_16c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_178);
  }
  if ((0x46U >> (uStack_17c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_188);
  }
  if ((0x46U >> (uStack_110._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_13c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_148);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_14c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_158);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
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
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
