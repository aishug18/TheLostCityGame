// Background
draw_sprite(MenuBg_spr, 0, 0, 0);

if (how_to_play) {
	draw_sprite(HowToPlayTitle_spr, 0, 960, 162);
	draw_sprite(Instr2_spr, 0, 960, 435);
	draw_sprite(Instr3_spr, 0, 960, 697);
	draw_sprite(Instr1_spr, 0, 960, 947);
		
	draw_sprite(btn_back.sprite, 0, btn_back.x, btn_back.y);
}
else {
	// Title
	draw_sprite_ext(MenuTitle_spr, 0, -24, 0, image_xscale * 1.5, image_yscale * 1.5, image_angle, image_blend, image_alpha);	// scale up sprite
	
	// Buttons
	draw_sprite(button_start.sprite, 0, button_start.x, button_start.y);
	draw_sprite(btn_howtoplay.sprite, 0, btn_howtoplay.x, btn_howtoplay.y);
	draw_sprite(button_quit.sprite, 0, button_quit.x, button_quit.y);
}