global.game_data = {
	//souls : 0,
	room_data : {}
};

function save_room() {
	// for now, save room will only be called at the start of each major phase // WoL
	var _save_data = [];
	var _struct;
	// set encounter and cards on board
	with (obj_encounter) {
		_struct = {
			id : id,
			object : object_get_name(object_index),
			layer : layer,
			depth : depth,
			x : x,
			y : y,
			player : player,
			i_phase_c_place : global.phase_c_place,
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
			if (instance_exists(global.board_c_card[i])) {
				with (global.board_c_card[i]) {
					// set structure of character card
					var _struct_child = {
						// information on a card
						id : id,
						object : object_get_name(object_index),
						layer : layer,
						depth : depth,
						x : des_x, // WoL
						y : des_y, // WoL
						card_speed : card_speed,
						character : character,
						player : player.id, // TF // WoL
						//player : noone, // TF // WoL
						act_ability : act_ability,
						act_move : false,
						conditions : conditions, // WoL
						temp_depth : temp_depth,
						damage_taken : 0,
						damage_stack : 0
					};
					// add information to inital character board
					_struct.i_board_c_card[i] = _struct_child;
				}
			}
			else _struct.i_board_c_card[i] = noone;
			// set enemy cards on board
			if (instance_exists(global.board_e_card[i])) {
				with (global.board_e_card[i]) {
					// set structure of enemy card
					var _struct_child = {
						// information on a card
						id : id,
						object : object_get_name(object_index),
						layer : layer,
						depth : depth,
						x : des_x, // WoL
						y : des_y, // WoL
						placement : placement,
						card_stats : card_stats,
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
						deck : deck.id // TF // WoL
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
	// get players
	var _player_ids = [];
	for (var i = 0; i < board_size; i++) {
		if (instance_exists(_save_data[0].i_board_c_card[i])) {
			array_push(_player_ids, _save_data[0].i_board_c_card[i].player.id);
		}
	}
	// use only the first id // add a for loop later ( WoL )
	var _player_id = _player_ids[0];
	var _associated_ids = []; // 0 = D // 1 = Char // 2 = Disc // 3 = Gauge
	// save assossiated deck
	with (_player_id.deck) {
		_struct = {
			id : id,
			object : object_get_name(object_index),
			layer : layer,
			depth : depth,
			x : x,
			y : y,
			player : _player_id,
			shuffled : shuffled,
			deck : deck,
			deck_size : deck_size
		};
		array_push(_associated_ids, _struct);
		array_push(_save_data, _struct);
	}
	// get associated character card
	for (var i = 0; i < board_size; i++) {
		// could be a loop within a loop when multiple players are involved
		if (instance_exists(_save_data[0].i_board_c_card[i])) {
			if (_save_data[0].i_board_c_card[i].player.id == _player_id) {
				array_push(_associated_ids, _save_data[0].i_board_c_card[i].id);
			}
		}
	}
	// save assossiated discard
	with (_player_id.discard) {
		_struct = {
			id : id,
			object : object_get_name(object_index),
			layer : layer,
			depth : tmp_depth,
			x : x,
			y : y,
			player : _player_id,
			discard : discard,
			discard_size : discard_size
		};
		array_push(_associated_ids, _struct);
		array_push(_save_data, _struct);
	}
	// save assossiated gauge
	with (_player_id.gauge) {
		_struct = {
			id : id,
			object : object_get_name(object_index),
			layer : layer,
			depth : tmp_depth,
			x : x,
			y : y,
			player : _player_id,
			ending_sprite_width : ending_sprite_width
		};
		array_push(_associated_ids, _struct);
		array_push(_save_data, _struct);
	}
	////////////////////////////
	// save players ( should be the last thing save and load )
	with (_player_id) {
		_struct = {
			id : id,
			object : object_get_name(object_index),
			layer : layer,
			depth : depth,
			x : x,
			y : y,
			deck : _associated_ids[0],
			character : _associated_ids[1],
			discard : _associated_ids[2],
			gauges : _associated_ids[3],
			hand_size : hand_size,
			hand : [],
			act_cycle : act_use_equip,
			act_cycle : act_cycle,
			act_attack : act_attack,
			act_cycle : act_cycle
		};
		// set hand cards
		for (var i = 0; i < hand_size; i++) {
			// set character cards on board
			if (instance_exists(hand[i])) {
				with (hand[i]) {
					// set structure of start card
					var _struct_child = {
						// information on a card
						id : id,
						object : object_get_name(object_index),
						layer : layer,
						depth : depth,
						card_speed : card_speed,
						card_stats : card_stats,
						hand_position : hand_position,
						player : _player_id,
						show_card : show_card,
						ani_act_draw : ani_act_draw,
						ani_fin_draw : ani_fin_draw
					};
					// add information to player
					_struct.hand[i] = _struct_child;
				}
			}
			else _struct.hand[i] = noone;
		array_push(_save_data, _struct);
	}
	// save all this information
	struct_set(global.game_data.room_data, room_get_name(room), _save_data);
	var _save_w = file_text_open_write("save_system_test.txt");
	var _save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}
function scr_room_load () {
	var _save_data = struct_get(global.game_data.room_data, room_get_name(room));
	// a save save exists
	if (_save_data != undefined) {
		// destroy everything
		
		// create player
		
		// create player deck
		
		// create player deck discard
		
		// create player cards
		
		// create enemy deck
		
		// create enemy cards
		
	}

}


function scr_game_save () {//_player_id = obj_player) {
	/*
	var _save_data = [];
	var _struct = {
		phase_c_place : global.phase_c_place,
		phase_e_place : global.phase_e_place,
		phase_e_act : global.phase_e_act,
		phase_c_act : global.phase_c_act,
		random_seed : global.random_seed
		// TR //phase_mulligan : global.phase_mulligan, // sub phase
		// TR //phase_react : global.phase_react // sub phase
	};
	array_push(_save_data, _struct);
	// set deck
	with (obj_player.deck) {
		_struct = {
			object : object_get_name(object_index),
			x : x,
			y : y,
			player : player
		};
		array_push(_save_data, _struct);
	}
	*/
	scr_save_room()
	//player = obj_player;
	//e_deck = obj_enemy_deck;
	
	var _save_w = file_text_open_write("save_system_test.txt");
	var _save_data_str = json_stringify(global.game_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}
















// set cards in deck from save


/*
ini_open("start_deck.ini");
for (var i = 0; i < deck_min; i++) {
	deck[i][0] = ini_read_string("deck",string(i),"");
}
ini_close();
deck_size = deck_min;
*/

function scr_game_load () {
	if (file_exists("save_system_test.txt")) {
		var _save_r = file_text_open_read("save_system_test.txt");
		var _save_data_str = file_text_read_string(_save_r);
		var _save_data = json_parse(_save_data_str);
		
		/*
		// set global varibles
		global.phase_c_place = _save_data[0].phase_c_place;
		global.phase_e_place = _save_data[0].phase_e_place;
		global.phase_e_act = _save_data[0].phase_e_act;
		global.phase_c_act = _save_data[0].phase_c_act;
		global.random_seed = _save_data[0].random_seed;
		var _object_array = [
			// start cards
			obj_player,
			obj_start_deck,
			obj_start_card,
			obj_start_discard,
			// character cards
			obj_character_card,
			// enemies
			obj_enemy_deck,
			obj_enemy_card,
		];

		*/
		//instance_destroy (obj_encounter);
		for (var i = 0; i < array_length(_save_data); i++) {
			var _struct = _save_data[i];
			instance_create_layer(_struct.x,_struct.y,"Encounter_System", asset_get_index(_struct.object), _struct);
		}
		//*/
		
		
		file_text_close(_save_r);
	}
}