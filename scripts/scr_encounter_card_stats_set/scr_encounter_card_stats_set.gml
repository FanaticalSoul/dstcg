function scr_encounter_card_stats_set () {
	encounter_card_stats = [
		{
			name : "hollow manservant",
			image : spr_encounter_card_sm_,
			image_hq : spr_encounter_card_hq_,
			encounter_level : 1,
			encounter : [
				[],
				[],
				[],
				[]
			]
		}
	];
	/*
	// add default values //
	var _test = false;
	for (i = 0; i < array_length(enemy_card_stats); i++ ) {
		if (_test) show_debug_message("enemy : "+string(struct_get(enemy_card_stats[i],"name")));
		struct_foreach (default_enemy, function(_name, _value) {
			if (struct_get(enemy_card_stats[i],string(_name)) == undefined) {
				struct_set(enemy_card_stats[i],string(_name),_value);
			}
			// for each attack
			for (j = 0; j < array_length(struct_get(enemy_card_stats[i],"attack")); j++ ) {
				struct_foreach (struct_get(default_enemy,"attack")[0], function(_name_2, _value_2) {
					if (struct_get(struct_get(enemy_card_stats[i],"attack")[j],string(_name_2)) == undefined) {
						struct_set(struct_get(enemy_card_stats[i],"attack")[j],string(_name_2),_value_2);
					}
				});
			}
		});
		if (_test) show_debug_message(string(enemy_card_stats[i]));
	}
	*/
	return encounter_card_stats;
}