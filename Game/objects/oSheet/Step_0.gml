/// @description Check if stopped playing

if is_playing {
	if current_time > end_time {
		is_playing = false;	
	}
}