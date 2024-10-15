/// @description Insert description here
x = 0;
y = 168;
///
#macro HANDMAX 6 // set as global // WoL

hand_max = HANDMAX; // this is for the "ring equipment" that draws cards


for (i = 0; i < hand_start; i++) {
	hand[i] = 0;
}


hand_size = 0;
/*
i = 0;
hand[i++] = 1;
hand[i++] = 2;
hand[i++] = 3;
hand_size = i;
*/


// set sprites
scr_set_hero_sprites();

i = 0;