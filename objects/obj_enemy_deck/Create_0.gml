/// @description set varibles

// initalize varibles
//deck_size = 0;
//enemy_count = 0; // enemy cards currently in play
// set varibles
//enemy_card_stats = scr_enemy_card_stats_set(); // enemy card stats
//deck_spacing = deck_spacing_width_in_pixels / deck_max;
// prevent errors for decks smaller than the max size of deck
//sout(["edeck",deck]);
for (var i = 0; i < e_deck_max; i++) deck[i] = "";
var i = 0;
for (i = 0; i < array_length(deck_load); i++) deck[i] = deck_load[i];
deck_size = i;
// initalize varibles for enemies on board
/*
for (i = 0; i < board_size; i++) {
	//enemy[i] = "";
	enemy[i] = {}; // stores enemy stats
	//TR//card_placements[i] = noone; // holds enemy position // fixes card stacking
}
*/
//scr_enemy_board_set ();
// shuffle deck on creation
if (!shuffled) {
	deck = scr_deck_shuffle (deck, deck_size);
	shuffled = true;
}
//sout("made enemy deck");