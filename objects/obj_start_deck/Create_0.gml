/// @description set deck stuff
// set start card stats
start_card_stats = scr_start_card_stats_set();
deck_min = 28; // starting deck size
//deck_max = 40; // ending deck size
// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i][0] = ""; // card name
	deck[i][1] = false; // revealed
}
// set cards in deck
i = 0;
for (j = 0; j < 11; j++) deck[i++][0] = "fth stamina";
for (j = 0; j <  4; j++) deck[i++][0] = "int stamina";
for (j = 0; j <  4; j++) deck[i++][0] = "str stamina";
for (j = 0; j <  2; j++) deck[i++][0] = "herald armour";
for (j = 0; j <  3; j++) deck[i++][0] = "spear";
for (j = 0; j <  2; j++) deck[i++][0] = "kite shield";
for (j = 0; j <  2; j++) deck[i++][0] = "talisman";
//deck[i-2][1] = true; // reveal card under top card // TF
deck_size = i;
i = 0; // reset increments
// reveal state
deck_reveal = false;
deck_reveal_offset = 0;
deck_reveal_full = false; // reveal all cards in deck
// custom adjustments
deck_spacing = deck_spacing_width_in_pixels / deck_max;
// deck cord varibles
deck_reveal_y = obj_player.y-sprite_height-deck_reveal_spacing*3/4;
// create assossiated discard // TF
discard = instance_create_depth(x,y+sprite_height+deck_reveal_spacing,depth,obj_start_discard);