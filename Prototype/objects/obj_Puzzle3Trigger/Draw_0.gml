// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "Press Enter to solve a puzzle!";
	draw_dialogue_box(message);
}