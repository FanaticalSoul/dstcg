/// @description start enemy act phase ( 4 )

var _flag = true;
for (var i = 0; i < board_size; i++) {
	if (instance_exists(global.board_c_card[i])) {
		with (global.board_c_card[i]) {
			if (damage_taken > 0) _flag = false;
		}
		if (!_flag) break;
	}
}

if (_flag) {
	global.phase_e_place = false;
	global.phase_c_act = false; // end player activation
	// start enemy act phase
	global.phase_e_act = true;
	sout("phase 4 - enemy activation");
	if (global.phase_e_act && alarm[4] == -1) {
		card_placement = 0;
		// skip activations of non-existant enemies
		while (card_placement < enemy_max) {
			if (!instance_exists(global.board_e_card[card_placement])) card_placement++;
			else break;
		}
	}
}