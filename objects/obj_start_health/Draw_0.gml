/// @description Insert description here
draw_self();
//draw_sprite();
draw_sprite_stretched_ext(
	spr_stamina_bar,
	-1,
	x,
	y+sprite_height,
	starting_sprite_width*stamina_xscale,
	sprite_height,
	c_white,
	1
);