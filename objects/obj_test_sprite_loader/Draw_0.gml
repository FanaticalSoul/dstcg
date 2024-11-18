/// @description Insert description here
// You can write your code in this editor

draw_self();
// draw loading bar
draw_sprite_stretched_ext(
	spr_health_bar, -1, 
	room_width/4-load_bar_2_spr_x/load_bar_1_spr_x, 
	room_height*3/4-load_bar_1_spr_y/2,
	load_bar_2_spr_x, load_bar_1_spr_y,
	c_white, 1
);
draw_sprite_stretched_ext(
	spr_stamina_bar, -1, 
	room_width/4-load_bar_2_spr_x/load_bar_1_spr_x, 
	room_height*3/4-load_bar_1_spr_y/2, 
	load_bar_1_spr_x*load_bar_xscale-load_bar_1_spr_x/2, load_bar_1_spr_y,
	c_white, 1
);