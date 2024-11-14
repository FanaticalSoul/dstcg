/*TR//
global.game_data = {
	//souls : 0,
	room_data : {}
};
//TR*/

/// @function					save_game_delete(file_name);
/// @param {string} file_name	save file name
/// @description				delete save data

function save_game_delete (file_name = file_data) {
	if (file_exists(file_name)) {
		file_delete(file_name);
	}
}

/// @function					start_new_game();
/// @description				load the created deck and character, phases ect...
///								this will later be used to load the player into the map ( WoL )

function start_new_game(save_system_id = id, deck_file = file_deck) {
	with (save_system_id) {
		sout("starting a new game");
		// load deck information
		ini_open(deck_file);
		var _deck_load = [];
		var _deck_size = ini_read_string("deck_size", string(0), string(deck_min));
		var _character_load = ini_read_string("character", string(0), string("herald"));
		for (var i = 0; i < _deck_size; i++) {
			var _start_card = ini_read_string("deck",string(i),"");
			array_push(_deck_load, [_start_card, false]);
		}
		ini_close();
		// create player
		var _player_id = instance_create_layer(start_player_cords[0], start_player_cords[1], "Instances", obj_player, {
			character_load : _character_load,
			deck_load : _deck_load,
			discard_load : []
		});
		// generate encounter from drawn encounter card // WoL
	
		//_deck_load = ["ghru leaper","irithyllian beast hound","ghru leaper"];
		//_deck_load = ["silver knight spearman","irithyllian slave warrior"];//,"silver knight spearman"];
		_deck_load = ["test","test","test","test","test","test"];//,"silver knight spearman"];
		var _e_deck_id = instance_create_layer(e_deck_cords[0], e_deck_cords[1], "Instances", obj_enemy_deck, {
			deck_load : _deck_load
		});
		// create encounter system //
		instance_create_layer(0, 0, "Encounter_System", obj_encounter_system, {
			player : _player_id,
			e_deck : _e_deck_id
		});
		// save
		//player_save_id = _player_id;
	}
}

/// @function					save_start_deck(start_deck, start_character, [deck_size], [deck_file]);
/// @description				save the deck made for a new game

function save_start_deck (start_deck, start_character, deck_size = deck_min, deck_file = file_deck) {
	ini_open(deck_file);
	for (var i = 0; i < deck_size; i++) {
		ini_write_string("deck",string(i),start_deck[i]);
	}
	ini_write_string("character", string(0), start_character);
	ini_write_string("deck_size", string(0), deck_size);
	ini_close();
}


