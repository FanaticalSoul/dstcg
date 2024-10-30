function scr_start_card_stats_set () {
	
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
	start_card_stats = [
		 [{
			name : "herald armour",
			type : "equipment",
			image : spr_start_card_sm_herald_armour,
			image_hq : spr_start_card_hq_herald_armour,
		},{
			block : 3,
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1, // faith
				0  // generic
			]
		},{
			standard_action : true,
			block : 2
		}],[{
			name : "spear",
			type : "equipment",
			image : spr_start_card_sm_spear,
			image_hq : spr_start_card_hq_spear,
			attack : "heavy"
		},{
			damage : 2,
			stamina : [
				0, // dexerity
				0, // intelligence
				1, // strength
				1, // faith
				1  // generic
			],
			play_script : function (id) {
				return scr_equipment_spear_1 (id);
			}
		}, {
			standard_action : true,
			damage : 2,
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1, // faith
				0  // generic
			],
			play_script : function (id) {
				return scr_equipment_spear_1 (id);
			}
		}, {
			standard_action : true,
			damage : 3,
			//attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				1, // strength
				1, // faith
				2  // generic
			],
			play_script : function (id) {
				return scr_equipment_spear_1 (id);
			}
		}],[{
			name : "kite shield",
			type : "equipment",
			image : spr_start_card_sm_kite_shield,
			image_hq : spr_start_card_hq_kite_shield,
		},{
			block  : 3,
			attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				1, // strength
				1, // faith
				0  // generic
			]	
		},{
			standard_action : true,
			damage : 2,
			//attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1, // faith
				0  // generic
			]
		}],[{
			name : "talisman",
			type : "equipment",
			image : spr_start_card_sm_talisman,
			image_hq : spr_start_card_hq_talisman
		},{
			block  : 2,
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1, // faith
				0  // generic
			]	
		},{
			standard_action : true,
			heal : 5,
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				0, // faith
				1  // generic
			],
			play_script : function (id) {
				return scr_equipment_talisman_2 (id);
			}
		}],[{
			name : "str stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_str,
			image_hq : spr_start_card_hq_stamina_str
			// options for stamina are bellow
		}, {
			stamina : [
				0, // dexerity
				0, // intelligence
				1, // strength
				0  // faith
			]
		}],[{
			name : "int stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_int,
			image_hq : spr_start_card_hq_stamina_int
			// options for stamina are bellow
		}, {
			stamina : [
				0, // dexerity
				1, // intelligence
				0, // strength
				0  // faith
			]
		}],[{
			name : "fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_fth,
			image_hq : spr_start_card_hq_stamina_fth
			// options for stamina are bellow
		}, {
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1  // faith
			]
		}],[{
			name : "dex stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_dex,
			image_hq : spr_start_card_hq_stamina_dex
			// options for stamina are bellow
		}, {
			stamina : [
				1, // dexerity
				0, // intelligence
				0, // strength
				0  // faith
			]
		}],[{
			name : "remant of humanity",
			type : "equipment",
			image : spr_start_card_sm_remant_of_humanity,
			image_hq : spr_start_card_hq_remant_of_humanity
		},{
			play_script : function (id) {
				return scr_equipment_remant_of_humanity_1 (id);
			}
		}]
	];
	// set default action
	default_action = {
		name : undefined,
		standard_action : false, // discard on use
		block  : 0,
		damage : 0,
		heal : 0,
		search : 0,
		shift  : 0,
		push   : false, // false = 0 // N = 1 // E = 2 // ect...
		ranged : false,
		dodge  : false,
		area_of_effect : false,
		attack : "none", // heavy, precise, magical, skilled, none
		inflict : false, // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
		stamina : [
			0, // dexerity
			0, // intelligence
			0, // strength
			0, // faith
			0  // generic
		]
	};
	// add default values // add name of item to all item actions //
	var _test = false;
	for (i = 0; i < array_length(start_card_stats); i++ ) {
		var _tmp_card = start_card_stats[i][0];
		// set undefined varibles
		if (struct_get(_tmp_card,"image") == undefined) struct_set(start_card_stats[i][0],"image",spr_start_card_sm_front);
		if (struct_get(_tmp_card,"image_hq") == undefined) struct_set(start_card_stats[i][0],"image_hq",spr_start_card_hq_front);
		if (struct_get(_tmp_card,"name") == undefined) struct_set(start_card_stats[i][0],"name","undefined");
		if (struct_get(_tmp_card,"attack") == undefined) struct_set(start_card_stats[i][0],"attack","none");
		// copy varibles across the array // this is a fix for the attack method
		default_action.name = start_card_stats[i][0].name;
		default_action.attack = start_card_stats[i][0].attack;
		// go through default array and update missing information in the attack action structure
		if (_test) show_debug_message("item : "+string(struct_get(start_card_stats[i][0],"name")));
		for (j = 0; j < array_length(start_card_stats[i]); j++ ) {
			if (struct_get(start_card_stats[i][0],"type") == "equipment"
			 || struct_get(start_card_stats[i][0],"type") == "weapon") {
				struct_foreach (default_action, function(_name, _value) {
					if (struct_get(start_card_stats[i][j],string(_name)) == undefined) {
						struct_set(start_card_stats[i][j],string(_name),_value);
					}
				});
			}
			if (_test) show_debug_message(string(start_card_stats[i][j]));
		}
	}
	return start_card_stats;
}