
/// @function					get_start_card_stats();
/// @description				get the stats for each start card
/// @return						{array<array<struct>>}

function get_start_card_stats () {
	
	/*/ WoL //
	// Area Attacks ( AoE )
	// WoL /*/

	/* WoL //
	diffrent card types
	
	type = "weapon" // equipment with an attack type and way to deal damage
	type = "equipment" // equipment with no attack type and no way to deal damage
	type = "stamina" // stamina
	// WoL */

	// set actions for cards
	var _card_stats = [
		 [{
			name : "herald armour",
			type : "equipment",
			image : spr_start_card_sm_herald_armour,
			image_hq : spr_start_card_hq_herald_armour
		},{
			block : 3,
			stamina : [0,0,0,1,0],
			reaction : true,
			play_script :  function (card_id = id) {scr_basic_block(1, card_id);}
		},{
			standard_action : true,
			block : 2,
			reaction : true,
			play_script :  function (card_id = id) {scr_basic_block(2, card_id);}
		}],/*[{ // test
			name : "spear",
			type : "equipment",
			image : spr_start_card_sm_spear,
			image_hq : spr_start_card_hq_spear,
			attack : "heavy"
		},{ play_script : function (card_id = id) {scr_basic_attack(1, card_id);},
			damage : 3,
			stamina : [0,0,0,1,0],
			ranged : true
		}],*/[{
			name : "spear",
			type : "equipment",
			image : spr_start_card_sm_spear,
			image_hq : spr_start_card_hq_spear,
			attack : "heavy"
		},{
			damage : 2,
			stamina : [0,0,1,1,1],
			play_script : function (card_id = id) {scr_basic_attack(1, card_id);}
		}, {
			standard_action : true,
			damage : 2,
			stamina : [0,0,0,1,0],
			play_script : function (card_id = id) {scr_basic_attack(2, card_id);}
		}, {
			standard_action : true,
			damage : 3,
			stamina : [0,0,1,1,2],
			play_script : function (card_id = id) {scr_basic_attack(3, card_id);}
		}],[{
			name : "kite shield",
			type : "equipment",
			image : spr_start_card_sm_kite_shield,
			image_hq : spr_start_card_hq_kite_shield,
			attack : "heavy"
		},{
			block  : 3,
			stamina : [0,0,1,1,0],
			reaction : true,
			play_script : function (card_id = id) {scr_basic_block (1, card_id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,0,1,0],
			play_script : function (card_id = id) {scr_basic_attack(2, card_id);}
		}],[{
			name : "talisman",
			type : "equipment",
			image : spr_start_card_sm_talisman,
			image_hq : spr_start_card_hq_talisman
		},{
			block  : 2,
			stamina : [0,0,0,1,0],
			reaction : true,
			play_script : function (card_id = id) {scr_basic_block (1, card_id);}
		},{
			standard_action : true,
			heal : 5,
			stamina : [0,0,0,0,1],
			play_script : function (card_id = id) {scr_basic_heal  (2, card_id);}
		}],
		// Knight Class
		[{ // knight armour
			name : "knight armour",
			type : "equipment",
			image : spr_start_card_sm_knight_armour,
			image_hq : spr_start_card_hq_knight_armour
		},{
			block  : 3, reaction : true,
			stamina : [0,0,1,0,0],
			play_script : function (card_id = id) {scr_basic_block (1, card_id);}
		},{
			standard_action : true,
			block : 4, reaction : true,
			stamina : [0,0,1,0,0],
			play_script : function (card_id = id) {scr_basic_block (2, card_id);}
		}],
		[{ // knight shield
			name : "knight shield",
			type : "equipment",
			image : spr_start_card_sm_knight_shield,
			image_hq : spr_start_card_hq_knight_shield,
			attack : "heavy"
		},{
			damage : 1,
			stamina : [0,0,1,0,1],
			play_script : function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			block : 3, reaction : true,
			play_script : function (card_id = id) {scr_basic_block (2, card_id);}
		}
		// long sword
		],[{name : "long sword",
			type : "equipment",
			image : spr_start_card_sm_long_sword,
			image_hq : spr_start_card_hq_long_sword,
			attack : "heavy"
		},{
			damage : 2,
			stamina : [0,0,1,1,1],
			play_script : function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,1,0,0],
			play_script : function (card_id = id) {scr_basic_attack(2, card_id);}
		},{
			standard_action : true,
			damage : 3,
			stamina : [0,0,2,0,2],
			play_script : function (card_id = id) {scr_basic_attack(3, card_id);}
		}
		// short sword
		],[{name : "short sword",
			type : "equipment",
			image : spr_start_card_sm_short_sword,
			image_hq : spr_start_card_hq_short_sword,
			attack : "skilled"
		},{
			damage : 1,
			stamina : [1,0,1,0,0],
			play_script : function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,1,0,0],
			play_script : function (card_id = id) {scr_basic_attack(2, card_id);}
		}
		// Stamina
		],[{name : "dex stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_dex,
			image_hq : spr_start_card_hq_stamina_dex
		}, {stamina : [1,0,0,0]}
		],[{name : "int stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_int,
			image_hq : spr_start_card_hq_stamina_int
		}, {stamina : [0,1,0,0]}
		],[{name : "str stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_str,
			image_hq : spr_start_card_hq_stamina_str
		}, {stamina : [0,0,1,0]}
		],[{name : "fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_fth,
			image_hq : spr_start_card_hq_stamina_fth
		}, {stamina : [0,0,0,1]}
		],
		//* market test feature //

		[{name : "int+fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_int_and_fth,
			image_hq : spr_start_card_hq_stamina_int_and_fth
		}, {stamina : [0,1,0,1]}
		],[{name : "dex+int stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_dex_and_int,
			image_hq : spr_start_card_hq_stamina_dex_and_int

		}, {stamina : [1,1,0,0]}
		],[{name : "str+fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_str_and_fth,
			image_hq : spr_start_card_hq_stamina_str_and_fth

		}, {stamina : [0,0,1,1]}
		],[{name : "str+dex stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_str_and_dex,
			image_hq : spr_start_card_hq_stamina_str_and_dex

		}, {stamina : [1,0,1,0]}
		],[{name : "int/fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_int_or_fth,
			image_hq : spr_start_card_hq_stamina_int_or_fth

		}, {stamina : [0,1,0,0]}, {stamina : [0,0,0,1]}
		],[{name : "dex/int stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_dex_or_int,
			image_hq : spr_start_card_hq_stamina_dex_or_int
		}, {stamina : [1,0,0,0]}, {stamina : [0,1,0,0]}
		// str/fth stamina
		],[{name : "str/fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_str_or_fth,
			image_hq : spr_start_card_hq_stamina_str_or_fth
		}, {stamina : [0,0,1,0]}, {stamina : [0,0,0,1]}
		// str/dex stamina
		],[{name : "str/dex stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_str_or_dex,
			image_hq : spr_start_card_hq_stamina_str_or_dex
		}, {stamina : [1,0,0,0]}, {stamina : [0,0,1,0]}
		],
		// market test feature //*/
		[{name : "remant of humanity",
			type : "equipment",
			image : spr_start_card_sm_remant_of_humanity,
			image_hq : spr_start_card_hq_remant_of_humanity
		},{ play_script : function (id) {
			scr_equipment_remant_of_humanity_1 (id);
		}}]
	];
	// set defaults
	_card_stats = set_start_card_stats_defaults(_card_stats);
	// add treasures
	var _treasures = get_treasure_stats();
	for (var i = 0; i < array_length(_treasures); i++) {
		array_push(_card_stats, _treasures[i]);
	}
	/*
	for (var i = 0; i < array_length(_card_stats); i++) {
		sout(_card_stats[i][0].name);
	}
	*/
	return _card_stats;
}

