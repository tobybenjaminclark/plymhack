/// @description Draw Tone Bar

var draw_color = c_black;
if color == "red" { draw_color = c_red }
if color == "green" { draw_color = c_lime; }
if color == "blue" { draw_color = c_blue; }

var being_played = false;
if parent.is_playing {
	var progress = (current_time - parent.start_time) / (parent.end_time - parent.start_time);
	var start_x = parent.x;				// Starting x-position
	var end_x = parent.x + parent.width;   // Ending x-position
	var _x = lerp(start_x, end_x, progress);
	
	var s_x = (parent.x) + ((s_time / parent.sheet_time) * s_width);
	var e_x = (parent.x) + ((e_time / parent.sheet_time) * s_width);
	if (s_x <= _x && _x <= e_x) {
		var being_played = true;
	}
}


if being_played {
	s_x = (parent.x) + ((s_time / parent.sheet_time) * s_width);
	e_x = (parent.x) + ((e_time / parent.sheet_time) * s_width);

	draw_set_color(draw_color);
	draw_rectangle(s_x, y - 4, e_x, y + 4, false);
} else {
	s_x = (parent.x) + ((s_time / parent.sheet_time) * s_width);
	e_x = (parent.x) + ((e_time / parent.sheet_time) * s_width);

	draw_set_color(draw_color);
	draw_rectangle(s_x + 1, y - 2, e_x - 1, y + 2, true);
	draw_rectangle(s_x, y - 3, e_x, y + 3, true);
	draw_rectangle(s_x - 1, y - 4, e_x + 1, y + 4, true);
}