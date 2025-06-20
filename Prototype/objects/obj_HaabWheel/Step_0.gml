// Rotate the wheel if active
if(is_active) {
	if (keyboard_check_pressed(vk_right)) {
		angle -= step_angle;
	}
	if (keyboard_check_pressed(vk_left)) {
		angle += step_angle;
	}

	// Calculate the currently selected glyph based on angle
	current_index = round(angle / step_angle) mod 19;
	if (current_index < 0) {
		current_index += 19;	// ensure positive
	}
}