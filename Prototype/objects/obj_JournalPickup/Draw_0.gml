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

	var line_1 = "You've acquired a journal! This journal is your life. Don't lose it! It contains all the information you need to educate yourself about Mayan culture and solve Mayan-based puzzles.";
	var line_2 = "Right now, your journal only has one page with content. The rest of the pages are empty. As you play along, you will discover artifacts that will teach you Mayan history and culture.";
	var line_3 = "These artifacts may be a clue to a puzzle, so make sure you find all of them and document them in your journal!";
	var line_4 = "You can access your journal by clicking on the journal icon, and you can flip through the pages by clicking the arrow buttons.";
	var line_5 = "Click anywhere to move on.";
	
	draw_text(200, 100, line_1);
	draw_text(200, 130, line_2);
	draw_text(200, 160, line_3);
	draw_text(200, 190, line_4);
	draw_text(200, 230, line_5);

	
}