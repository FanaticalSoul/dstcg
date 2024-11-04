/// @description enemy placement phase
if (global.phase_e_place) {
	with (obj_enemy_deck) {
		if (enemy_count < enemy_max && deck_size > 0) {
			scr_enemy_card_draw();
			obj_encounter.alarm[2] = card_draw_frame_delay; // wait [ card_draw_frame_delay ] frames then draw again loop this again
		}
		else if (obj_encounter.alarm[3] == -1) {
			obj_encounter.alarm[3] = card_draw_frame_delay;
		}
	}
}