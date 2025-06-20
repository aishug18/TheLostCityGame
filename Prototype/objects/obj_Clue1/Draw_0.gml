// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "This is a clue!! Wheel 1: press <- 3x. Wheel 2: press -> 1x.";
	draw_dialogue_box(message);
}