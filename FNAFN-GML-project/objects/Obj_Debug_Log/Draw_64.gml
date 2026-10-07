/// @description Obj_Debug_Log / Draw GUI — on-screen log overlay (triple-tap top-left toggles)
if (!variable_global_exists("dbg_show") || !global.dbg_show) exit;
var _total = array_length(global.dbg_lines);
var _n = min(_total, 18);
draw_set_alpha(0.65);
draw_set_color(c_black);
draw_rectangle(8, 8, 620, 8 + 24 * (_n + 1) + 8, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(16, 12, "FNAFN DBG r=" + string(global.dbg_room) + " f=" + string(global.dbg_frames));
for (var i = 0; i < _n; i += 1) {
    draw_text(16, 36 + 24 * i, global.dbg_lines[_total - _n + i]);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);

/* BEGIN DECOMPILED REFERENCE
// Hand-written diagnostics object; no decompiled source.
END DECOMPILED REFERENCE */
