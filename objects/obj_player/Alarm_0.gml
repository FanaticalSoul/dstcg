/// @description draw opening hand
if (hand_size < hand_max) {
	scr_draw_hero_card(1);
	alarm[0] = 8; // wait 8 frames then draw again loop this again
}