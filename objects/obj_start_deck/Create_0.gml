/// @description set deck stuff
// set start card stats
start_card_stats = scr_start_card_stats_set();
deck_min = 28; // starting deck size
deck_max = 40; // ending deck size
// prevent errors for decks smaller than the max size of deck
// BUG // for (i = 0; i < deck_max; i++) // if set to 40, and deck_size = 40, stuff breaks //
for (i = 0; i <= deck_max; i++) {
	deck[i][0] = ""; // card name
	deck[i][1] = false; // revealed
}
// set cards in deck
i = 0;
/*
// 11 faith cards
for (j = 0; j < 11; j++) {deck[i++][0] = 11;}
// 4 int cards
for (j = 0; j <  4; j++) {deck[i++][0] = 12;}
// 4 str cards
for (j = 0; j <  4; j++) {deck[i++][0] = 13;}
*/

for (i = 0; i < 40; i++) {
	if (i < 10) deck[i][0] = "herald armour";
	else if (i < 20) deck[i][0] = "spear";
	else if (i < 30) deck[i][0] = "kite shield";
	else deck[i][0] = "talisman";
}
//deck[i++][0] = "herald armour";
//deck[i++][0] = "spear";
//deck[i++][0] = "kite shield";
//deck[i++][0] = "talisman";

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