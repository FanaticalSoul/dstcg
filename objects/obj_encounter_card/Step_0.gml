/// @description Insert description here

if (is_mouse_over_card() && card_stats != {}) {
	// hold [ mouse left ] // flip encounter
	if (mouse_check_button_pressed(mb_left)) {
		var _flag = false;
		if (array_length(encounter_paths) > 0) {
			for (var i = 0; i < array_length(encounter_paths); i++) {
				//if (encounter_paths[i].cleared || encounter_paths[i].ani_fin_flip) {
				if (encounter_paths[i].cleared) {
					_flag = true;
					break;
				}
			}
		}
		else _flag = true;
		// check if any other encounters are active
		if (_flag) {
			for (var i = 0; i < board_m_size; i++) {
				var _card = global.board_m_card[i];
				if (instance_exists(_card)) {
					if (_card.active && _card != id) {
						_flag = false;
						break;
					}
				}
			}
		}
		// flip card
		if (_flag) {
			ani_act_flip = true;
		}
	}
	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right) && ani_fin_flip) {
		card_hq.sprite_index = card_stats.image_hq;
		card_hq.visible = true;
	}
}

// flip animation
if (ani_act_flip) {
	// decrease scale_x to 0, then switch sprites and increase it back to 1
	if (!ani_fin_flip) {
	    flip_scale_x -= flip_speed; // shrinking the card
	    if (flip_scale_x <= 0) {
	        ani_fin_flip = true; // mark as flipped
	        flip_scale_x = 0; // prevent negative scale
	    }
	} else {
	    flip_scale_x += flip_speed; // expanding the card
	    if (flip_scale_x >= 1) {
			// finish flip
	        flip_scale_x = 1; // full-size card
	        ani_act_flip = false; // flip finished
	    }
	}
}

if (alarm[0] == -1 && ani_fin_flip && !active && !cleared) {
	// check if all paths leading to encounter are cleared
	var _flag = false;
	if (array_length(encounter_paths) > 0) {
		for (var i = 0; i < array_length(encounter_paths); i++) {
			if (encounter_paths[i].cleared) {
				_flag = true;
				break;
			}
		}
	}
	else _flag = true;
	if (_flag) {
		id.active = true;
		alarm[0] = 1;
	}
}