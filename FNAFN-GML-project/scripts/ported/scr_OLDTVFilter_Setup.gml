/// @description FNAFN scr_OLDTVFilter_Setup - SURFACE-CHAIN BOOTSTRAP SHIM (full port pending)
// Ground truth: gml_Script_scr_OLDTVFilter_Setup (11040 B @0x14002fff0).
// The real Setup builds the whole OLDTV filter chain (surface ping-pong,
// shader uniform defaults, resource table); it needs SHADER resources that
// are not imported yet, so a full port waits on that. This bootstrap
// replicates ONLY the boot-critical observable effects decoded from the C:
//   surface_width (0x1877c) = surface_get_width(application_surface),
//   surface_height (0x1877b) = surface_get_height(application_surface)
//     [slots 0x1405c8ae0/0x1405c8af0, 1 arg];
//   bufferLastFrame (0x186e8) = surface_create(w, h);
//   bufferSurface (0x186e9)[0] = surface_create(w, h);
//   bufferSurface (0x186e9)[1] = surface_create(w, h)
//     [slot 0x1405c8a60, 2 args; three separate surfaces].
// Without these, Obj_Menu_Transition/Create dies indexing bufferSurface[0]
// (first observed failure: custom-night menu Enter -> Loading room).
// NOTE: runs unguarded on every call (like the original's per-Create
// invocation); surfaces leak until the full port manages the lifecycle.
// TODO(port): full 11 KB decode (uniform table, uVar4..uVar36 assignments,
// ping-pong discipline) + import real shaders; then remove this shim.
// NOTE: scripts/todo/scr_OLDTVFilter_Setup.gml holds the YYC GlobalScript
// re-export stub; THIS file (scripts/ported/) is the compiled implementation.
function scr_OLDTVFilter_Setup() {
    // At boot this runs (via Filter Alarm_0) before the first draw, when
    // application_surface does not exist yet (proven in MINI:
    // surface_exists(application_surface) == 0 in Create). Fall back to
    // room size so surface_create gets valid dims.
    if (surface_exists(application_surface)) {
        surface_width = surface_get_width(application_surface);
        surface_height = surface_get_height(application_surface);
    } else {
        surface_width = room_width;
        surface_height = room_height;
    }
    bufferLastFrame = surface_create(surface_width, surface_height);
    bufferSurface = [surface_create(surface_width, surface_height), surface_create(surface_width, surface_height)];
    var _tf = file_text_open_append(working_directory + "surftrace.txt");
    file_text_write_string(_tf, "SETUP w=" + string(surface_width) + " h=" + string(surface_height) + " lf=" + string(bufferLastFrame) + " b0=" + string(bufferSurface[0]) + " b1=" + string(bufferSurface[1]) + "\n");
    file_text_close(_tf);
    return 0;
}
