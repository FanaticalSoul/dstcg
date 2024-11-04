/// @description set placment location based on stats and draw the object
if (placement != -1) {
	des_x = enemy_cords[placement][0];
	des_y = enemy_cords[placement][1];
}
// draw either side of the card or the card in the process of flipping
draw_sprite_ext(flip_finished ? sprite_index : spr_enemy_card_sm_back_1, 0, x, y, flip_scale_x, 1, 0, c_white, 1);
// show card attacking or at least denote it as attacking ( WoL )
if (flip_finished && attack_animation) {
	draw_sprite(spr_card_sm_selected_alt,-1,x,y);
}
// simple damage counters for now
var _tmp_x = x-card_width/2+4;
var _hit_points = card_stats.hit_points;
// use highest possible HP to set stat displays
var i = 0;
var _counters = 0;
while (i+9 < wounds && i+9 < _hit_points) {
	draw_sprite(
		spr_counter_sm_wound_3,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	i += 10;
	_counters += 1;
}
while (i+4 < wounds && i+4 < _hit_points) {
	draw_sprite(
		spr_counter_sm_wound_2,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	i += 5;
	_counters += 1;
}
while (i < wounds && i < _hit_points) {
	draw_sprite(
		spr_counter_sm_wound_1,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	i++;
	_counters += 1;
}

//draw_text(x-card_width/32,y-card_height*5/16,wounds);
// WoL */
