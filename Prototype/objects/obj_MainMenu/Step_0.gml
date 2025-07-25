if (mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Start game
	if (point_in_rectangle(mx, my, button_start.x, button_start.y, button_start.x + button_start.w, button_start.y + button_start.h)) {
		room_goto_next();
	}
	
	// Show how to play screen
	if (point_in_rectangle(mx, my, btn_howtoplay.x, btn_howtoplay.y, btn_howtoplay.x + btn_howtoplay.w, btn_howtoplay.y + btn_howtoplay.h)) {
		how_to_play = true;
	}
	
	// Go back to pause from how to play
	if (how_to_play && point_in_rectangle(mx, my, btn_back.x, btn_back.y, btn_back.x + sprite_get_width(btn_back.sprite), btn_back.y + sprite_get_height(btn_back.sprite))) {
		how_to_play = false;
	}
	
	// Quit game
	if (point_in_rectangle(mx, my, button_quit.x, button_quit.y, button_quit.x + button_quit.w, button_quit.y + button_quit.h)) {
		game_end();
	}
}