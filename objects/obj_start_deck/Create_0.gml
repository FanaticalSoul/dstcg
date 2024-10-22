/// @description set varibles
// set start card stats
start_card_stats = scr_start_card_stats_set();
deck_min = 28; // starting deck size
// initalize varibles
deck_reveal_offset = 0;
deck_reveal = false; // reveal state
deck_reveal_full = false; // reveal all cards in deck // TF
// set varibles
card_width  = SMCARDSIZEX;
card_height = SMCARDSIZEY;
// prevent errors for decks smaller than the max size of deck
for (var _i = 0; _i < deck_max; _i++) {
	deck[_i][0] = ""; // card name
	deck[_i][1] = false; // revealed
}
// set cards in deck
i = 0;
for (var _i = 0; _i < 11; _i++) deck[i++][0] = "fth stamina";
for (var _i = 0; _i <  4; _i++) deck[i++][0] = "int stamina";
for (var _i = 0; _i <  4; _i++) deck[i++][0] = "str stamina";
for (var _i = 0; _i <  2; _i++) deck[i++][0] = "herald armour";
for (var _i = 0; _i <  2; _i++) deck[i++][0] = "talisman";
/*
for (var _i = 0; _i <  3; _i++) deck[i++][0] = "spear";
for (var _i = 0; _i <  2; _i++) deck[i++][0] = "kite shield";
*/
deck_size = i;
// custom adjustments
deck_spacing = deck_spacing_width_in_pixels / deck_max;
// deck cord varibles
deck_reveal_y = player.y-card_height-CARDSPACING*3/4;
deck_reveal_x = player.x-card_width/2;
// create assossiated discard // TF
discard = instance_create_depth(x,y+card_height+CARDSPACING,depth,obj_start_discard);
// shuffle deck on creation
deck = scr_deck_shuffle (deck, deck_size, true);