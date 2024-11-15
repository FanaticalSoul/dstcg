/// @description create associated deck

sout("create associated deck");
deck = instance_create_depth(start_deck_cords[0], start_deck_cords[1], depth, obj_start_deck, {
	player : id,
	deck_load : deck_load,
	shuffled : shuffled // default this to always have been shuffled
});