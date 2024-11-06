/// @description create associated character

character = instance_create_depth(character_cords[0], character_cords[1], depth, obj_character_card, {
	character : "herald",
	player : id
});