/// @description Insert description here
// You can write your code in this editor

if (visible) {
	if (i == array_length(sprites)) visible = false;
	else sprite_index = sprites[i];
	i++;
}


			// scale images
load_bar_xscale  = i / array_length(sprites) * load_bar_2_spr_x/load_bar_1_spr_x;