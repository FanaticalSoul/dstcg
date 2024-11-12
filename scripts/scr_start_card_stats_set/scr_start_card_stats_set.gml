
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
	card_stats = [
		 [{
			name : "herald armour",
			type : "equipment",
			image : spr_start_card_sm_herald_armour,
			image_hq : spr_start_card_hq_herald_armour,
		},{
			block : 3,
			stamina : [0,0,0,1,0],
			reaction : true,
			play_script : function (id) {
				return scr_basic_block(id);
			}
		},{
			standard_action : true,
			block : 2,
			reaction : true,
			play_script : function (id) {scr_basic_block(id);}
		}],[{
			name : "spear",
			type : "equipment",
			image : spr_start_card_sm_spear,
			image_hq : spr_start_card_hq_spear,
			attack : "heavy"
		},{ play_script : function (card_id = id) {scr_basic_attack(1, card_id);},
			damage : 0,
			stamina : [0,0,0,0,0],
			inflict : ["poison"]
		}],/*[{
			name : "spear",
			type : "equipment",
			image : spr_start_card_sm_spear,
			image_hq : spr_start_card_hq_spear,
			attack : "heavy"
		},{
			damage : 2,
			stamina : [0,0,1,1,1],
			play_script : function (id) {scr_basic_attack(id);}
		}, {
			standard_action : true,
			damage : 2,
			stamina : [0,0,0,1,0],
			play_script : function (id) {scr_basic_attack(id);}
		}, {
			standard_action : true,
			damage : 3,
			stamina : [0,0,1,1,2],
			play_script : function (id) {scr_basic_attack(id);}
		}],*/[{
			name : "kite shield",
			type : "equipment",
			attack : "heavy",
			image : spr_start_card_sm_kite_shield,
			image_hq : spr_start_card_hq_kite_shield,
		},{
			block  : 3,
			stamina : [0,0,1,1,0],
			reaction : true,
			play_script : function (id) {scr_basic_block(id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,0,1,0],
			play_script : function (id) {scr_basic_attack(id);}
		}],[{
			name : "talisman",
			type : "equipment",
			image : spr_start_card_sm_talisman,
			image_hq : spr_start_card_hq_talisman
		},{
			block  : 2,
			stamina : [0,0,0,1,0],
			reaction : true,
			play_script : function (id) {
				return scr_basic_block (id);
			}
		},{
			standard_action : true,
			heal : 5,
			stamina : [0,0,0,0,1],
			play_script : function (id) {scr_basic_heal(id);}
		}],
		// Knight Class
		[{ // knight armour
			name : "knight armour",
			type : "equipment"
		},{
			block  : 3, reaction : true,
			stamina : [0,0,1,0,0],
			play_script : function (id) {scr_basic_block(id);}
		},{
			standard_action : true,
			block : 4, reaction : true,
			stamina : [0,0,1,0,0],
			play_script : function (id) {scr_basic_block(id);}
		}],
		[{ // knight shield
			name : "knight shield",
			type : "equipment",
			attack : "heavy"
		},{
			damage : 3,
			stamina : [0,0,1,0,1],
			play_script : function (id) {scr_basic_attack(id);}
		},{
			standard_action : true,
			block : 3, reaction : true,
			play_script : function (id) {scr_basic_block(id);}
		}],
		
		[{ //long sword
			name : "long sword",
			type : "equipment",
			attack : "heavy"
		},{
			damage : 2,
			stamina : [0,0,1,1,1],
			play_script : function (id) {scr_basic_attack(id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,1,0,0],
			play_script : function (id) {scr_basic_attack(id);}
		},{
			standard_action : true,
			damage : 3,
			stamina : [0,0,2,0,2],
			play_script : function (id) {scr_basic_attack(id);}
		}],
		
		[{ //short sword
			name : "short sword",
			type : "equipment",
			attack : "skilled"
		},{
			damage : 1,
			stamina : [1,0,1,0,0],
			play_script : function (id) {scr_basic_attack(id);}
		},{
			standard_action : true,
			damage : 2,
			stamina : [0,0,1,0,0],
			play_script : function (id) {scr_basic_attack(id);}
		}],
		// Stamina
		[{
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
		}, {stamina : [0,1,0,0]}],[{
			name : "fth stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_fth,
			image_hq : spr_start_card_hq_stamina_fth
			// options for stamina are bellow
		}, {stamina : [0,0,0,1]}],[{
			name : "dex stamina",
			type : "stamina",
			image : spr_start_card_sm_stamina_dex,
			image_hq : spr_start_card_hq_stamina_dex
			// options for stamina are bellow
		}, {stamina : [1,0,0,0]}],[{
			name : "remant of humanity",
			type : "equipment",
			image : spr_start_card_sm_remant_of_humanity,
			image_hq : spr_start_card_hq_remant_of_humanity
		},{
			play_script : function (id) {
				scr_equipment_remant_of_humanity_1 (id);
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
		//search : 0, // WoL
		//shift  : 0, // WoL
		ranged : false,
		dodge  : false,
		area_of_effect : false,
		attack : "none", // heavy, precise, magical, skilled, none
		inflict : [], // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
		stamina : [
			0, // dexerity
			0, // intelligence
			0, // strength
			0, // faith
			0  // generic
		],
		reaction : false // can be used in response to an enemy attack
	};
	// add default values // add name of item to all item actions //
	var _test = false;
	for (i = 0; i < array_length(card_stats); i++) {
		var _tmp_card = card_stats[i][0];
		// set undefined varibles
		if (struct_get(_tmp_card,"image") == undefined) struct_set(card_stats[i][0],"image",spr_start_card_sm_front);
		if (struct_get(_tmp_card,"image_hq") == undefined) struct_set(card_stats[i][0],"image_hq",spr_start_card_hq_front);
		if (struct_get(_tmp_card,"name") == undefined) struct_set(card_stats[i][0],"name","undefined");
		if (struct_get(_tmp_card,"attack") == undefined) struct_set(card_stats[i][0],"attack","none");
		// copy varibles across the array // this is a fix for the attack method
		default_action.name = card_stats[i][0].name;
		default_action.attack = card_stats[i][0].attack;
		// go through default array and update missing information in the attack action structure
		if (_test) show_debug_message("item : "+string(struct_get(card_stats[i][0],"name")));
		for (j = 0; j < array_length(card_stats[i]); j++) {
			if (struct_get(card_stats[i][0],"type") == "equipment"
			 || struct_get(card_stats[i][0],"type") == "weapon") {
				struct_foreach (default_action, function(name, value) {
					if (struct_get(card_stats[i][j],string(name)) == undefined) {
						struct_set(card_stats[i][j],string(name),value);
					}
				});
			}
			if (_test) show_debug_message(string(card_stats[i][j]));
		}
	}
	return card_stats;
}