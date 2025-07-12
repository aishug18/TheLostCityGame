// Wheel positions
var center_x = 960;
var center_y = 540;
active_wheel_index = 0;

wheels = [];

// Place wheels in wheels array
var wheel_1 = instance_create_layer(460, 545, "Instances", obj_NumWheel1);
wheel_1.index = 0;	// Identify wheel
wheel_1.active = true;	// The first wheel is selected by default
array_push(wheels, wheel_1);

var wheel_2 = instance_create_layer(460, 545, "Instances", obj_TzolkinWheel);
wheel_2.index = 1;
wheel_2.active = false;	// Other wheels are not selected
array_push(wheels, wheel_2);

var wheel_3 = instance_create_layer(460, 550, "Instances", obj_NumWheel2);
wheel_3.index = 2;
wheel_3.active = false;
array_push(wheels, wheel_3);

var wheel_4 = instance_create_layer(460, 550, "Instances", obj_HaabWheel);
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
			show_debug_message("Incorrect combination!");
		}
	}
	
	// Check if Escape is pressed to exit puzzle
	if (keyboard_check_pressed(vk_escape)) {
		global.puzzle_active = false;
	
		with(obj_PuzzleManager) {
			current_puzzle = noone;
		}
		
		// Destroy the puzzle
		instance_destroy();
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
		// Information
		var line_1 = "Welcome to the final puzzle!";
		
		var line_2 = "This puzzle is based off of the Mayan calendar system, one of the";
		var line_3 = "most sophisticated and advanced systems in history.";
		
		var line_4 = "The Mayans used three calendar systems: Long Count, Haab', and Tzolk'in.";
		
		var line_5 = "A day in the Gregorian calendar (our calendar), like July 23, 2019,";
		var line_6 = "can be written using Long Count, Haab', and Tzolk'in.";
		
		var line_7 = "The goal of the puzzle is to align the wheel dials to match a";
		var line_8 = "specific date.";
		
		var line_9 = "What's the date, you ask? Solve the riddle on the right";
		var line_10 = "to find out!";
		
		var line_11 = "Use your journal and the information you recorded in it to";
		var line_12 = "help decode the riddle.";
		
		var line_13 = "Navigate between wheels by using the up and down arrows. The";
		var line_14 = "selected wheel is highlighted green.";
		
		var line_15 = "Turn each wheel left or right by using the left and right arrows.";
		
		var line_16 = "When you think you correctly aligned the glyphs, press Enter.";
		
		var line_17 = "Once you correctly align the wheel dials, you will unlock something!";
		
		draw_set_color(c_white);
		draw_text(100, 140, line_1);
		
		draw_text(100, 180, line_2);
		draw_text(100, 210, line_3);
		
		draw_text(100, 250, line_4);
		
		draw_text(100, 290, line_5);
		draw_text(100, 320, line_6);
		
		draw_text(100, 360, line_7);
		draw_text(100, 390, line_8);
		
		draw_text(100, 430, line_9);
		draw_text(100, 460, line_10);
		
		draw_text(100, 500, line_11);
		draw_text(100, 530, line_12);
		
		draw_text(100, 570, line_13);
		draw_text(100, 600, line_14);
		
		draw_text(100, 640, line_15);
		
		draw_text(100, 680, line_16);
		
		draw_text(100, 720, line_17);
		
		var clue = "CLUES";
		
		var clue_line_1 = "The first and third wheels are number wheels, where each glyph";
		var clue_line_2 = "is a Mayan number."
		var clue_line_3 = "The third wheel numbers go by 2 (1 = 2, 2 = 4, 3 = 6, etc.).";
		var clue_line_4 = "The second wheel is the Tzolk'in date wheel.";
		var clue_line_5 = "Ajaw, glyph #4, means \"Sun\" or \"Lord.\"";
		var clue_line_6 = "The fourth wheel is the Haab' date wheel.";
		var clue_line_7 = "The month Kumk'u, glyph #4 is often associated with maize.";
		
		draw_text(1300, 370, clue);
		
		draw_text(1300, 410, clue_line_1);
		draw_text(1300, 440, clue_line_2);
		draw_text(1300, 470, clue_line_3);
		draw_text(1300, 500, clue_line_4);
		draw_text(1300, 530, clue_line_5);
		draw_text(1300, 560, clue_line_6);
		draw_text(1300, 590, clue_line_7);
		
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
		
	if (!is_undefined(trigger_action)) {
		trigger_action();	// run the passed-in function
	}

	// Destroy the puzzle after it's solved
	instance_destroy();
};