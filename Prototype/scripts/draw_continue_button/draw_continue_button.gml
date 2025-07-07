function draw_continue_button(gx, gy){
	var button_w = 200;
	var button_h = 50;
	
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	var hovered = (mx > gx) && (mx < gx + button_w) && (my > gy) && (my < gy + button_h);
	
	// Draw background
	draw_set_color(hovered ? c_lime : c_gray);
	draw_rectangle(gx, gy, gx + button_w, gy + button_h, false);
	
	// Draw label
	draw_set_color(c_white);
	draw_text(gx + 60, gy + 15, "Continue");
	
	// Return true if hovered and clicked
	return hovered && mouse_check_button_pressed(mb_left);
}