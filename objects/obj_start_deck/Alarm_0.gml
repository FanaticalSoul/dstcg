/// @description draw opening hand
if (player.hand_size < HANDMAX) {
	scr_start_card_draw();
	alarm[0] = card_draw_frame_delay; // wait [card_draw_frame_delay] frames then draw again loop this again
}