/// @return						{array<array<struct>>}

function set_start_card_stats_defaults (card_stats, test = false) {
	// set default action
	var _default_action = {
		name : undefined,
		standard_action : false, // discard on use
		block  : 0,
		damage : 0,
		heal : 0,
		//search : 0, // WoL
		//shift  : 0, // WoL
		ranged : false,
		dodge  : false,
		//area_of_effect : false,
		attack : "none", // heavy, precise, magical, skilled, none
		inflict : [], // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
		stamina : [
			0, // dexerity
			0, // intelligence
			0, // strength
			0, // faith
			0  // generic
		],
		area_of_effect : [], // used for AoE
		reaction : false // can be used in response to an enemy attack
	};
	// add default values // add name of item to all item actions //
	for (var i = 0; i < array_length(card_stats); i++) {
		var _tmp_card = card_stats[i][0];
		// set undefined varibles
		if (struct_get(_tmp_card,"image") == undefined) struct_set(card_stats[i][0],"image",spr_start_card_sm_front);
		if (struct_get(_tmp_card,"image_hq") == undefined) struct_set(card_stats[i][0],"image_hq",spr_start_card_hq_front);
		if (struct_get(_tmp_card,"name") == undefined) struct_set(card_stats[i][0],"name","undefined");
		if (struct_get(_tmp_card,"attack") == undefined) struct_set(card_stats[i][0],"attack","none");
		// copy varibles across the array // this is a fix for the attack method
		_default_action.name = card_stats[i][0].name;
		_default_action.attack = card_stats[i][0].attack;
		// go through default array and update missing information in the attack action structure
		if (test) show_debug_message("item : "+string(struct_get(card_stats[i][0],"name")));
		for (var j = 0; j < array_length(card_stats[i]); j++) {
			if (struct_get(card_stats[i][0],"type") == "equipment"
			 || struct_get(card_stats[i][0],"type") == "weapon") {
				var _names = struct_get_names(_default_action);
				for (var k = 0; k < array_length(_names); k++) {
					var _name = string(_names[k]);
					var _card_value = struct_get(card_stats[i][j], _name);
					var _default_value = struct_get(_default_action, _name);
					if (_card_value == undefined) {
						struct_set(card_stats[i][j], _name, _default_value);
					}
					// set each effect in area_of_effect
					if (_name == "area_of_effect") {
						var _aoe = card_stats[i][j].area_of_effect;
						if (array_length(_aoe)>0) {
							for (var l = 0; l < array_length(_aoe); l++) {
								if (struct_get(_aoe[l], "inflict") == undefined) {
									struct_set(_aoe[l], "inflict", []);
								}
							}
						}
					}
				}
			}
			if (test) show_debug_message(string(card_stats[i][j]));
		}
	}
	return card_stats;
}


