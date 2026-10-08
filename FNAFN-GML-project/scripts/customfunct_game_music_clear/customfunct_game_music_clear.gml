/// @description FNAFN script customfunct_game_music_clear — PORTED from C
// Decompiled C reference (exact machine-level semantics):
// Ported: script customfunct_game_music_clear
function customfunct_game_music_clear() {
    for (var i = array_length(custom_music) - 1; i >= 0; i--)
        audio_destroy_stream(custom_music[i][0]);
    show_debug_message("music cleared");
}

/* BEGIN DECOMPILED REFERENCE
// (Ghidra note) Globals starting with '_' overlap smaller symbols at the same address
// - literal slash-star form removed: it would close a GML block comment early.

undefined8 *
gml_Script_customfunct_game_music_clear(undefined8 param_1,undefined8 param_2,undefined8 *param_3)

{
  double dVar1;
  int iVar2;
  undefined4 uVar3;
  undefined8 uVar4;
  undefined8 uVar5;
  longlong *plVar6;
  undefined8 uStack_c8;
  undefined *puStack_c0;
  undefined4 uStack_b8;
  undefined8 uStack_b0;
  undefined8 uStack_a8;
  uint uStack_9c;
  undefined8 *puStack_98;
  undefined8 uStack_90;
  uint uStack_84;
  undefined8 uStack_80;
  uint uStack_74;
  undefined8 uStack_70;
  undefined8 uStack_68;
  undefined8 uStack_60;
  
  uStack_60 = 0xfffffffffffffffe;
  puStack_c0 = &UNK_14043a2e0;
  uStack_b8 = 0;
  uStack_c8 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_c8;
  uStack_9c = 0xffffff;
  uStack_a8 = 0;
  uRam0000000140657680 = param_1;
  uStack_b0 = param_2;
  uVar4 = (**(code **)(*plRam000000014065e080 + 8))(plRam000000014065e080,0x186fc);
  uStack_74 = 0xffffff;
  uStack_80 = 0.0;
  uStack_68 = (ulonglong)(uint)uStack_68;
  uStack_70 = 0;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  func_0x000140144b20(uRam00000001405c9840);
  uStack_b8 = 0x68;
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  uStack_70 = 0;
  uStack_68 = 0x500000000;
  func_0x000140001490(&uStack_a8,uVar4);
  puStack_98 = &uStack_a8;
  uVar5 = func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,uRam00000001405c8ba0,&puStack_98);
  func_0x00014002fc60(&uStack_90,uVar5,1);
  func_0x000140001490(&uStack_80,&uStack_90);
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  dVar1 = _UNK_14043a218;
  while( true ) {
    uStack_84 = 0;
    uStack_90 = 0;
    iVar2 = func_0x00014015be60(&uStack_80,&uStack_90,uRam00000001405cd9c0,1);
    if (iVar2 < 0) break;
    uStack_b8 = 0x6a;
    if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
      func_0x000140001410(&uStack_70);
    }
    uStack_70 = 0;
    uStack_68 = 0x500000000;
    uVar3 = func_0x00014012cd90(&uStack_80);
    plVar6 = (longlong *)func_0x00014002fbe0(uVar4,uVar3);
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
    func_0x000140001490(&uStack_a8,plVar6);
    puStack_98 = &uStack_a8;
    func_0x0001401445d0(param_1,uStack_b0,&uStack_70,1,uRam00000001405c8bb0,&puStack_98);
    switch(uStack_74 & 0xffffff) {
    case 0:
    case 0xd:
      uStack_80 = uStack_80 + dVar1;
      break;
    case 1:
      uStack_80 = (double)func_0x00014012d320(&uStack_80);
      uStack_80 = uStack_80 + dVar1;
      uStack_74 = 0;
      break;
    default:
      func_0x000140005560(&UNK_14043a32c,&uStack_80,&uStack_80);
      break;
    case 7:
      uStack_80 = (double)CONCAT44(uStack_80._4_4_,(int)uStack_80 + -1);
      break;
    case 10:
      uStack_80 = (double)((longlong)uStack_80 + -1);
    }
  }
  uStack_b8 = 0x6c;
  func_0x0001401453a0(&uStack_90,0x1405c3548);
  func_0x000140181c60(&uStack_90);
  if ((0x46U >> (uStack_84 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_90);
  }
  if ((0x46U >> (uStack_68._4_4_ & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_70);
  }
  if ((0x46U >> (uStack_74 & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_80);
  }
  if ((0x46U >> (uStack_9c & 0x1f) & 1) != 0) {
    func_0x000140001410(&uStack_a8);
  }
  puRam0000000140657668 = (undefined8 *)uStack_c8;
  return param_3;
}
END DECOMPILED REFERENCE */