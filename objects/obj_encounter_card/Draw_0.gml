/// @description Insert description here

if (sprite_index_back != noone && sprite_index != noone) {
	draw_sprite_ext(ani_fin_flip ? sprite_index : sprite_index_back, 0, x, y, flip_scale_x, 1, 0, c_white, 1);
	if (cleared && ani_fin_flip && flip_scale_x == 1) draw_sprite(spr_icon_cleared_2, -1, x, y);
}