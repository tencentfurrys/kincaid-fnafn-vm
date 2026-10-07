/// @description helper: play a sound once (stop any running instance first)
// PORTED from C
// Ground truth: gml_Script_customfunct_audio_play_sound_single
// (644 B @0x140020290). Every call site passes argc=3, so the helper takes
// (snd, priority, loop). Decoded from the C:
//   1. audio_stop_sound(snd)  [slot 0x1405c8960, 1-arg call of arg0]
//   2. audio_play_sound(snd, priority, loop)  [slot 0x1405c8970, 3-arg call
//      of arg0/arg1/arg2, each fetched with an argc bounds check that
//      falls back to the default RValue @0x1405c3000 when omitted]
// The C pre-sets the return RValue to 0 and returns it unchanged -- the
// helper is side-effect only (the "single" = the old instance is stopped
// before replaying, so only one instance of the sound runs at a time).
// CORRECTION vs the skeleton port: the old 2-param form hardcoded priority
// 10 and omitted the audio_stop_sound call.
function customfunct_audio_play_sound_single(snd, priority, loop) {
    audio_stop_sound(snd);
    audio_play_sound(snd, priority, loop);
}
