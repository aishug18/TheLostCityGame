// Calculate the currently selected glyph based on angle
current_index = round(angle / step_angle) mod 10;
if (current_index < 0) {
	current_index += 10;	// ensure positive
}