/// @description FNAFN Obj_Night_Camera_Record / Mouse_4 — PORTED from C
// Ground truth: gml_Object_Obj_Night_Camera_Record_Mouse_4 (3140 B @0x1401215e0)
// Globals fetched: Night_camera_location (0x1873c), Night_recording (0x18749).
// Decoded guards, in order (uStack_b8 = GML line markers):
//   1. layer_get_visible(<layer>) == 1 else exit [slot 0x1405c86b0, const
//      @0x1405c6960 = "Camera_HUD" per EXE-CONSTANTS.md raw bytes
//      (0x1405c6960 -> "Camera_HUD"); TODO calibrate in-game].
//   image_alpha (slot 0x1405c7b98) vs 0.95 (0x3fee666666666666):
//     if (image_alpha == 0.95) { if (Night_camera_location != 6.0
//     [0x4018000000000000]) fall into the 8/9 check below; }
//     8/9 check: if (Night_camera_location != 8.0 [0x4020000000000000]) {
//     if (Night_camera_location != 9.0 [0x4022000000000000]) exit; }
//     i.e. pass iff (alpha==0.95 && loc==6) or loc==8 or loc==9.
//   5-6. customfunct_audio_play_sound_single x2 (snd consts @0x1405c6970 /
//     @0x1405c6980, vol/pitch runtime @0x140657530, TODO calibrate).
//   7. toggle (id 0x18793) = !toggle [bool via 0x14012bb70 ^ 1].
//   8. switch on toggle via runtime consts @0x140657540/@0x140657554 and
//      table @0x140657550 (TODO calibrate; 0/1 by shape):
//      case 1: Night_recording = 1; sound @0x1405c6990;
//      case 0: (fetch toggle, no-op) Night_recording = 0.
//   15+. with (Obj_Night_Camera_Icons) [object 43 = 0x4045800000000000 =
//      43.0 via 0x140144bd0/0x1401451f0/0x1401449f0, PROVEN with-shape]:
//     if (Night_camera_location == image_index [slot 0x1405c7aa8] + 1
//     [0x14000bf90 += 1]) {
//       switch on Night_recording via runtime consts @0x140657570/
//       @0x140657584 and table @0x140657580 (TODO calibrate):
//       case 1: image_blend (slot 0x1405c7c48) = 16777215 (c_white,
//         0x416fffffe0000000); case 0: image_blend = 255
//         (0x406fe00000000000) — recording tint on the matching icon.
//     }

// ---- sub-event Mouse_4 — PORTED from C ----
if (layer_get_visible(/* TODO(calibrate): layer @0x1405c6960, likely "Camera_HUD" */ "Camera_HUD") != 1) exit;
if (image_alpha == 0.95) {
    if (Night_camera_location != 6) {
        if (Night_camera_location != 8) {
            if (Night_camera_location != 9) exit;
        }
    } else {
        // loc == 6 with alpha == 0.95 passes without the 8/9 check
    }
} else {
    if (Night_camera_location != 8) {
        if (Night_camera_location != 9) exit;
    }
}
customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c6970 */ 0, /* TODO(calibrate): vol/pitch @0x140657530 */ 0, false);
customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c6980 */ 0, /* TODO(calibrate): vol/pitch @0x140657530 */ 0, false);
toggle = !toggle;
if (toggle == 1 /* TODO(calibrate): const @0x140657540 */) {
    Night_recording = 1;
    customfunct_audio_play_sound_single(/* TODO(calibrate): snd @0x1405c6990 */ 0, /* TODO(calibrate): vol/pitch @0x140657530 */ 0, false);
} else if (toggle == 0 /* TODO(calibrate): const @0x140657554 */) {
    Night_recording = 0;
}
with (Obj_Night_Camera_Icons) {
    if (Night_camera_location == image_index + 1) {
        if (Night_recording == 1 /* TODO(calibrate): const @0x140657570 */) {
            image_blend = c_white; // 16777215
        } else if (Night_recording == 0 /* TODO(calibrate): const @0x140657584 */) {
            image_blend = 255;
        }
    }
}
// ground truth: gml_Object_Obj_Night_Camera_Record_Mouse_4 (3140 B @0x1401215e0)
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Camera_Record_Mouse_4(longlong *param_1,undefined8 param_2)

