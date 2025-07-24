if (place_meeting(x, y, obj_Player)) {
	journal_acquired = true;
	hide_sprite = true;
	
	// Show journal icon on GUI
	obj_JournalIconGUI.is_visible = true;
	instance_destroy();
	
	// Dismiss sprite if player didn't click yet
	//alarm[0] = 100;
}

//if (journal_acquired && mouse_check_button_pressed(mb_left)) {
//	instance_destroy();
//}