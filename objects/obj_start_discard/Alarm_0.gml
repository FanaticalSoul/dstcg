/// @description cycle draw

if (cycle_size > 0) {
	start_card_draw(player.deck);
	cycle_size --;
	alarm[0] = ani_delay_card_draw; // wait [ani_delay_card_draw] frames then draw again loop this again
}