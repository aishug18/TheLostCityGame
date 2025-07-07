// Follow the player horizontally

// Desired camera position (centered on player)
var target_x = obj_Player.x - view_w / 2;
var clamp_x = clamp(target_x, 0, room_width - view_w);

// Keep the camera at y = 0 so it doesn't move vertically
camera_set_view_pos(view_camera[0], clamp_x, 0);