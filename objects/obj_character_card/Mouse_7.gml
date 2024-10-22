/// @description allow placement on board
for (i = 0; i < 6; i++) {
	var _tmp_x = obj_player.board_cords[i][0];
	var _tmp_y = obj_player.board_cords[i][1];
	if (x > _tmp_x-card_width /2 && x < _tmp_x+card_width /2 &&
	y > _tmp_y-card_height/2 && y < _tmp_y+card_height/2) {
		if (obj_player.board_card[i] == noone) {
			var _place_phase   = obj_player.character_placement_phase ;
			var _cha_act_phase = obj_player.character_activation_phase;
			if (_place_phase || _cha_act_phase) {
				// remove prior instance of object from field
				for (var _j = 0; _j < 6; _j++) {
					if (obj_player.board_card[_j] == id) {
						obj_player.board_card[_j] = noone;
						break;
					}
				}
				des_x = _tmp_x;
				des_y = _tmp_y;
				obj_player.board_card[i] = id;
				if (_place_phase) {
					// do particle magic
					instance_create_depth(_tmp_x, _tmp_y, temp_depth+1, obj_particle_card_ripple);
					with (obj_player) if (alarm[1]==-1) alarm[1] = 1; // end phase
				}
				break;
			}
		}
	}
}