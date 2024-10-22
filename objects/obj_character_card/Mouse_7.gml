/// @description allow placement on board
for (var _i = 0; _i < board_size; _i++) {
	var _tmp_x = player.board_cords[_i][0];
	var _tmp_y = player.board_cords[_i][1];
	if (x > _tmp_x-card_width/2 && x < _tmp_x+card_width/2 &&
	y > _tmp_y-card_height/2 && y < _tmp_y+card_height/2) {
		if (player.board_card[_i] == noone) {
			var _place_phase   = player.character_placement_phase ;
			var _cha_act_phase = player.character_activation_phase;
			if (_place_phase || _cha_act_phase) {
				// remove prior instance of object from field
				for (var _j = 0; _j < 6; _j++) {
					if (player.board_card[_j] == id) {
						player.board_card[_j] = noone;
						break;
					}
				}
				des_x = _tmp_x;
				des_y = _tmp_y;
				player.board_card[_i] = id;
				if (_place_phase) {
					// do particle magic
					instance_create_depth(_tmp_x, _tmp_y, temp_depth+1, obj_particle_card_ripple);
					with (player) if (alarm[1]==-1) alarm[1] = 1; // end phase
				}
				break;
			}
		}
	}
}