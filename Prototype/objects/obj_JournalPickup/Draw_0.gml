// Draw object normally
if (!hide_sprite) {
	draw_self();
}

if (journal_acquired) {

	var line_1 = "You've acquired a journal! This journal is your life. Don't lose it!";
	var line_2 = "It contains all the information you need to educate yourself about Mayan culture and solve Mayan-based puzzles.";
	var line_3 = "Right now, your journal only has one page with content. The rest of the pages are empty.";
	var line_4 = "As you play along, you will discover artifacts that will teach you Mayan history and culture.";
	var line_5 = "These artifacts may be a clue to a puzzle, so make sure you find all of them and document them in your journal!";
	
	draw_text(50, 100, line_1);
	draw_text(50, 130, line_2);
	draw_text(50, 160, line_3);
	draw_text(50, 190, line_4);
	draw_text(50, 230, line_5);
}