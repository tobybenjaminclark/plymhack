/// @description Sets global.player_count

show_debug_message("Player Count Set to {}", count);
global.player_count = count;

// Go to game.
room_goto(rmGameLoop);