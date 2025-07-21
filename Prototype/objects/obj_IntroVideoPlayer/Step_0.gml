var status = video_get_status();

// Pause and resume video
if (keyboard_check_pressed(vk_space)) {
    if (status == video_status_playing) {
        video_pause();
    }
    else if (status == video_status_paused) {
        video_resume();
    }
}

// Skip video
if (keyboard_check_pressed(vk_escape)) {
	video_close();
}

