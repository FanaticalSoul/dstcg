function scr_enemy_card_stats_set(){

	/*/ WoL //
	// Area Attacks ( AoE )
	// special_rules
	
	
	// cards to add later //
	// Silver Knight Spearman
	// Flamberge Hollow Slave
	// Irihyllian Slave Assassin
	// Irihyllian Slave Warrior
	// Skeleton
	
	// WoL /*/
	
	
	
	enemy_card_stats = [
		{
			name : "hollow manservant",
			enemy_level : 1,
			souls : 2,
			defense_value : 0,
			hit_points : 2,
			attack_value : 4,
			weakness : "none",
			attack : [
				{
					attack_location : 4,
					push : 1
				}
			],
			spawn_location : 1
		},
		{
			name : "sage\'s devout",
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 1,
			attack_value : 4,
			weakness : "precise",
			attack : [
				{
					attack_location : 1
				}
			],
			spawn_location : 4
		},
		{
			name : "firebomb hollow",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "skilled",
			attack : [
				{
					attack_location : 1
				}
			],
			spawn_location : 1
		},
		{
			name : "peasant hollow",
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "precise",
			attack : [
				{
					attack_location : 5,
					push : 1
				}
			],
			spawn_location : 2
		},
		{
			name : "hound rat",
			enemy_level : 1,
			souls : 1,
			defense_value : 0,
			hit_points : 1,
			attack_value : 3,
			weakness : "none",
			attack : [
				{
					attack_location : 5
				}
			],
			spawn_location : 2
		},
		{
			name : "cage spider",
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 4,
			attack_value : 1,
			weakness : "skilled",
			attack : [
				{
					attack_location : 6
				}
			],
			spawn_location : 3
		},
		{
			name : "irithyllian beast hound",
			enemy_level : 1,
			souls : 1,
			defense_value : 1,
			hit_points : 1,
			attack_value : 2,
			weakness : "magical",
			attack : [
				{
					attack_location : 3,
					inflict : ["frostbite"]
				}
			],
			spawn_location : 3
		},
		{
			name : "ghru leaper",
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "heavy",
			attack : [
				{
					attack_location : 2,
					inflict : ["poison"]
				}
			],
			spawn_location : 5
		},
		{
			name : "winged corvian",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "magical",
			attack : [
				{
					attack_location : 5
				}
			],
			spawn_location : 5
		},
		{
			name : "silver knight greatbowman",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "heavy",
			attack : [
				{
					attack_location : 2
				}
			],
			spawn_location : 5
		},
		{
			name : "crossbow grave warden",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "magical",
			attack : [
				{
					attack_location : 1
				}
			],
			spawn_location : 6
		},
		{
			name : "grave warden",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "heavy",
			attack : [
				{
					attack_location : 4
				}
			],
			spawn_location : 4
		},
		{
			name : "hollow assassin",
			enemy_level : 1,
			souls : 2,
			defense_value : 0,
			hit_points : 2,
			attack_value : 4,
			weakness : "none",
			attack : [
				{
					attack_location : 2
				}
			],
			spawn_location : 2
		},
		{
			name : "crossbow hollow",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "magical",
			attack : [
				{
					attack_location : 4
				}
			],
			spawn_location : 4
		},
		{
			name : "hollow soldier",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "heavy",
			attack : [
				{
					attack_location : 6
				}
			],
			spawn_location : 3
		}
		/*/ Add Later //
			{
			name : "",
			enemy_level : 1,
			souls : 0,
			defense_value : 0,
			hit_points : 0,
			attack_value : 0,
			weakness : "none", // heavy, precise, magical, skilled, none
			attack : [
				{
					attack_location : 0,
					push : false, // false = 0 // N = 1 // E = 2 // ect...
					inflict : false // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
				}
			],
			spawn_location : 0
		},
		/// Add Later */
	];
	// set default enemy stats
	default_enemy = {
		enemy_level   : 1,
		souls         : 1,
		defense_value : 0,
		hit_points    : 1,
		attack_value  : 0,
		weakness      : "none", // heavy, precise, magical, skilled, none
		attack : [
			{
				attack_location : 1,
				push            : false, // false = 0 // N = 1 // E = 2 // ect...
				// inflict condition(s) // bleed, frostbite, poison, stagger
				inflict         : false // an array if true
			}
		],
		spawn_location : 1
	};
	// add default values //
	var _test = true;
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
	return;
}