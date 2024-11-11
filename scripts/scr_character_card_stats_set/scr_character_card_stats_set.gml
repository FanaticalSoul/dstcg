
/// @function					get_character_card_stats();
/// @description				get the stats for each character card
/// @return						{array<struct>}

function get_character_card_stats() {
	/* WoL //
	Taunt Value
	Heroic Ability
	// WoL */
	var _card_stats = [
		{
			name : "assassin",
			image_sm_front : spr_character_card_sm_assassin_front,
			image_sm_back  : spr_character_card_sm_assassin_back ,
			taunt_value : 8
		},
		{
			name : "herald",
			image_sm_front : spr_character_card_sm_herald_front,
			image_sm_back  : spr_character_card_sm_herald_back ,
			image_hq_front : spr_character_card_hq_herald_front,
			image_hq_back  : spr_character_card_hq_herald_back ,
			taunt_value : 4
		},
		{
			name : "knight",
			image_sm_front : spr_character_card_sm_knight_front,
			image_sm_back  : spr_character_card_sm_knight_back ,
			taunt_value : 10,
			reaction : true,
			play_script : function (character_id) {scr_character_ability_knight(character_id);}
		},
		{
			name : "sorcerer",
			image_sm_front : spr_character_hero_sm_sorcerer_front,
			image_sm_back  : spr_character_card_sm_sorcerer_back ,
			taunt_value : 5
		}
	];
	var _default_stats = {
		name : "undefined",
		image_sm_front : spr_start_card_sm_template,
		image_sm_back  : spr_start_card_sm_template,
		image_hq_front : spr_card_hq,
		image_hq_back  : spr_card_hq,
		taunt_value : 1,
		reaction : false
	};
	// add default values // add name of item to all item actions //
	var _default_stat_names = variable_struct_get_names(_default_stats);
	for (var i = 0; i < array_length(_card_stats); i++) {
		for (var j = 0; j < array_length(_default_stat_names); j++) {
			if (struct_get(_card_stats[i],_default_stat_names[j]) == undefined) {
				struct_set(_card_stats[i],_default_stat_names[j], struct_get(_default_stats, _default_stat_names[j]));
			}
		}
	}
	return _card_stats;
}



function scr_character_ability_knight (character_id = id) {
	with (character_id) {
		scr_start_card_block(3);
		selected = false;
		act_ability = true;
		global.phase_react = false;
	}
}