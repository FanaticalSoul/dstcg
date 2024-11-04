/// @description start enemy placement phase
global.phase_mulligan = false;
global.phase_e_place = true;
// draw enemy cards then start activation phase
if (alarm[2] == -1) alarm[2] = e_deck.card_draw_frame_delay;