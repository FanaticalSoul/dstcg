/// @description create associated deck

deck = instance_create_depth(start_deck_cords[0], start_deck_cords[1], depth, obj_start_deck, {
	player : id,
	deck_load : [["fth stamina", false]]
})