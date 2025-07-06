if (in_range() && keyboard_check_pressed(ord("E"))) {
	journal_acquired = true;
	hide_sprite = true;
}

if (journal_acquired && mouse_check_button_pressed(mb_left)) {
	instance_destroy();
	room_goto_next();
}