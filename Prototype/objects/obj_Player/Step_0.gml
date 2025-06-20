move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
move_y *= move_speed;


move_and_collide(move_x, move_y, obj_Wall);
if (move_x != 0) image_xscale = sign(move_x);	// sprite will flip to face left/right depending on where it's walking

if(place_meeting(x, y, obj_Riddle)) {
	room_goto_next();
}

if(place_meeting(x, y, obj_Win)) {
	game_end();
}