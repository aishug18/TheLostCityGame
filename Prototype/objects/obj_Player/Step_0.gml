if (global.puzzle_active) exit;
if (global.game_paused) exit;

// Left/right: A/D or ←/→
move_x = (keyboard_check(ord("D")) || keyboard_check(vk_right))
         - (keyboard_check(ord("A")) || keyboard_check(vk_left));
move_x *= move_speed;

if(place_meeting(x, y + 2, obj_Ground) || place_meeting(x, y + 2, obj_Puzzle2Door) || place_meeting(x, y + 2, obj_Puzzle3Door)) {
	move_y = 0;
	// Jump: W or ↑ or Space
	if(keyboard_check(vk_space) || keyboard_check(ord("W")) || keyboard_check(vk_up)) {
		move_y -= jump_speed;
	}
}
else if (move_y < 10) {
	move_y += 1;
}

move_and_collide(move_x, move_y, obj_Solid, 4, 0, 0, move_speed, -1);

if (move_x != 0) image_xscale = sign(move_x);	// sprite will flip to face left/right depending on where it's walking

if(place_meeting(x, y, obj_Win)) {
	game_end();
}