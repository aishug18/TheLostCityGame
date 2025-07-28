// First draw puzzle GUI (bottom layer)
if (instance_exists(obj_PuzzleManager)) {
	with (obj_PuzzleManager) {
		puzzle_draw_gui();
	}
}

// Then draw journal icon
if (instance_exists(obj_JournalIconGUI)) {
	with (obj_JournalIconGUI) {
		journal_icon_draw_gui();
	}
}

// Then draw journal GUI (top layer)
if (instance_exists(obj_JournalManager)) {
	with (obj_JournalManager) {
		journal_draw_gui();
		}
}