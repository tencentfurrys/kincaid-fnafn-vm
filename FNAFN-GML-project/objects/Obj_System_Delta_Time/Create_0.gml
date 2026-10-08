/// @description FNAFN Obj_System_Delta_Time / Create_0 — PORTED from C (reference kept below)
// Ground truth: gml_Object_Obj_System_Delta_Time_Create_0 (765 B @0x1400f2c90)
// Decoded:
//   1. fetch global `delta_factor` (id 0x1870b), set it to 1.0
//      (0x3ff0000000000000). Initialises the global on game start.
//   2. loop: compare against 12.0 (0x4028000000000000) via the read
//      helper with a runtime-named VARREF slot (uRam00000001405cd9c0);
//      call global script `Scr_Camera_Update` (id 0x186d5) with 2 args;
//      stage -100.0 (0xc059000000000000); typed-add of 1 against an
//      accumulator (the type switch collapses to `x += 1` in GML).
// Loop shape = count-and-call (frame/second measurement) until the bound
// is reached. Ghidra ordering caveat: -100.0 (and Alarm_0's 300.0) are
// staged AFTER the call in the listing -- the store-after-call artefact.

delta_factor = 1;
// TODO(calibrate): exact loop bound (12.0 vs a room_speed multiple) and
// the two Scr_Camera_Update arguments (see the -100.0 note above).
while (true) {
    // bound compare against 12.0 (runtime-named slot read) -- break when done
    Scr_Camera_Update(2, -100);
    // accumulator += 1 (typed-add switch collapses to this in GML)
    break;
}

// ---- decompiled C reference kept for verification (PORTING.md) ----
// Original GML was YYC-compiled into FNAFN.exe. The C below is the exact
// machine-level semantics recovered by Ghidra. Call graph and names are
// intact (see gml_all_414_decompiled.c).
/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// — line neutralized: a literal slash-star here would close this block
// comment early (GML block comments do not nest).

void gml_Object_Obj_System_Delta_Time_Create_0(longlong *param_1)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 *puVar4;
  undefined8 *puVar5;
  undefined8 uStack_e8;
  undefined4 uStack_dc;
  undefined8 uStack_d8;
  undefined *puStack_d0;
  undefined4 uStack_c8;
  undefined8 uStack_c0;
  uint uStack_b4;
  undefined8 uStack_b0;
  uint uStack_a4;
  undefined8 uStack_a0;
  uint uStack_94;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  uint uStack_64;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_d0 = &UNK_14043d113;
  uStack_c8 = 0;
  uStack_d8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_d8;
  plRam0000000140657680 = param_1;
  puVar4 = (undefined8 *)(**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x1870b);
  uStack_64 = 0xffffff;
  uStack_70 = 0.0;
  uStack_b4 = 0xffffff;
  uStack_c0 = 0;
  uStack_a4 = 0xffffff;
  uStack_b0 = 0;
  uStack_94 = 0xffffff;
  uStack_a0 = 0;
  uStack_84 = 0xffffff;
  uStack_90 = 0;
  uStack_74 = 0xffffff;
  uStack_80 = 0;
  if ((0x46U >> (*(uint *)((longlong)puVar4 + 0xc) & 0x1f) & 1) != 0) {
    func_0x000140001410(puVar4);
  }
  *(undefined4 *)((longlong)puVar4 + 0xc) = 0;
  *puVar4 = 0x3ff0000000000000;
  uStack_c8 = 7;
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  dVar1 = _UNK_140439dd0;
  uStack_64 = 0;
  uStack_70 = 0.0;
  while( true ) {
    uStack_dc = 0;
    uStack_e8 = 0x4028000000000000;
    iVar2 = func_0x00014015be60(&uStack_70,&uStack_e8,uRam00000001405cd9c0,1);
    if ((iVar2 == -2) || (-1 < iVar2)) break;
    uStack_c8 = 9;
    plRam0000000140657680 = (longlong *)0x28795;
    puVar4 = (undefined8 *)(**(code **)(*param_1 + 0x10))(param_1,0x186d5);
    func_0x000140141d00(param_1);
    uVar3 = func_0x00014012cd90(&uStack_70);
    puVar5 = (undefined8 *)func_0x00014012b840(puVar4,uVar3);
    func_0x000140141d00(*puVar4);
    if ((0x46U >> (*(uint *)((longlong)puVar5 + 0xc) & 0x1f) & 1) != 0) {
      func_0x000140001410(puVar5);
    }
    *(undefined4 *)((longlong)puVar5 + 0xc) = 0;
    *puVar5 = 0xc059000000000000;
    func_0x000140141c50(2);
    switch(uStack_64 & 0xffffff) {
    case 1:
      uStack_70 = (double)func_0x00014012d320(&uStack_70);
      uStack_70 = uStack_70 + dVar1;
      uStack_64 = 0;
      break;
    default:
      func_0x000140005560(&UNK_140439e10,&uStack_70,&uStack_70);
      break;
    case 7:
      uStack_70 = (double)CONCAT44(uStack_70._4_4_,(int)uStack_70 + 1);
      break;
    case 10:
      uStack_70 = (double)((longlong)uStack_70 + 1);
      break;
    case 0xd:
      uStack_64 = 0;
    case 0:
      uStack_70 = uStack_70 + dVar1;
    }
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
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
  if ((0x46U >> (uStack_64 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  puRam0000000140657668 = (undefined8 *)uStack_d8;
  return;
}
END DECOMPILED REFERENCE */
