/// @description set placment location based on stats and draw the object
if (placement != -1) {
	des_x = enemy_cords[placement][0];
	des_y = enemy_cords[placement][1];
}
// draw either side of the card or the card in the process of flipping
draw_sprite_ext(flip_finished ? sprite_index : spr_enemy_card_sm_back_1, 0, x, y, flip_scale_x, 1, 0, c_white, 1);