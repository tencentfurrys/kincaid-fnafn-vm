/// @description FNAFN Obj_Menu_Transition / Step_0 — PORTED from C
// Ground truth: gml_Object_Obj_Menu_Transition_Step_0 (771 B @0x14004ba70)
// Decoded, in order (uStack_80 = 1/3/5/6 are GML line markers):
//   1. global fetch `delta_factor` (id 0x1870b, +8 on the runner global).
//   2. line 1: read image_alpha (slot uRam00000001405c7b98 — REGISTRY-
//      CONFIRMED image_alpha) via op helper func_0x00014015f1a0; multiply
//      0.005 (0x3f747ae147ae147b) by delta_factor (func_0x0001400053f0 =
//      MUL); subtract from image_alpha (func_0x00014000bdb0 = SUB); write
//      back (func_0x000140160140).
//   3. line 3: re-read image_alpha, 3-way compare against -0.5
//      (func_0x00014015be60, 0xbfe0000000000000). Branch taken when
//      (iVar1 != -2) && (iVar1 < 0)  =>  image_alpha < -0.5.
//   4. line 5: 1-arg call on slot uRam00000001405c8c20 (REGISTRY-CONFIRMED
//      surface_free) with the custom variable `surf` (id 0x18779, +8 fetch).
//   5. line 6: 1-arg call on slot uRam00000001405c8cb0 (REGISTRY-CONFIRMED
//      room_goto) with the custom variable `Room_to_go_to` (id 0x18760).
// Reading: the transition overlay fades its image_alpha out at
// 0.005 * delta_factor per step; once it has faded past -0.5 it frees its
// surface and goes to the room stored in Room_to_go_to.
image_alpha -= 0.005 * delta_factor;
if (image_alpha < -0.5) {
    surface_free(surf);
    room_goto(Room_to_go_to);
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Transition_Step_0(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  uint in_stack_ffffffffffffff38;
  ulonglong in_stack_ffffffffffffff40;
  undefined8 *puStack_b8;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  undefined *puStack_88;
  undefined4 uStack_80;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  uint uStack_4c;
  undefined8 uStack_48;
  undefined8 uStack_40;
  undefined8 uStack_38;
  
  uStack_38 = 0xfffffffffffffffe;
  puStack_88 = &UNK_14043a8a2;
  uStack_80 = 0;
  uStack_90 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_90;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_40 = CONCAT44(0xffffff,(undefined4)uStack_40);
  uStack_48 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_80 = 1;
  in_stack_ffffffffffffff40 = in_stack_ffffffffffffff40 & 0xffffffffffffff00;
  in_stack_ffffffffffffff38 = in_stack_ffffffffffffff38 & 0xffffff00;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_68,in_stack_ffffffffffffff38,
                      in_stack_ffffffffffffff40);
  uStack_4c = 0;
  uStack_58 = 0x3f747ae147ae147b;
  func_0x0001400053f0(&uStack_58,uVar2);
  func_0x00014000bdb0(&uStack_68,&uStack_58);
  if ((0x46U >> (uStack_4c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_58);
  }
  func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_68);
  uStack_80 = 3;
  func_0x00014015f1a0(param_1,uRam00000001405c7b98,0x80000000,&uStack_68,
                      in_stack_ffffffffffffff38 & 0xffffff00,
                      in_stack_ffffffffffffff40 & 0xffffffffffffff00);
  uStack_4c = 0;
  uStack_58 = 0xbfe0000000000000;
  iVar1 = func_0x00014015be60(&uStack_68,&uStack_58,uRam00000001405cd9c0,1);
  if ((iVar1 != -2) && (iVar1 < 0)) {
    uStack_80 = 5;
    if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_48);
    }
    uStack_48 = 0;
    uStack_40 = 0x500000000;
    uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18779);
    func_0x000140001490(&uStack_78,uVar2);
    puStack_b8 = &uStack_78;
    func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8c20,&puStack_b8);
    uStack_80 = 6;
    if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_48);
    }
    uStack_48 = 0;
    uStack_40 = 0x500000000;
    uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18760);
    func_0x000140001490(&uStack_78,uVar2);
    puStack_b8 = &uStack_78;
    func_0x0001401445d0(param_1,param_2,&uStack_48,1,uRam00000001405c8cb0,&puStack_b8);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_40._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_48);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  puRam0000000140657668 = (undefined8 *)uStack_90;
  return;
}
END DECOMPILED REFERENCE */
