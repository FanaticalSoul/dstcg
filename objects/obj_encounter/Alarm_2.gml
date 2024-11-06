/// @description enemy placement phase
if (global.phase_e_place) {
	with (e_deck) {
		if (enemy_count < enemy_max && deck_size > 0) {
			enemy_card_draw();
			obj_encounter.alarm[2] = card_draw_frame_delay; // wait [ card_draw_frame_delay ] frames then draw again loop this again
		}
		/*
		else {
			with (obj_encounter) {
				if (!enemy_draw_flag) {
					enemy_draw_flag = true;
				}
			}
		}
		/*
		else if (obj_encounter.alarm[3] == -1) {
			obj_encounter.alarm[3] = card_draw_frame_delay;
		}
		*/
	}
}