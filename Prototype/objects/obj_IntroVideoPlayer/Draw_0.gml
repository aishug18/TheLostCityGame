var video_data = video_draw();

if (video_data[0] == 0) {	// video is playing without any issues
    draw_surface(video_data[1], 0, 0);
}
else {
	video_close();
}