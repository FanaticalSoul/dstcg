


function save_data_deck (player = noone, file_name = file_deck) {
	sout("save_data_deck");
	var _save_data = [];
	var _struct;
	// set encounter and cards on board
	_struct = noone;
	if (instance_exists(player)) {
		with (player) {
			var _hand_str = [];
			for (var i = 0; i < array_length(hand); i++) _hand_str[i] = hand[i].card_name;
			_struct = {
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
	array_push(_save_data, _struct);
	//
	//_struct = noone;
	// save data
	var _save_w = file_text_open_write(file_name);
	var _save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
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
		shuffled : false
	};
	array_push(_save_data, _struct);
	//
	_struct = {
		rewards : deck,
		loot : [],
		inventory : [deck, 0] // [ [ equipment and stamina ] , souls ]
	};
	array_push(_save_data, _struct);
	// save data
	var _save_w = file_text_open_write(file_name);
	var _save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}
