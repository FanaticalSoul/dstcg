/// @description set varibles

// set varibles from deck
//start_card_stats = deck.start_card_stats;
discard_reveal_x = start_discard_reveal_cords[0];
discard_reveal_y = start_discard_reveal_cords[1];
// initalize varibles
discard_size = 0;
discard_reveal_offset = 0;
discard_reveal = false;
cycle_size = 0; // used to keep track of cards being cycled
// set varibles
tmp_depth = depth; // fixes bug with displaying over enemy cards
//discard_spacing = discard_spacing_width_in_pixels / max_deck;
// set all discard cards to be empty
for (var i = 0; i < max_deck; i++) {
	if (is_undefined(discard[i])) {
		discard[i] = "";
	}
}
// log creation
sout("created discard");