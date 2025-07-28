if (mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Start game
	if (point_in_rectangle(mx, my, button_start.x, button_start.y, button_start.x + sprite_get_width(button_start.sprite), button_start.y + sprite_get_height(button_start.sprite))) {
		room_goto_next();
	}
	
	// Show how to play screen
	if (point_in_rectangle(mx, my, btn_howtoplay.x, btn_howtoplay.y, btn_howtoplay.x + sprite_get_width(btn_howtoplay.sprite), btn_howtoplay.y + sprite_get_height(btn_howtoplay.sprite))) {
		how_to_play = true;
	}
	
	// Go back to pause from how to play
	if (how_to_play && point_in_rectangle(mx, my, btn_back.x, btn_back.y, btn_back.x + sprite_get_width(btn_back.sprite), btn_back.y + sprite_get_height(btn_back.sprite))) {
		how_to_play = false;
	}
	
	// Quit game
	if (point_in_rectangle(mx, my, button_quit.x, button_quit.y, button_quit.x + sprite_get_width(button_quit.sprite), button_quit.y + sprite_get_height(button_quit.sprite))) {
		game_end();
	}
}