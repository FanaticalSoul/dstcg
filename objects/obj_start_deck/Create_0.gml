/// @description set varibles

// initalize varibles
deck_reveal_offset = 0;
deck_reveal = false; // reveal state
deck_reveal_full = false; // reveal all cards in deck // TF
tmp_depth = depth; // fixes bug with displaying over enemy cards
var i = 0;
// prevent errors for decks smaller than the max size of deck
for (i = 0; i < max_deck; i++) {
	deck[i][0] = ""; // card name
	deck[i][1] = false; // revealed
}
// trim deck being loaded
var _trim_size = 0;
for (i = 0; i < array_length(deck_load); i++) {
	if (deck_load[i][0] != "") _trim_size++;
}
// load deck
for (i = 0; i < _trim_size; i++) {
	deck[i][0] = deck_load[i][0]; // card name
	deck[i][1] = deck_load[i][1]; // revealed
}
deck_size = i;
// custom adjustments
//deck_spacing = deck_spacing_width_in_pixels / max_deck;
// deck cord varibles
deck_reveal_x = start_deck_reveal_cords[0];
deck_reveal_y = start_deck_reveal_cords[1];
// shuffle deck on creation
if (!shuffled) {
	deck = scr_deck_shuffle (deck, deck_size, true);
	shuffled = true;
}
// log creation
sout("created start deck");