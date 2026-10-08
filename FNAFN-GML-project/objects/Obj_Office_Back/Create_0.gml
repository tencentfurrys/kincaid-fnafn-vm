/// @description FNAFN Obj_Office_Back / Create — PORTED from C
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Porting task: express this
// in GML. Call graph and names are intact (see gml_all_414_decompiled.c).
// Ported: Obj_Office_Back / Create
if (game[0] == 0) { power_threshold = 2; } else { power_threshold = 0; } // TODO: consts
toggle = 0;
door_speed = 0;

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

void gml_Object_Obj_Office_Back_Create_0(longlong *param_1)

{
  int iVar1;
  uint uVar2;
  undefined4 uVar3;
  longlong *plVar4;
  undefined8 *puVar5;
  longlong unaff_GS_OFFSET;
  undefined4 uVar6;
  undefined8 uStack_88;
  uint uStack_7c;
  undefined8 uStack_78;
  uint uStack_6c;
  undefined8 uStack_68;
  uint uStack_5c;
  undefined8 uStack_58;
  undefined *puStack_50;
  undefined4 uStack_48;
  longlong lStack_40;
  undefined4 uStack_38;
  uint uStack_34;
  undefined8 uStack_30;
  
  uStack_30 = 0xfffffffffffffffe;
  puStack_50 = &UNK_14043add8;
  uStack_48 = 0;
  uStack_58 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_58;
  plRam0000000140657680 = param_1;
  plVar4 = (longlong *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x18724);
  uStack_7c = 0xffffff;
  uStack_88 = 0;
  uStack_6c = 0xffffff;
  uStack_78 = 0;
  uStack_5c = 0xffffff;
  uStack_68 = 0;
  uStack_48 = 1;
  if (((*(uint *)((longlong)plVar4 + 0xc) & 0xffffff) == 2) && (*plVar4 != 0)) {
    func_0x0001401479b0();
    iVar1 = func_0x000140147990(*plVar4);
    if (iVar1 < 1) {
      uVar3 = func_0x000140147990(*plVar4);
      plVar4 = (longlong *)0x0;
      func_0x000140144260(&UNK_140439ca6,0,uVar3);
    }
    else {
      plVar4 = (longlong *)func_0x000140147980(*plVar4,0);
    }
  }
  else {
    func_0x000140144260(&UNK_140439cd8);
  }
  uStack_34 = *(uint *)((longlong)plVar4 + 0xc);
  uStack_38 = *(undefined4 *)(plVar4 + 1);
  if ((0x46U >> (uStack_34 & 0x1f) & 1) == 0) {
    lStack_40 = *plVar4;
  }
  else {
    func_0x00014005d1c0(&lStack_40,plVar4);
  }
  if (*(int *)(*(longlong *)(*(longlong *)(unaff_GS_OFFSET + 0x58) + (ulonglong)__tls_index * 8) + 4
              ) < iRam00000001406556d4) {
    func_0x0001403f6320(0x1406556d4);
    if (iRam00000001406556d4 == -1) {
      uRam00000001406556cc = 0;
      uRam00000001406556c0 = 0x3ff0000000000000;
      func_0x0001403f6668(&DAT_14005d160);
      func_0x0001403f62c0(0x1406556d4);
    }
  }
  uVar2 = func_0x00014015be60(0x1406556c0,&lStack_40,uRam00000001405cd9c0,0);
  if ((uVar2 | uRam00000001406556cc._4_4_) == 0) {
    uStack_48 = 3;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875b);
    uVar3 = (undefined4)_UNK_140439e68;
    uVar6 = (undefined4)((ulonglong)_UNK_140439e68 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
  }
  else {
    uStack_48 = 4;
    puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x1875b);
    uVar3 = (undefined4)_UNK_14043add0;
    uVar6 = (undefined4)((ulonglong)_UNK_14043add0 >> 0x20);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = CONCAT44(uVar6,uVar3);
  uStack_48 = 7;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18793);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  uStack_48 = 9;
  puVar5 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x18710);
  if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar5);
  }
  *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
  *puVar5 = 0;
  if ((0x46U >> (uStack_34 & 0x1f) & 1) != 0) {
    func_0x000140001410(&lStack_40);
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
  puRam0000000140657668 = (undefined8 *)uStack_58;
  return;
}
END DECOMPILED REFERENCE */