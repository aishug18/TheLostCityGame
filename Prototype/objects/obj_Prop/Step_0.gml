if (place_meeting(x, y, obj_Player)) {
	hide_sprite = true;
	global.prop = true;
}

if (global.prop && mouse_check_button_pressed(mb_left)) {
	global.prop = false;
	instance_destroy();
}