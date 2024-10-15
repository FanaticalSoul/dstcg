/// @description Insert description here
x = 0;
y = 168;
///

card_width = sprite_get_width(spr_card_back);
card_height = sprite_get_height(spr_card_back);


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
i = 0;
sprites[i++] = spr_card_back;
sprites[i++] = spr_card_1;
sprites[i++] = spr_card_2;
sprites[i++] = spr_card_3;
sprites[i++] = spr_card_4;
sprites[i++] = spr_card_5;
sprites[i++] = spr_card_6;
sprites[i++] = spr_card_7;
sprites[i++] = spr_card_8;
sprites[i++] = spr_card_9;

i = 0;