/// @description Obj_Debug_Log / Step — heartbeat, room watch, overlay toggle
global.dbg_frames += 1;
var _rn = room_get_name(room);
if (_rn != global.dbg_room) {
    global.dbg_room = _rn;
    dbg_log("room: " + _rn + " inst=" + string(instance_number(all, false)) + " fps=" + string(fps_real));
    if (instance_exists(Obj_Menu_Fade)) {
        dbg_log("fade n=" + string(instance_number(Obj_Menu_Fade, false)));
        with (Obj_Menu_Fade) {
            dbg_log("fade df=" + (variable_instance_exists(self, "delta_factor") ? string(delta_factor) : "MISSING") + " alpha=" + string(image_alpha));
        }
    } else {
        dbg_log("fade: none in room");
    }
}
if (mouse_check_button_pressed(mb_left)) {
    var _gx = device_mouse_x_to_gui(0);
    var _gy = device_mouse_y_to_gui(0);
    if (_gx < 220 && _gy < 220) {
        if (current_time - global.dbg_tap_time < 800) global.dbg_taps += 1;
        else global.dbg_taps = 1;
        global.dbg_tap_time = current_time;
        if (global.dbg_taps >= 3) {
            global.dbg_show = !global.dbg_show;
            global.dbg_taps = 0;
            dbg_log("overlay " + (global.dbg_show ? "on" : "off"));
        }
    }
}
if (global.dbg_frames mod 300 == 0) {
    dbg_log("tick f=" + string(global.dbg_frames));
}

/* BEGIN DECOMPILED REFERENCE
// Hand-written diagnostics object; no decompiled source.
END DECOMPILED REFERENCE */
