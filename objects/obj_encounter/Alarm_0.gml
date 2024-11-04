/// @description start mulligan phase
global.phase_c_place = false;
with (obj_start_deck) if (alarm[0] == -1) alarm[0] = 1;
global.phase_mulligan = true;