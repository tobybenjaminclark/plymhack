/// @description Insert description here
// You can write your code in this editor

if current_time > start_time && !has_started {
	// Play the sound
	sound_to_stop = audio_play_sound(sound, 1, false, 1, 0, pitch * 2);
	has_started = true;
}

if current_time > end_time {
	/// Alarm[0] event
	if (audio_is_playing(sound_to_stop)) {
	    audio_stop_sound(sound_to_stop);
	}

	instance_destroy(self);
}