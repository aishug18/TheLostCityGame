function mouse_to_gui(){
	// Scale factor: GUI resolution / camera resolution
	var scale_x = display_get_gui_width() / camera_get_view_width(view_camera[0]);
	var scale_y = display_get_gui_height() / camera_get_view_height(view_camera[0]);

	// Get position of mouse in GUI coordinates
	var gui_x = (mouse_x - camera_get_view_x(view_camera[0])) * scale_x;
	var gui_y = (mouse_y - camera_get_view_y(view_camera[0])) * scale_y;
	
	return [gui_x, gui_y];
}