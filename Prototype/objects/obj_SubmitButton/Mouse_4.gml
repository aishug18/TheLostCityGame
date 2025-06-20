// Answer: 4 Ajaw 8 Kumk'u

var TzolkinNum = obj_NumWheel1.current_index;
var TzolkinDay = obj_TzolkinWheel.current_index;
var HaabNum = obj_NumWheel2.current_index;
var HaabDay = obj_HaabWheel.current_index;

// (0-based) 4 = index 3, Ajaw = index 19, 8 = index 8 (0-19), Kumk'u = index _
if(TzolkinNum = 3 && TzolkinDay == 19 && HaabNum == 8 && HaabDay == 0) {
	show_message("You solved the puzzle!");
	room_goto_next();
} else {
	show_message("Try again");
}