/// @description Draw sheet

// Split into 6 rows (i.e., #fafafa, #e6e6e6, #fafafa, #e6e6e6, #fafafa, #e6e6e6)
var row_height = height / 6;

// Draw the border first
draw_set_color(#cfcfcf);
draw_rectangle(x - 5, y - 5, x + width + 5, y + height + 5, false);

// Now draw the rows with alternating colors
for (var i = 0; i < 6; i++) {
    // Alternate colors between #fafafa and #e6e6e6
    if (i mod 2 == 0) {
        draw_set_color(#fafafa);  // White (#fafafa) for even rows
    } else {
        draw_set_color(#e6e6e6);  // Light grey (#e6e6e6) for odd rows
    }
    
    // Draw the rectangle for this row
    draw_rectangle(x, y + i * row_height, x + width, y + (i + 1) * row_height, false);
}


if (is_playing) {
	var progress = (current_time - start_time) / (end_time - start_time);
	var start_x = x; // Starting x-position
	var end_x = x + width;   // Ending x-position
	var _x = lerp(start_x, end_x, progress);
	
	draw_set_color(c_black);
	draw_rectangle(_x, y, _x + 1, y + height, false);
}
