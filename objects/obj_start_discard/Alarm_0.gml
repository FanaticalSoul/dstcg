/// @description cycle draw
if (cycle_size > 0) {
	with (deck) scr_start_card_draw();
	cycle_size --;
	alarm[0] = deck.card_draw_frame_delay; // wait [card_draw_frame_delay] frames then draw again loop this again
}
