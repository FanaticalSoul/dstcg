function start_new_game_test (save_system_id = id, deck_file = file_deck) {
	var _encounter_card;
	with (save_system_id) {
		//sout("testing");
		
		// set inital random seed
		randomize();
		var _rand_seed = random_get_seed();
		// set random decks
		var _encounters_1 = [];
		var _encounters_2 = [];
		var _encounters_3 = [];
		for (var i = 1; i <= 3; i++) {
			for (var j = 0; j < array_length(encounter_card_stats); j++) {
				if (i == encounter_card_stats[j].encounter_level) {
					if (i == 1) array_push(_encounters_1, encounter_card_stats[j]);
					if (i == 2) array_push(_encounters_2, encounter_card_stats[j]);
					if (i == 3) array_push(_encounters_3, encounter_card_stats[j]);
				}
			}
		}
		_encounters_1 = array_shuffle(_encounters_1);
		_encounters_2 = array_shuffle(_encounters_2);
		_encounters_3 = array_shuffle(_encounters_3);
		// place inital encounter cards
		for (var i = 0; i < board_m_size; i++) {
			var _lvl = global.board_m_cords[i][0];
			var _x = global.board_m_cords[i][1];
			var _y = global.board_m_cords[i][2];
			if (_lvl == 1 && array_length(_encounters_1) > 0) {
				_encounter_card = _encounters_1[array_length(_encounters_1)-1];
				instance_create_layer(_x, _y, "Encounters", obj_encounter_card, {
					card_name  : _encounter_card.name,
					sprite_index_back : spr_encounter_card_sm_back_1
				});
				global.board_m_card[i] = _encounter_card;
				array_pop(_encounters_1);
			}
			else if (_lvl == 2 && array_length(_encounters_2) > 0) {
				_encounter_card = _encounters_2[array_length(_encounters_2)-1];
				instance_create_layer(_x, _y, "Encounters", obj_encounter_card, {
					card_name  : _encounter_card.name,
					sprite_index_back : spr_encounter_card_sm_back_2
				});
				global.board_m_card[i] = _encounter_card;
				array_pop(_encounters_2);
			}
			else if (_lvl == 3 && array_length(_encounters_3) > 0) {
				_encounter_card = _encounters_3[array_length(_encounters_3)-1]
				instance_create_layer(_x, _y, "Encounters", obj_encounter_card, {
					card_name  : _encounter_card.name,
					sprite_index_back : spr_encounter_card_sm_back_3
				});
				global.board_m_card[i] = _encounter_card;
				array_pop(_encounters_3);
			}
			else global.board_m_card[i] = noone;
		}
	}
}