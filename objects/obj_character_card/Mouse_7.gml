/// @description allow placement on board

if (instance_exists(player)) { // TF // only step if player exists
	for (var i = 0; i < board_size; i++) {
		var _tmp_x = global.board_c_cords[i][0];
		var _tmp_y = global.board_c_cords[i][1];
		if (x > _tmp_x-card_width/2 && x < _tmp_x+card_width/2 &&
		y > _tmp_y-card_height/2 && y < _tmp_y+card_height/2) {
			if (!instance_exists(global.board_c_card[i])) {
				if (global.phase_c_place || global.phase_c_act) {
					// remove prior instance of object from field
					for (var j = 0; j < board_size; j++) {
						if (global.board_c_card[j] == id) {
							global.board_c_card[j] = noone;
							break;
						}
					}
					des_x = _tmp_x;
					des_y = _tmp_y;
					global.board_c_card[i] = id;
					if (global.phase_c_place) {
						// do particle magic
						instance_create_depth(_tmp_x, _tmp_y, temp_depth+1, obj_particle_card_ripple);
						// toggle off phase
						global.phase_c_place = false;
					}
					break;
				}
			}
		}
	}
}