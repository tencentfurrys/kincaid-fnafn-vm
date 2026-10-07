/// @description dbg_log(s): timestamped line to overlay buffer + file (dev only)
function dbg_log(_s) {
    var _t = "[" + string(current_time) + "] " + string(_s);
    if (!variable_global_exists("dbg_lines")) global.dbg_lines = [];
    array_push(global.dbg_lines, _t);
    while (array_length(global.dbg_lines) > 40) array_delete(global.dbg_lines, 0, 1);
    if (variable_global_exists("dbg_file") && global.dbg_file != -1) {
        file_text_write_string(global.dbg_file, _t);
        file_text_writeln(global.dbg_file);
        file_text_flush(global.dbg_file);
    }
}
