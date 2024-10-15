/// @description Insert description here
x = 0;
y = 168;
///

hand_max = hand_start; // this is for the ring that draws cards

for (i = 0; i < hand_start; i++) {
	hand[i] = 0;
}

i = 0;
hand[i++] = 1;
hand[i++] = 2;
hand[i++] = 3;
hand_size = i;
// set sprites
scr_set_hero_sprites();

i = 0;