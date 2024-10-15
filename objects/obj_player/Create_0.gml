/// @description Insert description here
//x = 0;
//y = 168;
///


// WoL // for some reason, varibles being initalized in the object need to be re-initalized here
#macro HANDMAX 9 // set as global // WoL
#macro HANDEND 6 // set as global // WoL

hand_max = HANDEND; // this is for the "ring equipment" that draws cards
//hand_offset = 0;
//hand_visable = 5;



for (i = 0; i < hand_start; i++) {
	hand[i][0] = 0; // sprite index
	hand[i][1] = false; // revealed
	hand[i][2] = false; // selected
	
	// initalize cards in hand
	hand_card[i] = noone;
}
hand_size = 0;

// set sprites
sprites = scr_set_hero_sprites();

i = 0;








///////////////////// DECK STUFF







// deck information
deck_size = 0; // cards in deck
deck_point = 0; // position in deck (pointer)
deck_min = 28; // starting deck size
deck_max = 40; // ending deck size
#macro DECKMAX 40 // ending deck size
// prevent errors for decks smaller than the max size of deck
for (i = 0; i < deck_max; i++) {
	deck[i][0] = 0; // sprite_index
	deck[i][1] = false; // evealed
}
// set cards in deck
i = 0;
/*
// 11 faith cards
for (j = 0; j < 11; j++) {deck[i++][0] = 12;}
// 4 int cards
for (j = 0; j <  4; j++) {deck[i++][0] = 11;}
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



deck[i-2][1] = true; // reveal card under top card
deck_size = i;

// set macro ( read-only global varible ) to avoid reading nonexistant cards
#macro HEROCARDCOUNT array_length(sprites)
// 
i = 0; // reset increments




