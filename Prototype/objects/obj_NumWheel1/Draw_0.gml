draw_sprite_ext(spr_NumWheel1, 0, x, y, 1, 1, angle, c_white, 1);	// Draw the sprite normally, but rotate it.

// Draw highlight ring if this wheel is active
if(is_active) {
	draw_set_color(c_lime);
	draw_set_alpha(0.3);
	draw_circle(x, y, sprite_width / 2 + 4, false);
	draw_set_alpha(1);
}