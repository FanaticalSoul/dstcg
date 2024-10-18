function scr_start_card_stats_set () {
	
	/*/ WoL //
	// Area Attacks ( AoE )
	// WoL /*/

	// set actions for cards
	start_card_stats = [
		 [{
			name : "herald armour",
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
			damage : 2,
			attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				1, // strength
				1, // faith
				1  // generic
			]
		}, {
			standard_action : true,
			damage : 2,
			attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1, // faith
				0  // generic
			]
		}, {
			standard_action : true,
			damage : 3,
			attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				1, // strength
				1, // faith
				2  // generic
			]
		}],[{
			name : "kite shield",
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
			attack : "heavy",
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				1, // faith
				0  // generic
			]
		}],[{
			name : "talisman",
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
			heal  : 5,
			stamina : [
				0, // dexerity
				0, // intelligence
				0, // strength
				0, // faith
				1  // generic
			]
		}]
	];
	// set default action
	default_action = {
		standard_action : false, // discard on use
		block  : 0,
		damage : 0,
		heal : 0,
		search : 0,
		shift  : 0,
		push   : false, // false = 0 // N = 1 // E = 2 // ect...
		ranged : false,
		dodge  : false,
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
		if (_test) show_debug_message("item : "+string(struct_get(start_card_stats[i][0],"name")));
		for (j = 0; j < array_length(start_card_stats[i]); j++ ) {
			struct_foreach (default_action, function(_name, _value) {
				if (struct_get(start_card_stats[i][j],string(_name)) == undefined) {
					struct_set(start_card_stats[i][j],string(_name),_value);
				}
			});
			if (struct_get(start_card_stats[i][j],"name") == undefined) {
				struct_set(start_card_stats[i][j],"name",struct_get(start_card_stats[i][0],"name"));
			}
			if (_test) show_debug_message(string(start_card_stats[i][j]));
		}
	}
	return;
}