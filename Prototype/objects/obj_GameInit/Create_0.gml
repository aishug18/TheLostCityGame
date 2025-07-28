// Set fullscreen
window_set_fullscreen(true);

// Toggle fullscreen
if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}

// Global puzzle flag
global.puzzle_active = false;

// Prop description (to stop gameplay)
global.prop = false;

// Store collected clues for each level
global.level_1_clues = [];
global.level_2_clues = [];
global.level_3_clues = [];
global.level_4_clues = [];

// Any other startup settings