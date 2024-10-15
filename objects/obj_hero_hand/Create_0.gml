/// @description Insert description here
x = 0;
y = 168;
///
#macro HANDMAX 6 // set as global // WoL

hand_max = HANDMAX; // this is for the "ring equipment" that draws cards

for (i = 0; i < hand_start; i++) {
	hand[i][0] = 0; // sprite index
	hand[i][1] = false; // revealed
	hand[i][2] = false; // selected
}
hand_size = 0;

// set sprites
scr_set_hero_sprites();

i = 0;