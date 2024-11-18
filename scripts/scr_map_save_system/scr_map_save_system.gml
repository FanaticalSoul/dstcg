//function start_new_game_test (save_system_id = id, deck_file = file_deck) {
function start_new_game () {//(deck_file = file_deck) {
	sout("start_new_game");
	var _encounter_card;
	//with (save_system_id) {
	// create map system
	instance_create_layer(0, 0, "Map_System", obj_map_system);
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
			global.board_m_card[i] = instance_create_layer(_x, _y, "Encounters", obj_encounter_card, {
				card_name  : _encounter_card.name,
				sprite_index_back : spr_encounter_card_sm_back_1,
				encounter_paths : []
			});
			array_pop(_encounters_1);
		}
		else if (_lvl == 2 && array_length(_encounters_2) > 0) {
			_encounter_card = _encounters_2[array_length(_encounters_2)-1];
			global.board_m_card[i] = instance_create_layer(_x, _y, "Encounters", obj_encounter_card, {
				card_name  : _encounter_card.name,
				sprite_index_back : spr_encounter_card_sm_back_2,
				encounter_paths : []
			});
			array_pop(_encounters_2);
		}
		else if (_lvl == 3 && array_length(_encounters_3) > 0) {
			_encounter_card = _encounters_3[array_length(_encounters_3)-1]
			global.board_m_card[i] = instance_create_layer(_x, _y, "Encounters", obj_encounter_card, {
				card_name  : _encounter_card.name,
				sprite_index_back : spr_encounter_card_sm_back_3,
				encounter_paths : []
			});
			array_pop(_encounters_3);
		}
		else global.board_m_card[i] = noone;
	}
	// connect paths
	global.board_m_card[4].encounter_paths = [
		global.board_m_card[1].id, 
		global.board_m_card[3].id
	];
	//}
	save_game_map();
}


function save_game_map (file_name = file_map) {
	sout("save_game_map");
	var _save_data = [];
	var _struct;
	var _i_board_m_cards = [];
	// add information on encounter cards
	_struct = [];
	for (var i = 0; i < board_m_size; i++) {
		var _sub_struct = {};
		if (instance_exists(global.board_m_card[i])) {
			with (global.board_m_card[i]) {
				_sub_struct = {
					object : object_get_name(object_index),
					layer : "Encounters",
					depth : depth,
					x : x,
					y : y,
					card_name : card_name,
					ani_act_flip : ani_act_flip,
					ani_fin_flip : ani_fin_flip,
					flip_speed : flip_speed,
					sprite_index_back : sprite_index_back,
					encounter_paths : [], // WoL
					cleared : cleared,
					active : active
				};
				array_push(_i_board_m_cards, card_name);
			}
		}
		else array_push(_i_board_m_cards, "");
		array_push(_struct, _sub_struct); // noone are replaced by {}
	}
	array_push(_save_data, _struct);
	// add information on system
	_struct = {};
	with (obj_map_system) {
		_struct = {
			object : object_get_name(object_index),
			layer : "Map_System",
			depth : depth,
			x : x,
			y : y,
			i_board_m_cards : _i_board_m_cards, // WoL // put names here to load later
			i_random_seed   : random_get_seed()
		};
	}
	array_push(_save_data, _struct);
	// save all this information
	var _save_w = file_text_open_write(file_name);
	var _save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}
