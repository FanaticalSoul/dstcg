/// @description draw and drag the object

if (instance_exists(player)) { // TF // only draw if player exists
	// only draw inside the room
	if (is_struct(card_stats) > 0 && x > -card_width/2 && x < room_width
	 && y > -card_height/2 && y < room_height) {
		if (act_ability) sprite_index = struct_get(card_stats,"image_sm_back");
		else sprite_index = struct_get(card_stats,"image_sm_front");
		draw_self();
		if (selected) draw_sprite(spr_card_sm_selected,-1,x,y); // selected draw
	}
	// drag card
	if (dragable) {
		depth = -hand_max-2;
		speed = 0;
		x = mouse_x;
		y = mouse_y;
	}
	// draw wound counters
	var _tmp_x = x-card_width/2+4;
	var i = 0;
	var _counters = 0;
	var _counter_values = [
		[spr_counter_sm_wound_3,10],
		[spr_counter_sm_wound_2, 5],
		[spr_counter_sm_wound_1, 1]
	];
	for (var j = 0; j < array_length(_counter_values); j++) {
		while (i+_counter_values[j][1]-1 < damage_taken) {
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
}