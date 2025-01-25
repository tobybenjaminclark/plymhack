/// @description Spawns Player Count Objects

var player_count = 4;
var adj_player_count = 5; // Spacing
var width = room_width;
var mid_height = room_height div 2;
var indv_player_width = width / adj_player_count;

instance_create_layer(indv_player_width * (0 + 1), mid_height, layer, oPlayerCountButton, {count : 1});
instance_create_layer(indv_player_width * (0 + 2), mid_height, layer, oPlayerCountButton, {count : 2});
instance_create_layer(indv_player_width * (0 + 3), mid_height, layer, oPlayerCountButton, {count : 3});
instance_create_layer(indv_player_width * (0 + 4), mid_height, layer, oPlayerCountButton, {count : 4});
