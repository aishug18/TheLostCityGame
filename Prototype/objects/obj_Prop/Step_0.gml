if (place_meeting(x, y, obj_Player)) {
	hide_sprite = true;
	play_audio = true;
}

if (play_audio && !global.prop) {
	audio_play_sound(Clue_or_prop2, 1, false);
	global.prop = true;
}

if (global.prop && mouse_check_button_pressed(mb_left)) {
	global.prop = false;
	instance_destroy();
}