function load_game_map (file_name = file_map) {
	sout("load_game_map");
	if (file_exists(file_name)) {
		var _save_r = file_text_open_read(file_name);
		var _save_data_str = file_text_read_string(_save_r);
		var _save_data = json_parse(_save_data_str);
		sout("encounter info");
		sout(_save_data[0]);
		/*
		for (var i = 0; i < board_m_size; i++) {
			var _sub_struct = {};
			if (instance_exists(global.board_m_card[i])) {
				with (global.board_m_card[i]) {
					_sub_struct = {
						object : object_get_name(object_index),
						layer : "Encounters",
						depth : depth,
						x : x,
						y : y,
						card_name : card_name,
						ani_act_flip : ani_act_flip,
						ani_fin_flip : ani_fin_flip,
						flip_speed : flip_speed,
						sprite_index_back : sprite_index_back,
						encounter_paths : [], // WoL
						cleared : cleared,
						active : active
					};
					array_push(_i_board_m_cards, card_name);
				}
			}
		else array_push(_i_board_m_cards, "");
		*/
		var _struct = _save_data[0];
		global.board_m_card = [];
		for (var i = 0; i < board_m_size; i++) {
			// create an encounter
			var _card = _struct[i];
			if (struct_exists(_card, "card_name")) {
				array_push(global.board_m_card, instance_create_struct(_card));
			}
			else array_push(global.board_m_card, noone);
		}
		// connect paths
		global.board_m_card[4].encounter_paths = [
			global.board_m_card[1].id, 
			global.board_m_card[3].id
		];
		// create map system
		_struct = _save_data[1];
		
		//sout(_save_data[1]);
		// get map cards
		var _i_board_m_cards = [];
		with (_struct) {
			for (var i = 0; i < board_m_size; i++) {
				if (i_board_m_cards[i]=="") array_push(_i_board_m_cards, noone);
				else {
					for (var j = 0; j < board_m_size; j++) {
						if (global.board_m_card[j] != noone) {
							if (i_board_m_cards[i]==global.board_m_card[j].card_name) {
								array_push(_i_board_m_cards, global.board_m_card[j]);
								break;
							}
						}
					}
				}
			}
		}
		_struct.i_board_m_cards = _i_board_m_cards;
		// create map system
		instance_create_struct(_struct);
		file_text_close(_save_r);
	}
	else sout("failed to load map");
}

// fix encounter paths on load // WoL
/*
if (i == board_m_size-1) {
	_sub_struct.encounter_paths = [global.board_m_card[1],global.board_m_card[3]];
}
*/





function start_new_encounter (e_deck_load = [], file_name = file_deck) {
	sout("start_new_encounter");
	// load deck information
	var _save_r = file_text_open_read(file_name);
	var _save_data_str = file_text_read_string(_save_r);
	var _save_data = json_parse(_save_data_str);
	
	
	
	
	var _deck_size = _save_data[0].deck_size;
	var _deck_load = _save_data[0].deck;
	var _hand_load = _save_data[0].hand;
	/*
	sout("</");
	sout(_save_data[0]);
	sout("/>");	
	*/
	// add cards to top of deck
	while (array_length(_hand_load)>0) {
		_deck_load[_deck_size][0] = _hand_load[array_length(_hand_load)-1];
		_deck_load[_deck_size][1] = true;
		array_pop(_hand_load);
		_deck_size++;
	}
	/*
	sout("</");
	sout(_hand_load);
	sout(_deck_load);
	sout("/>");	
	*/
	// create player
	var _player_id = instance_create_layer(start_player_cords[0], start_player_cords[1], "Instances", obj_player, {
		character_load : _save_data[0].character,
		deck_load : _deck_load,
		//hand : _save_data[0].hand,
		//hand : _save_data[0].hand,
		//hand_size : array_length(_save_data[0].hand),
		discard_load : _save_data[0].discard,
		shuffled : _save_data[0].shuffled,
		ability_used : _save_data[0].act_ability
	});
	// generate encounter from drawn encounter card // WoL
	var _e_deck_id = instance_create_layer(e_deck_cords[0], e_deck_cords[1], "Instances", obj_enemy_deck, {
		deck_load : e_deck_load
	});
	// create encounter system //
	instance_create_layer(0, 0, "Encounter_System", obj_encounter_system, {
		player : _player_id,
		e_deck : _e_deck_id
	});
	// save
	//player_save_id = _player_id;
}