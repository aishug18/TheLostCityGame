if (global.puzzle_active) exit;	// in puzzle mode
if (instance_exists(obj_JournalManager) && obj_JournalManager.journal_open) exit;	// opened journal
if (global.prop) exit;	// prop description, so stop moving

// ---- Input ----

// Left/right: A/D or ←/→
// Jump: W or ↑ or Space
var rightKey = keyboard_check(vk_right) || keyboard_check(ord("D"));	// pressed = 1, not pressed = 0
var leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
var jumpKey = keyboard_check(vk_space) || keyboard_check(ord("W")) || keyboard_check(vk_up);

// ---- X movement ----
move_direction = rightKey - leftKey;

x_speed = move_direction * move_speed;

if (place_meeting(x + x_speed, y, obj_Solid)) {
	x_speed = 0;	// collision, so stop moving
}

x += x_speed;

// ---- Y movement ----
y_speed += grav;

// Jump
if (jumpKey && on_ground) {
	y_speed = jump_speed;
}

// Cap falling speed
if (y_speed > 8) {
	y_speed = 8;
}

if (place_meeting(x, y + y_speed, obj_Solid)) {
	y_speed = 0;	// collision, so stop moving
}

// Set if on ground
if (y_speed >= 0 && place_meeting(x, y + 1, obj_Solid)) {
	on_ground = true;
}
else {
	on_ground = false;
}

y += y_speed;


// ---- Sprite Control ----

// Flip sprite
if (x_speed != 0) {
	image_xscale = sign(x_speed);
}

// Walk
if (abs(x_speed)) > 0 {
	sprite_index = walk_sprite;
}

// Idle
if (x_speed == 0) {
	sprite_index = idle_sprite;
}

// In the air
if (!on_ground) {
	sprite_index = jump_sprite;
}

// Dead
if (dead) {
	sprite_index = Player_death;
}

// Set the collision mask
mask_index = idle_sprite;


// Portal
if(place_meeting(x, y, obj_Portal)) {
	if (room_next(room) != noone) {
		room_goto_next();
	}
	else {
		game_end();
	}
}