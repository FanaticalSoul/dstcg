function scr_enemy_card_ghru_leaper (_id) {
	scr_enemy_card_basic_attack (_id,attack,attack_value);
	return;
}
function scr_enemy_card_irithyllian_beast_hound (_id) {
	scr_enemy_card_basic_attack (_id,attack,attack_value);
	return;
}

function scr_enemy_card_basic_attack (_id,_attack,_attack_value) {
	for (var _i = 0; _i < array_length(_attack); _i++) {
		// check target position for player
		var _target_character = obj_player.board_card[_attack[_i].attack_location-1]; // change obj_player ( WoL )
		var _row_start = 0;
		// check row for character with highest taunt value
		for (var _j = 0; _j < board_rows; _j ++) {
			if (_target_character == noone) {
				//_row_start = int64((_attack[_i].attack_location-1)/board_cols)*board_cols;
				_row_start = abs(int64((_attack[_i].attack_location-1)/board_cols)-_j)*board_cols;
				_target_character = scr_character_row_check (_target_character, _row_start, obj_player.board_card);
			}
			else break;
		}
		// if target is valid
		if (_target_character != noone) {
			// do each basic attack listed
			sout(_id.card_stats.name+" is targeting "+_target_character.card_stats.name);
			// for each attack, allow targeted player to respond once ( if they can )
			_target_character.player.reaction = true;
			// check if any cards in hand or on field can react
			reaction_flag = false;
			// they can use their characters reaction ability
			if (_target_character.card_stats.reaction && !_target_character.ability_used) reaction_flag = true;
			// 
			else {
				var _hand_card = _target_character.player.hand_card;
				// check equipment cards in hand for reaction cards
				for (var _j = 0; _j < _target_character.player.hand_size; _j++) {
					for (var _k = 0; _k < array_length(_hand_card[_j].card_stats); _k++) {
						if (_hand_card[_j].card_stats[0].type = "equipment") {
							if (_hand_card[_j].card_stats[_k].reaction) {
								reaction_flag = true;
								break;
							}
						}
					}
				}
			}
			// WoL
			// reaction currently causes too many issues, as I haven't
			// programmed anything for it yet
			reaction_flag = false; // TF // temp fix for reactions
			if (reaction_flag) {
				// they can use an equipment to react
				sout("the player can react to this attack");
				// PLAYER REACTION CODE // WoL //
				// take into account _attack_value
				// create a value on character for incoming damage, thats applied instead ( after being revised )
			}
			else {
				sout("the player can\'t react to this attack");
				_target_character.player.reaction = false;
			}
			// resolve damage on player
			_target_character.damage_taken += _attack_value;
		}
	}
	return;
}



function scr_character_row_check (_target_character, _row_start, _character_board) {
	var _target_characters = [];
	for (var _k = _row_start; _k < _row_start+board_cols; _k++) {
		// for each column in the current row
		if (_character_board[_k] != noone) {
			// add an existing character
			array_push(_target_characters,_character_board[_k]);
		}
	}
	// if possible targets were found in the same row
	if (array_length(_target_characters) > 0) {
		//_target_character = noone;
		for (var _k = 0; _k < array_length(_target_characters); _k++) {
			// set the target if there is no target currently set
			if (_target_character == noone) _target_character = _target_characters[_k];
			// replace the target character with a character in the same row that has a higher taunt value
			else if (_target_characters[_k].card_stats.taunt_value > _target_character.card_stats.taunt_value) {
				_target_character = _target_characters[_k];
			}
		}
	}
	return _target_character;
}