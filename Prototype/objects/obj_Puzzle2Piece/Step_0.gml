// Start dragging if mouse is pressed on this piece
if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
    dragging = true;
    offset_x = mouse_x - x;
    offset_y = mouse_y - y;
	show_debug_message("clicked and dragging");
}

// Stop dragging on mouse release
if(mouse_check_button_released(mb_left)) {
	dragging = false;
}

// While dragging, move the piece but clamp it so it can't leave the box
if (dragging) {
	x = clamp(mouse_x - offset_x, box_left, box_right - sprite_width);
	y = clamp(mouse_y - offset_y, box_top, box_bottom - sprite_height);
}