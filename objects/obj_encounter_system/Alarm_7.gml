/// @description exit encounter

// log action
sout("game won");

// add loot to inventory

// add rewards to loot

// update file
save_data_deck(player);
// update encounter status
var _file_name = file_map;
var _save_data_str;
if (file_exists(_file_name)) {
	var _save_r = file_text_open_read(_file_name);
	_save_data_str = file_text_read_string(_save_r);
	var _save_data = json_parse(_save_data_str);
	// update encounter status
	sout(_save_data[0]);
	for (var i = 0; i < board_m_size; i++) {
		if (struct_exists(_save_data[0][i], "active")) {
			if (_save_data[0][i].active && !_save_data[0][i].cleared) {
				_save_data[0][i].active = false;
				_save_data[0][i].cleared = true;
				break;
			}
		}
	}
	file_text_close(_save_r);
	sout(_save_data[0]);
	// override file
	var _save_w = file_text_open_write(_file_name);
	_save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}
// delete encounter information
save_game_delete(file_encounter);
// exit encounter
global.room_index = 2;
room_goto(global.room_index);