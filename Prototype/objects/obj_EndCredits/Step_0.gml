if (mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Quit game
	if (point_in_rectangle(mx, my, btn_quit.x, btn_quit.y, btn_quit.x + sprite_get_width(btn_quit.sprite), btn_quit.y + sprite_get_height(btn_quit.sprite))) {
		game_end();
	}
}