{
  byte bVar1;
  char cVar2;
  int iVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  double *pdVar6;
  longlong lVar7;
  longlong unaff_GS_OFFSET;
  undefined8 in_stack_fffffffffffffdf8;
  undefined4 uVar11;
  ulonglong uVar8;
  undefined8 **ppuVar9;
  undefined8 **ppuVar10;
  ulonglong uVar12;
  undefined8 uStack_1f8;
  uint uStack_1ec;
  undefined8 uStack_1e8;
  uint uStack_1dc;
  undefined8 uStack_1d8;
  uint uStack_1cc;
  undefined8 uStack_1c8;
  uint uStack_1bc;
  undefined8 uStack_1b8;
  uint uStack_1ac;
  undefined8 *puStack_1a8;
  undefined8 *puStack_1a0;
  undefined8 *puStack_198;
  undefined8 *puStack_190;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 *puStack_170;
  undefined8 uStack_168;
  uint uStack_15c;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  double dStack_120;
  undefined4 uStack_118;
  uint uStack_114;
  undefined8 uStack_110;
  undefined4 uStack_108;
  uint uStack_104;
  undefined8 uStack_100;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  undefined4 uStack_dc;
  longlong lStack_d8;
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  undefined8 uStack_90;
  undefined8 uStack_88;
  undefined4 uStack_80;
  uint uStack_7c;
  longlong *plStack_78;
  undefined8 uStack_70;
  
  uVar11 = (undefined4)((ulonglong)in_stack_fffffffffffffdf8 >> 0x20);
  ppuVar9 = &puStack_1a8;
  uStack_70 = 0xfffffffffffffffe;
  puStack_c0 = &UNK_14043dc4e;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
  uStack_15c = 0xffffff;
  uStack_168 = 0;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  plRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  plStack_78 = param_1;
  uStack_100 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873c);
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_104 = 0xffffff;
  uStack_110 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_f0 = CONCAT44(0xffffff,(undefined4)uStack_f0);
  uStack_f8 = 0;
  uStack_1ec = 0xffffff;
  uStack_1f8 = 0;
  uStack_1dc = 0xffffff;
  uStack_1e8 = 0;
  uStack_1cc = 0xffffff;
  uStack_1d8 = 0;
  uStack_1bc = 0xffffff;
  uStack_1c8 = 0;
  uStack_1ac = 0xffffff;
  uStack_1b8 = 0;
  uStack_b8 = 1;
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  if ((0x46U >> (uStack_15c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_168);
  }
  func_0x0001401441e0(&uStack_168,0x1405c6960);
  uVar8 = CONCAT44(uVar11,uRam00000001405c86b0);
  ppuVar10 = ppuVar9;
  puStack_1a8 = &uStack_168;
  uVar5 = func_0x0001401445d0(plStack_78,uStack_b0,&uStack_98,1,uVar8,ppuVar9);
  uStack_dc = 0;
  uStack_e8 = 0x3ff0000000000000;
  iVar3 = func_0x00014015be60(uVar5,&uStack_e8,uRam00000001405cd9c0,0);
  if (iVar3 != 0) goto code_r0x000140121822;
  uStack_b8 = 3;
  uVar12 = (ulonglong)ppuVar10 & 0xffffffffffffff00;
  func_0x00014015f1a0(plStack_78,uRam00000001405c7b98,0x80000000,&uStack_180,
                      uVar8 & 0xffffffffffffff00,uVar12);
  uVar5 = uRam00000001405cd9c0;
  uStack_dc = 0;
  uStack_e8 = 0x3fee666666666666;
  iVar3 = func_0x00014015be60(&uStack_180,&uStack_e8,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
    uStack_dc = 0;
    uStack_e8 = 0x4018000000000000;
    iVar3 = func_0x00014015be60(uStack_100,&uStack_e8,uVar5,0);
    if (iVar3 != 0) goto code_r0x000140121a20;
  }
  else {
code_r0x000140121a20:
    uStack_dc = 0;
    uStack_e8 = 0x4020000000000000;
    iVar3 = func_0x00014015be60(uStack_100,&uStack_e8,uVar5,0);
    if (iVar3 != 0) {
      uStack_dc = 0;
      uStack_e8 = 0x4022000000000000;
      iVar3 = func_0x00014015be60(uStack_100,&uStack_e8,uVar5,0);
      if (iVar3 != 0) goto code_r0x000140121822;
    }
  }
  uStack_b8 = 5;
  if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  uStack_f8 = 0;
  uStack_f0 = 0x500000000;
  func_0x00014000bee0(&uStack_158,0x1405c6970);
  puStack_1a0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x140657530);
  puStack_198 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x140657530);
  puStack_190 = &uStack_138;
  gml_Script_customfunct_audio_play_sound_single(plStack_78,uStack_b0,&uStack_f8,3,&puStack_1a0);
  uStack_b8 = 6;
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  uStack_98 = 0;
  uStack_90 = 0x500000000;
  func_0x00014000bee0(&uStack_168,0x1405c6980);
  puStack_1a8 = &uStack_168;
  func_0x00014000bee0(&uStack_158,0x140657530);
  puStack_1a0 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x140657530);
  ppuVar10 = ppuVar9;
  puStack_198 = &uStack_148;
  gml_Script_customfunct_audio_play_sound_single(plStack_78,uStack_b0,&uStack_98,3,ppuVar9);
  uStack_b8 = 7;
  pdVar6 = (double *)(**(code **)(*plStack_78 + 0x10))(plStack_78,0x18793);
  bVar1 = func_0x00014012bb70(pdVar6);
  if ((0x46U >> (*(uint *)((longlong)pdVar6 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(pdVar6);
  }
  *(undefined4 *)((longlong)pdVar6 + 0xc) = 0;
  *pdVar6 = (double)(uint)(bVar1 ^ 1);
  uStack_b8 = 8;
  uStack_114 = 0;
  uStack_118 = *(undefined4 *)(pdVar6 + 1);
  dStack_120 = *pdVar6;
  puStack_170 = puVar4;
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140657568) {
    func_0x0001403f6320(0x140657568);
    if (iRam0000000140657568 == -1) {
      uRam000000014065754c = 0;
      uRam0000000140657540 = 0;
      uRam0000000140657560 = 0x100000000;
      uRam0000000140657554 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_140122a40);
      func_0x0001403f62c0(0x140657568);
    }
  }
  uVar5 = uRam00000001405cd9c0;
  lVar7 = 0;
  iVar3 = func_0x00014015be60(0x140657540,&dStack_120,uRam00000001405cd9c0,0);
  if (iVar3 == 0) {
code_r0x000140121cc7:
    puVar4 = puStack_170;
    iVar3 = *(int *)(lVar7 * 0x14 + 0x140657550);
    if (iVar3 == 1) {
      uStack_b8 = 0xb;
      if ((0x46U >> (*(uint *)((longlong)puStack_170 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puStack_170);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
      uStack_b8 = 0xc;
      if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_98);
      }
      uStack_98 = 0;
      uStack_90 = 0x500000000;
      func_0x00014000bee0(&uStack_168,0x1405c6990);
      puStack_1a8 = &uStack_168;
      func_0x00014000bee0(&uStack_158,0x140657530);
      puStack_1a0 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x140657530);
      puStack_198 = &uStack_148;
      gml_Script_customfunct_audio_play_sound_single(plStack_78,uStack_b0,&uStack_98,3,ppuVar9);
      ppuVar10 = ppuVar9;
    }
    else if (iVar3 == 0) {
      uStack_b8 = 10;
      (**(code **)(*plStack_78 + 0x10))(plStack_78,0x18793);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0;
    }
  }
  else {
    iVar3 = func_0x00014015be60(0x140657554,&dStack_120,uVar5,0);
    if (iVar3 == 0) {
      lVar7 = 1;
      goto code_r0x000140121cc7;
    }
  }
  uStack_b8 = 0xf;
  uStack_7c = 0;
  uStack_88 = 0x4045800000000000;
  iVar3 = func_0x000140144bd0(&uStack_e8,&plStack_78,&uStack_b0,&uStack_88);
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if (0 < iVar3) {
    do {
      uStack_b8 = 0x11;
      uVar12 = uVar12 & 0xffffffffffffff00;
      ppuVar10 = (undefined8 **)((ulonglong)ppuVar10 & 0xffffffffffffff00);
      func_0x00014015f1a0(plStack_78,uRam00000001405c7aa8,0x80000000,&uStack_110,ppuVar10,uVar12);
      uStack_7c = uStack_104;
      uStack_80 = uStack_108;
      if ((0x46U >> (uStack_104 & 0x1f) & 1) == 0) {
        uStack_88 = uStack_110;
      }
      else {
        func_0x000140122b60(&uStack_88,&uStack_110);
      }
      func_0x00014000bf90(&uStack_88,1);
      iVar3 = func_0x00014015be60(uStack_100,&uStack_88,uRam00000001405cd9c0,0);
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      if (iVar3 == 0) {
        uStack_b8 = 0x13;
        uStack_7c = *(uint *)((longlong)puStack_170 + 0xc);
        uStack_80 = *(undefined4 *)(puStack_170 + 1);
        if ((0x46U >> (uStack_7c & 0x1f) & 1) == 0) {
          uStack_88 = *puStack_170;
        }
        else {
          func_0x000140122b60(&uStack_88);
        }
        if (*(int *)(*(longlong *)
                      (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
            iRam0000000140657598) {
          func_0x0001403f6320(0x140657598);
          if (iRam0000000140657598 == -1) {
            auRam000000014065757c = ZEXT816(0);
            uRam0000000140657570 = 0x3ff0000000000000;
            uRam0000000140657590 = 0x100000000;
            func_0x0001403f6668(&DAT_140122ad0);
            func_0x0001403f62c0(0x140657598);
          }
        }
        uVar5 = uRam00000001405cd9c0;
        iVar3 = func_0x00014015be60(0x140657570,&uStack_88,uRam00000001405cd9c0,0);
        if (iVar3 == 0) {
          lVar7 = 0;
code_r0x0001401220b9:
          iVar3 = *(int *)(lVar7 * 0x14 + 0x140657580);
          if (iVar3 == 1) {
            uStack_b8 = 0x16;
            if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_a8);
            }
            uStack_9c = 0;
            uStack_a8 = 0x416fffffe0000000;
            func_0x000140160140(plStack_78,uRam00000001405c7c48,0x80000000,&uStack_a8);
          }
          else if (iVar3 == 0) {
            uStack_b8 = 0x15;
            if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
              func_0x000140001410(&uStack_a8);
            }
            uStack_9c = 0;
            uStack_a8 = 0x406fe00000000000;
            func_0x000140160140(plStack_78,uRam00000001405c7c48,0x80000000,&uStack_a8);
          }
        }
        else {
          iVar3 = func_0x00014015be60(0x140657584,&uStack_88,uVar5,0);
          if (iVar3 == 0) {
            lVar7 = 1;
            goto code_r0x0001401220b9;
          }
        }
        if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_88);
        }
      }
      cVar2 = func_0x0001401451f0(&uStack_e8,&plStack_78,&uStack_b0);
    } while (cVar2 != '\0');
  }
  func_0x0001401449f0(&uStack_e8,&plStack_78,&uStack_b0);
  if (lStack_d8 != 0) {
    func_0x00014012ec70();
    lStack_d8 = 0;
  }
  if ((0x46U >> (uStack_114 & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_120);
  }
code_r0x000140121822:
  if ((0x46U >> (uStack_1ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b8);
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
  if ((0x46U >> (uStack_1ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1f8);
  }
  if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_90._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_104 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_110);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
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
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return;
}
END DECOMPILED REFERENCE */
