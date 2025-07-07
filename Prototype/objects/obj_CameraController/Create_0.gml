// Initialize the camera

// Desired view size
view_w = 1920;
view_h = 1080;

// Create a camera
camera = camera_create_view(0, 0, view_w, view_h, 0, obj_Player, -1, -1, 0, 0);
view_camera[0] = camera;