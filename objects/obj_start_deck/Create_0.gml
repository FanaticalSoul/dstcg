/// @description set varibles

// initalize varibles
deck_reveal_offset = 0;
deck_reveal = false; // reveal state
deck_reveal_full = false; // reveal all cards in deck // TF
tmp_depth = depth; // fixes bug with displaying over enemy cards
// prevent errors for decks smaller than the max size of deck
for (var i = 0; i < max_deck; i++) {
	deck[i][0] = ""; // card name
	deck[i][1] = false; // revealed
}
// set cards in deck from save
ini_open("start_deck.ini");
for (var i = 0; i < deck_min; i++) {
	deck[i][0] = ini_read_string("deck",string(i),"");
}
ini_close();
deck_size = deck_min;
// custom adjustments
deck_spacing = deck_spacing_width_in_pixels / max_deck;
// deck cord varibles
deck_reveal_y = player.y-card_height-card_spacing*3/4;
deck_reveal_x = player.x-card_width/2;
// shuffle deck on creation
deck = scr_deck_shuffle (deck, deck_size, true);
// log creation
sout("created start deck");