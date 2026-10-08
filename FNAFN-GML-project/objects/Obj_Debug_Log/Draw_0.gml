/// @description Obj_Debug_Log / Draw — surface-presentation probe (red border = app surface alive)
draw_set_alpha(1);
draw_set_color(c_red);
draw_rectangle(0, 0, 40, 40, false);
draw_rectangle(display_get_width() - 40, display_get_height() - 40, display_get_width(), display_get_height(), false);
draw_set_color(c_white);

/* BEGIN DECOMPILED REFERENCE
// Hand-written diagnostics object; no decompiled source.
END DECOMPILED REFERENCE */
