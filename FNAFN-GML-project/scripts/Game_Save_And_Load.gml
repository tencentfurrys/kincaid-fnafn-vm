/// @description FNAFN gml_GlobalScript_Game_Save_And_Load — PORTED from C (YYC re-export stub)
// Ground truth: gml_GlobalScript_Game_Save_And_Load (672 B @0x140038fa0)
// A YYC GlobalScript block is a re-export: it calls the runner's id-registration
// path (a fetch on id 0x18705/0x1870b/... in the annotated C) once per script
// defined below it in GameMaker's original script list, counting them in
// uStack_40. No GML statement runs (param_3 return = undefined; no side
// effects). The functions themselves live in their own gml_Script_* files;
// in a from-source GM project these become plain script assets in order:

// Registered script ids: 0x18703 (customfunct_game_save), 0x18700 (customfunct_game_load), 0x18704 (customfunct_game_save_music), 0x18701 (customfunct_game_load_music), 0x186ff (customfunct_game_create_music_stream), 0x18702 (customfunct_game_music_clear)
// This file intentionally contains no executable GML.

/* BEGIN DECOMPILED REFERENCE
// #### gml_GlobalScript_Game_Save_And_Load  va=0x140038fa0  size=672 ====

undefined8 *
gml_GlobalScript_Game_Save_And_Load(longlong *param_1,undefined8 param_2,undefined8 *param_3)

{
  undefined8 uVar1;
  undefined8 uStack_50;
  undefined *puStack_48;
  undefined4 uStack_40;
  undefined auStack_38 [12];
  uint uStack_2c;
  undefined8 uStack_28;
  
  uStack_28 = 0xfffffffffffffffe;
  puStack_48 = &UNK_14043a308 /* "gml_GlobalScript_Game_Save_And_Load" */;
  uStack_50 = puRam0000000140657668;
  puRam0000000140657668 = &uStack_50;
  plRam0000000140657680 = param_1;
  *(undefined4 *)((longlong)param_3 + 0xc) = 5;
  *param_3 = 0;
  uStack_40 = 1;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18703 /* customfunct_game_save */);
  func_0x0001401452a0(auStack_38,gml_Script_customfunct_game_save,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  uStack_40 = 0x1b;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18700 /* customfunct_game_load */);
  func_0x0001401452a0(auStack_38,gml_Script_customfunct_game_load,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  uStack_40 = 0x38;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18704 /* customfunct_game_save_music */);
  func_0x0001401452a0(auStack_38,gml_Script_customfunct_game_save_music,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  uStack_40 = 0x48;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18701 /* customfunct_game_load_music */);
  func_0x0001401452a0(auStack_38,gml_Script_customfunct_game_load_music,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  uStack_40 = 0x58;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x186ff /* customfunct_game_create_music_stream */);
  func_0x0001401452a0(auStack_38,gml_Script_customfunct_game_create_music_stream,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  uStack_40 = 0x66;
  uVar1 = (**(code **)(*param_1 + 0x10))(param_1,0x18702 /* customfunct_game_music_clear */);
  func_0x0001401452a0(auStack_38,gml_Script_customfunct_game_music_clear,param_1);
  func_0x000140141d00(param_1);
  func_0x000140001490(uVar1,auStack_38);
  func_0x000140141c50(1);
  if ((0x46U >> (uStack_2c & 0x1f) & 1) != 0) {
    func_0x000140001410(auStack_38);
  }
  puRam0000000140657668 = (undefined8 *)uStack_50;
  return param_3;
}
END DECOMPILED REFERENCE */
