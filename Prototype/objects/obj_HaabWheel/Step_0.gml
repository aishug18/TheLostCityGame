// Calculate the currently selected glyph based on angle
current_index = round(angle / step_angle) mod 4;
if (current_index < 0) {
	current_index += 4;	// ensure positive
}