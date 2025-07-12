if (global.puzzle_active) exit;
if (global.game_paused) exit;


// Get input
// Left/right: A/D or ←/→
// Jump: W or ↑ or Space
var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));	// pressed = 1, not pressed = 0
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check(vk_space) || keyboard_check(ord("W")) || keyboard_check(vk_up);

// X movement
move_direction = rightKey - leftKey;

// Get face direction
if (move_direction != 0) {
	face = move_direction;
}

x_speed = move_direction * move_speed;

if (place_meeting(x + x_speed, y, obj_Ground)) {
	x_speed = 0;	// collision, so stop moving
}

x += x_speed;


// Y movement
y_speed += grav;

// Jump
if (jumpKey && on_ground) {
	y_speed = jump_speed;
}

// Cap falling speed
if (y_speed > 8) {
	y_speed = 8;
}

if (place_meeting(x, y + y_speed, obj_Ground)) {
	y_speed = 0;	// collision, so stop moving
}

// Set if on ground
if (y_speed >= 0 && place_meeting(x, y + 1, obj_Ground)) {
	on_ground = true;
}
else {
	on_ground = false;
}

y += y_speed;


// Sprite Control

// Walking
if (abs(x_speed)) > 0 {	// are we moving
	sprite_index = walk_sprite;
}

// Not moving
if (x_speed == 0) {
	sprite_index = idle_sprite;
}

// In the air
if (!on_ground) {
	sprite_index = jump_sprite;
}

// Set the collision mask
mask_index = idle_sprite;


//move_dir = rightKey - leftKey;	// positive (right) or negative (left)

//move_x = move_dir * move_speed;

//var on_ground = place_meeting(x + move_dir * 2, y + 1, obj_Ground);

//// Allow jumping
//if (on_ground) {
//	move_y = 0;
//	if(jumpKeyPressed) {
//		move_y -= jump_speed;
//	}
//}
//else if (move_y < 10) {	// Fall down
//	move_y += 1;
//}

//move_and_collide(move_x, move_y, obj_Solid, 4, 0, 0, move_speed, -1);

//if (x_speed != 0) {
//	image_xscale = sign(x_speed);	// Flip sprite
//}

//// Animation handling
//if (!on_ground) {
//	sprite_index = Player_Jump;
//	image_speed = 0;	// jump sprite has one frame
//}
//if (x_speed != 0) {
//	sprite_index = Player_Walk;
//	image_speed = 1;	// controls walking animation speed
//}
//else {
//	sprite_index = Player_Idle;
//	image_speed = 1;
//}


if(place_meeting(x, y, obj_Win)) {
	game_end();
}