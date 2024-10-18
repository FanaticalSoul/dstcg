/// @description Insert description here






//deck_point = 0; // position in deck (pointer)
deck_min = 28; // starting deck size
deck_max = 40; // ending deck size
// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i][0] = 0; // sprite_index
	deck[i][1] = false; // evealed
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
deck[i++][0] = 1;
deck[i++][0] = 2;
deck[i++][0] = 3;
deck[i++][0] = 4;
deck[i++][0] = 5;
deck[i++][0] = 6;
deck[i++][0] = 7;
deck[i++][0] = 8;
deck[i++][0] = 9;
//deck[i-2][1] = true; // reveal card under top card
deck_size = i;
i = 0; // reset increments






// set enemy card stats
start_card_stats = scr_start_sprites_set();


player = obj_player;

// display information

// reveal state
deck_reveal = false;
deck_reveal_offset = 0;
deck_reveal_full = false; // reveal all cards in deck
// custom adjustments
deck_spacing = deck_spacing_width_in_pixels / deck_max;
//deck_spacing = 1;
// deck cord varibles
deck_reveal_y = player.y-sprite_height-deck_reveal_spacing*3/4;