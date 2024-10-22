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
deck[_i++] = "winged corvian";
deck[_i++] = "irithyllian beast hound";
deck[_i++] = "peasant hollow";
/*
deck[i++] = "hollow manservant";
deck[i++] = "ghru leaper";
deck[i++] = "crossbow grave warden";
deck[i++] = "grave warden";
*/
deck_size = _i;
// initalize varibles for enemies on board
for (_i = 0; _i < BOARDSIZE; _i++) {
	enemy[_i] = "";
	enemy_card[_i] = noone;
	card_placements[_i] = noone; // holds enemy position // fixes card stacking
}
// set enemy placement positions
var _cord_x = sprite_width /2+CARDSPACING+enemy_board_offset[0];
var _cord_y = sprite_height/2+CARDSPACING+enemy_board_offset[1];
_i = 0;
for (var _iy = 0; _iy < BOARDROWS; _iy++) {
	for (var _ix = 0; _ix < BOARDCOLS; _ix++) {
		enemy_cords[_i] = [
			_cord_x+_ix*(sprite_width +CARDSPACING),
			_cord_y+_iy*(sprite_height+CARDSPACING)
		];
		_i++;
	}
}
// shuffle deck on creation
deck = scr_deck_shuffle (deck, deck_size);