/// @description draw enemies from deck
/*
if (global.phase_e_place) {
	with (obj_enemy_deck) {
		if (enemy_count < enemy_max && deck_size > 0) {
			scr_enemy_card_draw();
			alarm[0] = card_draw_frame_delay; // wait [ card_draw_frame_delay ] frames then draw again loop this again
		}
		else if (obj_encounter.alarm[2] == -1) {
			global.phase_e_place = false;
			obj_encounter.alarm[2] = card_draw_frame_delay;
		}
	}
}
// activate cards
/*
else if (alarm[1] == -1 && obj_player.enemy_activation_phase) {
	alarm[1] = card_draw_frame_delay;
}
/