// draw_set_font(*font name*);	// if you have a font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
draw_set_color(c_black);
draw_text(960, 200, "Shadow Archive: Echoes of the Past");

// Information about game
var line_1 = "Welcome history hunters, to the epic time-traveling history game!";
var line_2 = "This game is focused on teaching Mayan culture and history, so strap in, put on your thinking hats, and let's explore the past!";
var line_3 = "Solve puzzles, navigate historical structures, discover artifacts, and document your findings in your precious journal.";
var line_4 = "Click \"Start\" to play.";

draw_text(960, 230, line_1);
draw_text(960, 260, line_2);
draw_text(960, 290, line_3);
draw_text(960, 320, line_4);

// Start button
draw_set_color(c_white);
draw_rectangle(button_start.x, button_start.y, button_start.x + button_start.w, button_start.y + button_start.h, false);
draw_set_color(c_black);
draw_text(button_start.x + button_start.w/2, button_start.y + button_start.h/2, "Start");

// Quit button
draw_set_color(c_white);
draw_rectangle(button_quit.x, button_quit.y, button_quit.x + button_quit.w, button_quit.y + button_quit.h, false);
draw_set_color(c_black);
draw_text(button_quit.x + button_quit.w/2, button_quit.y + button_quit.h/2, "Quit");

draw_set_halign(fa_left);
draw_set_valign(fa_top);