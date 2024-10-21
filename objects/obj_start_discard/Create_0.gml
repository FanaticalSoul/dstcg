/// @description Insert description here
discard_max = obj_start_deck.deck_max;
discard_spacing = obj_start_deck.deck_spacing;
discard_reveal_spacing = obj_start_deck.deck_reveal_spacing;
start_card_stats = obj_start_deck.start_card_stats;
discard_reveal_y = obj_start_deck.deck_reveal_y;
discard_visable = obj_start_deck.deck_visable;
for (i = 0; i < discard_max; i++) {
	discard[i] = ""; // card name
}
discard_size = 0;
discard_reveal_offset = 0;
discard_reveal = false;
cycle_size = 0; // used to keep track of cards being cycled