/// @description draw enemies from deck
if (enemy_count < enemy_max && deck_size > 0) {
	scr_enemy_card_draw();
	alarm[0] = card_draw_frame_delay; // wait [ card_draw_frame_delay ] frames then draw again loop this again
}
// activate cards
else if (alarm[1] == -1 && obj_player.enemy_activation_phase) alarm[1] = card_draw_frame_delay;