/// @return						{array<array<struct>>}

function get_treasure_stats () {
	var _card_stats = [
		[{  name : "morning star",
			type : "equipment",
			image : spr_start_card_sm_morning_star,
			image_hq : spr_start_card_hq_morning_star,
			attack : "heavy"
		},{
			damage : 2,
			stamina : [0,0,1,1,0],
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 4,
			stamina : [0,0,1,2,0],
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		}],
		[{  name : "soul arrow",
			type : "equipment",
			image : spr_start_card_sm_soul_arrow,
			image_hq : spr_start_card_hq_soul_arrow,
			attack : "magical"
		},{
			damage : 1,
			ranged : true,
			stamina : [0,1,0,1,0],
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			ranged : true,
			damage : 2,
			stamina : [0,1,0,1,0],
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		},{
			standard_action : true,
			ranged : true,
			damage : 3,
			stamina : [0,2,0,0,2],
			play_script :  function (card_id = id) {scr_basic_attack(3, card_id);}
		}],
		[{  name : "mace",
			type : "equipment",
			image : spr_start_card_sm_mace,
			image_hq : spr_start_card_hq_mace,
			attack : "heavy"
		},{
			damage : 2,
			stamina : [0,0,1,1,1],
			inflict : ["stagger"],
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,1,1,0],
			inflict : ["stagger"],
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		},{
			standard_action : true,
			inflict : ["stagger"],
			play_script :  function (card_id = id) {scr_basic_attack(3, card_id);}
		}],
		[{  name : "morion blade",
			type : "equipment",
			image : spr_start_card_sm_morion_blade,
			image_hq : spr_start_card_hq_morion_blade,
			attack : "skilled"
		},{
			damage : 1,
			stamina : [1,0,0,0,1],
			inflict : ["bleed"],
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,1,1,0],
			inflict : ["bleed"],
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		}],
		[{  name : "onislayer greatbow",
			type : "equipment",
			image : spr_start_card_sm_onislayer_greatbow,
			image_hq : spr_start_card_hq_onislayer_greatbow,
			attack : "skilled"
		},{
			damage : 3,
			stamina : [2,0,1,0,0],
			ranged : true,
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 4,
			stamina : [1,0,2,0,0],
			ranged : true,
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		}],
		[{  name : "partizan",
			type : "equipment",
			image : spr_start_card_sm_partizan,
			image_hq : spr_start_card_hq_partizan,
			attack : "heavy"
		},{
			damage : 3,
			stamina : [0,0,1,2,0],
			ranged : true,
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 3,
			stamina : [0,0,1,1,0],
			ranged : true,
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		}],
		[{  name : "rapier",
			type : "equipment",
			image : spr_start_card_sm_rapier,
			image_hq : spr_start_card_hq_rapier,
			attack : "skilled"
		},{
			damage : 2,
			stamina : [1,0,1,0,0],
			play_script :  function (card_id = id) {scr_basic_attack(1, card_id);}
		},{
			standard_action : true,
			damage : 3,
			stamina : [1,0,0,0,0],
			play_script :  function (card_id = id) {scr_basic_attack(2, card_id);}
		}]
	];
	// set defaults
	_card_stats = set_start_card_stats_defaults(_card_stats);
	return _card_stats;
}




