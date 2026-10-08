/// @description FNAFN Obj_Menu_Transition / Draw_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Transition_Draw_0 (1068 B @0x14004c010)
// Decoded, in order (uStack_110 = 1/2 are GML line markers):
//   1. line 1: fetch custom variable `surf` (id 0x18779, +8 on self), then
//      a 1-arg call on slot uRam00000001405c8a50 (REGISTRY-CONFIRMED
//      surface_exists); boolean-coerce the result (func_0x00014012bb70).
//   2. line 2 (only if surface_exists(surf)): read image_alpha (slot
//      uRam00000001405c7b98 via op helper func_0x00014015f1a0), then an
//      8-arg call on slot uRam00000001405c8d70 (REGISTRY-CONFIRMED
//      draw_surface_ext). C arg order (puStack_160..128):
//        (surf, 0x140655520, 0x140655520, 0x1405c39b0, 0x1405c39b0,
//         0x140655520, 0x1405c39c0, image_alpha)
//      Resolved from the exe (exe_strings.py):
//        0x1405c39b0 = double 1.0  -> xscale/yscale
//        0x1405c39c0 = double 16777215.0 -> c_white (colour)
//        0x140655520 = runtime const (0x14065xxxx, outside the exe image)
//      used for x, y AND rot -- 0 by convention for a fullscreen surface.
// Reading: draw the transition surface fullscreen, tinted white, at the
// object's fading image_alpha (the Step event decrements it).
if (surface_exists(surf)) {
    // TODO(calibrate): x/y/rot are the unresolved runtime const @0x140655520.
    draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, image_alpha);
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Transition_Draw_0(longlong *param_1,undefined8 param_2)

{
  char cVar1;
  undefined8 uVar2;
  uint uVar3;
  undefined8 **ppuVar4;
  undefined8 *puStack_168;
  undefined8 *puStack_160;
  undefined8 *puStack_158;
  undefined8 *puStack_150;
  undefined8 *puStack_148;
  undefined8 *puStack_140;
  undefined8 *puStack_138;
  undefined8 *puStack_130;
  undefined8 *puStack_128;
  undefined8 uStack_120;
  undefined *puStack_118;
  undefined4 uStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  undefined8 uStack_f0;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  uint uStack_bc;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  undefined4 uStack_38;
  uint uStack_34;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_118 = &UNK_14043a8c8;
  uStack_120 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_120;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_bc = 0xffffff;
  uStack_c8 = 0;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_34 = 0xffffff;
  uStack_40 = 0;
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_110 = 1;
  uStack_f8 = 0;
  uStack_f0 = 0x500000000;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18779);
  func_0x000140001490(&uStack_e8,uVar2);
  ppuVar4 = &puStack_168;
  uVar3 = uRam00000001405c8a50;
  puStack_168 = &uStack_e8;
  uVar2 = func_0x0001401445d0(param_1,param_2,&uStack_f8,1,uRam00000001405c8a50,ppuVar4);
  cVar1 = func_0x00014012bb70(uVar2);
  if (cVar1 != '\0') {
    uStack_110 = 2;
    if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_40);
    }
    uStack_40 = 0;
    uStack_38 = 0;
    uStack_34 = 5;
    uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18779);
    func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_50,uVar3 & 0xffffff00,
                        (ulonglong)ppuVar4 & 0xffffffffffffff00);
    func_0x000140001490(&uStack_d8,uVar2);
    puStack_160 = &uStack_d8;
    func_0x00014000bee0(&uStack_c8,0x140655520);
    puStack_158 = &uStack_c8;
    func_0x00014000bee0(&uStack_b8,0x140655520);
    puStack_150 = &uStack_b8;
    func_0x00014000bee0(&uStack_a8,0x1405c39b0);
    puStack_148 = &uStack_a8;
    func_0x00014000bee0(&uStack_98,0x1405c39b0);
    puStack_140 = &uStack_98;
    func_0x00014000bee0(&uStack_88,0x140655520);
    puStack_138 = &uStack_88;
    func_0x00014000bee0(&uStack_78,0x1405c39c0);
    puStack_130 = &uStack_78;
    func_0x000140001490(&uStack_68,&uStack_50);
    puStack_128 = &uStack_68;
    func_0x0001401445d0(param_1,param_2,&uStack_40,8,uRam00000001405c8d70,&puStack_160);
  }
  if ((0x46U >> (uStack_fc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_108);
  }
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_40);
  }
  if ((0x46U >> (uStack_f0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_f8);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_8c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_98);
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
  if ((0x46U >> (uStack_cc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d8);
  }
  if ((0x46U >> (uStack_dc & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_120;
  return;
}
END DECOMPILED REFERENCE */
