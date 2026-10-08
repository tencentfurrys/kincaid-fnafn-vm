/// @description FNAFN Obj_Menu_Warning / Draw — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Warning_Draw_0 (2871 B @0x140113eb0)
// Same event as Obj_Menu_Disclaimer/Draw_0 (same size, same helper chain,
// same x/y consts) with the warning strings. Decoded identically:
//   draw_set_alpha(image_alpha) [slot 0x1405c7b98 via func_0x00014015f1a0,
//   float setter func_0x00014018d0b0, contextual];
//   if (!surface_exists(surface)) surface = surface_create(room_width,
//   room_height) [surface = id 0x1877a; slots 0x1405c8a50/0x1405c8a60
//   registry; room_width/room_height = slots 0x1405c7b08/0x1405c7b18];
//   surface_set_target(surface) [func_0x0001401756b0, contextual];
//   draw_set_font(game_font[1]) [id 0x18725 +8 global, element [1]];
//   draw_set_halign(fa_center) [func_0x000140175530(1), PROVEN];
//   draw_set_color(make_color_rgb(255, 0, 110)) [func_0x0001401756a0 +
//   func_0x00014018d100]; eight draw_text(640, y, str) [slot 0x1405c8da0
//   registry; x @0x1405c66d8 = 640.0, y @0x1405c66e8..@0x1405c6758 =
//   64/160/195/230/265/435/470/505, exe .data doubles; strings via
//   exe_strings.py, exact bytes incl. sic "dipictions"];
//   surface_reset_target() [func_0x000140183c00, contextual];
//   draw_surface(surface, x, y) [slot 0x1405c8ab0 registry] with x/y both
//   the runtime-pool const @0x140657400: TODO(calibrate) (0 by fullscreen
//   convention, cf. Obj_Menu_Transition/Draw).
draw_set_alpha(image_alpha);
if (!surface_exists(surface)) {
    surface = surface_create(room_width, room_height);
}
surface_set_target(surface);
draw_set_font(game_font[1]);
draw_set_halign(fa_center);
draw_set_color(make_color_rgb(255, 0, 110));
draw_text(640, 64, "warning"); // str @0x1405c6560
draw_text(640, 160, "warning, this game features graphic dipictions of"); // str @0x1405c6570 (sic)
draw_text(640, 195, "nudity and sexual acts, along with references to"); // str @0x1405c65b0
draw_text(640, 230, "sexual assault. It also contains flashing lights"); // str @0x1405c65f0
draw_text(640, 265, "and loud noises"); // str @0x1405c6630
draw_text(640, 435, "this game is strongly advised-against for those"); // str @0x1405c6640
draw_text(640, 470, "who are underage, dealing with epilepsy or affected"); // str @0x1405c6670
draw_text(640, 505, "by sexual, verbal or physical trauma"); // str @0x1405c66b0
surface_reset_target();
draw_surface(surface, 0 /* TODO(calibrate): runtime const @0x140657400 */, 0 /* TODO(calibrate): same */);
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Warning_Draw_0(longlong *param_1,undefined8 param_2)

