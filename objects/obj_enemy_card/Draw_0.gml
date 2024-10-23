/// @description set placment location based on stats and draw the object
if (placement != -1) {
	des_x = enemy_cords[placement][0];
	des_y = enemy_cords[placement][1];
}
// draw either side of the card or the card in the process of flipping
draw_sprite_ext(flip_finished ? sprite_index : spr_enemy_card_sm_back_1, 0, x, y, flip_scale_x, 1, 0, c_white, 1);

// simple damage counters for now
//wounds = 11; // TF
var _tmp_x = x-card_width/2+4;
var _hit_points = card_stats.hit_points;
//_hit_points = 80;
// use highest possible HP to set stat displays
var _i = 0;
var _counters = 0;
while (_i+9 < wounds && _i+9 < _hit_points) {
	draw_sprite(
		spr_counter_sm_wound_3,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	_i += 10;
	_counters += 1;
}
while (_i+4 < wounds && _i+4 < _hit_points) {
	draw_sprite(
		spr_counter_sm_wound_2,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	_i += 5;
	_counters += 1;
}
while (_i < wounds && _i < _hit_points) {
	draw_sprite(
		spr_counter_sm_wound_1,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	_i++;
}

//draw_text(x-card_width/32,y-card_height*5/16,wounds);
// WoL */
