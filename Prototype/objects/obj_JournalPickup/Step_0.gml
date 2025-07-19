if (place_meeting(x, y, obj_Player)) {
	journal_acquired = true;
	hide_sprite = true;
	
	// Show journal icon on GUI
	obj_JournalIconGUI.is_visible = true;
}

// Show Mayan number system intro
if (journal_acquired && mouse_check_button_pressed(mb_left)) {
	instance_destroy();
}