/// @description FNAFN Obj_Office_Camera_Control / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Office_Camera_Control_Step_0 (3D YYC office
// camera pan). Globals: delta_factor (0x1870b), Night_camera (0x1873b),
// Night_office_rotated (0x18747). Self: fade_alpha (0x18718),
// Player_rotation_mode (0x18758), cx (0x18709), cy (0x1870a),
// Player_rotate_cooldown (0x18756), Player_rotating (0x18757), x/y,
// view_camera (slot 0x1405c7bf8), mouse_x/mouse_y (slots 0x1405c7bc8/0x1405c7bd8).
// Create seeds Player_rotation_mode = 2, rotating/cooldown = 0, fade_alpha = 1.
// Helpers/slots (EXE-REGISTRY.md): 0x1405c8cc0 = lerp, 0x1405c8a00 = clamp,
// 0x1405c85a0/0x1405c85b0 = camera_get_view_x/y,
// 0x1405c85c0/0x1405c85d0 = camera_get_view_width/height,
// 0x1405c8ce0 = camera_set_view_pos, 0x1405c8cf0 = audio_listener_position,
// 0x1405c8cd0 = audio_listener_orientation (Create), 0x14000bf90 = +=,
// 0x14000bdb0 = -=.
// TODO(calibrate): every @0x1406554xx runtime-pool const (fade target, clamp
// bounds @0x1405c38f0/@0x1405c3900 are exe consts below the dump range too)
// + every @0x1405c38xx/@0x1405c39xx exe const (below EXE-CONSTANTS range).
// Inline factors decoded: 0.1/0.4/0.05/0.975-ish not here; 25 (0x19) and
// 1255 (0x4e7) screen-edge margins; 15.0 (0x402e...) cooldown reset.
// 1. Ease fade + clamp rotation mode every step:
fade_alpha = lerp(fade_alpha, /* TODO(calibrate runtime): @0x1406554c0 */ 0, 0.1 * delta_factor);
Player_rotation_mode = clamp(Player_rotation_mode, /* TODO @0x1405c38f0 */ 0, /* TODO @0x1405c3900 */ 0);
if (Night_camera == 0) {
    // 2. Project mouse into world: cx/cy track the view, offset by half the
    // view size (/-2.0 via _UNK_140439e68 divisor, as in Night_Display/Draw).
    cx = camera_get_view_x(view_camera);
    cy = camera_get_view_y(view_camera);
    cx = lerp(x, mouse_x, /* TODO @0x1405c3910 factor */ 0) - camera_get_view_width(view_camera) / 2;
    cy = lerp(y, mouse_y, /* TODO @0x1405c3920 factor */ 0) - camera_get_view_height(view_camera) / 2;
    camera_set_view_pos(view_camera, cx, cy);
    // 3. Per-mode x drift (switch on Player_rotation_mode via runtime consts
    // @0x1406554d0 = 1.0 / @0x1406554e4 = 2.0 / @0x1406554f8 = 3.0, table
    // @0x1406554e0 + count @0x140655504; TODO calibrate mapping):
    if (Player_rotation_mode == /* TODO(runtime) 1 */ 1) {
        x = lerp(x, /* TODO @0x1405c3940 */ 0, 0.4 * delta_factor);
    } else if (Player_rotation_mode == /* TODO(runtime) 2 */ 2) {
        x = lerp(x, /* TODO @0x1405c3950 */ 0, 0.4 * delta_factor);
    } else {
        // case 0: uses both cx and cy reads (dual-fetch in C).
        x = lerp(x, /* TODO @0x1405c3930 */ 0, 0.4 * delta_factor);
    }
}
// 4. Rotation cooldown: count down while > 0, clear rotating at <= 0.
if (Player_rotate_cooldown > 0) {
    Player_rotate_cooldown -= 1 * delta_factor;
}
if (Player_rotate_cooldown <= 0) {
    Player_rotating = 0;
}
// 5. Listener follows the projected point:
audio_listener_position(cx, cy, /* TODO(runtime) @0x1406554c0 z */ 0);
if (Night_office_rotated == 0) {
    // 6. Screen-edge rotation triggers (25px left margin, 1255px right margin):
    if (mouse_x < cx + 25) {
        if (Player_rotating == 0 && Night_camera == 0) {
            Player_rotate_cooldown = 15;
            Player_rotation_mode -= 1;
            Player_rotating = 1;
        }
    }
    if (mouse_x > cx + 1255) {
        // Right-edge mirror (C re-checks rotating == 0 + camera == 0, then
        // cooldown = 15, mode += 1, rotating = 1).
        if (Player_rotating == 0 && Night_camera == 0) {
            Player_rotate_cooldown = 15;
            Player_rotation_mode += 1;
            Player_rotating = 1;
        }
    }
}
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Camera_Control_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  longlong lVar6;
  longlong unaff_GS_OFFSET;
  undefined4 uVar7;
  undefined4 uVar8;
  uint uVar9;
  undefined8 **ppuVar10;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  undefined8 uStack_158;
  undefined8 uStack_150;
  uint uStack_144;
  undefined8 uStack_140;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  uint uStack_10c;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  undefined8 uStack_e0;
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
  undefined8 uStack_78;
  undefined8 uStack_70;
  undefined4 uStack_68;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043a78e;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  plRam0000000140657680 = param_1;
  uStack_140 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_160 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_144 = 0xffffff;
  uStack_150 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uStack_e0 = CONCAT44(0xffffff,(undefined4)uStack_e0);
  uStack_e8 = 0;
  uStack_98 = 1;
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18718);
  func_0x000140001490(&uStack_138,uVar3);
  puStack_c8 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1406554c0);
  puStack_c0 = &uStack_128;
  uStack_64 = 0;
  uStack_70 = 0x3fb999999999999a;
  func_0x0001400053f0(&uStack_70,uStack_140);
  func_0x000140001490(&uStack_118,&uStack_70);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  puStack_b8 = &uStack_118;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_c8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar3,uVar4);
  func_0x000140141c50(1);
  uStack_98 = 2;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18758);
  func_0x000140001490(&uStack_138,uVar3);
  puStack_c8 = &uStack_138;
  func_0x00014000bee0(&uStack_128,0x1405c38f0);
  puStack_c0 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1405c3900);
  puStack_b8 = &uStack_118;
  uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8a00,&puStack_c8);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar3,uVar4);
  func_0x000140141c50(1);
  uStack_98 = 3;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar1 = func_0x00014015be60(uStack_160,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_98 = 6;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    uStack_158 = (**(code **)(*param_1 + 0x10))(param_1,0x18709);
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_f8);
    func_0x000140001490(&uStack_138,&uStack_f8);
    puStack_c8 = &uStack_138;
    uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c85a0,&puStack_c8);
    func_0x000140141d00(param_1);
    func_0x000140001490(uStack_158,uVar3);
    func_0x000140141c50(1);
    uStack_98 = 7;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x1870a);
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_f8);
    func_0x000140001490(&uStack_138,&uStack_f8);
    ppuVar10 = &puStack_c8;
    uVar9 = uRam00000001405c85b0;
    puStack_c8 = &uStack_138;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_80,1,uRam00000001405c85b0,ppuVar10);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar3,uVar4);
    func_0x000140141c50(1);
    uStack_98 = 9;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_e8);
    }
    uStack_e8 = 0;
    uStack_e0 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8,uVar9 & 0xffffff00,
                        (ulonglong)ppuVar10 & 0xffffffffffffff00);
    func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_150);
    func_0x000140001490(&uStack_138,&uStack_d8);
    puStack_c8 = &uStack_138;
    func_0x000140001490(&uStack_128,&uStack_150);
    puStack_c0 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c3910);
    puStack_b8 = &uStack_118;
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_f8);
    func_0x000140001490(&uStack_108,&uStack_f8);
    puStack_b0 = &uStack_108;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,uRam00000001405c85c0,&puStack_b0);
    func_0x00014001f910(&uStack_90,uVar4,_UNK_140439e68);
    ppuVar10 = &puStack_c8;
    uVar9 = uRam00000001405c8cc0;
    puVar5 = (undefined8 *)
             func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,ppuVar10);
    uStack_64 = *(uint *)((longlong)puVar5 + 0xc);
    uStack_68 = *(undefined4 *)(puVar5 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar5;
    }
    else {
      func_0x000140049d80(&uStack_70,puVar5);
    }
    func_0x00014000bdb0(&uStack_70,&uStack_90);
    func_0x000140141d00(param_1);
    func_0x000140001490(uStack_158,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    func_0x000140141c50(1);
    uStack_98 = 10;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_e8);
    }
    uStack_e8 = 0;
    uStack_e0 = 0x500000000;
    func_0x00014015f1a0(param_1,uRam00000001405c7b88,0x80000000,&uStack_180,uVar9 & 0xffffff00,
                        (ulonglong)ppuVar10 & 0xffffffffffffff00);
    func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_170);
    func_0x000140001490(&uStack_138,&uStack_180);
    puStack_c8 = &uStack_138;
    func_0x000140001490(&uStack_128,&uStack_170);
    puStack_c0 = &uStack_128;
    func_0x00014000bee0(&uStack_118,0x1405c3920);
    puStack_b8 = &uStack_118;
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_f8);
    func_0x000140001490(&uStack_108,&uStack_f8);
    puStack_b0 = &uStack_108;
    uVar4 = func_0x0001401445d0(param_1,param_2,&uStack_e8,1,uRam00000001405c85d0,&puStack_b0);
    func_0x00014001f910(&uStack_90,uVar4,_UNK_140439e68);
    puVar5 = (undefined8 *)
             func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_c8);
    uStack_64 = *(uint *)((longlong)puVar5 + 0xc);
    uStack_68 = *(undefined4 *)(puVar5 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar5;
    }
    else {
      func_0x000140049d80(&uStack_70,puVar5);
    }
    func_0x00014000bdb0(&uStack_70,&uStack_90);
    func_0x000140141d00(param_1);
    func_0x000140001490(uVar3,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_90);
    }
    func_0x000140141c50(1);
    uStack_98 = 0xc;
    if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_80);
    }
    uStack_80 = 0;
    uStack_78 = 0x500000000;
    func_0x00014015ef90(param_1,uRam00000001405c7bf8,0,&uStack_f8);
    func_0x000140001490(&uStack_138,&uStack_f8);
    puStack_c8 = &uStack_138;
    func_0x000140001490(&uStack_128,uStack_158);
    puStack_c0 = &uStack_128;
    func_0x000140001490(&uStack_118,uVar3);
    ppuVar10 = &puStack_c8;
    uVar9 = uRam00000001405c8ce0;
    puStack_b8 = &uStack_118;
    func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8ce0,ppuVar10);
    uStack_98 = 0xf;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18758);
    uStack_64 = *(uint *)((longlong)puVar5 + 0xc);
    uStack_68 = *(undefined4 *)(puVar5 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar5;
    }
    else {
      func_0x000140049d80(&uStack_70,puVar5);
    }
    if ((*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8)
                 + 4) < iRam000000014065550c) &&
       (func_0x0001403f6320(0x14065550c), iRam000000014065550c == -1)) {
      uRam00000001406554dc = 0;
      uRam00000001406554d0 = 0x3ff0000000000000;
      uRam00000001406554f0 = 0x100000000;
      uRam00000001406554e4 = 0x4000000000000000;
      uRam0000000140655504 = 0x200000000;
      uRam00000001406554f8 = 0x4008000000000000;
      func_0x0001403f6668(&DAT_140049cd0);
      func_0x0001403f62c0(0x14065550c);
    }
    uVar3 = uRam00000001405cd9c0;
    lVar6 = 0;
    iVar1 = func_0x00014015be60(0x1406554d0,&uStack_70,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
code_r0x000140048310:
      iVar1 = *(int *)(lVar6 * 0x14 + 0x1406554e0);
      if (iVar1 == 2) {
code_r0x000140048c54:
        uStack_98 = 0x15;
        if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_80);
        }
        uStack_80 = 0;
        uStack_78 = 0x500000000;
        func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8,uVar9 & 0xffffff00,
                            (ulonglong)ppuVar10 & 0xffffffffffffff00);
        func_0x000140001490(&uStack_138,&uStack_d8);
        puStack_c8 = &uStack_138;
        func_0x00014000bee0(&uStack_128,0x1405c3950);
        puStack_c0 = &uStack_128;
        uStack_84 = 0;
        uStack_90 = 0x3fd999999999999a;
        func_0x0001400053f0(&uStack_90,uStack_140);
        func_0x000140001490(&uStack_118,&uStack_90);
        if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_90);
        }
        puStack_b8 = &uStack_118;
        uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_c8);
        func_0x000140001490(&uStack_d8,uVar3);
        func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8);
        uStack_98 = 0x16;
      }
      else {
code_r0x000140048321:
        if (iVar1 == 1) {
          uStack_98 = 0x13;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8,uVar9 & 0xffffff00,
                              (ulonglong)ppuVar10 & 0xffffffffffffff00);
          func_0x000140001490(&uStack_138,&uStack_d8);
          puStack_c8 = &uStack_138;
          func_0x00014000bee0(&uStack_128,0x1405c3940);
          puStack_c0 = &uStack_128;
          uStack_84 = 0;
          uStack_90 = 0x3fd999999999999a;
          func_0x0001400053f0(&uStack_90,uStack_140);
          func_0x000140001490(&uStack_118,&uStack_90);
          if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_90);
          }
          puStack_b8 = &uStack_118;
          uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_c8)
          ;
          func_0x000140001490(&uStack_d8,uVar3);
          func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8);
          uStack_98 = 0x14;
        }
        else if (iVar1 == 0) {
          uStack_98 = 0x11;
          if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_80);
          }
          uStack_80 = 0;
          uStack_78 = 0x500000000;
          (**(code **)(*param_1 + 0x10))(param_1,0x18709);
          (**(code **)(*param_1 + 0x10))(param_1,0x1870a);
          func_0x00014015f1a0(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8,uVar9 & 0xffffff00,
                              (ulonglong)ppuVar10 & 0xffffffffffffff00);
          func_0x000140001490(&uStack_138,&uStack_d8);
          puStack_c8 = &uStack_138;
          func_0x00014000bee0(&uStack_128,0x1405c3930);
          puStack_c0 = &uStack_128;
          uStack_84 = 0;
          uStack_90 = 0x3fd999999999999a;
          func_0x0001400053f0(&uStack_90,uStack_140);
          func_0x000140001490(&uStack_118,&uStack_90);
          if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_90);
          }
          puStack_b8 = &uStack_118;
          uVar3 = func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cc0,&puStack_c8)
          ;
          func_0x000140001490(&uStack_d8,uVar3);
          func_0x000140160140(param_1,uRam00000001405c7b78,0x80000000,&uStack_d8);
          uStack_98 = 0x12;
        }
      }
    }
    else {
      iVar1 = func_0x00014015be60(0x1406554e4,&uStack_70,uVar3,0);
      if (iVar1 == 0) {
        lVar6 = 1;
        goto code_r0x000140048310;
      }
      iVar1 = func_0x00014015be60(0x1406554f8,&uStack_70,uVar3,0);
      if (iVar1 == 0) {
        iVar1 = uRam0000000140655504._4_4_;
        if (uRam0000000140655504._4_4_ != 2) goto code_r0x000140048321;
        goto code_r0x000140048c54;
      }
    }
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
  }
  uStack_98 = 0x1a;
  uVar3 = (**(code **)(*param_1 + 8))(param_1,0x18756);
  uStack_64 = 0;
  uStack_70 = 0;
  uVar7 = (undefined4)uRam00000001405cd9c0;
  uVar8 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
  iVar1 = func_0x00014015be60(uVar3,&uStack_70,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    uStack_98 = 0x1c;
    uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18756);
    uStack_64 = 0;
    uStack_70 = 0x3ff0000000000000;
    func_0x0001400053f0(&uStack_70,uStack_140);
    func_0x00014000bdb0(uVar3,&uStack_70);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uVar7 = (undefined4)uRam00000001405cd9c0;
    uVar8 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
  }
  uStack_98 = 0x1e;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar1 = func_0x00014015be60(uVar3,&uStack_70,CONCAT44(uVar8,uVar7),1);
  if ((iVar1 != -2) && (iVar1 < 1)) {
    uStack_98 = 0x20;
    (**(code **)(*param_1 + 0x10))(param_1,0x18756);
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18757);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0;
  }
  uStack_98 = 0x22;
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  uStack_80 = 0;
  uStack_78 = 0x500000000;
  uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18709);
  uVar4 = (**(code **)(*param_1 + 0x10))(param_1,0x1870a);
  func_0x000140001490(&uStack_138,uVar3);
  puStack_c8 = &uStack_138;
  func_0x000140001490(&uStack_128,uVar4);
  puStack_c0 = &uStack_128;
  func_0x00014000bee0(&uStack_118,0x1406554c0);
  puStack_b8 = &uStack_118;
  func_0x0001401445d0(param_1,param_2,&uStack_80,3,uRam00000001405c8cf0,&puStack_c8);
  uStack_98 = 0x23;
  uStack_64 = 0;
  uStack_70 = 0;
  iVar1 = func_0x00014015be60(uVar2,&uStack_70,uRam00000001405cd9c0,0);
  if (iVar1 == 0) {
    uStack_98 = 0x25;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18709);
    func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_150);
    uStack_64 = *(uint *)((longlong)puVar5 + 0xc);
    uStack_68 = *(undefined4 *)(puVar5 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar5;
    }
    else {
      func_0x000140049d80(&uStack_70,puVar5);
    }
    func_0x00014000bf90(&uStack_70,0x19);
    iVar1 = func_0x00014015be60(&uStack_150,&uStack_70,uRam00000001405cd9c0,1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (iVar1 != -2 && iVar1 < 0) {
      uStack_98 = 0x27;
      uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18757);
      uVar2 = uRam00000001405cd9c0;
      uStack_64 = 0;
      uStack_70 = 0;
      iVar1 = func_0x00014015be60(uVar3,&uStack_70,uRam00000001405cd9c0,0);
      if (iVar1 == 0) {
        uStack_64 = 0;
        uStack_70 = 0;
        iVar1 = func_0x00014015be60(uStack_160,&uStack_70,uVar2,0);
        if (iVar1 == 0) {
          uStack_98 = 0x29;
          puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18756);
          if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar5);
          }
          *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
          *puVar5 = 0x402e000000000000;
          uStack_98 = 0x2a;
          uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18758);
          uStack_64 = 0;
          uStack_70 = 0x3ff0000000000000;
          func_0x00014000bdb0(uVar2,&uStack_70);
          if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
            func_0x000140001410(&uStack_70);
          }
          uStack_98 = 0x2b;
          puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18757);
          if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar5);
          }
          *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
          *puVar5 = 0x3ff0000000000000;
        }
      }
    }
    uStack_98 = 0x2e;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18709);
    func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_150);
    uStack_64 = *(uint *)((longlong)puVar5 + 0xc);
    uStack_68 = *(undefined4 *)(puVar5 + 1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) == 0) {
      uStack_70 = *puVar5;
    }
    else {
      func_0x000140049d80(&uStack_70,puVar5);
    }
    func_0x00014000bf90(&uStack_70,0x4e7);
    iVar1 = func_0x00014015be60(&uStack_150,&uStack_70,uRam00000001405cd9c0,1);
    if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    if (0 < iVar1) {
      uStack_98 = 0x30;
      uVar3 = (**(code **)(*param_1 + 0x10))(param_1,0x18757);
      uVar2 = uRam00000001405cd9c0;
      uStack_64 = 0;
      uStack_70 = 0;
      iVar1 = func_0x00014015be60(uVar3,&uStack_70,uRam00000001405cd9c0,0);
      if (iVar1 == 0) {
        uStack_64 = 0;
        uStack_70 = 0;
        iVar1 = func_0x00014015be60(uStack_160,&uStack_70,uVar2,0);
        if (iVar1 == 0) {
          uStack_98 = 0x32;
          puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18756);
          if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar5);
          }
          *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
          *puVar5 = 0x402e000000000000;
          uStack_98 = 0x33;
          uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18758);
          func_0x00014000bf90(uVar2,1);
          uStack_98 = 0x34;
          puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18757);
          if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
            func_0x000140001410(puVar5);
          }
          *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
          *puVar5 = 0x3ff0000000000000;
          goto joined_r0x000140048c49;
        }
      }
    }
  }
joined_r0x000140048c49:
  if ((0x46U >> (uStack_e0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  if ((0x46U >> (uStack_78._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
  }
  if ((0x46U >> (uStack_144 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_150);
  }
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
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
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
