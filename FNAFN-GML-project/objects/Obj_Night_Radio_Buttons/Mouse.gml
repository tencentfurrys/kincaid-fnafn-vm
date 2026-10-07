/// @description FNAFN Obj_Night_Radio_Buttons / Mouse_4 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_4  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_4 — PORTED from C ----
// ground truth: gml_Object_Obj_Night_Radio_Buttons_Mouse_4 (10026 B @0x14010c5b0)
// Ported: Obj_Night_Radio_Buttons / Mouse_4
// Decoded, in order (uStack_98 = GML line markers 1..0x3d; ids via
// builtin_ids.json, slots via EXE-REGISTRY.md, objects via obj_names.json,
// doubles verified big-endian, strings/consts via exe_strings.py):
//   1. if (image_alpha == 1) [slot 0x1405c7b98 READ via 0x14015f1a0;
//      `!=`-exit skips to the trailing 0x3d block]:
//      image_index here is the button-bank state (slot 0x1405c7aa8).
//   3-8. if (image_index == 1): track-forward button.
//   5.   if (Obj_Night_Music_Switch.selection < 11) [object-tagged read
//        0x140160480(0x3c, 0x1876f); 0x3c = 60 = Obj_Night_Music_Switch;
//        0x4026000000000000 = 11.0; `<` via the `r < 0` test]:
//   7.     Obj_Night_Music_Switch.selection += 1 [+= helper 0x14000bf90
//        with immediate 1; write-back via 0x140160b90(0x3c, 0x1876f)].
//   8.     customfunct_audio_play_sound_single(Snd_Camera_Radio_Change, <rt>, <rt>) [exe const
//        27.0 @0x1405c6490].
//   0xb-0x12. if (image_index == 2): play button.
//        if (image_xscale > 0.95) [slot 0x1405c7c18; 0x3fee666666666666
//        = 0.95; `>` via `0 < r`]:
//   0xd.     audio_stop_sound(46) [slot 0x1405c8960; exe const 46.0
//          @0x1405c64a0].
//   0xe.     customfunct_audio_play_sound_single(Snd_Camera_Radio_Play, <rt>, <rt>) [53.0
//          @0x1405c64b0].
//   0xf.     customfunct_audio_play_sound_single(Snd_Camera_Click, <rt>, <rt>) [48.0
//          @0x1405c64c0].
//   0x10.    playing = 1 (id 0x18759; direct +0x10 slot write).
//   0x11.    Obj_Night_Radio_Spinner.turn = 1 [0x3e = 62 =
//          Obj_Night_Radio_Spinner; id 0x18798; 1.0 literal].
//   0x12.    for (var i = array_length(custom_music) - 1; i >= 0; i -= 1)
//            audio_stop_sound(custom_music[i]) [custom_music id 0x186fc;
//          array_length = slot 0x1405c8ba0; bound shape
//          func_0x00014002fc60(dst, src, 1) = src - 1 per the ported
//          Obj_Menu_Night_Display/Draw helper note (so init is len - 1;
//          NOTE this differs from the sibling Obj_Menu_Radio_Play/Mouse
//          port, which elides the -1 — verify in-game); `i >= 0` via the
//          `r < 0`-break; `i -= 1` via the typed-decrement switch on
//          dVar1 = -1.0 (_UNK_14043a218 .rdata double); element-accessor
//          boilerplate (0x14012cd90 int cast + 0x14002fbe0 + bounds
//          guards) elided per the Radio_Play convention].
//   0x16.    switch (Obj_Night_Music_Switch.selection) on runtime-pool
//          cases 1.0..10.0 (@0x1406572c0/@0x1406572d4/@0x1406572e8/
//          @0x1406572fc/@0x140657310/@0x140657324/@0x140657338/
//          @0x14065734c/@0x140657360/@0x140657374; guarded init shows
//          1.0 = 0x3ff0... through 10.0 = 0x4024...; branch-index mapping
//          assumed identity per the ported Camera_Button convention).
//          Each matched case jumps to its handler and returns directly
//          (jumptable @0x14010f29c unrecoverable), so bodies are `exit` +
//          TODO. Fallthrough (no case matched):
//   0x23.      audio_play_sound_on(Obj_Office_Front_Middle.music_emitter,
//            song_choice, 1, <rt>) [0x2a = 42 = Obj_Office_Front_Middle,
//            id 0x18739 read via 0x140160480; song_choice id 0x18771 self
//            fetch; 1.0 = exe const @0x1405c64d0; trailing arg is runtime
//            const @0x1406572b0; slot 0x1405c8980 = audio_play_sound_on,
//            argc=4, return discarded].
//   0x24.      image_index = 1.
//   0x26-0x2e. if (image_index == 1):
//        if (image_xscale < 0.95) [`<` via `(r != -2) && (r < 0)`]:
//   0x28.      audio_stop_sound(53).
//   0x29.      customfunct_audio_play_sound_single(Snd_Camera_Click, <rt>, <rt>).
//   0x2a.      customfunct_audio_play_sound_single(Snd_Camera_Radio_Stop, <rt>, <rt>).
//   0x2b.      playing = 0.
//   0x2c.      Obj_Night_Radio_Spinner.turn = 0.
//   0x2d.      image_index = 2.
//   0x2e.      same custom_music stop-loop as 0x12.
//   0x33-0x38. if (image_index == 3): track-back button.
//   0x35.    if (Obj_Night_Music_Switch.selection > 1):
//   0x37.      Obj_Night_Music_Switch.selection -= 1 [-= helper
//          0x14000bdb0 with 1.0 RValue; write-back].
//   0x38.      customfunct_audio_play_sound_single(Snd_Camera_Radio_Change, <rt>, <rt>).
//   0x3d (ALWAYS runs, even when image_alpha != 1 — the L1 early-exit
//      jumps here, and the main body falls through):
//        Obj_Night_Music_Switch.selection =
//          audio_play_sound_on(Obj_Night_Music_Switch.selection, 1, 10)
//        [1.0 = @0x1405c64d0, 10.0 = @0x1405c64e0 literals; the
//        0x140160290(0x3c) push is with-target boilerplate — dotted form
//        per the PORTING.md object-tagged rule].
// TODO(calibrate): every runtime const @0x14065xxx (audio priority/loop
// @0x1406572b0, switch pool @0x1406572c0..., outer 4-arg play_on trailing
// arg) is outside the mapped exe image; the 10 switch-branch bodies
// (jumptable @0x14010f29c) and the audio_play_sound_on arg meanings —
// verify in-game.
if (image_alpha == 1) {
    if (image_index == 1) {
        if (Obj_Night_Music_Switch.selection < 11) {
            Obj_Night_Music_Switch.selection += 1;
            customfunct_audio_play_sound_single(Snd_Camera_Radio_Change, 0 /* TODO(calibrate): runtime const @0x1406572b0 */, false /* TODO(calibrate): runtime const @0x1406572b0 */);
        }
    }
    if (image_index == 2) {
        if (image_xscale > 0.95) {
            audio_stop_sound(46);
            customfunct_audio_play_sound_single(Snd_Camera_Radio_Play, 0 /* TODO(calibrate): runtime const @0x1406572b0 */, false /* TODO(calibrate): runtime const @0x1406572b0 */);
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate): runtime const @0x1406572b0 */, false /* TODO(calibrate): runtime const @0x1406572b0 */);
            playing = 1;
            Obj_Night_Radio_Spinner.turn = 1;
            for (var i = array_length(custom_music) - 1; i >= 0; i -= 1) {
                audio_stop_sound(custom_music[i]);
            }
            switch (Obj_Night_Music_Switch.selection) {
                case 1: // TODO(calibrate): runtime pool @0x1406572c0; jumptable branch — verify in-game
                    // TODO(calibrate): branch body unrecoverable (jumptable @0x14010f29c); C returns here
                    exit;
                case 2: // TODO(calibrate): runtime pool @0x1406572d4
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 3: // TODO(calibrate): runtime pool @0x1406572e8
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 4: // TODO(calibrate): runtime pool @0x1406572fc
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 5: // TODO(calibrate): runtime pool @0x140657310
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 6: // TODO(calibrate): runtime pool @0x140657324
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 7: // TODO(calibrate): runtime pool @0x140657338
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 8: // TODO(calibrate): runtime pool @0x14065734c
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 9: // TODO(calibrate): runtime pool @0x140657360
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
                case 10: // TODO(calibrate): runtime pool @0x140657374
                    // TODO(calibrate): branch body unrecoverable; C returns here
                    exit;
            }
            audio_play_sound_on(Obj_Office_Front_Middle.music_emitter, song_choice, 1, 0 /* TODO(calibrate): runtime const @0x1406572b0 */);
            image_index = 1;
        }
    }
    if (image_index == 1) {
        if (image_xscale < 0.95) {
            audio_stop_sound(53);
            customfunct_audio_play_sound_single(Snd_Camera_Click, 0 /* TODO(calibrate): runtime const @0x1406572b0 */, false /* TODO(calibrate): runtime const @0x1406572b0 */);
            customfunct_audio_play_sound_single(Snd_Camera_Radio_Stop, 0 /* TODO(calibrate): runtime const @0x1406572b0 */, false /* TODO(calibrate): runtime const @0x1406572b0 */);
            playing = 0;
            Obj_Night_Radio_Spinner.turn = 0;
            image_index = 2;
            for (var i = array_length(custom_music) - 1; i >= 0; i -= 1) {
                audio_stop_sound(custom_music[i]);
            }
        }
    }
    if (image_index == 3) {
        if (Obj_Night_Music_Switch.selection > 1) {
            Obj_Night_Music_Switch.selection -= 1;
            customfunct_audio_play_sound_single(Snd_Camera_Radio_Change, 0 /* TODO(calibrate): runtime const @0x1406572b0 */, false /* TODO(calibrate): runtime const @0x1406572b0 */);
        }
    }
}
Obj_Night_Music_Switch.selection = audio_play_sound_on(Obj_Night_Music_Switch.selection, 1, 10);
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Night_Radio_Buttons_Mouse_4(longlong *param_1,undefined8 param_2)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 uVar5;
  longlong *plVar6;
  undefined8 uVar7;
  ulonglong uVar8;
  longlong lVar9;
  longlong unaff_GS_OFFSET;
  ulonglong in_stack_fffffffffffffe18;
  undefined8 **ppuVar10;
  ulonglong uVar11;
  undefined4 uVar12;
  ulonglong in_stack_fffffffffffffe20;
  undefined8 **ppuVar13;
  ulonglong uVar14;
  undefined auStack_1d8 [16];
  undefined8 uStack_1c0;
  uint uStack_1b4;
  undefined8 uStack_1b0;
  uint uStack_1a4;
  undefined8 uStack_1a0;
  uint uStack_194;
  undefined8 uStack_190;
  uint uStack_184;
  undefined8 uStack_180;
  uint uStack_174;
  undefined8 uStack_170;
  uint uStack_164;
  undefined8 uStack_160;
  undefined8 uStack_158;
  uint uStack_14c;
  undefined8 uStack_148;
  uint uStack_13c;
  undefined8 uStack_138;
  uint uStack_12c;
  undefined8 uStack_128;
  uint uStack_11c;
  undefined8 uStack_118;
  undefined4 uStack_110;
  uint uStack_10c;
  undefined auStack_108 [16];
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 *puStack_e8;
  undefined8 *puStack_e0;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  longlong *plStack_90;
  undefined auStack_88 [8];
  undefined8 uStack_80;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043d6a8;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_14c = 0xffffff;
  uStack_158 = 0;
  uStack_13c = 0xffffff;
  uStack_148 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_174 = 0xffffff;
  uStack_180 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_164 = 0xffffff;
  uStack_170 = 0;
  plRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  uStack_160 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fc);
  uStack_b4 = 0xffffff;
  uStack_c0 = 0.0;
  uStack_68._4_4_ = 0xffffff;
  uStack_70 = 0;
  uStack_1b4 = 0xffffff;
  uStack_1c0 = 0;
  uStack_1a4 = 0xffffff;
  uStack_1b0 = 0;
  uStack_194 = 0xffffff;
  uStack_1a0 = 0;
  uStack_184 = 0xffffff;
  uStack_190 = 0;
  uStack_98 = 1;
  in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
  ppuVar10 = (undefined8 **)(in_stack_fffffffffffffe18 & 0xffffffffffffff00);
  plStack_90 = param_1;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_180,ppuVar10,
                      in_stack_fffffffffffffe20);
  uStack_80._4_4_ = 0;
  uStack_80._0_4_ = SUB124(_auStack_88,8);
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar2 = func_0x00014015be60(&uStack_180,auStack_88,uRam00000001405cd9c0,0);
  if (iVar2 != 0) goto code_r0x00014010d2bc;
  uStack_98 = 3;
  in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
  ppuVar10 = (undefined8 **)((ulonglong)ppuVar10 & 0xffffffffffffff00);
  func_0x00014015f1a0(plStack_90,uRam00000001405c7aa8,0x80000000,&uStack_d0,ppuVar10,
                      in_stack_fffffffffffffe20);
  _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
  iVar2 = func_0x00014015be60(&uStack_d0,auStack_88,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_98 = 5;
    auStack_108 = ZEXT816(0);
    in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
    ppuVar10 = (undefined8 **)((ulonglong)ppuVar10 & 0xffffffffffffff00);
    func_0x000140160480(0x3c,0x1876f,0x80000000,auStack_108,ppuVar10,in_stack_fffffffffffffe20);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x4026000000000000;
    iVar2 = func_0x00014015be60(auStack_108,auStack_88,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_98 = 7;
      in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
      func_0x000140160480(0x3c,0x1876f,0x80000000,auStack_108,
                          (ulonglong)ppuVar10 & 0xffffffffffffff00,in_stack_fffffffffffffe20);
      func_0x00014000bf90(auStack_108,1);
      func_0x000140160b90(0x3c,0x1876f,0x80000000,auStack_108);
      uStack_98 = 8;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      func_0x00014000bee0(&uStack_158,0x1405c6490);
      puStack_f8 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x1406572b0);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1406572b0);
      ppuVar10 = &puStack_f8;
      puStack_e8 = &uStack_138;
      gml_Script_customfunct_audio_play_sound_single(plStack_90,uStack_b0,&uStack_70,3,ppuVar10);
    }
  }
  uStack_98 = 0xb;
  ppuVar13 = (undefined8 **)(in_stack_fffffffffffffe20 & 0xffffffffffffff00);
  uVar11 = (ulonglong)ppuVar10 & 0xffffffffffffff00;
  func_0x00014015f1a0(plStack_90,uRam00000001405c7aa8,0x80000000,&uStack_d0,uVar11,ppuVar13);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4000000000000000;
  iVar2 = func_0x00014015be60(&uStack_d0,auStack_88,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    ppuVar13 = (undefined8 **)((ulonglong)ppuVar13 & 0xffffffffffffff00);
    uVar11 = uVar11 & 0xffffffffffffff00;
    func_0x00014015f1a0(plStack_90,uRam00000001405c7c18,0x80000000,&uStack_170,uVar11,ppuVar13);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fee666666666666;
    iVar2 = func_0x00014015be60(&uStack_170,auStack_88,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      uStack_98 = 0xd;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uVar3 = (undefined4)(uVar11 >> 0x20);
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_158,0x1405c64a0);
      puStack_f8 = &uStack_158;
      func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,1,CONCAT44(uVar3,uRam00000001405c8960),
                          &puStack_f8);
      uStack_98 = 0xe;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_158,0x1405c64b0);
      puStack_f8 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x1406572b0);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1406572b0);
      puStack_e8 = &uStack_138;
      gml_Script_customfunct_audio_play_sound_single(plStack_90,uStack_b0,&uStack_70,3,&puStack_f8);
      uStack_98 = 0xf;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_158,0x1405c64c0);
      puStack_f8 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x1406572b0);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1406572b0);
      puStack_e8 = &uStack_138;
      ppuVar10 = &puStack_f8;
      gml_Script_customfunct_audio_play_sound_single(plStack_90,uStack_b0,&uStack_70,3,ppuVar10);
      uVar3 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
      uStack_98 = 0x10;
      puVar4 = (undefined8 *)(**(code **)(*plStack_90 + 0x10))(plStack_90,0x18759);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0x3ff0000000000000;
      uStack_98 = 0x11;
      auStack_108 = ZEXT816(0x3ff0000000000000);
      func_0x000140160b90(0x3e,0x18798,0x80000000,auStack_108);
      uStack_98 = 0x12;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x000140001490(&uStack_158,uStack_160);
      ppuVar10 = &puStack_f8;
      uVar11 = CONCAT44(uVar3,uRam00000001405c8ba0);
      puStack_f8 = &uStack_158;
      uVar5 = func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,1,uVar11,ppuVar10);
      func_0x00014002fc60(auStack_88,uVar5,1);
      func_0x000140001490(&uStack_c0,auStack_88);
      if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_88);
      }
      dVar1 = _UNK_14043a218;
      while( true ) {
        _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
        iVar2 = func_0x00014015be60(&uStack_c0,auStack_88,uRam00000001405cd9c0,1);
        if (iVar2 < 0) break;
        uStack_98 = 0x14;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uVar12 = (undefined4)(uVar11 >> 0x20);
        uStack_70 = 0;
        uStack_68 = 0x500000000;
        uVar3 = func_0x00014012cd90(&uStack_c0);
        plVar6 = (longlong *)func_0x00014002fbe0(uStack_160,uVar3);
        if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
          func_0x0001401479b0();
          iVar2 = func_0x000140147990(*plVar6);
          if (iVar2 < 1) {
            uVar3 = func_0x000140147990(*plVar6);
            func_0x000140144260(&UNK_140439ca6,0,uVar3);
            plVar6 = (longlong *)0x0;
          }
          else {
            plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
        }
        func_0x000140001490(&uStack_158,plVar6);
        ppuVar10 = &puStack_f8;
        uVar11 = CONCAT44(uVar12,uRam00000001405c8960);
        puStack_f8 = &uStack_158;
        func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,1,uVar11,ppuVar10);
        switch(uStack_b4 & 0xffffff) {
        case 0:
        case 0xd:
          uStack_c0 = uStack_c0 + dVar1;
          break;
        case 1:
          uStack_c0 = (double)func_0x00014012d320(&uStack_c0);
          uStack_c0 = uStack_c0 + dVar1;
          uStack_b4 = 0;
          break;
        default:
          func_0x000140005560(&UNK_14043a32c,&uStack_c0,&uStack_c0);
          break;
        case 7:
          uStack_c0 = (double)CONCAT44(uStack_c0._4_4_,(int)uStack_c0 + -1);
          break;
        case 10:
          uStack_c0 = (double)((longlong)uStack_c0 + -1);
        }
      }
      uStack_98 = 0x16;
      _auStack_88 = ZEXT816(0);
      uVar14 = (ulonglong)ppuVar10 & 0xffffffffffffff00;
      uVar11 = uVar11 & 0xffffffffffffff00;
      func_0x000140160480(0x3c,0x1876f,0x80000000,auStack_88,uVar11,uVar14);
      uStack_10c = uStack_80._4_4_;
      uStack_110 = (uint)uStack_80;
      if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) == 0) {
        uStack_118 = auStack_88;
      }
      else {
        func_0x00014010f4a0(&uStack_118,auStack_88);
      }
      if ((*(int *)(*(longlong *)
                     (*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4) <
           iRam0000000140657388) && (func_0x0001403f6320(0x140657388), iRam0000000140657388 == -1))
      {
        uRam00000001406572cc = 0;
        uRam00000001406572c0 = 0x3ff0000000000000;
        uRam00000001406572e0 = 0x100000000;
        uRam00000001406572d4 = 0x4000000000000000;
        uRam00000001406572f4 = 0x200000000;
        uRam00000001406572e8 = 0x4008000000000000;
        uRam0000000140657308 = 0x300000000;
        uRam00000001406572fc = 0x4010000000000000;
        uRam000000014065731c = 0x400000000;
        uRam0000000140657310 = 0x4014000000000000;
        uRam0000000140657330 = 0x500000000;
        uRam0000000140657324 = 0x4018000000000000;
        uRam0000000140657344 = 0x600000000;
        uRam0000000140657338 = 0x401c000000000000;
        uRam0000000140657358 = 0x700000000;
        uRam000000014065734c = 0x4020000000000000;
        uRam000000014065736c = 0;
        uRam0000000140657360 = 0x4022000000000000;
        uRam0000000140657370 = 8;
        uRam0000000140657380 = 0x900000000;
        uRam0000000140657374 = 0x4024000000000000;
        func_0x0001403f6668(&DAT_14010f340);
        func_0x0001403f62c0(0x140657388);
      }
      uVar5 = uRam00000001405cd9c0;
      lVar9 = 0;
      iVar2 = func_0x00014015be60(0x1406572c0,&uStack_118,uRam00000001405cd9c0,0);
      plVar6 = plStack_90;
      if (iVar2 == 0) {
code_r0x00014010dda9:
        uVar8 = (ulonglong)*(uint *)(lVar9 * 0x14 + 0x1406572d0);
joined_r0x00014010dd55:
        if (uVar8 < 10) {
                    / * WARNING: Could not recover jumptable at 0x00014010ddc9. Too many branches * /
                    / * WARNING: Treating indirect jump as call * /
          (*(code *)(&UNK_14010f29c + *(int *)(&UNK_14010f29c + uVar8 * 4)))();
          return;
        }
      }
      else {
        iVar2 = func_0x00014015be60(0x1406572d4,&uStack_118,uVar5,0);
        uVar8 = uRam00000001406572e0;
        if (iVar2 == 0) {
joined_r0x00014010dd3d:
          uVar8 = uVar8 >> 0x20;
          goto joined_r0x00014010dd55;
        }
        iVar2 = func_0x00014015be60(0x1406572e8,&uStack_118,uVar5,0);
        if (iVar2 == 0) {
          uVar8 = uRam00000001406572f4 >> 0x20;
          goto joined_r0x00014010dd55;
        }
        iVar2 = func_0x00014015be60(0x1406572fc,&uStack_118,uVar5,0);
        uVar8 = uRam0000000140657308;
        if (iVar2 == 0) goto joined_r0x00014010dd3d;
        iVar2 = func_0x00014015be60(0x140657310,&uStack_118,uVar5,0);
        uVar8 = uRam000000014065731c;
        if (iVar2 == 0) {
joined_r0x00014010dd55:
          uVar8 = uVar8 >> 0x20;
          goto joined_r0x00014010dd55;
        }
        iVar2 = func_0x00014015be60(0x140657324,&uStack_118,uVar5,0);
        uVar8 = uRam0000000140657330;
        if (iVar2 == 0) goto joined_r0x00014010dd3d;
        iVar2 = func_0x00014015be60(0x140657338,&uStack_118,uVar5,0);
        uVar8 = uRam0000000140657344;
        if (iVar2 == 0) goto joined_r0x00014010dd55;
        iVar2 = func_0x00014015be60(0x14065734c,&uStack_118,uVar5,0);
        uVar8 = uRam0000000140657358;
        if (iVar2 == 0) goto joined_r0x00014010dd3d;
        iVar2 = func_0x00014015be60(0x140657360,&uStack_118,uVar5,0);
        if (iVar2 == 0) {
          lVar9 = 8;
          goto code_r0x00014010dda9;
        }
        iVar2 = func_0x00014015be60(0x140657374,&uStack_118,uVar5,0);
        uVar8 = uRam0000000140657380;
        if (iVar2 == 0) goto joined_r0x00014010dd3d;
      }
      uStack_98 = 0x23;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      auStack_1d8 = ZEXT816(0);
      uVar5 = (**(code **)(*plVar6 + 0x10))(plVar6,0x18771);
      uVar11 = uVar11 & 0xffffffffffffff00;
      func_0x000140160480(0x2a,0x18739,0x80000000,auStack_1d8,uVar11,uVar14 & 0xffffffffffffff00);
      uVar3 = (undefined4)(uVar11 >> 0x20);
      func_0x000140001490(&uStack_158,auStack_1d8);
      puStack_f8 = &uStack_158;
      func_0x000140001490(&uStack_148,uVar5);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1405c64d0);
      puStack_e8 = &uStack_138;
      func_0x00014000bee0(&uStack_128,0x1406572b0);
      ppuVar13 = &puStack_f8;
      uVar11 = CONCAT44(uVar3,uRam00000001405c8980);
      puStack_e0 = &uStack_128;
      func_0x0001401445d0(plVar6,uStack_b0,&uStack_70,4,uVar11,ppuVar13);
      uStack_98 = 0x24;
      if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_d0);
      }
      uStack_c4 = 0;
      uStack_d0 = 0x3ff0000000000000;
      func_0x000140160140(plVar6,uRam00000001405c7aa8,0x80000000,&uStack_d0);
      if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_118);
      }
    }
  }
  uStack_98 = 0x26;
  ppuVar13 = (undefined8 **)((ulonglong)ppuVar13 & 0xffffffffffffff00);
  uVar11 = uVar11 & 0xffffffffffffff00;
  func_0x00014015f1a0(plStack_90,uRam00000001405c7aa8,0x80000000,&uStack_d0,uVar11,ppuVar13);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x3ff0000000000000;
  iVar2 = func_0x00014015be60(&uStack_d0,auStack_88,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    ppuVar13 = (undefined8 **)((ulonglong)ppuVar13 & 0xffffffffffffff00);
    uVar11 = uVar11 & 0xffffffffffffff00;
    func_0x00014015f1a0(plStack_90,uRam00000001405c7c18,0x80000000,&uStack_170,uVar11,ppuVar13);
    uStack_80._4_4_ = 0;
    auStack_88 = (undefined  [8])0x3fee666666666666;
    iVar2 = func_0x00014015be60(&uStack_170,auStack_88,uRam00000001405cd9c0,1);
    if ((iVar2 != -2) && (iVar2 < 0)) {
      uStack_98 = 0x28;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uVar3 = (undefined4)(uVar11 >> 0x20);
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_158,0x1405c64b0);
      puStack_f8 = &uStack_158;
      func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,1,CONCAT44(uVar3,uRam00000001405c8960),
                          &puStack_f8);
      uStack_98 = 0x29;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_158,0x1405c64c0);
      puStack_f8 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x1406572b0);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1406572b0);
      puStack_e8 = &uStack_138;
      gml_Script_customfunct_audio_play_sound_single(plStack_90,uStack_b0,&uStack_70,3,&puStack_f8);
      uStack_98 = 0x2a;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68 = 0x500000000;
      func_0x00014000bee0(&uStack_158,0x1405c64a0);
      puStack_f8 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x1406572b0);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1406572b0);
      ppuVar10 = &puStack_f8;
      puStack_e8 = &uStack_138;
      gml_Script_customfunct_audio_play_sound_single(plStack_90,uStack_b0,&uStack_70,3,ppuVar10);
      uVar3 = (undefined4)((ulonglong)ppuVar10 >> 0x20);
      uStack_98 = 0x2b;
      puVar4 = (undefined8 *)(**(code **)(*plStack_90 + 0x10))(plStack_90,0x18759);
      if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
        func_0x000140001410(puVar4);
      }
      *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
      *puVar4 = 0;
      uStack_98 = 0x2c;
      auStack_108._0_12_ = SUB1612(ZEXT816(0),0);
      auStack_108._12_4_ = 0;
      func_0x000140160b90(0x3e,0x18798,0x80000000,auStack_108);
      uStack_98 = 0x2d;
      if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_d0);
      }
      uStack_c4 = 0;
      uStack_d0 = 0x4000000000000000;
      func_0x000140160140(plStack_90,uRam00000001405c7aa8,0x80000000,&uStack_d0);
      uStack_98 = 0x2e;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      func_0x000140001490(&uStack_158,uStack_160);
      ppuVar13 = &puStack_f8;
      uVar11 = CONCAT44(uVar3,uRam00000001405c8ba0);
      puStack_f8 = &uStack_158;
      uVar5 = func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,1,uVar11,ppuVar13);
      func_0x00014002fc60(auStack_88,uVar5,1);
      func_0x000140001490(&uStack_c0,auStack_88);
      if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_88);
      }
      dVar1 = _UNK_14043a218;
      while( true ) {
        _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
        iVar2 = func_0x00014015be60(&uStack_c0,auStack_88,uRam00000001405cd9c0,1);
        if (iVar2 < 0) break;
        uStack_98 = 0x30;
        if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_70);
        }
        uVar12 = (undefined4)(uVar11 >> 0x20);
        uStack_70 = 0;
        uStack_68._0_4_ = 0;
        uStack_68._4_4_ = 5;
        uVar3 = func_0x00014012cd90(&uStack_c0);
        plVar6 = (longlong *)func_0x00014002fbe0(uStack_160,uVar3);
        if (((*(uint *)((longlong)plVar6 + 0xc) & 0xffffff) == 2) && (*plVar6 != 0)) {
          func_0x0001401479b0();
          iVar2 = func_0x000140147990(*plVar6);
          if (iVar2 < 1) {
            uVar3 = func_0x000140147990(*plVar6);
            func_0x000140144260(&UNK_140439ca6,0,uVar3);
            plVar6 = (longlong *)0x0;
          }
          else {
            plVar6 = (longlong *)func_0x000140147980(*plVar6,0);
          }
        }
        else {
          func_0x000140144260(&UNK_140439cd8);
        }
        func_0x000140001490(&uStack_158,plVar6);
        ppuVar13 = &puStack_f8;
        uVar11 = CONCAT44(uVar12,uRam00000001405c8960);
        puStack_f8 = &uStack_158;
        func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,1,uVar11,ppuVar13);
        switch(uStack_b4 & 0xffffff) {
        case 0:
        case 0xd:
          uStack_c0 = uStack_c0 + dVar1;
          break;
        case 1:
          uStack_c0 = (double)func_0x00014012d320(&uStack_c0);
          uStack_c0 = uStack_c0 + dVar1;
          uStack_b4 = 0;
          break;
        default:
          func_0x000140005560(&UNK_14043a32c,&uStack_c0,&uStack_c0);
          break;
        case 7:
          uStack_c0 = (double)CONCAT44(uStack_c0._4_4_,(int)uStack_c0 + -1);
          break;
        case 10:
          uStack_c0 = (double)((longlong)uStack_c0 + -1);
        }
      }
    }
  }
  uStack_98 = 0x33;
  in_stack_fffffffffffffe20 = (ulonglong)ppuVar13 & 0xffffffffffffff00;
  ppuVar10 = (undefined8 **)(uVar11 & 0xffffffffffffff00);
  func_0x00014015f1a0(plStack_90,uRam00000001405c7aa8,0x80000000,&uStack_d0,ppuVar10,
                      in_stack_fffffffffffffe20);
  uStack_80._4_4_ = 0;
  auStack_88 = (undefined  [8])0x4008000000000000;
  iVar2 = func_0x00014015be60(&uStack_d0,auStack_88,uRam00000001405cd9c0,0);
  if (iVar2 == 0) {
    uStack_98 = 0x35;
    auStack_108 = ZEXT816(0);
    in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
    ppuVar10 = (undefined8 **)((ulonglong)ppuVar10 & 0xffffffffffffff00);
    func_0x000140160480(0x3c,0x1876f,0x80000000,auStack_108,ppuVar10,in_stack_fffffffffffffe20);
    _auStack_88 = ZEXT416(SUB164(_auStack_88,8)) << 0x40;
    iVar2 = func_0x00014015be60(auStack_108,auStack_88,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      uStack_98 = 0x37;
      in_stack_fffffffffffffe20 = in_stack_fffffffffffffe20 & 0xffffffffffffff00;
      func_0x000140160480(0x3c,0x1876f,0x80000000,auStack_108,
                          (ulonglong)ppuVar10 & 0xffffffffffffff00,in_stack_fffffffffffffe20);
      uStack_80._4_4_ = 0;
      auStack_88 = (undefined  [8])0x3ff0000000000000;
      func_0x00014000bdb0(auStack_108,auStack_88);
      if ((0x46U >> (uStack_80._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(auStack_88);
      }
      func_0x000140160b90(0x3c,0x1876f,0x80000000,auStack_108);
      uStack_98 = 0x38;
      if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_70);
      }
      uStack_70 = 0;
      uStack_68._0_4_ = 0;
      uStack_68._4_4_ = 5;
      func_0x00014000bee0(&uStack_158,0x1405c6490);
      puStack_f8 = &uStack_158;
      func_0x00014000bee0(&uStack_148,0x1406572b0);
      puStack_f0 = &uStack_148;
      func_0x00014000bee0(&uStack_138,0x1406572b0);
      ppuVar10 = &puStack_f8;
      puStack_e8 = &uStack_138;
      gml_Script_customfunct_audio_play_sound_single(plStack_90,uStack_b0,&uStack_70,3,ppuVar10);
    }
  }
