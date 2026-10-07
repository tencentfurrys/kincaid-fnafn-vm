/// @description D&D If Next Room action
// PORTED from C
function action_if_next_room() {
    return room_next(room) >= 0;
}
