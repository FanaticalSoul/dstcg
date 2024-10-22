/// @description create character, hand, and phases
instance_create_depth(obj_start_deck.x-8-sprite_width, obj_start_deck.y, depth, obj_character_card, {
	character : character
});
// set hand
hand_size = 0;
for (i = 0; i < hand_max; i++) {
	hand[i][0] = 0; // sprite index
	hand[i][1] = false; // revealed
	hand[i][2] = false; // selected
	hand_card[i] = noone; // initalize cards in hand
}
i = 0;
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
