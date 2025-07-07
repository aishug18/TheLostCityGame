video = video_open("intro.mp4");

if (video == -1) {
	show_debug_message("failed to load video");
	instance_destroy();
}