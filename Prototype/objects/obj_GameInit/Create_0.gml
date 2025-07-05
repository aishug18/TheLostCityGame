// Set fullscreen
window_set_fullscreen(true);

// Toggle fullscreen
if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}

// Global puzzle flag
global.puzzle_active = false;

// Create puzzle manager
if (!instance_exists(obj_PuzzleManager)) {
    instance_create_layer(x, y, "Instances", obj_PuzzleManager);
}

// Any other startup settings
