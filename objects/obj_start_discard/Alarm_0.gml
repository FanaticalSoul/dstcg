/// @description cycle draw
if (cycle_size > 0) {
	with (obj_start_deck) scr_start_card_draw(1);
	cycle_size --;
	alarm[0] = card_draw_frame_delay; // wait [card_draw_frame_delay] frames then draw again loop this again
}
