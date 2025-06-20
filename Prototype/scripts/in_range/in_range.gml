function in_range(){
	var dist = point_distance(x, y, obj_Player.x, obj_Player.y);	// gives distance between player and object

	if(dist < 120) {
		return true;
	}
	else {
		return false;
	}
}