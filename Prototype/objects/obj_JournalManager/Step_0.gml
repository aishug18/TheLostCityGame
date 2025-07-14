var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Handle arrow clicks / keys (choose one or the other)
if (journal_open) {
	// Right page (right arrow spr clicked)
	if (keyboard_check_pressed(vk_right) || 
		(mouse_check_button_pressed(mb_left) && 
			point_in_rectangle(mx, my, right_arrow.x - 75, right_arrow.y - 84, right_arrow.x + 75, right_arrow.y + 84))) {
		
		current_page = min(ds_list_size(clues) - 1, current_page + 1);	// Increment page count, cap it at max pages
	}
	
	// Left page (left arrow spr clicked)
	if (keyboard_check_pressed(vk_left) || 
		(mouse_check_button_pressed(mb_left) && 
			point_in_rectangle(mx, my, left_arrow.x - 75, left_arrow.y - 84, left_arrow.x + 75, left_arrow.y + 84))) {
				
		current_page = max(0, current_page - 1);	// Decrement page count, cap it at 0
	}
}