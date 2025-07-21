// Wheel positions
var center_x = 960;
var center_y = 540;
active_wheel_index = 0;

wheels = [];

// Place wheels in wheels array
var wheel_1 = instance_create_layer(460, 545, "Objects", obj_NumWheel1);
wheel_1.index = 0;	// Identify wheel
wheel_1.active = true;	// The first wheel is selected by default
array_push(wheels, wheel_1);

var wheel_2 = instance_create_layer(460, 545, "Objects", obj_TzolkinWheel);
wheel_2.index = 1;
wheel_2.active = false;	// Other wheels are not selected
array_push(wheels, wheel_2);

var wheel_3 = instance_create_layer(460, 550, "Objects", obj_NumWheel2);
wheel_3.index = 2;
wheel_3.active = false;
array_push(wheels, wheel_3);

var wheel_4 = instance_create_layer(460, 550, "Objects", obj_HaabWheel);
wheel_4.index = 3;
wheel_4.active = false;
array_push(wheels, wheel_4);

// State flags
puzzle_solved = false;
solution = [7, 3, 3, 0];	// Answer: 4 Ajaw 8 Kumk'u


// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved
	if (puzzle_solved) {
		return;
	}
	
	// Choose active wheel with up/down arrows
	if (keyboard_check_pressed(vk_down)) {
		active_wheel_index = (active_wheel_index + 1) mod 4;
	}
	if (keyboard_check_pressed(vk_up)) {
		active_wheel_index = (active_wheel_index - 1 + 4) mod 4;
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
			}
			if (keyboard_check_pressed(vk_right)) {
				w.turn(-1);	// right = clockwise
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
				break;
			}
		}
		
		if(correct) {
			puzzle_solved = true;
			
			// Deactivate wheels so player can't keep spinning them
			for (var i = 0; i < 4; i++) {
				wheels[i].active = false;
			}
		}
		else {
			// Show "wrong" feedback
			draw_text(1100, 600, "Incorrect combination!");
		}
	}
};

// Draw puzzle
draw_puzzle = function () {
	if (puzzle_solved) {
		// Draw victory message and continue button
		draw_set_color(c_white);
		draw_text(250, 480, is_undefined(victory_message) ? "Puzzle Solved!" : victory_message);
		
		if(draw_continue_button(860, 520)) {
			solve_puzzle();
		}
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
					draw_circle(w.x, w.y, w.sprite_width / 2 - 25, true);
				}
			}
		}
	}
};

// Puzzle is solved, so trigger something
solve_puzzle = function() {
	// Clean up and trigger external action
	global.puzzle_active = false;
	
	with(obj_PuzzleManager) {
		current_puzzle = noone;
	}
	
	// Spawn portal
	instance_create_layer(1504, 160, "Objects", obj_Portal);

	// Destroy the puzzle after it's solved
	instance_destroy();
};