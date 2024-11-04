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
function scr_game_save (_player_id = obj_player) {
	// global.random_seed
	/*
	var _encounter_phases = [
		obj_encounter.character_placement_phase,
		obj_encounter.enemy_activation_phase,
		obj_encounter.character_activation_phase,
	];
	*/
	
	
	
	/*
	var _character = {
		name : noone, // name of character
		act_ability : noone,
		conditions : noone
	}
	
	
	var _player_hand = {
		
	
	}
	*/
	var _encounter = {
		random_seed : global.random_seed,
		phase_c_place : global.random_seed,
		// TR //phase_mulligan : global.random_seed, // sub phase
		phase_e_place : global.random_seed,
		phase_e_act : global.random_seed,
		// TR //phase_react : global.random_seed, // sub phase
		phase_c_act : global.random_seed
	}
	player = obj_player;
	e_deck = obj_enemy_deck;
	
	var _save_w = file_text_open_write("save_system_test.txt");
	file_text_write_real(_save_w, json_stringify(_encounter));
	file_text_close(_save_w);
}
function scr_game_load () {
	if (file_exists("save_system_test.txt")) {
		var _save_r = file_text_open_read("save_system_test.txt");
		global.souls = file_text_read_real(_save_r);
		file_text_close(_save_r);
	}
}