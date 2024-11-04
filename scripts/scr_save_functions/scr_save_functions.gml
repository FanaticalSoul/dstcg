/*
function scr_save_encounter () {

	//var _enemy_count = max(0,instance_count(obj_enemy_card));
	var _enemy_count = instance_count(obj_enemy_card);
	
	
	var _encounter_structure = {
		enemy_count : _enemy_count,
		enemy_data : array_create(_enemy_count)
	};
	
	
	
	for (var i = 0; i < _enemy_count; i++) {
		var _enemy_instance = instance_find(obj_enemy_card, i);
		// enemy information
		_encounter_structure.enemy_data[i] = {
			
		}
	}
}
*/
function scr_game_save () {//_player_id = obj_player) {
	var _save_data = [];
	
	/*
	with obj_encounter {
		var _struct = {
			phase_c_place : global.phase_c_place,
			phase_e_place : global.phase_e_place,
			phase_e_act : global.phase_e_act,
			phase_c_act : global.phase_c_act,
			random_seed : global.random_seed
			// TR //phase_mulligan : global.phase_mulligan, // sub phase
			// TR //phase_react : global.phase_react, // sub phase
		};
		array_push(_save_data, _struct);
	}
	*/
	// set globals
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
		var _struct = {
			object : object_get_name(object_index),
			x : x,
			y : y,
			player : player
			/*
			phase_c_place : phase_c_place,
			phase_e_place : phase_e_place,
			phase_e_act : phase_e_act,
			phase_c_act : phase_c_act,
			random_seed : random_seed
			// TR //phase_mulligan : phase_mulligan, // sub phase
			// TR //phase_react : phase_react, // sub phase
			*/
		};
		array_push(_save_data, _struct);
	}
	
	player = obj_player;
	e_deck = obj_enemy_deck;
	
	var _save_w = file_text_open_write("save_system_test.txt");
	var _save_data_str = json_stringify(_save_data);
	file_text_write_string(_save_w, _save_data_str);
	file_text_close(_save_w);
}
function scr_game_load () {
	if (file_exists("save_system_test.txt")) {
		var _save_r = file_text_open_read("save_system_test.txt");
		var _save_data_str = file_text_read_string(_save_r);
		var _save_data = json_parse(_save_data_str);
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
		
		/*
		layer_destroy_instances ("Instances");
		*/
		//instance_destroy (obj_encounter);
		for (var i = 1; i < array_length(_save_data); i++) {
			var _struct = _save_data[i];
			instance_create_layer(_struct.x,_struct.y,"Encounter_System", asset_get_index(_struct.object), _struct);
		}
		//*/
		
		
		file_text_close(_save_r);
	}
}