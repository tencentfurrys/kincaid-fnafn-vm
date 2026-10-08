/// @description FNAFN draw_lensflare - SIGNATURE SHIM (real port pending)
// TEMPORARY no-op, 2026-10-08: the real gml_Script_draw_lensflare is
// 23,529 B of C (@0x14000c0b0) -- the office lens-flare renderer (draws
// sprites 16=Siris / 4=Sglow / 39=Sring per sprite_names.json).
// This shim exists ONLY so the project compiles now that script bodies
// really link (previously the empty stub skipped arity checks); call sites
// in Obj_Office_Back/Draw_0 (x2) and Obj_Office_Front_Middle/Draw_0 pass
// 8 args. Lens-flare glow is currently MISSING in-game.
// TODO(port): replace with the real decode from the C reference.
// NOTE: scripts/todo/draw_lensflare.gml holds the YYC GlobalScript
// re-export stub (registration only); THIS file (scripts/ported/) is the
// compiled implementation (ported/ wins on collision).
function draw_lensflare(_a0, _a1, _a2, _a3, _a4, _a5, _a6, _a7) {
}
