/// @description Draw Tone Bar

s_x = (parent.x) + ((s_time / parent.sheet_time) * s_width);
e_x = (parent.x) + ((e_time / parent.sheet_time) * s_width);

draw_set_color(c_black);
draw_line(s_x, y, e_x, y);