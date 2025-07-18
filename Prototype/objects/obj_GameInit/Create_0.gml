// Set fullscreen
window_set_fullscreen(true);

// Toggle fullscreen
if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}

// Global puzzle flag
global.puzzle_active = false;

// Pause flag
global.game_paused = false;

// Prop description (to stop gameplay)
global.prop = false;

// start background music with looping
//audio_play_sound(* sound file asset *, 1, true);	// true = looping

// Any other startup settings