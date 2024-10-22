/// @description create character, deck, hand, and phases
// create assossated deck
start_deck = instance_create_depth(deck_cords[0], deck_cords[1], depth, obj_start_deck, {
	player : id
})
// create assossated character
instance_create_depth(start_deck.x-card_spacing-card_width, start_deck.y, depth, obj_character_card, {
	character : character,
	player : id
});
// set hand
hand_size = 0;
for (var _i = 0; _i < hand_max; _i++) {
	hand[_i] = "";
	hand_card[_i] = noone; // initalize cards in hand
}
scr_character_board_set (); // for character object
// track selected cards
selection = [];
// encounter setup phases
randomize();
// encounter phases
character_placement_phase = true;
muligan_phase = false;
enemy_activation_phase = false;
character_activation_phase = false;
// actions taken
action_cycle = false;