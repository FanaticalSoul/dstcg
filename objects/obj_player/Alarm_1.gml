/// @description create associated character
character = instance_create_depth(deck.x-card_spacing-card_width, deck.y, depth, obj_character_card, {
	character : "herald",
	player : id
});