// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "Time for the puzzle!!";
	draw_dialogue_box(message);
}