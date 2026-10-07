/// @description helper: play a directional (emitter) sound once
// PORTED from C
// Ground truth: gml_Script_customfunct_audio_play_sound_directional_single
// (713 B @0x140020620). Same shape as customfunct_audio_play_sound_single
// but the play goes through an emitter, so the helper takes 4 args.
// Decoded from the C (each arg is fetched with an argc bounds check vs
// param_4 that falls back to the default RValue @0x1405c3000 when omitted):
//   1. audio_stop_sound(arg1)  [slot 0x1405c8960, 1-arg call of arg1 --
//      the SAME stop slot the non-directional helper uses on its arg0]
//   2. audio_play_sound_on(arg0, arg1, arg2, arg3)  [slot 0x1405c8980,
//      4-arg call of arg0/arg1/arg2/arg3]
// GML's audio_play_sound_on(sound, emitter, priority, loop) fixes the
// order: arg0=sound, arg1=emitter, arg2=priority, arg3=loop. So the stop
// targets the EMITTER (cuts whatever is already playing on it) -- the
// "single" in the name, same as the non-directional variant.
// The C pre-sets the return RValue to 0 and returns it unchanged, so the
// helper is side-effect only.
// TODO(calibrate): the only reference to this script anywhere in the
// codebase is the gml_GlobalScript_Audio re-export registration
// (scripts/todo/Audio.gml:44, binds script id 0x186fd via the runner's
// id-fetch). That passes NO arguments, so no call site calibrates the
// parameter names. The ARG COUNT and ORDER are certain (argc checks for
// args 1..4 plus the two builtin calls are unambiguous); only the NAMES
// are a best guess.
// CORRECTION vs the skeleton port: the old 2-param form ignored the
// emitter entirely (plain audio_play_sound with a hardcoded priority 10)
// and dropped the audio_stop_sound call.
function customfunct_audio_play_sound_directional_single(sound, emitter, priority, loop) {
    audio_stop_sound(emitter);
    audio_play_sound_on(sound, emitter, priority, loop);
}
