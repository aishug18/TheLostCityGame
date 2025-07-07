angle = 0;
step_angle = 360 / 6;	// 6 numbers
current_index = 0;
active = false;	// if the current wheel is selected or not

turn = function(dir) {
	angle += dir * step_angle;
};