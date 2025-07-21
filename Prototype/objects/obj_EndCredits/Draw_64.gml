// draw_set_font(*font name*);	// if you have a font
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


draw_set_color(c_black);

var line_1 = "Congratulations! You discovered important artifacts and preserved Mayan history!";
var line_2 = "Credits";
var line_3 = "... some names and roles ...";

draw_text(960, 230, line_1);
draw_text(960, 280, line_2);
draw_text(960, 310, line_3);

// Quit button
draw_set_color(c_white);
draw_rectangle(btn_quit.x, btn_quit.y, btn_quit.x + btn_quit.w, btn_quit.y + btn_quit.h, false);
draw_set_color(c_black);
draw_text(btn_quit.x + btn_quit.w/2, btn_quit.y + btn_quit.h/2, "Quit");

draw_set_halign(fa_left);
draw_set_valign(fa_top);