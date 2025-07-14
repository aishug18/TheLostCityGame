// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "Press E to collect the object";
	draw_dialogue_box(message);
}