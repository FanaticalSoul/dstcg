
/// @function					set_card_enemy_stats();
/// @description				get the stats for each enemy card
/// @return						{array<struct>}

function get_enemy_card_stats() {
	card_stats = [/*{
			name : "test",
			image : spr_enemy_card_sm_ghru_leaper,
			image_hq : spr_enemy_card_hq_ghru_leaper,
			enemy_level : 1,
			souls : 3,
			defense_value : 0,
			hit_points : 1,
			attack_value : 0,
			weakness : "skilled",
			attack : [
				{
					attack_location : 2,
					//conditions : ["poison", "stagger", "frostbite", "bleed", "push w"]
					conditions : []
				}
			],
			spawn_location : 5
		},*/
		// level 1 encounters
		{
			name : "crossbow grave warden",
			image : spr_enemy_card_sm_crossbow_grave_warden,
			image_hq : spr_enemy_card_hq_crossbow_grave_warden,
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "magical",
			attack : [{attack_location : 1}],
			spawn_location : 6
		},{ name : "ghru leaper",
			image : spr_enemy_card_sm_ghru_leaper,
			image_hq : spr_enemy_card_hq_ghru_leaper,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "heavy",
			attack : [{
				attack_location : 2,
				conditions : ["poison"]
			}],
			spawn_location : 5
		},{ name : "grave warden",
			image : spr_enemy_card_sm_grave_warden,
			image_hq : spr_enemy_card_hq_grave_warden,			
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "heavy",
			attack : [{attack_location : 4}],
			spawn_location : 4
		},{ name : "hollow manservant",
			image : spr_enemy_card_sm_hollow_manservant,
			image_hq : spr_enemy_card_hq_hollow_manservant,
			enemy_level : 1,
			souls : 2,
			defense_value : 0,
			hit_points : 2,
			attack_value : 4,
			weakness : "none",
			attack : [{
				attack_location : 4,
				conditions : ["push n"]
			}],
			spawn_location : 1
		},{ name : "irithyllian beast hound",
			image : spr_enemy_card_sm_irithyllian_beast_hound,
			image_hq : spr_enemy_card_hq_irithyllian_beast_hound,
			enemy_level : 1,
			souls : 1,
			defense_value : 1,
			hit_points : 1,
			attack_value : 2,
			weakness : "magical",
			attack : [{
				attack_location : 3,
				conditions : ["frostbite"]
			}],
			spawn_location : 3
		},{ name : "irithyllian slave assassin",
			image : spr_enemy_card_sm_irithyllian_slave_assassin,
			image_hq : spr_enemy_card_hq_irithyllian_slave_assassin,
			enemy_level : 1,
			souls : 1,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "precise",
			abilities : ["invisibility"],
			attack : [{attack_location : 6}],
			spawn_location : 6
		},{ name : "irithyllian slave warrior",
			image : spr_enemy_card_sm_irithyllian_slave_warrior,
			image_hq : spr_enemy_card_hq_irithyllian_slave_warrior,
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "skilled",
			abilities : ["invisibility"],
			attack : [{attack_location : 6}],
			spawn_location : 6
		},{ name : "peasant hollow",
			image : spr_enemy_card_sm_peasant_hollow,
			image_hq : spr_enemy_card_hq_peasant_hollow,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "precise",
			attack : [{
				attack_location : 5,
				conditions : ["push n"]
			}],
			spawn_location : 2
		},{ name : "silver knight spearman",
			image : spr_enemy_card_sm_silver_knight_spearman,
			image_hq : spr_enemy_card_hq_silver_knight_spearman,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 2,
			attack_value : 4,
			weakness : "precise",
			attack : [{
				attack_location : 2,
				area_of_effect : true
			},{
				attack_location : 5,
				area_of_effect : true
			}],
			spawn_location : 2
		},{ name : "winged corvian",
			image : spr_enemy_card_sm_winged_corvian,
			image_hq : spr_enemy_card_hq_winged_corvian,
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "magical",
			attack : [{attack_location : 5}],
			spawn_location : 5
		},
		// level 2 encounters
		{
			name : "devout of the deep",
			image : spr_enemy_card_sm_devout_of_the_deep,
			image_hq : spr_enemy_card_hq_devout_of_the_deep,
			enemy_level : 2,
			souls : 6,
			defense_value : 2,
			hit_points : 3,
			attack_value : 3,
			weakness : "heavy",
			attack : [{
				attack_location : 5,
				conditions : ["push n"]
			}],
			spawn_location : 5
		},{ name : "fire witch",
			image : spr_enemy_card_sm_fire_witch,
			image_hq : spr_enemy_card_hq_fire_witch,
			enemy_level : 2,
			souls : 6,
			defense_value : 2,
			hit_points : 2,
			attack_value : 4,
			weakness : "precise",
			attack : [{
				attack_location : 2,
				area_of_effect : true
			},{
				attack_location : 3,
				area_of_effect : true
			},{
				attack_location : 5,
				area_of_effect : true
			},{
				attack_location : 6,
				area_of_effect : true
			}],
			spawn_location : 6
		},{ name : "giant hound rat",
			image : spr_enemy_card_sm_giant_hound_rat,
			image_hq : spr_enemy_card_hq_giant_hound_rat,
			enemy_level : 2,
			souls : 4,
			defense_value : 1,
			hit_points : 2,
			attack_value : 4,
			weakness : "magical",
			attack : [{
				attack_location : 6,
				conditions : ["poison"]
			}],
			spawn_location : 3
		},{ name : "irithyllian slave sorcerer",
			image : spr_enemy_card_sm_irithyllian_slave_sorcerer,
			image_hq : spr_enemy_card_hq_irithyllian_slave_sorcerer,
			enemy_level : 2,
			souls : 4,
			defense_value : 2,
			hit_points : 1,
			attack_value : 4,
			weakness : "precise",
			abilities : ["invisibility"],
			attack : [{attack_location : 1}],
			spawn_location : 4
		},{ name : "lycanthrope",
			image : spr_enemy_card_sm_lycanthrope,
			image_hq : spr_enemy_card_hq_lycanthrope,
			enemy_level : 2,
			souls : 5,
			defense_value : 2,
			hit_points : 2,
			attack_value : 3,
			weakness : "magical",
			attack : [{attack_location : 5}],
			spawn_location : 2
		},{ name : "lycanthrope hunter",
			image : spr_enemy_card_sm_lycanthrope_hunter,
			image_hq : spr_enemy_card_hq_lycanthrope_hunter,
			enemy_level : 2,
			souls : 5,
			defense_value : 2,
			hit_points : 2,
			attack_value : 2,
			weakness : "skilled",
			abilities : ["double strike"],
			attack : [{attack_location : 5}],
			spawn_location : 5
		},{ name : "pontiff knight great scythe",
			image : spr_enemy_card_hq_pontiff_knight_great_scythe_1,
			image_hq : spr_enemy_card_hq_pontiff_knight_great_scythe,
			enemy_level : 2,
			souls : 6,
			defense_value : 2,
			hit_points : 2,
			attack_value : 3,
			weakness : "skilled",
			attack : [{
				attack_location : 4,
				area_of_effect : true
			},{
				attack_location : 5,
				area_of_effect : true,
				conditions : ["push w"]
			},{
				attack_location : 6,
				area_of_effect : true,
				conditions : ["push w"]
			}],
			spawn_location : 1
		},{ name : "pontiff knight swordsman",
			image : spr_enemy_card_sm_pontiff_knight_swordsman,
			image_hq : spr_enemy_card_hq_pontiff_knight_swordsman,
			enemy_level : 2,
			souls : 6,
			defense_value : 2,
			hit_points : 2,
			attack_value : 3,
			weakness : "heavy",
			attack : [{
				attack_location : 4,
				conditions : ["stagger"]
			}],
			spawn_location : 1
		},{ name : "writhing rotten flesh",
			image : spr_enemy_card_sm_writhing_rotten_flesh,
			image_hq : spr_enemy_card_hq_writhing_rotten_flesh,
			enemy_level : 2,
			souls : 4,
			defense_value : 1,
			hit_points : 4,
			attack_value : 2,
			weakness : "magical",
			abilities : ["double strike"],
			attack : [{
				attack_location : 4,
				conditions : ["push n"]
			}],
			spawn_location : 1
		}
		/*,{ name : "crossbow hollow",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "magical",
			attack : [{attack_location : 4}],
			spawn_location : 4
		},{ name : "hollow soldier",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "heavy",
			attack : [{attack_location : 6}],
			spawn_location : 3
		},{ name : "hollow assassin",
			enemy_level : 1,
			souls : 2,
			defense_value : 0,
			hit_points : 2,
			attack_value : 4,
			weakness : "none",
			attack : [{attack_location : 2}],
			spawn_location : 2
		},{ name : "silver knight greatbowman",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "heavy",
			attack : [{attack_location : 2}],
			spawn_location : 5
		},{ name : "sages devout",
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 1,
			attack_value : 4,
			weakness : "precise",
			attack : [{attack_location : 1}],
			spawn_location : 4
		},{ name : "firebomb hollow",
			enemy_level : 1,
			souls : 2,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "skilled",
			attack : [{attack_location : 1}],
			spawn_location : 1
		},{ name : "hound rat",
			enemy_level : 1,
			souls : 1,
			defense_value : 0,
			hit_points : 1,
			attack_value : 3,
			weakness : "none",
			attack : [{attack_location : 5}],
			spawn_location : 2
		},{ name : "cage spider",
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 4,
			attack_value : 1,
			weakness : "skilled",
			attack : [{attack_location : 6}],
			spawn_location : 3
		}*/
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
					//push : false, // false = 0 // N = 1 // E = 2 // ect...
					inflict : false // an array if true // inflict condition(s) // bleed, frostbite, poison, stagger
				}
			],
			spawn_location : 0
		},
		/// Add Later */
	];
	// set default enemy stats
	default_enemy = {
		image : spr_enemy_card_sm_front,
		image_hq : spr_enemy_card_sm_front,
		enemy_level   : 1,
		souls         : 1,
		defense_value : 0,
		hit_points    : 1,
		attack_value  : 0,
		abilities : [],
		//regenerate : false, // TF
		//invisibility : false, // TF
		weakness : "none", // heavy, precise, magical, skilled, none
		//area_of_effect : false, // WoL
		attack : [
			{
				attack_location : 1,
				//push : false, // false = 0 // N = 1 // E = 2 // ect...
				// inflict condition(s) // bleed, frostbite, poison, stagger
				conditions : false, // an array if true
				area_of_effect : false
			}
		],
		spawn_location : 1,
		play_script : function (card_id = id) {enemy_card_basic_attack(card_id);}
	};
	// add default values //
	//var _test = false;
	for (i = 0; i < array_length(card_stats); i++) {
		//if (_test) show_debug_message("enemy : "+string(struct_get(card_stats[i],"name")));
		struct_foreach (default_enemy, function(_name, _value) {
			if (struct_get(card_stats[i],string(_name)) == undefined) {
				struct_set(card_stats[i],string(_name),_value);
			}
			// for each attack
			for (j = 0; j < array_length(struct_get(card_stats[i],"attack")); j++) {
				struct_foreach (struct_get(default_enemy,"attack")[0], function(_name_2, _value_2) {
					if (struct_get(struct_get(card_stats[i],"attack")[j],string(_name_2)) == undefined) {
						struct_set(struct_get(card_stats[i],"attack")[j],string(_name_2),_value_2);
					}
				});
			}
		});
		//if (_test) show_debug_message(string(card_stats[i]));
	}
	return card_stats;
}