/// @description start enemy placement phase
global.phase_mulligan = false;
global.phase_e_place = true;
sout("phase 3 - enemy placement");
// draw enemy cards then start activation phase
if (alarm[2] == -1) alarm[2] = e_deck.card_draw_frame_delay;