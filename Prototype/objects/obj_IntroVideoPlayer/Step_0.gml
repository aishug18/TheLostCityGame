var status = video_get_status();

// Pause and resume video
if (keyboard_check_pressed(vk_space))
{
    if (status == video_status_playing)
    {
        video_pause();
    }
    else if (status == video_status_paused)
    {
        video_resume();
    }
}

// Skip video
if (keyboard_check_pressed(vk_escape))
{
    if (surface_exists(video)) {
        video_close();
    }
	room_goto_next();
}

// Go to next room after video finishes playing
if (status == video_status_closed) {
	room_goto_next();
}
