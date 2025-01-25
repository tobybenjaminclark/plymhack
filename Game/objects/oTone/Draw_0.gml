/// @description Draw Tone Bar

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

	draw_set_color(c_red);
	draw_line(s_x, y, e_x, y);
	draw_line(s_x, y + 1, e_x, y + 1);
	draw_line(s_x, y + 2, e_x, y + 2);
	draw_line(s_x, y - 1, e_x, y - 1);
	draw_line(s_x, y - 2, e_x, y - 2);
} else {
	s_x = (parent.x) + ((s_time / parent.sheet_time) * s_width);
	e_x = (parent.x) + ((e_time / parent.sheet_time) * s_width);

	draw_set_color(c_black);
	draw_line(s_x, y, e_x, y);
	draw_line(s_x, y + 1, e_x, y + 1);
	draw_line(s_x, y - 1, e_x, y - 1);
}