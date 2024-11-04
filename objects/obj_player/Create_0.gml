/// @description create character, deck, hand, and phases
// create assossated deck
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
for (var i = 0; i < hand_max; i++) {
	hand[i] = "";
	hand_card[i] = noone; // initalize cards in hand
}
// track selected cards
selection = [];
stamina_selection = [];
// actions taken
act_cycle = false; // cycled selected cards in hand
act_use_equip = false; // equipment was used for a non-attack action
act_attack = false; // attacked with equipment
// states // these are not phases as they are only for the individual player
state_pay_stamina = false; 