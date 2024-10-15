/// @description draw card from deck
if (!deck_reveal && mouse_x >= x && mouse_x <= x+sprite_width && mouse_y >= y-sprite_height && mouse_y <= y) {
	with (player) {scr_draw_hero_card(1);}
}