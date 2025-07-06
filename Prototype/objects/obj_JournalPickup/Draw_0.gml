// Draw object normally
if (!hide_sprite) {
	draw_self();
}

// If the player is nearby, draw the dialogue box
if(in_range() && !hide_sprite) {
	var message = "Press E to pick up the journal";
	draw_dialogue_box(message);
}
else if (journal_acquired) {
	var message = "You've acquired a journal! All clues and information will be placed in it. Click anywhere to move on.";
	draw_dialogue_box(message);
}