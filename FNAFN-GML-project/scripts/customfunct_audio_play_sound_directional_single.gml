/// @description helper: play a directional (emitter) sound once
// PORTED from C
// Ground truth: gml_Script_customfunct_audio_play_sound_directional_single
// (713 B @0x140020620). Same shape as customfunct_audio_play_sound_single
// but the play goes through an emitter, so the helper takes 4 args.
// Decoded from the C (each arg is fetched with an argc bounds check vs
// param_4 that falls back to the default RValue @0x1405c3000 when omitted):
//   1. audio_stop_sound(arg1)  [slot 0x1405c8960, 1-arg call of arg1 --
//      the SAME stop slot the non-directional helper uses on its arg0
//      (its snd), so arg1 is the SOUND]
//   2. audio_play_sound_on(arg0, arg1, arg2, arg3)  [slot 0x1405c8980,
//      4-arg call of arg0/arg1/arg2/arg3]
// GML's audio_play_sound_on(emitter, sound, loop, priority) fixes the
// order (manual + forum confirmation; note loop/priority are SWAPPED vs
// audio_play_sound(sound, priority, loop)): arg0=emitter, arg1=sound,
// arg2=loop, arg3=priority. So the stop targets the SOUND (cuts the
// previous instance before replaying) -- the "single" in the name, same
// as the non-directional variant.
// CORRECTION 2026-10-08: the first port had the params as
// (sound, emitter, priority, loop) with audio_stop_sound(emitter) --
// backwards on all four positions (the builtin order was misremembered).
// Every repo call site already passes (emitter, sound, ...) -- e.g.
// Obj_Office_Front_Left/Mouse_4: directional_single(door_emitter, 15,
// ...) -- and Foxy Alarm_1 passes (Foxy_emitter var, 43=Snd_Foxy_Door),
// which only makes sense as (emitter, sound). No call-site changes needed.
// The C pre-sets the return RValue to 0 and returns it unchanged, so the
// helper is side-effect only.
// TODO(calibrate): every observed call site passes the SAME runtime-pool
// const for loop+priority (e.g. @0x1406563f8 twice in Foxy Alarm_1), so
// the loop-vs-priority split is positional only; the shared VALUE needs
// pool decode (pool-map.json has no 0x1406563f8 entry yet).
// CORRECTION vs the skeleton port: the old 2-param form ignored the
// emitter entirely (plain audio_play_sound with a hardcoded priority 10)
// and dropped the audio_stop_sound call.
function customfunct_audio_play_sound_directional_single(emitter, sound, loop, priority) {
    audio_stop_sound(sound);
    audio_play_sound_on(emitter, sound, loop, priority);
}
