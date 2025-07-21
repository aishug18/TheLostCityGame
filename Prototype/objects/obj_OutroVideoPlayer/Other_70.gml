var _type = async_load[? "type"];

if (_type == "video_end" || _type == "video_closed") {
    // Video has ended or was closed by user
	room_goto_next();
}