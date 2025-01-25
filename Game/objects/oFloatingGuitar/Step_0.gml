// Increment the timer
float_timer += float_speed;

// Calculate the new Y position
y = lerp(original_y - float_range / 2, original_y + float_range / 2, (sin(float_timer) + 1) / 2);
