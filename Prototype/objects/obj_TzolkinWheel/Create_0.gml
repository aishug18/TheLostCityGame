angle = 0;
step_angle = 360 / 8;	// 8 glyphs
current_index = 0;
active = false;	// if the current wheel is selected or not


turn = function(dir) {
	angle += dir * step_angle;
};