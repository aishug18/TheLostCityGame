// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "This is another clue!! Wheel 3: press <- 8x. Wheel 4: press -> 0x.";
	draw_dialogue_box(message);
}