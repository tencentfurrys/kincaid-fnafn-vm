/// @description FNAFN boot globals - globalvar declarations (compile-time only, no C ground truth)
// The YYC build resolved these bare names to globals project-wide: EVERY
// access in the decompiled C goes through the global fetch path
// (verified 2026-10-08 by tight fetch-expression scan: 67 unique true
// globals after excluding 28 script-registration ids; ZERO ids
// use both global and instance paths, so the split is exact). A VM build
// compiles bare names to instance scope unless declared, so without this
// every cross-object read dies with "not set before reading it"
// (delta_factor in Filter Step, game_font in menu Draws, ...).
// This script defines no function; its sole purpose is the declaration.
// Canonical source: scripts/ported/ (wired into scripts/__fnafn_globals/).
globalvar Bonnie_AI_Level, Chica_AI_Level, Foxy_AI_Level, Freddy_AI_Level,
    Mangle_AI_Level, Jumpscare, Night_bonnie_location, Night_camera,
    Night_camera_location, Night_camera_mode, Night_camera_vent_location,
    Night_chica_location, Night_door_back, Night_door_left, Night_door_right,
    Night_foxy_location, Night_freddy_location, Night_mangle_location,
    Night_office_power_slot, Night_office_rotated, Night_power_amount,
    Night_recording, Parallax_enabled, bufferLastFrame, bufferSurface,
    chromatic_enabled, chromatic_magnetude, chromatic_pattern,
    composite_artifact, composite_bleeding, composite_distortion,
    composite_enabled, composite_fringing, composite_secondpass_enabled,
    custom_music, delta_factor, dirt_magnetude, dirt_offset, dirt_pattern,
    game, game_font, game_lines, game_settings, keep_aspect_ratio,
    noise_enabled, noise_magnetude, noise_offset, noise_pattern,
    oldtvfilter_enabled, scanline_count, scanline_enabled, scanline_magnetude,
    scanline_pattern, static_magnetude, static_offset, static_pattern,
    static_scale, surface_height, surface_width, television_brightness,
    television_contrast, television_enabled, television_saturation,
    television_sharpness, tube_distortion, tube_enabled, tube_mask;
