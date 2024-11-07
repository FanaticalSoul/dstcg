/// @description draw enemy deck

for (var i = 0; i < deck_size; i++) {
	draw_sprite(spr_enemy_card_sm_back_1,-1,x+i*e_deck_spacing,y-i*e_deck_spacing);
}