function save_game (player_id, file_name = file_data) { // do single player saves for now // WoL
	sout("saving game");
	// for now, save room will only be called at the start of each major phase // WoL
	var _save_data = [];
	var _struct;
	// set encounter and cards on board
	with (obj_encounter_system) {
		_struct = {
			object : object_get_name(object_index),
			layer : "Encounter_System",
			depth : depth,
			x : x,
			y : y,
			i_phase_c_place : global.phase_c_place,
			i_phase_e_place : global.phase_e_place,
			i_phase_e_act : global.phase_e_act,
			i_phase_c_act : global.phase_c_act,
			i_phase_mulligan : global.phase_mulligan,
			i_phase_react : global.phase_react,
			i_board_c_card : [],
			i_board_e_card : [],
			i_random_seed : global.random_seed
		};
		for (var i = 0; i < board_size; i++) {
			// set character cards on board
			//if (instance_exists(global.board_c_card[i])) {
			if (global.board_c_card[i] != noone) {
				with (global.board_c_card[i]) {
					// set structure of character card
					var _struct_child = {
						// information on a card
						//id : player_id.character.id,
						object : object_get_name(object_index),
						layer : layer_get_name(player_id.layer),
						depth : temp_depth,
						inital_x : inital_x,
						inital_y : inital_y,
						x : des_x, // WoL
						y : des_y, // WoL
						card_speed : card_speed,
						character : character,
						act_ability : act_ability,
						act_move : false,
						conditions : conditions, // WoL
						damage_taken : 0//,
						//damage_stack : 0,
						//condition_stack : []
					};
					// add information to inital character board
					_struct.i_board_c_card[i] = _struct_child;
				}
			}
			else _struct.i_board_c_card[i] = noone;
			// set enemy cards on board
			//if (instance_exists(global.board_e_card[i])) {
			if (global.board_e_card[i] != noone) {
				with (global.board_e_card[i]) {
					// set structure of enemy card
					var _struct_child = {
						// information on a card
						//id : id,
						object : object_get_name(object_index),
						layer : layer_get_name(player_id.layer),
						depth : tmp_depth,
						x : des_x, // WoL
						y : des_y, // WoL
						placement : placement,
						//card_stats : card_stats,
						card_name : card_name,
						card_speed : card_speed,
						flip_speed : flip_speed,
						wound_spacing : wound_spacing,
						ani_delay_attack : ani_delay_attack,
						ani_act_board : ani_act_board,
						ani_fin_board : ani_fin_board,
						ani_act_flip : ani_act_flip,
						ani_fin_flip : ani_fin_flip,
						wounds : wounds,
						conditions : conditions, // WoL
						reanimated : reanimated
						//deck : deck.id // TF // WoL
						//deck : noone // TF // WoL
					};
					// add information to inital enemy board
					_struct.i_board_e_card[i] = _struct_child;
				}
			}
			else _struct.i_board_e_card[i] = noone;
		}
		array_push(_save_data, _struct);
	}
	// get players ( and their assossated stuff )
	// WoL
	// save assossiated deck
	with (player_id.deck) {
		_struct = {
			//id : id,
			object : object_get_name(object_index),
			layer : layer_get_name(player_id.layer),
			depth : depth,
			x : x,
			y : y,
			//player : player_id,
			shuffled : shuffled,
			deck_load : deck,
			deck_size : deck_size
		};
		//array_push(_associated_ids, _struct);
		array_push(_save_data, _struct);
	}
	// get associated character card // WoL
	
	// save assossiated discard
	with (player_id.discard) {
		_struct = {
			object : object_get_name(object_index),
			layer : layer_get_name(player_id.layer),
			depth : tmp_depth,
			x : x,
			y : y,
			//player : undefined,
			discard_load : discard,
			discard_size : discard_size
		};
		array_push(_save_data, _struct);
	}
	// save assossiated gauges
	with (player_id.gauges) {
		_struct = {
			//id : id,
			object : object_get_name(object_index),
			layer : layer_get_name(player_id.layer),
			depth : depth,
			x : x,
			y : y,
			//player : player_id,
			ending_sprite_width : ending_sprite_width
		};
		//array_push(_associated_ids, _struct);
		array_push(_save_data, _struct);
	}
	// save players ( should be the last thing save and load )
	with (player_id) {
		_struct = {
			object : object_get_name(object_index),
			layer : layer_get_name(layer),
			depth : depth,
			x : x,
			y : y,
			deck_load : player_id.deck_load,
			character_load : player_id.character_load,
			discard_load : player_id.discard_load,
			hand_size : hand_size,
			hand : [],
			act_equip_use : act_equip_use,
			act_cycle : act_cycle,
			act_attack : act_attack
		};
		// set hand cards
		for (var i = 0; i < hand_size; i++) {
			// set character cards on board
			if (instance_exists(hand[i])) {
				with (hand[i]) {
					// set structure of start card
					var _struct_child = {
						// information on a start card
						x : x,
						y : y,
						object : object_get_name(object_index),
						layer : layer_get_name(player_id.layer),
						depth : depth,
						card_speed : card_speed,
						card_name : card_name,
						hand_position : hand_position,
						show_card : show_card,
						ani_act_draw : ani_act_draw,
						ani_fin_draw : ani_fin_draw
					};
					// add information to player
					_struct.hand[i] = _struct_child;
				}
			}
			else _struct.hand[i] = noone;
		}
		array_push(_save_data, _struct);
	}
	// save each enemy deck
	var _e_deck_ids = [];
	for (var i = 0; i < instance_number(obj_enemy_deck); i++) {
	    array_push(_e_deck_ids, instance_find(obj_enemy_deck, i));
	}
	var _e_deck_id = _e_deck_ids[0];
	// save e_deck
	with (_e_deck_id) {
		_struct = {
			object : object_get_name(object_index),
			layer : layer_get_name(player_id.layer),
			depth : depth,
			x : x,
			y : y,
			deck_load : deck,
			shuffled : shuffled
		};
		array_push(_save_data, _struct);
	}
	// save all this information
	//TR//struct_set(global.game_data.room_data, room_get_name(room), _save_data);
	var _save_w = file_text_open_write(file_name);
	var _save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}

