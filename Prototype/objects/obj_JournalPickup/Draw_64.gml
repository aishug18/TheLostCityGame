// Draw instructions about journal
if (journal_acquired && !global.prop) {
	draw_sprite(Instr1_spr, 0, display_get_gui_width() / 2, 220);
}

// Draw number system description
else if(global.prop && hide_sprite) {
	draw_sprite(TutPuzzleIntro, 0, display_get_gui_width() / 2, display_get_gui_height() / 2);
}