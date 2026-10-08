/// @description FNAFN Obj_Menu_Options_Icons / Mouse_4 — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// 1 sub-event(s): Mouse_4  (one reference block each; port a sub-event by
//  editing its ---- header to PORTED and inserting GML above its block)

// ---- sub-event Mouse_4 — PORTED from C ----
// ground truth: gml_Object_Obj_Menu_Options_Icons_Mouse_4 (967 B @0x1400da150)
// Reads image_index (slot 0x1405c7aa8, EXE-REGISTRY.md) and two-case
// compares it (func_0x00014015be60) against runtime consts @0x140656d60 /
// @0x140656d74 with label table @0x140656d70 (all in .data zero-tail,
// unmapped = runtime). iVar1 == 1 branch opens @0x1405c5750 (patreon),
// == 0 branch opens @0x1405c5720 (gamejolt); slot 0x1405c8fc0 = url_open
// (EXE-REGISTRY.md). Best-fit mapping: image_index 0 -> gamejolt,
// 1 -> patreon.
// Ported: Obj_Menu_Options_Icons / Mouse_4
// TODO(calibrate): case consts @0x140656d60/@0x140656d74 + table @0x140656d70
// are runtime — confirm in-game that image_index 0/1 map as below.
if (image_index == 0) { url_open("https://gamejolt.com/games/FNAF-N/148097"); }
else if (image_index == 1) { url_open("https://www.patreon.com/HStudiosDev"); }

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) WARNING: Globals starting with '_' overlap smaller symbols at the same address * /

void gml_Object_Obj_Menu_Options_Icons_Mouse_4(undefined8 param_1,undefined8 param_2)

{
  int iVar1;
  longlong lVar2;
  longlong unaff_GS_OFFSET;
  undefined4 uVar3;
  uint in_stack_ffffffffffffff08;
  ulonglong in_stack_ffffffffffffff10;
  undefined8 uStack_e8;
  undefined *puStack_e0;
  undefined4 uStack_d8;
  undefined8 uStack_d0;
  uint uStack_c4;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 *puStack_90;
  undefined8 uStack_88;
  undefined4 uStack_80;
  uint uStack_7c;
  undefined8 uStack_78;
  undefined4 uStack_70;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_50;
  undefined8 uStack_48;
  undefined8 uStack_40;
  
  uStack_40 = 0xfffffffffffffffe;
  puStack_e0 = &UNK_14043cafd;
  uStack_e8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_e8;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_48 = CONCAT44(0xffffff,(undefined4)uStack_48);
  uStack_50 = 0;
  uStack_c4 = 0xffffff;
  uStack_d0 = 0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_d8 = 1;
  uRam0000000140657680 = param_1;
  func_0x00014015f1a0(param_1,uRam00000001405c7aa8,0x80000000,&uStack_78,
                      in_stack_ffffffffffffff08 & 0xffffff00,
                      in_stack_ffffffffffffff10 & 0xffffffffffffff00);
  uStack_7c = uStack_6c;
  uStack_80 = uStack_70;
  if ((0x46U >> (uStack_6c & 0x1f) & 1) == 0) {
    uStack_88 = uStack_78;
  }
  else {
    func_0x0001400da830(&uStack_88,&uStack_78);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam0000000140656d88) {
    func_0x0001403f6320(0x140656d88);
    if (iRam0000000140656d88 == -1) {
      uRam0000000140656d6c = 0;
      uRam0000000140656d60 = 0;
      uRam0000000140656d80 = 0x100000000;
      uRam0000000140656d74 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_1400da7a0);
      func_0x0001403f62c0(0x140656d88);
    }
  }
  uVar3 = (undefined4)uRam00000001405cd9c0;
  lVar2 = 0;
  iVar1 = func_0x00014015be60(0x140656d60,&uStack_88,uVar3,0);
  if (iVar1 != 0) {
    iVar1 = func_0x00014015be60(0x140656d74,&uStack_88,uVar3,0);
    if (iVar1 != 0) goto code_r0x0001400da366;
    lVar2 = 1;
  }
  iVar1 = *(int *)(lVar2 * 0x14 + 0x140656d70);
  if (iVar1 == 1) {
    uStack_d8 = 4;
    if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_50);
    }
    uStack_50 = 0;
    uStack_48 = 0x500000000;
    if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    func_0x0001401441e0(&uStack_68,0x1405c5750);
    puStack_90 = &uStack_68;
    func_0x0001401445d0(param_1,param_2,&uStack_50,1,uRam00000001405c8fc0,&puStack_90);
  }
  else if (iVar1 == 0) {
    uStack_d8 = 3;
    if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_50);
    }
    uStack_50 = 0;
    uStack_48 = 0x500000000;
    if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_68);
    }
    func_0x0001401441e0(&uStack_68,0x1405c5720);
    puStack_90 = &uStack_68;
    func_0x0001401445d0(param_1,param_2,&uStack_50,1,uRam00000001405c8fc0,&puStack_90);
  }
code_r0x0001400da366:
  if ((0x46U >> (uStack_7c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_88);
  }
  if ((0x46U >> (uStack_94 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a0);
  }
  if ((0x46U >> (uStack_a4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_b0);
  }
  if ((0x46U >> (uStack_b4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_c0);
  }
  if ((0x46U >> (uStack_c4 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_d0);
  }
  if ((0x46U >> (uStack_48._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_50);
  }
  if ((0x46U >> (uStack_6c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_78);
  }
  if ((0x46U >> (uStack_5c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_68);
  }
  puRam0000000140657668 = (undefined8 *)uStack_e8;
  return;
}
END DECOMPILED REFERENCE */