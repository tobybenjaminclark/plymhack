/// @description Insert description here
// You can write your code in this editor

if current_time > end_time {
	/// Alarm[0] event
	if (audio_is_playing(sound_to_stop)) {
	    audio_stop_sound(sound_to_stop);
	}

	instance_destroy(self);
}