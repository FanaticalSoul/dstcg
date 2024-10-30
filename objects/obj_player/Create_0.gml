/// @description create character, deck, hand, and phases
// create assossated deck
//start_deck = instance_create_depth(deck_cords[0], deck_cords[1], depth, obj_start_deck, {
deck = instance_create_depth(deck_cords[0], deck_cords[1], depth, obj_start_deck, {
	player : id
})
// create assossated character
scr_character_board_set (); // for character object
character_card = instance_create_depth(deck.x-card_spacing-card_width, deck.y, depth, obj_character_card, {
	character : character,
	player : id
});
// set hand
hand_size = 0;
for (var _i = 0; _i < hand_max; _i++) {
	hand[_i] = "";
	hand_card[_i] = noone; // initalize cards in hand
}
// track selected cards
selection = [];
stamina_selection = [];
// encounter setup phases
randomize();
// encounter phases
character_placement_phase = true;
muligan_phase = false;
enemy_activation_phase = false;
character_activation_phase = false;
// actions taken
action_cycle = false;
action_use_equipment = false; // equipment was used for a non-attack action
action_attack = false;
// labeled as actions but treated as sub-states
action_pay_stamina = false;