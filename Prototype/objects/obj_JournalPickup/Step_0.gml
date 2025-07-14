if (in_range() && keyboard_check_pressed(ord("E"))) {
	journal_acquired = true;
	hide_sprite = true;
	
	// Show journal icon on GUI
	obj_JournalIconGUI.is_visible = true;
}

// Show Mayan number system intro
if (journal_acquired && mouse_check_button_pressed(mb_left)) {
	tut_intro = true;
}

if (journal_acquired && keyboard_check_pressed(vk_enter) && tut_intro) {
	instance_destroy();
}