function load_game (file_name = file_data) {
	sout("loading game");
	if (file_exists(file_name)) {
		var _save_r = file_text_open_read(file_name);
		var _save_data_str = file_text_read_string(_save_r);
		var _save_data = json_parse(_save_data_str);
		
		
		// load globals
		var _struct = _save_data[0];
		// character board
		var _character_ids = [];
		var _i_board_c_card = [];
		for (var i = 0; i < array_length(_struct.i_board_c_card); i++) {
			if (is_struct(_struct.i_board_c_card[i])) {
				// if character card exists
				// create character card and add it's id to the board
				var _character_id = instance_create_struct(_struct.i_board_c_card[i]);
				array_push(_i_board_c_card, _character_id);
				array_push(_character_ids, _character_id);
			}
			else array_push(_i_board_c_card, noone);
		}
		// enemy board
		var _i_board_e_card = [];
		var _enemy_ids = [];
		for (var i = 0; i < array_length(_struct.i_board_e_card); i++) {
			if (is_struct(_struct.i_board_e_card[i])) {
				// if character card exists
				// create character card and add it's id to the board
				var _enemy_id = instance_create_struct(_struct.i_board_e_card[i]);
				array_push(_i_board_e_card, _enemy_id);
				array_push(_enemy_ids, _enemy_id);
			}
			else array_push(_i_board_e_card, noone);
		}
		// set player
		var _player_save_index = -1;
		var _tmp_struct = {
			start_deck : noone,
			start_discard : noone,
			player_gauges : noone
		};
		for (var i = 0; i < array_length(_save_data); i++) {
			_struct = _save_data[i];
			//sout("loading... "+string(i));
			var _tmp_obj = string(_struct.object);
			//sout(_tmp_obj);
			if (_tmp_obj == "obj_player") _player_save_index = i;
			else if (_tmp_obj != "obj_encounter_system") { // don't load encounter system
				//sout("didn't make a player "+_tmp_obj);
				var _tmp_id = instance_create_struct(_struct);
				if (_tmp_obj == "obj_start_deck") {
					struct_set(_tmp_struct, "start_deck", _tmp_id);
				}
				else if (_tmp_obj == "obj_player_gauges") {
					struct_set(_tmp_struct, "player_gauges", _tmp_id);
				}
				else if (_tmp_obj == "obj_start_discard") {
					struct_set(_tmp_struct, "start_discard", _tmp_id);
				}
				else {
					// load e_deck // WoL
					// update enemy cards
					for (var j = 0; j < array_length(_enemy_ids); j++) {
						var _enemy_id = _enemy_ids[j];
						// WoL // connect enemy to difficulty deck
						_enemy_id.deck = _tmp_id;
					}
				}
			}
			else if (_tmp_obj == "obj_encounter_system") {
				var _tmp_id = encounter_system_create(_struct,_i_board_c_card,_i_board_e_card);
			}
		}
		
		// create player
		if (_player_save_index != -1) {
			//sout("made player");
			var _player_id = player_create_struct(_save_data[_player_save_index], _tmp_struct, _character_ids);
		}

		
		
		
		file_text_close(_save_r);
	}
}

// create an instance from a structure
function instance_create_struct (struct_id) {
	var _x = struct_id.x;
	var _y = struct_id.y;
	var _layer_id = layer_get_id(struct_id.layer);
	var _object_id = asset_get_index(struct_id.object);
	struct_remove(struct_id, "object");
	struct_remove(struct_id, "x");
	struct_remove(struct_id, "y");
	struct_remove(struct_id, "layer");
	//sout (struct_id);
	return instance_create_layer(_x, _y, _layer_id, _object_id, struct_id);
}



function encounter_system_create (struct_id, c_board, e_board) {
	var _x = struct_id.x;
	var _y = struct_id.y;
	var _layer_id = layer_get_id(struct_id.layer);
	var _object_id = asset_get_index(struct_id.object);
	struct_remove(struct_id, "object");
	struct_remove(struct_id, "x");
	struct_remove(struct_id, "y");
	struct_remove(struct_id, "layer");
	struct_set(struct_id, "i_board_c_card", c_board);
	struct_set(struct_id, "i_board_e_card", e_board);
	return instance_create_layer(_x, _y, _layer_id, _object_id, struct_id);
}


function player_create_struct (struct_id_1, struct_id_2, character_ids) {
	var _x = struct_id_1.x;
	var _y = struct_id_1.y;
	var _layer_id = layer_get_id(struct_id_1.layer);
	var _object_id = asset_get_index(struct_id_1.object);
	struct_remove(struct_id_1, "object");
	struct_remove(struct_id_1, "x");
	struct_remove(struct_id_1, "y");
	struct_remove(struct_id_1, "layer");
	struct_set(struct_id_1, "deck", struct_id_2.start_deck);
	struct_set(struct_id_1, "discard", struct_id_2.start_discard);
	struct_set(struct_id_1, "gauges", struct_id_2.player_gauges);
	var _character_id = undefined;
	for (var i = 0; i < array_length(character_ids); i++) {
		if (character_ids[i].character == struct_id_1.character_load) {
			// if the character id matches the character the player picked
			_character_id = character_ids[i];
			break;
		}
	}
	struct_set(struct_id_1, "character", _character_id);
	// load each card in hand
	
	// save card id's to hand
	
	//sout("player hand");
	//sout(struct_id_1.hand);
	var _hand_array = [];
	for (var i = 0; i < array_length(struct_id_1.hand); i++) {
		if (struct_id_1.hand[i] != noone) {
			//sout("making card");
			var _sub_struct = struct_id_1.hand[i];
			var _start_card = instance_create_struct(_sub_struct);
			array_push(_hand_array, _start_card);
		}
		else {
			//sout("skipping card");
			array_push(_hand_array, noone);
		}
	}
	struct_set(struct_id_1, "hand", _hand_array);
	
	// create player
	var _player_id = instance_create_layer(_x, _y, _layer_id, _object_id, struct_id_1);
	// update player id's
	struct_id_1.deck.player = _player_id;
	struct_id_1.discard.player = _player_id;
	struct_id_1.gauges.player = _player_id;
	_character_id.player = _player_id;
	for (var i = 0; i < array_length(_hand_array); i++) {
		if (_hand_array[i] != noone) {
			_hand_array[i].player = _player_id;
		}
	}
	// create player
	return _player_id;
}
