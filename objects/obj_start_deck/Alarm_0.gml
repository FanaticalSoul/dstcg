/// @description draw opening hand
if (obj_player.hand_size < obj_player.hand_start) {
	scr_start_card_draw(1);
	alarm[0] = card_draw_frame_delay; // wait [card_draw_frame_delay] frames then draw again loop this again
}