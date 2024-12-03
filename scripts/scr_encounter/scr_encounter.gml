
function game_death () {
	sout("game_death");
	// lose loot
	save_data_loot(false);
	// play you died animation // WoL
	
	// go to bonfire
	var _bonfire_level = int64(get_data_file(file_deck)[2]);
	if (_bonfire_level+1 > 5) game_over();
	else bonfire_rest();
}

function game_victory () {
	sout("game_victory");
	// for now just delete the save data and reset the game // WoL
	if (file_exists(file_encounter)) file_delete(file_encounter);
	if (file_exists(file_deck)) file_delete(file_deck);
	if (file_exists(file_map)) file_delete(file_map);
	game_restart();
}

function game_over () {
	sout("game_over");
	// for now just delete the save data and reset the game // WoL
	if (file_exists(file_encounter)) file_delete(file_encounter);
	if (file_exists(file_deck)) file_delete(file_deck);
	if (file_exists(file_map)) file_delete(file_map);
	game_restart();
}


function game_won () {
	sout("game_won");
	// update loot
	save_data_loot();
	//save_data_deck(player);
	update_encounter_status(false);
	global.room_index = 2;
	room_goto(global.room_index);
	//game_restart();
	/*
	
	/*
	// update file
	// update encounter status
	// exit encounter
	*/
}


function update_encounter_status (toggle_bonfire = true) {
	// update map file
	var _file_map = file_map;
	var _save_data = get_data_file(_file_map);
	for (var i = 0; i < board_m_size; i++) {
		if (struct_exists(_save_data[0][i], "active")) {
			if (_save_data[0][i].active && !_save_data[0][i].cleared) {
				_save_data[0][i].active = false;
				_save_data[0][i].cleared = true;
				_save_data[0][i].reveal = true;
				break;
			}
		}
	}
	if (toggle_bonfire) _save_data[1].bonfire = true;
	set_data_file(_save_data, _file_map);
	//  update deck file
	if (!toggle_bonfire) save_data_deck(obj_player);
	// delete encounter file
	save_game_delete(file_encounter);
}




function bonfire_rest (file_name = file_deck) {
	sout("bonfire_rest");
	// read information
	var _save_data = get_data_file(file_name);
	// update inventory // add rewards treasures
	var _rewards_treasure = _save_data[1].rewards[0];
	for (var i = 0; i < array_length(_rewards_treasure); i++) {
		array_push(_save_data[1].inventory[0], _rewards_treasure[i]);
	}
	// update inventory // add loot treasures
	var _loot_treasure = _save_data[1].loot[0];
	for (var i = 0; i < array_length(_loot_treasure); i++) {
		array_push(_save_data[1].inventory[0], _loot_treasure[i]);
	}
	// update inventory // add souls to inventory
	_save_data[1].inventory[1] = int64(_save_data[1].inventory[1]);
	_save_data[1].inventory[1] += int64(_save_data[1].loot[1]);
	_save_data[1].inventory[1] += int64(_save_data[1].rewards[1]);
	// reset rewards and loot
	_save_data[1].loot = [[], 0];
	_save_data[1].rewards = [[], 0];
	// level up bonfire //
	var _bonfire_level = int64(_save_data[2])+1;
	if (_bonfire_level > 5) game_over();
	else _save_data[2] = min(_bonfire_level, 5);
	// write to file and update encounter status
	set_data_file(_save_data, file_name);
	update_encounter_status();
	room_goto_bonfire();
}

function room_goto_bonfire (room_index = 4) {
	global.room_index = room_index;
	room_goto(global.room_index);
}



function spoil_bonfire (visual_spoiler) {
	with (visual_spoiler) {
		var _sprite = undefined;
		var _bonfire_level = get_data_file(file_deck)[2];
		if (_bonfire_level == 1) _sprite = spr_bonfire_card_hq_1;
		else if (_bonfire_level == 2) _sprite = spr_bonfire_card_hq_2;
		else if (_bonfire_level == 3) _sprite = spr_bonfire_card_hq_3;
		else if (_bonfire_level == 4) _sprite = spr_bonfire_card_hq_4;
		else if (_bonfire_level == 5) _sprite = spr_bonfire_card_hq_5;
		if (!is_undefined(_sprite)) {
			sprite_index = _sprite;
			if (!visible) visible = true;
		}
	}
}
