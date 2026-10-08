/// @description Obj_Debug_Log / Create — dev-only log catcher (strip before release)
global.dbg_lines = [];
global.dbg_show = true;
global.dbg_taps = 0;
global.dbg_tap_time = 0;
global.dbg_room = "";
global.dbg_frames = 0;
global.dbg_crash = "";
global.dbg_file = -1;
exception_unhandled_handler(function(_ex) {
    global.dbg_crash = string(_ex.message);
    if (variable_global_exists("dbg_lines")) dbg_log("CRASH: " + global.dbg_crash);
});
var _f = file_text_open_write(working_directory + "fnafn_log.txt");
if (_f != -1) global.dbg_file = _f;
dbg_log("boot: FNAFN VM dev");
dbg_log("display " + string(display_get_width()) + "x" + string(display_get_height()));

/* BEGIN DECOMPILED REFERENCE
// Hand-written diagnostics object; no decompiled source.
END DECOMPILED REFERENCE */
