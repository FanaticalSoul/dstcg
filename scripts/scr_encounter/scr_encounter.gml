
function game_death () {
	sout("game_death");
	// lose loot
	save_data_loot(false);
	// play you died animation // WoL
	
	// go to bonfire
	bonfire_rest();
}

function game_over () {
	sout("game_over");
	// for now just delete the save data and reset the game // WoL
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


function update_encounter_status (toggle_bonfire = true, file_name = file_map) {
	// update encounter status
	if (file_exists(file_name)) {
		var _save_data = get_data_file(file_name);
		// update encounter status
		for (var i = 0; i < board_m_size; i++) {
			if (struct_exists(_save_data[0][i], "active")) {
				if (_save_data[0][i].active && !_save_data[0][i].cleared) {
					_save_data[0][i].active = false;
					_save_data[0][i].cleared = true;
					break;
				}
			}
		}
		// toggle bonfire on
		if (toggle_bonfire) _save_data[1].bonfire = true;
		// override file
		set_data_file(_save_data, file_name);
	}
	// delete encounter information
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
