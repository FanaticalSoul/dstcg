function start_new_game_test (save_system_id = id, deck_file = file_deck) {
	with (save_system_id) {
		sout("testing");
		global.board_e_cords = [
			[3,72,33],
			[2,136,33],
			[2,104-8-32,89],
			[1,104,89],
			[1,104+8+32,89]
		];
		// set inital random seed
		
		// place inital encounter cards
		instance_create_layer(board_e_cords[0][1], board_e_cords[0][2], "Encounters", obj_encounter_card, {card_name : ""});
		instance_create_layer(board_e_cords[0][1], board_e_cords[0][2], "Encounters", obj_encounter_card, {card_name : ""});
		instance_create_layer(board_e_cords[0][1], board_e_cords[0][2], "Encounters", obj_encounter_card, {card_name : ""});
		instance_create_layer(board_e_cords[0][1], board_e_cords[0][2], "Encounters", obj_encounter_card, {card_name : ""});
		instance_create_layer(board_e_cords[0][1], board_e_cords[0][2], "Encounters", obj_encounter_card, {card_name : ""});
		
		
		/*
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
		*/
	}
}