/// @description set placment location based on stats and draw the object

if (placement != -1) {
	des_x = global.board_e_cords[placement][0];
	des_y = global.board_e_cords[placement][1];
}
// draw either side of the card or the card in the process of flipping
draw_sprite_ext(ani_fin_flip ? sprite_index : spr_enemy_card_sm_back_1, 0, x, y, flip_scale_x, 1, 0, c_white, 1);
// show card attacking or at least denote it as attacking ( WoL )
if (ani_fin_flip && ani_act_attack) {
	draw_sprite(spr_card_sm_selected_alt,-1,x,y);
}
// simple damage counters for now
// draw wound counters
var _tmp_x = x-card_width/2+4;
var _hit_points = card_stats.hit_points;
var i = 0;
var _counters = 0;
var _counter_values = [
	[spr_counter_sm_wound_3,10],
	[spr_counter_sm_wound_2, 5],
	[spr_counter_sm_wound_1, 1]
];
for (var j = 0; j < array_length(_counter_values); j++) {
	while (i+_counter_values[j][1]-1 < wounds && i+_counter_values[j][1]-1 < _hit_points) {
		draw_sprite(
			_counter_values[j][0],
			-1,
			_tmp_x+_counters*4,
			y-card_height/2-4
		);
		i += _counter_values[j][1];
		_counters ++;
	}
}