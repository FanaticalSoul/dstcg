/// @description draw enemies from deck
if (enemy_count < enemy_max && deck_size > 0) {
	scr_enemy_card_draw();
	alarm[0] = 8; // wait 8 frames then draw again loop this again
}