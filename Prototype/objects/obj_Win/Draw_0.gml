// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "You win!! Touch the flag to end the game.";
	draw_dialogue_box(message);
}