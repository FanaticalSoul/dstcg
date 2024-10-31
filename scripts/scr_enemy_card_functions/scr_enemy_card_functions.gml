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
		// change obj_player // WoL
		var _target_character = obj_player.board_card[_attack[_i].attack_location-1];
		var _row_start = 0;
		// check row for character with highest taunt value
		if (_target_character == noone) {
			_row_start = int64((_attack[_i].attack_location-1)/board_cols)*board_cols;
			_target_character = scr_character_row_check (_target_character, _row_start, obj_player.board_card);
		}
		// check other row if character is unset
		if (_target_character == noone) {
			// check other row for character with highest taunt value
			_row_start = abs(int64((_attack[_i].attack_location-1)/board_cols)-1)*board_cols; // WoL
			_target_character = scr_character_row_check (_target_character, _row_start, obj_player.board_card);
		}
		// if program is valid
		if (_target_character != noone) {
			// do each basic attack listed
	
			// for each attack, allow targeted player to respond once ( if they can )
	
			// resolve damage on player
	
			// end this enemies activation
		}
	}
	return;
}



function scr_character_row_check (_target_character, _row_start, _character_board) {
	var _target_characters = [];
	for (var _j = _row_start; _j < _row_start+board_cols; _j++) {
		// for each column in the current row
		if (_character_board[_j] != noone) {
			// add an existing character
			array_push(_target_characters,_character_board[_j]);
		}
	}
	// if possible targets were found in the same row
	if (array_length(_target_characters) > 0) {
		//_target_character = noone;
		for (var _j = 0; _j < _target_characters; _j++) {
			// set the target if there is no target currently set
			if (_target_character == noone) _target_character = _target_characters[_j];
			// replace the target character with a character in the same row that has a higher taunt value
			else if (_target_characters[_j].card_stats.taunt_value > _target_character.card_stats.taunt_value) {
				_target_character = _target_characters[_j];
			}
		}
	}
	return _target_character;
}