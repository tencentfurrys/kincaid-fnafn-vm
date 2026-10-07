/// @description FNAFN Obj_Menu_Continue / KeyPress_69 - PORTED from C
// ---- sub-event KeyPress_69 (split from KeyPress.gml) ----
// ground truth: gml_Object_Obj_Menu_Continue_KeyPress_69 (921 B @0x140055ff0)
// Decoded (uStack_b0 = 1/3/5/7/9/10 are GML line markers):
//   1. line 1: read draw_alpha (id 0x18712); 3-way compare against 0.95
//      (0x3fef333333333333, func_0x00014015be60; `0 < iVar1`) => gate the
//      confirm key until the screen has faded in.
//   3. line 3: read select (0x1876a); compare == 6.0 (0x4018...). Branch:
//      1-arg call on slot 0x1405c8cb0 (REGISTRY-CONFIRMED room_goto) with
//      runtime const 0x140655570. That address sits in .data's
//      zero-initialized tail (vsize 0x2fac9c vs rawsize 0x91e00) => the
//      value is 0 => room_goto(0) = Rm_Menu_Custom_Night (room_names.json).
//      select 6 is the "custom  night" entry -> correct target.
//   5/7/9/10. select == 7.0 (0x401c...) branch: instance_create_layer(32,
//      160, "Main_menu", Obj_Menu_Main_Title) — consts 0x1405c3d58 = 32.0,
//      0x1405c3d68 = 160.0, string 0x1405c3d48 = "Main_menu",
//      0x1405c3d78 = 63.0 -> obj_names.json 63 — then instance_destroy()
//      (func_0x00014017c070(self, other, 0, 0), PROVEN 2026-10-06). select
//      7 is the "exit" entry: hand control to the main menu and remove the
//      continue-screen controller (same shape as KeyPress_81/Q).
if (draw_alpha > 0.95) {
    if (select == 6) {
        room_goto(Rm_Menu_Custom_Night);
    }
    if (select == 7) {
        instance_create_layer(32, 160, "Main_menu", Obj_Menu_Main_Title);
        instance_destroy();
    }
}
/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Menu_Continue_KeyPress_69(longlong *param_1,undefined8 param_2)

{
  int iVar1;
  undefined8 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined8 *puStack_108;
  undefined8 *puStack_100;
  undefined8 *puStack_f8;
  undefined8 *puStack_f0;
  undefined8 uStack_e0;
  uint uStack_d4;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  undefined *puStack_b8;
  undefined4 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 uStack_98;
  uint uStack_8c;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_60;
  undefined4 uStack_54;
  undefined8 uStack_50;
  undefined4 uStack_48;
  uint uStack_44;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_b8 = &UNK_14043aa4e;
  uStack_c0 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c0;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uStack_8c = 0xffffff;
  uStack_98 = 0;
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_44 = 0xffffff;
  uStack_50 = 0;
  uStack_d4 = 0xffffff;
  uStack_e0 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b0 = 1;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*param_1 + 8))(param_1,0x18712);
  uStack_54 = 0;
  uStack_60 = 0x3fef333333333333;
  iVar1 = func_0x00014015be60(uVar2,&uStack_60,uRam00000001405cd9c0,1);
  if (0 < iVar1) {
    uStack_b0 = 3;
    uVar2 = (**(code **)(*param_1 + 8))(param_1,0x1876a);
    uStack_54 = 0;
    uStack_60 = 0x4018000000000000;
    uVar3 = (undefined4)uRam00000001405cd9c0;
    uVar4 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    iVar1 = func_0x00014015be60(uVar2,&uStack_60,uRam00000001405cd9c0,0);
    if (iVar1 == 0) {
      uStack_b0 = 5;
      if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0;
      uStack_44 = 5;
      func_0x00014000bee0(&uStack_a8,0x140655570);
      puStack_108 = &uStack_a8;
      func_0x0001401445d0(param_1,param_2,&uStack_50,1,uRam00000001405c8cb0,&puStack_108);
      uVar3 = (undefined4)uRam00000001405cd9c0;
      uVar4 = (undefined4)((ulonglong)uRam00000001405cd9c0 >> 0x20);
    }
    uStack_b0 = 7;
    uStack_54 = 0;
    uStack_60 = 0x401c000000000000;
    iVar1 = func_0x00014015be60(uVar2,&uStack_60,CONCAT44(uVar4,uVar3),0);
    if (iVar1 == 0) {
      uStack_b0 = 9;
      if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_50);
      }
      uStack_50 = 0;
      uStack_48 = 0;
      uStack_44 = 5;
      (**(code **)(*param_1 + 8))(param_1,0x1876a);
      func_0x00014000bee0(&uStack_a8,0x1405c3d58);
      puStack_108 = &uStack_a8;
      func_0x00014000bee0(&uStack_98,0x1405c3d68);
      puStack_100 = &uStack_98;
      if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
        func_0x000140001410(&uStack_88);
      }
      func_0x0001401441e0(&uStack_88,0x1405c3d48);
      puStack_f8 = &uStack_88;
      func_0x00014000bee0(&uStack_78,0x1405c3d78);
      puStack_f0 = &uStack_78;
      func_0x0001401445d0(param_1,param_2,&uStack_50,4,uRam00000001405c8d90,&puStack_108);
      uStack_b0 = 10;
      func_0x00014017c070(param_1,param_2,0,0);
    }
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_d4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_e0);
  }
  if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
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
  puRam0000000140657668 = (undefined8 *)uStack_c0;
  return;
}
END DECOMPILED REFERENCE */

