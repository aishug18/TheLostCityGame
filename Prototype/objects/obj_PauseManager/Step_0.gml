// Toggle pause
if (keyboard_check_pressed(ord("P"))) {
	is_paused = !is_paused;
}

if (is_paused) {
	global.game_paused = true;
} else {
	global.game_paused = false;
}