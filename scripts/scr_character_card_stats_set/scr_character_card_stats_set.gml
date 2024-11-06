
/// @function					get_character_card_stats();
/// @description				get the stats for each character card
/// @return						{array<struct>}

function get_character_card_stats() {
	/* WoL //
	Taunt Value
	Heroic Ability
	// WoL */
	card_stats = [
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
			reaction : true
		},
		{
			name : "sorcerer",
			image_sm_front : spr_character_hero_sm_sorcerer_front,
			image_sm_back  : spr_character_card_sm_sorcerer_back ,
			taunt_value : 5
		}
	];
	default_stats = {
		name : "undefined",
		image_sm_front : spr_start_card_sm_template,
		image_sm_back  : spr_start_card_sm_template,
		image_hq_front : spr_card_hq,
		image_hq_back  : spr_card_hq,
		taunt_value : 1,
		reaction : false
	};
	// add default values // add name of item to all item actions //
	for (i = 0; i < array_length(card_stats); i++) {
		struct_foreach (default_stats, function(name, value) {
			if (struct_get(card_stats[i],string(name)) == undefined) {
				struct_set(card_stats[i],string(name), value);
			}
		});
	}
	return card_stats;
}