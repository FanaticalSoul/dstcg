/// @description set varibles
// initalize varibles
deck_size = 0;
enemy_count = 0; // enemy cards currently in play
// set varibles
enemy_card_stats = scr_enemy_card_stats_set(); // enemy card stats
deck_spacing = deck_spacing_width_in_pixels / deck_max;
// prevent errors for decks smaller than the max size of deck
for (var _i = 0; _i < deck_max; _i++) deck[_i] = "";
// set cards in deck ( no states )
var _i = 0;
//deck[_i++] = "winged corvian";
deck[_i++] = "irithyllian beast hound";
//deck[_i++] = "peasant hollow";
deck[_i++] = "ghru leaper";
/*
deck[i++] = "hollow manservant";
deck[i++] = "ghru leaper";
deck[i++] = "crossbow grave warden";
deck[i++] = "grave warden";
*/
deck_size = _i;
// initalize varibles for enemies on board
for (_i = 0; _i < board_size; _i++) {
	enemy[_i] = "";
	card_placements[_i] = noone; // holds enemy position // fixes card stacking
}
scr_enemy_board_set ();
// shuffle deck on creation
deck = scr_deck_shuffle (deck, deck_size);