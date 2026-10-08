/// @description FNAFN Obj_Night_Camera_Map / Step — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Night_Camera_Map / Step
customfunct_image_speed_delta(0.025);
if (mouse_x > 2077) {
    if (mouse_y > 282) {
        if (Night_recording == 0) { image_alpha = 0.95; }
        else if (Night_camera_mode == "music") { image_alpha = 1; }
        else { image_alpha = 0.45; }
    } else if (Night_camera_mode == "music") { image_alpha = 1; }
    else { image_alpha = 0.45; }
} else if (Night_camera_mode == "music") { image_alpha = 1; }
else { image_alpha = 0.45; }

/* BEGIN DECOMPILED REFERENCE
void gml_Object_Obj_Night_Camera_Map_Step_0(undefined8 param_1,undefined8 param_2)

{
  undefined8 uVar1;
  int iVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 *puStack_110;
  undefined8 uStack_108;
  uint uStack_fc;
  undefined8 uStack_f8;
  uint uStack_ec;
  undefined8 uStack_e8;
  uint uStack_dc;
  undefined8 uStack_d8;
  uint uStack_cc;
  undefined8 uStack_c8;
  undefined8 uStack_c0;
  undefined8 uStack_b8;
  uint uStack_ac;
  undefined8 uStack_a8;
  undefined *puStack_a0;
  undefined4 uStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  uint uStack_54;
  undefined8 uStack_50;
  
  uStack_50 = 0xfffffffffffffffe;
  puStack_a0 = &UNK_14043c6b5;
  uStack_98 = 0;
  uStack_a8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_a8;
  uStack_ac = 0xffffff;
  uStack_b8 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  uRam0000000140657680 = param_1;
  uVar3 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18749);
  uStack_54 = 0xffffff;
  uStack_60 = 0;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1873d);
  uStack_fc = 0xffffff;
  uStack_108 = 0;
  uStack_ec = 0xffffff;
  uStack_f8 = 0;
  uStack_dc = 0xffffff;
  uStack_e8 = 0;
  uStack_cc = 0xffffff;
  uStack_d8 = 0;
  uStack_98 = 1;
  uStack_c8 = 0;
  uStack_c0 = 0x500000000;
  func_0x00014000bee0(&uStack_b8,0x1405c5338);
  puStack_110 = &uStack_b8;
  gml_Script_customfunct_image_speed_delta(param_1,param_2,&uStack_c8,1,&puStack_110);
  uStack_98 = 3;
  func_0x00014015ef90(param_1,uRam00000001405c7bc8,0x80000000,&uStack_90);
  uStack_64 = 0;
  uStack_70 = 0x40a03a0000000000;
  iVar2 = func_0x00014015be60(&uStack_90,&uStack_70,uRam00000001405cd9c0,1);
  if (0 < iVar2) {
    func_0x00014015ef90(param_1,uRam00000001405c7bd8,0x80000000,&uStack_80);
    uVar1 = uRam00000001405cd9c0;
    uStack_64 = 0;
    uStack_70 = 0x4071a00000000000;
    iVar2 = func_0x00014015be60(&uStack_80,&uStack_70,uRam00000001405cd9c0,1);
    if (0 < iVar2) {
      uStack_64 = 0;
      uStack_70 = 0;
      iVar2 = func_0x00014015be60(uVar3,&uStack_70,uVar1,0);
      if (iVar2 == 0) {
        uStack_98 = 5;
        if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
          func_0x000140001410(&uStack_60);
        }
        uStack_54 = 0;
        uStack_60 = 0x3fee666666666666;
        func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
        goto code_r0x0001400c5028;
      }
    }
  }
  uStack_98 = 9;
  func_0x0001401453a0(&uStack_70,0x1405c5330);
  iVar2 = func_0x00014015be60(uVar4,&uStack_70,uRam00000001405cd9c0,0);
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if (iVar2 == 0) {
    uStack_98 = 0xb;
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    uStack_54 = 0;
    uStack_60 = 0x3ff0000000000000;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
  }
  else {
    uStack_98 = 0xf;
    if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_60);
    }
    uStack_54 = 0;
    uStack_60 = 0x3fdccccccccccccd;
    func_0x000140160140(param_1,uRam00000001405c7b98,0x80000000,&uStack_60);
  }
code_r0x0001400c5028:
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
  if ((0x46U >> (uStack_c0._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c8);
  }
  if ((0x46U >> (uStack_54 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_60);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_ac & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_a8;
  return;
}
END DECOMPILED REFERENCE */