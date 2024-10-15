/// @description Insert description here
x = 0;
y = 168;
///


// WoL // for some reason, varibles being initalized in the object need to be re-initalized here
#macro HANDMAX 9 // set as global // WoL
#macro HANDEND 6 // set as global // WoL

hand_max = HANDEND; // this is for the "ring equipment" that draws cards
//hand_offset = 0;
//hand_visable = 5;



for (i = 0; i < hand_start; i++) {
	hand[i][0] = 0; // sprite index
	hand[i][1] = false; // revealed
	hand[i][2] = false; // selected
}
hand_size = 0;

// set sprites
scr_set_hero_sprites();

i = 0;