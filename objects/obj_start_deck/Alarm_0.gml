/// @description draw opening hand
if (obj_player.hand_size < obj_player.hand_start) {
	scr_start_card_draw(1);
	alarm[0] = 8; // wait 8 frames then draw again loop this again
}