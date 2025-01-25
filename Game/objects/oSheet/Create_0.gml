/// @description Create notes

sheet_time = 5;

is_playing = true;
start_time = current_time;
end_time = current_time + (sheet_time * 1000);

notes = [
    {
        type: "tone",
        s_time: 0.5,
        e_time: 1.5,
        pitch: 0.8
    },
	{
        type: "tone",
        s_time: 1.5,
        e_time: 2.5,
        pitch: 0.6
    },
	{
        type: "tone",
        s_time: 2.5,
        e_time: 3.5,
        pitch: 0.4
    },
];

// Loop through the notes array
for (var i = 0; i < array_length(notes); i++) {
    var current_note = notes[i];
    if (is_struct(current_note) && current_note.type == "tone") {
        current_note.parent = self;
        var new_instance = instance_create_layer(0, 0, "Notes", oTone, current_note);
		var new_instance_2 = instance_create_layer(0, 0, "Notes", oPureTone, {
			start_time: current_time + (current_note.s_time * 1000),
			end_time: current_time + (current_note.e_time * 1000),
			pitch: current_note.pitch
		});
    }
}
