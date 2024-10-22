/// @description set varibles
// set varibles from deck
discard_max = deck.deck_max;
start_card_stats = deck.start_card_stats;
discard_reveal_y = deck.deck_reveal_y;
discard_reveal_x = deck.deck_reveal_x;
// initalize varibles
discard_size = 0;
discard_reveal_offset = 0;
discard_reveal = false;
cycle_size = 0; // used to keep track of cards being cycled
// set varibles
discard_spacing = discard_spacing_width_in_pixels / discard_max;
card_width = SMCARDSIZEX;
card_height = SMCARDSIZEY;
// set all discard cards to be empty
for (var _i = 0; _i < discard_max; _i++) discard[_i] = "";