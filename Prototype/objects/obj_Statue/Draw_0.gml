// Draw object normally
draw_self();

// If the player is nearby, draw the dialogue box
if(in_range()) {
	var message = "This is a Mayan object used for rituals, blah blah blah";
	draw_dialogue_box(message);
}