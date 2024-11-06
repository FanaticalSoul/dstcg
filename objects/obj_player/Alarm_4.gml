/// @description create associated gauges

gauges = instance_create_depth(player_gauges_cords[0], player_gauges_cords[1], depth, obj_player_gauges, {
	player : id
});