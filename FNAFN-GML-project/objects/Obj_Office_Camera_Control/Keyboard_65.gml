/// @description FNAFN Obj_Office_Camera_Control / Keyboard_65 - PORTED from C
// ---- sub-event Keyboard_65 (split from Keyboard.gml) ----
// ground truth: gml_Object_Obj_Office_Camera_Control_Keyboard_65 (577 B @0x140049e00)
// Decoded, in order (uStack_58 = GML line markers). Ids per
// builtin_ids.json: 0x18757 Player_rotating, 0x1873b Night_camera, 0x18747
// Night_office_rotated (triple `== 0` guard reads via +8 fetch +
// compare-helper `iVar1 == 0`); writes via +0x10 fetch: 0x18756
// Player_rotate_cooldown = 15.0 (0x402e000000000000 literal), 0x18758
// Player_rotation_mode -= 1.0 (in-place `-=` helper 0x14000bdb0 with
// 0x3ff0000000000000, per PORTING.md), 0x18757 Player_rotating = 1.0.
// No 0x14065xxxx/0x1405c3xxx consts — all constants are literals.
// Ported: Obj_Office_Camera_Control / Keyboard_65
if (Player_rotating == 0 && Night_camera == 0 && Night_office_rotated == 0) {
    Player_rotate_cooldown = 15;
    Player_rotation_mode -= 1;
    Player_rotating = 1;
}

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Office_Camera_Control_Keyboard_65(longlong *param_1)

{
  int iVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  undefined4 uVar6;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  undefined *puStack_60;
  undefined4 uStack_58;
  undefined8 uStack_50;
  uint uStack_44;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_60 = &UNK_14043a7ba;
  uStack_58 = 0;
  uStack_68 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_68;
  plRam0000000140657680 = param_1;
  uVar2 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873b);
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18747);
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_58 = 1;
  uVar4 = (**(code **)(*param_1 + 8))(param_1,0x18757);
  uStack_44 = 0;
  uStack_50 = 0;
  uVar6 = (undefined4)uRam00000001405cd9c0;
  iVar1 = func_0x00014015be60(uVar4,&uStack_50,uVar6,0);
  if (iVar1 == 0) {
    uStack_44 = 0;
    uStack_50 = 0;
    iVar1 = func_0x00014015be60(uVar2,&uStack_50,uVar6,0);
    if (iVar1 == 0) {
      uStack_44 = 0;
      uStack_50 = 0;
      iVar1 = func_0x00014015be60(uVar3,&uStack_50,uVar6,0);
      if (iVar1 == 0) {
        uStack_58 = 3;
        puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18756);
        if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar5);
        }
        *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
        *puVar5 = 0x402e000000000000;
        uStack_58 = 4;
        uVar2 = (**(code **)(*param_1 + 0x10))(param_1,0x18758);
        uStack_44 = 0;
        uStack_50 = 0x3ff0000000000000;
        func_0x00014000bdb0(uVar2,&uStack_50);
        if ((0x46U >> (uStack_44 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_50);
        }
        uStack_58 = 5;
        puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18757);
        if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
          func_0x000140001410(puVar5);
        }
        *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
        *puVar5 = 0x3ff0000000000000;
      }
    }
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  puRam0000000140657668 = (undefined8 *)uStack_68;
  return;
}
END DECOMPILED REFERENCE */