code_r0x00014010d2bc:
  uStack_98 = 0x3d;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  _auStack_88 = ZEXT816(0);
  uVar11 = (ulonglong)ppuVar10 & 0xffffffffffffff00;
  func_0x000140160480(0x3c,0x1876f,0x80000000,auStack_88,uVar11,
                      in_stack_fffffffffffffe20 & 0xffffffffffffff00);
  uVar3 = (undefined4)(uVar11 >> 0x20);
  func_0x000140001490(&uStack_158,auStack_88);
  puStack_f8 = &uStack_158;
  func_0x00014000bee0(&uStack_148,0x1405c64d0);
  puStack_f0 = &uStack_148;
  func_0x00014000bee0(&uStack_138,0x1405c64e0);
  puStack_e8 = &uStack_138;
  uVar5 = func_0x0001401445d0(plStack_90,uStack_b0,&uStack_70,3,CONCAT44(uVar3,uRam00000001405c8a00)
                              ,&puStack_f8);
  uVar7 = func_0x000140160290(0x3c);
  func_0x000140141d00(uVar7);
  func_0x000140001490(auStack_88,uVar5);
  func_0x000140141c50(1);
  func_0x000140160b90(0x3c,0x1876f,0x80000000,auStack_88);
  if ((0x46U >> (uStack_184 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_190);
  }
  if ((0x46U >> (uStack_194 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1a0);
  }
  if ((0x46U >> (uStack_1a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1b0);
  }
  if ((0x46U >> (uStack_1b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_1c0);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_164 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_170);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_174 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_180);
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
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */
