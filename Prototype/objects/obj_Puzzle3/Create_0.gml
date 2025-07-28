// Wheel positions
var center_x = 960;
var center_y = 540;
active_wheel_index = 0;

wheels = [];

// Place wheels in wheels array
var wheel_1 = instance_create_layer(460, 545, "Puzzle", obj_NumWheel1);
wheel_1.index = 0;	// Identify wheel
wheel_1.active = true;	// The first wheel is selected by default
array_push(wheels, wheel_1);

var wheel_2 = instance_create_layer(456, 551, "Puzzle", obj_TzolkinWheel);
wheel_2.index = 1;
wheel_2.active = false;	// Other wheels are not selected
array_push(wheels, wheel_2);

var wheel_3 = instance_create_layer(462, 556, "Puzzle", obj_NumWheel2);
wheel_3.index = 2;
wheel_3.active = false;
array_push(wheels, wheel_3);

var wheel_4 = instance_create_layer(460, 547, "Puzzle", obj_HaabWheel);
wheel_4.index = 3;
wheel_4.active = false;
array_push(wheels, wheel_4);

// Help
help_btn = {x: 95, y: 985, sprite: Help_spr };
help_instr = {x: 404, y: 95, sprite: Puzzle3_Instr };
back_btn = {x: 790, y: 480, sprite: BackBtn_spr };
help = false;	// true if help icon is clicked

// State flags
puzzle_solved = false;
solution = [7, 3, 3, 0];	// Answer: 4 Ajaw 8 Kumk'u
incorrect = false;
explain = false;
confetti = false;


// Run puzzle
run_puzzle = function () {
	// Explanation is dimissed, play confetti
	if (explain && !puzzle_solved && mouse_check_button_pressed(mb_left)) {
		confetti = true;
	}
	
	// Check if puzzle is solved to play confetti
	if (!puzzle_solved && confetti) {	// Flags to ensure alarm gets called once
		puzzle_solved = true;
		alarm[0] = 60;
	}
	
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	// Check if help icon is clicked
	if (mouse_check_button_pressed(mb_left) && point_in_circle(mx, my, help_btn.x, help_btn.y, 54)) {
		help = true;
	}
	
	// Check if back button is clicked when help is shown
	if (mouse_check_button_pressed(mb_left) && help && 
		point_in_rectangle(mx, my, back_btn.x, back_btn.y, back_btn.x + sprite_get_width(back_btn.sprite), back_btn.y + sprite_get_height(back_btn.sprite))) {
		
		help = false;
	}
	
	// Choose active wheel with up/down arrows
	if (keyboard_check_pressed(vk_down)) {
		active_wheel_index = (active_wheel_index + 1) mod 4;
		audio_play_sound(Click, 1, false);
	}
	if (keyboard_check_pressed(vk_up)) {
		active_wheel_index = (active_wheel_index - 1 + 4) mod 4;
		audio_play_sound(Click, 1, false);
	}
	// Update which wheel is active
	for (var i = 0; i < array_length(wheels); i++) {
		if (instance_exists(wheels[i])) {
			wheels[i].active = (i == active_wheel_index);
		}
	}
	
	// Move active wheel with left/right arrows
	for (var i = 0; i < array_length(wheels); i++) {
		var w = wheels[i];
		if(instance_exists(w) && w.active) {
			if (keyboard_check_pressed(vk_left)) {
				w.turn(1);	// left = counterclockwise
				incorrect = false;	// dismiss incorrect message
				audio_play_sound(stone_sound, 1, false);
			}
			if (keyboard_check_pressed(vk_right)) {
				w.turn(-1);	// right = clockwise
				incorrect = false;
				audio_play_sound(stone_sound, 1, false);
			}
		}
	}
	
	// Check if Enter is pressed to check answer
	if (keyboard_check_pressed(vk_enter)) {
		// Compare wheels to solution
		var correct = true;
		for (var i = 0; i < 4; i++) {
			if (wheels[i].current_index != solution[i]) {
				correct = false;
				incorrect = true;
				audio_play_sound(lose_sound, 1, false);
				break;
			}
		}
		
		if(correct) {
			audio_play_sound(Win_sound, 1, false);
			explain = true;
			
			// Deactivate wheels so player can't keep spinning them
			for (var i = 0; i < 4; i++) {
				wheels[i].active = false;
			}
		}
	}
};

// Draw puzzle
draw_puzzle = function () {
	if (confetti) {
		draw_sprite(ConfettiWin_spr, -1, 0, 0);
	}
	else if (explain && !puzzle_solved) {
		// Draw correct sprite
		draw_sprite(Correct_spr, 0, -65, 65);
		// Draw explanation sprite
		draw_sprite(Wheel_EndEx, 0, 960, 540);
	}
	else {
		// Draw wheels
		if (instance_exists(wheels[0])) {	// Draw NumWheel1
			draw_sprite_ext(Wheel_T1, 0, wheels[0].x, wheels[0].y, 1, 1, wheels[0].angle, c_white, 1);	// Draw the sprite normally, but rotate it.
		}
		if (instance_exists(wheels[1])) {	// Draw TzolkinWheel
			draw_sprite_ext(Wheel_T2, 0, wheels[1].x, wheels[1].y, 1, 1, wheels[1].angle, c_white, 1);
		}
		if (instance_exists(wheels[2])) {	// Draw NumWheel2
			draw_sprite_ext(Wheel_H1, 0, wheels[2].x, wheels[2].y, 1, 1, wheels[2].angle, c_white, 1);
		}
		if (instance_exists(wheels[3])) {	// Draw HaabWheel
			draw_sprite_ext(Wheel_H2, 0, wheels[3].x, wheels[3].y, 1, 1, wheels[3].angle, c_white, 1);
		}
		
		// Draw arrow/marker on top
		draw_sprite(Wheel_marker, 0, 460, 175);
		
		// Draw riddle
		draw_sprite(Wheel_riddle, 0, 1360, 260);
		
		// Draw highlight ring if this wheel is active
		for (var i = 0; i < 4; i++) {
			var w = wheels[i];
			if (instance_exists(w)) {
				if(w.active) {
					draw_set_color(c_lime);
					draw_circle(w.x, w.y, w.sprite_width / 2 - 15, true);
				}
			}
		}
		
		// Draw help button
		draw_sprite(help_btn.sprite, 0, help_btn.x, help_btn.y);
		
		if (help) {
			// Background
			draw_set_color(c_black);
			draw_set_alpha(0.4);
			draw_rectangle(0, 0, 1920, 1080, false);
			draw_set_alpha(1);
			
			draw_sprite(help_instr.sprite, 0, help_instr.x, help_instr.y);
			draw_sprite(back_btn.sprite, 0, back_btn.x, back_btn.y);
		}
		
		if (incorrect) {
			draw_sprite(Incorrect_spr, 0, 830, 510);
		}
	}
};