{
  uint uVar1;
  char cVar2;
  int iVar3;
  undefined4 uVar4;
  double *pdVar5;
  double *pdVar6;
  undefined8 uVar7;
  double dVar8;
  uint in_stack_fffffffffffffeb8;
  ulonglong in_stack_fffffffffffffec0;
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
  double dStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  undefined8 uStack_d0;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 *puStack_78;
  undefined8 *puStack_70;
  undefined8 *puStack_68;
  undefined8 uStack_58;
  undefined8 uStack_50;
  undefined8 uStack_48;
  
  uStack_48 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043d90b;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_dc = 0xffffff;
  dStack_e8 = 0.0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  plRam0000000140657680 = param_1;
  pdVar5 = (double *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18725);
  uStack_50 = CONCAT44(0xffffff,(undefined4)uStack_50);
  uStack_58 = 0;
  uStack_d0 = CONCAT44(0xffffff,(undefined4)uStack_d0);
  uStack_d8 = 0;
  uStack_12c = 0xffffff;
  uStack_138 = 0;
  uStack_11c = 0xffffff;
  uStack_128 = 0;
  uStack_10c = 0xffffff;
  uStack_118 = 0;
  uStack_80 = 1;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&dStack_e8,
                      in_stack_fffffffffffffeb8 & 0xffffff00,
                      in_stack_fffffffffffffec0 & 0xffffffffffffff00);
  dVar8 = dStack_e8;
  if ((uStack_dc & 0xffffff) != 0) {
    dVar8 = (double)func_0x00014012d320(&dStack_e8);
  }
  func_0x00014018d0b0((float)dVar8);
  uStack_80 = 2;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  pdVar6 = (double *)(**(code **)(*param_1 + 8))(param_1,0x1877a);
  func_0x000140001490(&uStack_c8,pdVar6);
  puStack_78 = &uStack_c8;
  uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_58,1,uRam00000001405c8a50,&puStack_78);
  cVar2 = func_0x00014012bb70(uVar7);
  if (cVar2 == '\0') {
    uStack_80 = 4;
    if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_d8);
    }
    uStack_d8 = 0;
    uStack_d0 = 0x500000000;
    pdVar6 = (double *)(**(code **)(*param_1 + 0x10))(param_1,0x1877a);
    func_0x00014015ef90(param_1,uRam00000001405c7b08,0x80000000,&uStack_108);
    func_0x00014015ef90(param_1,uRam00000001405c7b18,0x80000000,&uStack_f8);
    func_0x000140001490(&uStack_b8,&uStack_108);
    puStack_70 = &uStack_b8;
    func_0x000140001490(&uStack_a8,&uStack_f8);
    puStack_68 = &uStack_a8;
    uVar7 = func_0x0001401445d0(param_1,param_2,&uStack_d8,2,uRam00000001405c8a60,&puStack_70);
    func_0x000140141d00(param_1);
    func_0x000140001490(pdVar6,uVar7);
    func_0x000140141c50(1);
  }
  uStack_80 = 7;
  if ((*(uint *)((longlong)pdVar6 + 0xc) & 0xffffff) == 0) {
    dVar8 = *pdVar6;
  }
  else {
    dVar8 = (double)func_0x00014012d320(pdVar6);
  }
  func_0x0001401756b0((longlong)dVar8);
  uStack_80 = 8;
  if (((*(uint *)((longlong)pdVar5 + 0xc) & 0xffffff) == 2) && (*pdVar5 != 0.0)) {
    func_0x0001401479b0();
    iVar3 = func_0x000140147990(*pdVar5);
    if (iVar3 < 2) {
      uVar4 = func_0x000140147990(*pdVar5);
      func_0x000140144260(&UNK_140439ca6,1,uVar4);
      pdVar5 = (double *)0x0;
      uVar1 = uRam000000000000000c;
    }
    else {
      pdVar5 = (double *)func_0x000140147980(*pdVar5,1);
      uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
    uVar1 = *(uint *)((longlong)pdVar5 + 0xc);
  }
  if ((uVar1 & 0xffffff) == 0) {
    dVar8 = *pdVar5;
  }
  else {
    dVar8 = (double)func_0x00014012d320(pdVar5);
  }
  func_0x000140175520((longlong)dVar8);
  uStack_80 = 9;
  func_0x000140175530(1);
  uStack_80 = 10;
  uVar4 = func_0x0001401756a0(0xff,0,0x6e);
  func_0x00014018d100(uVar4);
  uStack_80 = 0xc;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c66e8);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c6560);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0xd;
  func_0x000140175520(0);
  uStack_80 = 0xe;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c66f8);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c6570);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0xf;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c6708);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c65b0);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x10;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c6718);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c65f0);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x11;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c6728);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c6630);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x12;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c6738);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c6640);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x13;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c6748);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c6670);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x14;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x00014000bee0(&uStack_c8,0x1405c66d8);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x1405c6758);
  puStack_70 = &uStack_b8;
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  func_0x0001401441e0(&uStack_a8,0x1405c66b0);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8da0,&puStack_78);
  uStack_80 = 0x15;
  func_0x000140183c00();
  uStack_80 = 0x17;
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  uStack_58 = 0;
  uStack_50 = 0x500000000;
  func_0x000140001490(&uStack_c8,pdVar6);
  puStack_78 = &uStack_c8;
  func_0x00014000bee0(&uStack_b8,0x140657400);
  puStack_70 = &uStack_b8;
  func_0x00014000bee0(&uStack_a8,0x140657400);
  puStack_68 = &uStack_a8;
  func_0x0001401445d0(param_1,param_2,&uStack_58,3,uRam00000001405c8ab0,&puStack_78);
  if ((0x46U >> (uStack_10c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_118);
  }
  if ((0x46U >> (uStack_11c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_128);
  }
  if ((0x46U >> (uStack_12c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_138);
  }
  if ((0x46U >> (uStack_d0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_50._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  if ((0x46U >> (uStack_ec & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&dStack_e8);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  if ((0x46U >> (uStack_bc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
