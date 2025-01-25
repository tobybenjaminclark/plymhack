/// play_tone(start_time, end_time, pitch)

has_started = false;

// Calculate the duration
var duration = end_time - start_time;  
if (duration <= 0) {
    show_error("Invalid time interval: End time must be greater than start time.", true);
    return;
}

sound = sndTone;
if color == "red" { sound = sndTone }
if color == "green" { sound = sndGuitar; }
if color == "blue" { sound = sndPiano; }


