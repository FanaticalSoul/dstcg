function scr_character_card_stats_set() {
	/* WoL //
	Taunt Value
	Heroic Ability
	// WoL */
	character_card_stats = [
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
			taunt_value : 4
		},
		{
			name : "knight",
			image_sm_front : spr_character_card_sm_knight_front,
			image_sm_back  : spr_character_card_sm_knight_back ,
			taunt_value : 10
		},
		{
			name : "sorcerer",
			image_sm_front : spr_character_hero_sm_sorcerer_front,
			image_sm_back  : spr_character_card_sm_sorcerer_back ,
			taunt_value : 5
		}
	];
	default_character = {
		name : "undefined",
		image_sm_front : spr_start_card_sm_template,
		image_sm_back  : spr_start_card_sm_template,
		image_hq_front : spr_card_hq,
		image_hq_back  : spr_card_hq,
		taunt_value : 1
	};
	// add default values // add name of item to all item actions //
	var _test = false;
	for (i = 0; i < array_length(character_card_stats); i++ ) {
		struct_foreach (default_character, function(_name, _value) {
			if (struct_get(character_card_stats[i],string(_name)) == undefined) {
				struct_set(character_card_stats[i],string(_name),_value);
			}
		});
	}
	return character_card_stats;
}