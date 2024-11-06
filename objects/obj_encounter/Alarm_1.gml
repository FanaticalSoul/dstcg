/// @description start enemy placement phase ( 3 )
global.phase_mulligan = false;
global.phase_e_place = true;
sout("phase 3 - enemy placement");
// draw enemy cards then start activation phase
if (alarm[2] == -1) alarm[2] = ani_delay_card_draw;