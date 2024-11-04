/// @description start enemy placement phase
global.phase_mulligan = false;
global.phase_e_place = true;
// draw enemy cards then start activation phase
if (alarm[2] == -1) alarm[2] = obj_enemy_deck.card_draw_frame_delay;
/*
enemy_activation_phase = true;
//character_activation_phase = true; // TF
with (obj_enemy_deck) {
	// draw enemy cards then start activation phase
	if (alarm[0] == -1) alarm[0] = 1;
}
*/