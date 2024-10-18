// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_init_arrays() {
	
	
	/*/ WoL //
	// Area Attacks ( AoE )
	// WoL /*/
	
	/*/ Template // 3 actions max //

	// Template /*/
	
	
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
		inflict : [
			// inflict condition(s) // bleed, frostbite, poison, stagger
		],
		stamina : [
			0, // dexerity
			0, // intelligence
			0, // strength
			0, // faith
			0  // generic
		]
	};
	
	
	
	
	temp_array = [
		 [
			{
				block : 3,
				stamina : [
					0, // dexerity
					0, // intelligence
					0, // strength
					1, // faith
					0  // generic
				],
				name : "herald armour"
			},
			{
				standard_action : true,
				block : 2
			}
		],
		[
			{
				damage : 2,
				attack : "heavy",
				stamina : [
					0, // dexerity
					0, // intelligence
					1, // strength
					1, // faith
					1  // generic
				],
				name : "spear"
			},
			{
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
			},
			{
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
			}
		],
		[
			{
				block  : 3,
				attack : "heavy",
				stamina : [
					0, // dexerity
					0, // intelligence
					1, // strength
					1, // faith
					0  // generic
				],
				name : "kite shield"
			},
			{
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
			}
		],
		[
			{
				block  : 2,
				stamina : [
					0, // dexerity
					0, // intelligence
					0, // strength
					1, // faith
					0  // generic
				],
				name : "talisman"
			},
			{
				standard_action : true,
				heal  : 5,
				stamina : [
					0, // dexerity
					0, // intelligence
					0, // strength
					0, // faith
					1  // generic
				]
			}
		]
	];
	for (i = 0; i < array_length(temp_array); i++ ) {
		var _card = temp_array[i];
		show_debug_message("item : "+string(struct_get(temp_array[i][0],"name")));
		for (j = 0; j < array_length(_card); j++ ) {
			struct_foreach (default_action, function(_name, _value) {
				var _tmp_action = struct_get(temp_array[i][j],string(_name));
				if (_tmp_action == undefined) {
					struct_set(temp_array[i][j],string(_name),_value);
				}
			});
			if (struct_get(temp_array[i][j],"name") == undefined) {
				struct_set(temp_array[i][j],"name",struct_get(temp_array[i][0],"name"));
			}
			show_debug_message(string(temp_array[i][j]));
		}
	}
	return;
}