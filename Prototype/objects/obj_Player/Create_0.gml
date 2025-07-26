// Respawn point
x = obj_PlayerRespawn.x;
y = obj_PlayerRespawn.y;

move_direction = 0;
move_speed = 4;
x_speed = 0;
y_speed = 0;

grav = 0.4;
jump_speed = -9;
on_ground = true;

// Sprites
idle_sprite = Player_Idle;
walk_sprite = Player_Walk;
jump_sprite = Player_Jump;

dead = false;

// Death
die = function() {
	dead = true;
	audio_play_sound(Death, 1, false);
	// Wait one-ish second before respawning
	alarm[0] = 80;
}