if (place_meeting(x, y, obj_Player)) {
	journal_acquired = true;
	hide_sprite = true;
	
	// Show journal icon on GUI
	obj_JournalIconGUI.is_visible = true;
}

// Show Mayan number system intro
if (journal_acquired && mouse_check_button_pressed(mb_left)) {
	alarm[0] = 0.1 * game_get_speed(gamespeed_fps);
}

if (journal_acquired && mouse_check_button_pressed(mb_left) && global.prop) {
	global.prop = false;
	instance_destroy();
}