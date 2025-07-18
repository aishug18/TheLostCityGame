// Puzzle state
puzzle_solved = false;
state = "browse";	// "browse", "selecting", "complete", "done"

// Item list
item_list = [
	{ x: 990, y: 860, sprite: spr_Item1, desc: spr_Desc1, id: "bone", correct: true, selected: false },
	{ x: 1590, y: 670, sprite: spr_Item2, desc: spr_Desc2, id: "skull", correct: true, selected: false },
	{ x: 1340, y: 420, sprite: spr_Item3, desc: spr_Desc3, id: "mask", correct: false, selected: false },
	{ x: 1350, y: 740, sprite: spr_Item4, desc: spr_Desc4, id: "acid", correct: true, selected: false },
	{ x: 1060, y: 450, sprite: spr_Item5, desc: spr_Desc5, id: "statue", correct: false, selected: false },
	{ x: 830, y: 300, sprite: spr_Item6, desc: spr_Desc6, id: "torch", correct: false, selected: false },
	{ x: 670, y: 700, sprite: spr_Item7, desc: spr_Desc7, id: "scroll", correct: true, selected: false },
	{ x: 510, y: 320, sprite: spr_Item8, desc: spr_Desc8, id: "knife", correct: true, selected: false },
	{ x: 350, y: 610, sprite: spr_Item9, desc: spr_Desc9, id: "bowl", correct: false, selected: false },
	{ x: 1570, y: 260, sprite: spr_Item10, desc: spr_Desc10, id: "vase", correct: false, selected: false },
];

// Variables
selected_item = -1;	// index in item_list
correct_collected = 0;	// count of correct items
required_items = 5;	// total required items to find

// Button positions
btn_putBack = { x: 400, y: 500, w: 150, h: 50 };	// later change to just position and sprite
btn_store = { x: 600, y: 500, w: 150, h: 50};

// Run puzzle
run_puzzle = function () {
	// Check if puzzle is solved
	if (puzzle_solved) {
		return;
	}
	
	// run actual puzzle
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if (state == "browse") {
		// Check for item click
		for (var i = 0; i < array_length(item_list); i++) {
			var item = item_list[i];
			
			if (!item.selected && 
				point_in_rectangle(mx, my, item.x, item.y, item.x + sprite_get_width(item.sprite), item.y + sprite_get_height(item.sprite))) {
				
				if (mouse_check_button_pressed(mb_left)) {
					selected_item = i;
					state = "selecting";
					break;
				}
			}
		}
	}
	else if (state == "selecting") {
		// Button interactions
		if (mouse_check_button_pressed(mb_left)) {
			// Put back item
            if (point_in_rectangle(mx, my, btn_putBack.x, btn_putBack.y, btn_putBack.x + btn_putBack.w, btn_putBack.y + btn_putBack.h)) {
                selected_item = -1;
                state = "browse";
            }
			// Store item in journal
            else if (point_in_rectangle(mx, my, btn_store.x, btn_store.y, btn_store.x + btn_store.w, btn_store.y + btn_store.h)) {
                var item = item_list[selected_item];
                item_list[selected_item].selected = true;
				
				// Add item to journal
				with (obj_JournalManager) {
					add_clue(item.desc, 1400, 540);
				}
				
                // Check if it's correct
                if (item.correct) {
                    correct_collected += 1;
                }

                selected_item = -1;
                if (correct_collected >= required_items) {
                    state = "complete";
                    // (Optional) Start animation timer here
                } else {
                    state = "browse";
                }
            }
        }
	}
	else if (state == "complete") {
        // play animation or show sprite
		// delay then ->
		state = "done";
    }
	else if (state == "done") {
		puzzle_solved = true;
	}
	
};

// Draw puzzle
draw_puzzle = function () {
	if (puzzle_solved) {
		// Draw victory message and continue button
		draw_set_color(c_white);
		draw_text(730, 480, is_undefined(victory_message) ? "Puzzle Solved!" : victory_message);
		
		if(draw_continue_button(860, 520)) {
			solve_puzzle();
		}
	}
	
	// draw actual puzzle
	else {
		// Draw instructions
		draw_sprite(spr_Puzzle4Instr, 0, 20, 20);
		
		// Score display
		draw_set_color(c_white);
		draw_text(1770, 20, string(correct_collected) + " / " + string(required_items));
		
		if (state == "browse") {
			// Draw all visible items
			for (var i = 0; i < array_length(item_list); i++) {
				var item = item_list[i];
				if (!item.selected) {
					draw_sprite(item.sprite, 0, item.x, item.y);
				}
			}
		}
		else if (state == "selecting") {
			var item = item_list[selected_item];
			
			// Dim background
			draw_set_alpha(0.5);
			draw_rectangle(0, 0, 1920, 1080, false);
			draw_set_alpha(1);
			
			// Draw description
			draw_sprite(item.desc, 0, 100, 100);
			
			// Draw buttons
			draw_set_color(c_white);
	        draw_rectangle(btn_putBack.x, btn_putBack.y, btn_putBack.x + btn_putBack.w, btn_putBack.y + btn_putBack.h, false);
	        draw_rectangle(btn_store.x, btn_store.y, btn_store.x + btn_store.w, btn_store.y + btn_store.h, false);

	        draw_set_color(c_black);
	        draw_text(btn_putBack.x + 20, btn_putBack.y + 15, "Put Back");
	        draw_text(btn_store.x + 20, btn_store.y + 15, "Store");
		}
		else if (state == "complete") {
			// Show completion sprite or animation
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
	instance_create_layer(1536, 128, "Objects", obj_Portal);

	// Destroy the puzzle after it's solved
	instance_destroy();
};