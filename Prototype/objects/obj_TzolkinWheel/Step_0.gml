// Calculate the currently selected glyph based on angle
current_index = round(angle / step_angle) mod 8;
if (current_index < 0) {
	current_index += 8;	// ensure positive
}