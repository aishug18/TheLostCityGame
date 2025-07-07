// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "You win!! Click anywhere to end the game.";
	draw_dialogue_box(message);
}