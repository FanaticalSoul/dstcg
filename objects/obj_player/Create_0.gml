/// @description set empty hand and sprites
// create hero
instance_create_depth(obj_start_deck.x-8-sprite_width, obj_start_deck.y, depth, obj_hero_card, {
	hero_class : hero_class
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
scr_hero_field_set (); // for hero object
// track selected cards
selection = [];
// actions taken
action_cycle = false;
encounter_start = false;