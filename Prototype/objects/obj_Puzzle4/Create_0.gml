C// Puzzle state
puzzle_solved = false;
state = "browse";	// "browse", "selecting", "complete", "done"

// Item list
item_list = [
	{ x: 1312, y: 768, sprite: spr_Item1, desc: spr_Desc1, id: "stingray", correct: true, selected: false },
	{ x: 32, y: 608, sprite: spr_Item2, desc: spr_Desc2, id: "pot", correct: true, selected: false },
	{ x: 768, y: 896, sprite: spr_Item3, desc: spr_Desc3, id: "incense", correct: true, selected: false },
	{ x: 448, y: 160, sprite: spr_Item4, desc: spr_Desc4, id: "censer", correct: true, selected: false },
	{ x: 1600, y: 512, sprite: spr_Item5, desc: spr_Desc5, id: "cocoa", correct: false, selected: false },
	{ x: 1152, y: 640, sprite: spr_Item6, desc: spr_Desc6, id: "knife", correct: false, selected: false },
	{ x: 1632, y: 64, sprite: spr_Item7, desc: spr_Desc7, id: "handle", correct: false, selected: false },
	{ x: 352, y: 672, sprite: spr_Item8, desc: spr_Desc8, id: "gold", correct: false, selected: false }
];

// Props for background
prop_list = [
	{ x: 0, y: -32, sprite: Pu4_prop5 },
	{ x: 1632, y: 32, sprite: Pu4_prop4 },
	{ x: 1472, y: 640, sprite: Pu4_prop6 },
	{ x: 832, y: 800, sprite: Pu4_prop1 },
	{ x: 32, y: 704, sprite: Pu4_prop2 }
	
];

// Variables
selected_item = -1;	// index in item_list
correct_collected = 0;	// count of correct items
required_items = 4;	// total required items to find

// Button positions
btn_putBack = { x: 450, y: 710, sprite: Pu4_btndrop };	// later change to just position and sprite
btn_store = { x: 1030, y: 710, sprite: Pu4_btnkeep };

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
            if (point_in_rectangle(mx, my, btn_putBack.x, btn_putBack.y, btn_putBack.x + sprite_get_width(btn_putBack.sprite), btn_putBack.y + sprite_get_height(btn_putBack.sprite))) {
                selected_item = -1;
                state = "browse";
            }
			// Store item in journal
            else if (point_in_rectangle(mx, my, btn_store.x, btn_store.y, btn_store.x + sprite_get_width(btn_store.sprite), btn_store.y + sprite_get_height(btn_store.sprite))) {
                var item = item_list[selected_item];
                item_list[selected_item].selected = true;
				
				// Add item to journal
				with (obj_JournalManager) {
					add_clue(item.id, item.sprite, 1184, 352);
				}
				array_push(global.level_4_clues, item.id);
				
                // Check if it's correct
                if (item.correct) {
                    correct_collected += 1;
                }

                selected_item = -1;
                if (correct_collected >= required_items) {
                    state = "complete";
                }
				else {
                    state = "browse";
                }
            }
        }
	}
	else if (state == "complete") {
		if (mouse_check_button_pressed(mb_left)) {
			puzzle_solved = true;
		}
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
	
	// Draw actual puzzle
	else {
		// Draw background
		draw_sprite(Puzzle4_bg, 0, 0, 0);
		
		// Draw background props
		for (var i = 0; i < array_length(prop_list); i++) {
			var prop = prop_list[i];
			draw_sprite(prop.sprite, 0, prop.x, prop.y);
		}
		
		// Score display
		draw_set_color(c_white);
		draw_text(1710, 50, string(correct_collected) + " / " + string(required_items));
		
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
			draw_set_alpha(0.3);
			draw_set_color(c_black);
			draw_rectangle(0, 0, 1920, 1080, false);
			draw_set_alpha(1);
			
			// Draw description with item
			draw_sprite(item.desc, 0, 300, 240);
			draw_sprite(item.sprite, 0, 1100, 240);
			
			// Draw buttons
			draw_sprite(btn_putBack.sprite, 0, btn_putBack.x, btn_putBack.y);
			draw_sprite(btn_store.sprite, 0, btn_store.x, btn_store.y);
		}
		else if (state == "complete") {
			draw_sprite(Puzzle4_Finalbg, 0, 0, 0);
			draw_sprite(Puzzle4_FinalEx, 0, 32, 16);
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
	instance_create_layer(128, 849, "Objects", obj_Portal);

	// Destroy the puzzle after it's solved
	instance_destroy();
};