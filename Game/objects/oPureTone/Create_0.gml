/// play_tone(start_time, end_time, pitch)

// Calculate the duration
var duration = end_time - start_time;  
if (duration <= 0) {
    show_error("Invalid time interval: End time must be greater than start time.", true);
    return;
}

// Play the sound
sound_to_stop = audio_play_sound(sndTone, 1, false, 1, 0, pitch * 2);
