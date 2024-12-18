


function save_data_deck (player = noone, file_name = file_deck) {
	sout("save_data_deck");
	// set encounter and cards on board
	var _deck_data = {};
	if (instance_exists(player)) {
		with (player) {
			var _hand_str = [];
			/////////////////////////////
			for (var i = 0; i < array_length(hand); i++) _hand_str[i] = hand[i].card_name;
			_deck_data = {
				deck : deck.deck,
				hand : _hand_str,
				discard : discard.discard,
				character : character.character,
				act_ability : character.act_ability,
				deck_size : deck.deck_size,
				discard_size : discard.discard_size,
				shuffled : deck.shuffled
			};
		}
	}
	// add rewards and other such things // CiD
	
	//var _save_data_str;
	// add information about inventory, loot, and rewards
	var _save_r = file_text_open_read(file_name);
	var _save_data_str = file_text_read_string(_save_r);
	var _save_data = [_deck_data, json_parse(_save_data_str)[1], json_parse(_save_data_str)[2]];
	file_text_close(_save_r);
	// save data
	set_data_file(_save_data, file_name);
}

function save_data_deck_start (deck, character, file_name = file_deck) {
	sout("save_data_deck_start");
	var _save_data = [];
	var _struct;
	// update deck
	var _start_deck;
	for (var i = 0; i < deck_min; i++) {
		_start_deck[i][0] = "";
		_start_deck[i][1] = false;
	}
	for (var i = 0; i < array_length(deck); i++) {
		_start_deck[i][0] = deck[i];
	}
	
	// new game
	_struct = {
		deck : _start_deck,
		hand : [],
		deck_size : array_length(_start_deck),
		discard : [],
		character : character,
		act_ability : false,
		shuffled : false,
		discard_size : 0
	};
	array_push(_save_data, _struct);
	// set rewards ect...
	var _deck_cards = [];
	for (var i = 0; i < array_length(deck); i++) {
		if (deck[i] != "") array_push(_deck_cards, deck[i]);
	}
	_struct = {
		rewards : [[], 0],
		loot : [[], 0],
		inventory : [_deck_cards, 0] // [ [ equipment and stamina ] , souls ]
	};
	array_push(_save_data, _struct);
	// set bonfire level ( to 1 )
	array_push(_save_data, 1);
	// save data
	set_data_file(_save_data, file_name);
}

function set_data_rewards (rewards, file_name = file_deck) {
	var _save_data = get_data_file(file_name); // read information
	_save_data[1].rewards = rewards; // update rewards
	set_data_file(_save_data, file_name); // write to file
}

function get_data_rewards (file_name = file_deck) {
	return get_data_file(file_name)[1].rewards;
}
function get_data_inventory (file_name = file_deck) {
	return get_data_file(file_name)[1].inventory;
}
function get_data_loot (file_name = file_deck) {
	return get_data_file(file_name)[1].loot;
}


function save_data_loot (won_encounter = true, file_name = file_deck) {
	sout("save_data_loot");
	sout(object_get_name(id.object_index));
	// read information
	var _save_data = get_data_file(file_name);
	// update rewards
	if (won_encounter) {
		// update inventory
		var _loot_treasure = _save_data[1].loot[0];
		for (var i = 0; i < array_length(_loot_treasure); i++) {
			array_push(_save_data[1].inventory[0], _loot_treasure[i]);
		}
		var _loot_souls = int64(_save_data[1].loot[1]);
		_save_data[1].inventory[1] = int64(_save_data[1].inventory[1]) + _loot_souls;
		// update loot
		_save_data[1].loot = [_save_data[1].rewards[0], _save_data[1].rewards[1]];
	}
	else _save_data[1].loot = [[], 0];
	_save_data[1].rewards = [[], 0];
	// write to file
	set_data_file(_save_data, file_name);
}

function get_data_file (file_name) {
	var _save_r = file_text_open_read(file_name);
	var _save_data_str = file_text_read_string(_save_r);
	var _save_data = json_parse(_save_data_str);
	file_text_close(_save_r);
	return _save_data;
}

function set_data_file (save_data, file_name) {
	var _save_w = file_text_open_write(file_name);
	var _save_data_str = json_stringify(save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}





function save_data_deck_adjustment (deck, file_name = file_deck) {
	// save to assossiated player // WoL
	sout("save_data_deck_adjustment");
	
	var _start_deck;
	for (var i = 0; i < array_length(deck); i++) {
		_start_deck[i][0] = "";
		_start_deck[i][1] = false;
	}
	for (var i = 0; i < array_length(deck); i++) {
		_start_deck[i][0] = deck[i];
	}
	
	
	var _deck_data = {
		deck : _start_deck,
		hand : [],
		discard : [],
		character : get_data_file(file_name)[0].character,
		act_ability : false, // reset at bonfire
		deck_size : array_length(deck),
		discard_size : 0,
		shuffled : false
	};
	// add rewards and other such things // CiD
	
	//var _save_data_str;
	// add information about inventory, loot, and rewards
	var _save_r = file_text_open_read(file_name);
	var _save_data_str = file_text_read_string(_save_r);
	var _save_data = [_deck_data, json_parse(_save_data_str)[1], json_parse(_save_data_str)[2]];
	file_text_close(_save_r);
	// save data
	set_data_file(_save_data, file_name);
}
