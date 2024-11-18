/// @description create associated character

// set starting cords
var _character_cords;
_character_cords[0] = character_cords[0];
_character_cords[1] = character_cords[1];
var _depth = depth;
if (instance_exists(deck)) {
	_character_cords[0] = start_deck_cords[0]+deck.deck_size*deck_spacing;
	_character_cords[1] = start_deck_cords[1]-deck.deck_size*deck_spacing;
	_depth = deck.depth-deck.deck_size;
}

character = instance_create_depth(_character_cords[0], _character_cords[1], _depth, obj_character_card, {
	character : character_load,
	player : id,
	inital_x : _character_cords[0],
	inital_y : _character_cords[1],
	act_ability : ability_used
});