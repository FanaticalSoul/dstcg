/// @description draw opening hand

if (player.hand_size < hand_max) {
	start_card_draw();
	// wait [ani_delay_card_draw] frames then draw again loop this again
	alarm[0] = ani_delay_card_draw;
}