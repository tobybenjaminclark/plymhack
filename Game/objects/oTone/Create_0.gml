/// @description Insert description here
// You can write your code in this editor

// Sheet width/height
s_width = parent.width;
s_height = parent.height;

x = (parent.x) + ((s_time / parent.sheet_time) * s_width);
y = (parent.y + s_height) - (s_height * pitch);
