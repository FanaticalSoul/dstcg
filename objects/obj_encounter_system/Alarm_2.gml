/// @description enemy placement phase

if (global.phase_e_place) {
	with (e_deck) {
		if (get_enemy_count() < enemy_max && deck_size > 0) {
			enemy_card_draw();
			// wait [ ani_delay_card_draw ] frames then draw again loop this again
			//sout("drew card");
			obj_encounter_system.alarm[2] = ani_delay_card_draw; // do not check for this alarm
		}
	}
}