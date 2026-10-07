/// @description helper: is the mouse pointer inside this UI button box?
// PORTED from C
// Ground truth: gml_Script_customfunct_ui_button_detection
// (1183 B @0x14003b0e0). Called from every menu/camera UI button handler
// (Obj_Menu_Continue Step, Obj_Menu_Pause Mouse, Obj_Menu_Options Mouse,
// Obj_Menu_Main_Title Mouse/KeyPress, ...). Returns 1 iff the mouse is
// strictly inside the rectangle:
//     mouse_x > argument0                       (left)
//     mouse_x < argument2 + argument4           (right = width + offset)
//     mouse_y > argument1                       (top)
//     mouse_y < argument3                       (bottom)
// Any omitted argument falls back to the default RValue @0x1405c3000
// (= 0.0, the .data base) via the argc bounds checks, so a 2-arg call
// degenerates to a point test (0,0)-(argument2,argument3).
// Helper decode: func_0x00014015ef90(self, slot, 0x80000000, &out) reads a
// builtin property -- slot 0x1405c7bc8 = mouse_x, 0x1405c7bd8 = mouse_y
// (EXE-REGISTRY). func_0x00014015be60(a, b, ...) is the 3-way compare
// (negative = a < b, positive = a > b, -2 = incomparable), and every bound
// here is a strict inequality (`< 0` / `> 0` tests, never `== 0`).
// The success branch loads the constant @0x140439dd0 (= double 1.0) into
// the return RValue; the fall-through path leaves the pre-set 0.
// NOTE: func_0x000140144b20(<own script slot>) in the prologue is runner
// bookkeeping with no GML equivalent -- it appears in 31 scripts, always
// self-tagged, with no data dependency on the argument/return flow.
function customfunct_ui_button_detection(x1, y1, x2, y2, x_offset) {
    if (mouse_x > x1 && mouse_x < x2 + x_offset && mouse_y > y1 && mouse_y < y2) {
        return 1;
    }
    return 0;
}
