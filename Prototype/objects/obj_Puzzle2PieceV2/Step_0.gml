var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Start dragging if mouse is pressed on this piece and is not the anchor
if (!is_anchor && mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
    dragging = true;
    drag_offset_x = mx - x;
}

// Stop dragging on mouse release
if(mouse_check_button_released(mb_left)) {
	dragging = false;
}

// While dragging, move the piece
if (dragging) {
	x = mx - drag_offset_x;
	y = my - drag_offset_y;
}