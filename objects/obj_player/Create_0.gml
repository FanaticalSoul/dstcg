/// @description set empty hand and sprites
// create hero
instance_create_depth(obj_start_deck.x-8-sprite_width, obj_start_deck.y, depth, obj_hero_card, {
	hero_class : hero_class
});


hand_size = 0;
// set hand
hand_spacing = 8;
hand_start = 6;
hand_max = hand_start+3;
for (i = 0; i < hand_start; i++) {
	hand[i][0] = 0; // sprite index
	hand[i][1] = false; // revealed
	hand[i][2] = false; // selected
	hand_card[i] = noone; // initalize cards in hand
}
i = 0;
scr_hero_field_set (); // for hero object