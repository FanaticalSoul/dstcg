
/// @function					set_card_enemy_stats();
/// @description				get the stats for each enemy card
/// @return						{array<struct>}

function get_enemy_card_stats() {

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
	
	card_stats = [{
			name : "hollow manservant",
			image : spr_enemy_card_sm_hollow_manservant,
			image_hq : spr_enemy_card_hq_hollow_manservant,
			enemy_level : 1,
			souls : 2,
			defense_value : 0,
			hit_points : 2,
			attack_value : 4,
			weakness : "none",
			attack : [
				{
					attack_location : 4,
					//push : 1
					conditions : ["push n"]
				}
			],
			spawn_location : 1
		},{
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
		},{
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
		},{
			name : "peasant hollow",
			image : spr_enemy_card_sm_peasant_hollow,
			image_hq : spr_enemy_card_hq_peasant_hollow,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 2,
			attack_value : 2,
			weakness : "precise",
			attack : [
				{
					attack_location : 5,
					//push : 1
					conditions : ["push n"]
				}
			],
			spawn_location : 2
		},{
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
		},{
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
		},{
			name : "irithyllian beast hound",
			image : spr_enemy_card_sm_irithyllian_beast_hound,
			image_hq : spr_enemy_card_hq_irithyllian_beast_hound,
			enemy_level : 1,
			souls : 1,
			defense_value : 1,
			hit_points : 1,
			attack_value : 2,
			weakness : "magical",
			attack : [
				{
					attack_location : 3,
					conditions : ["frostbite"]
				}
			],
			spawn_location : 3,
			play_script : function (id) {
				enemy_card_irithyllian_beast_hound(id);
			}
		},{
			name : "ghru leaper",
			image : spr_enemy_card_sm_ghru_leaper,
			image_hq : spr_enemy_card_hq_ghru_leaper,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 1,
			attack_value : 3,
			weakness : "heavy",
			attack : [
				{
					attack_location : 2,
					conditions : ["poison"]
				}
			],
			spawn_location : 5,
			play_script : function (id) {
				enemy_card_ghru_leaper(id);
			}
		},{
			name : "test",
			image : spr_enemy_card_sm_ghru_leaper,
			image_hq : spr_enemy_card_hq_ghru_leaper,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 1,
			attack_value : 2,
			weakness : "skilled",
			abilities : ["double strike"],
			attack : [
				{
					attack_location : 2,
					//conditions : ["poison", "stagger", "frostbite", "bleed", "push w"]
					conditions : ["push s"]
				}
			],
			spawn_location : 5,
			play_script : function (id) {
				enemy_card_ghru_leaper(id);
			}
		},{
			name : "winged corvian",
			image : spr_enemy_card_sm_winged_corvian,
			image_hq : spr_enemy_card_hq_winged_corvian,
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
		},{
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
		},{
			name : "silver knight spearman",
			image : spr_enemy_card_sm_silver_knight_spearman,
			image_hq : spr_enemy_card_hq_silver_knight_spearman,
			enemy_level : 1,
			souls : 3,
			defense_value : 1,
			hit_points : 2,
			attack_value : 4,
			weakness : "precise",
			attack : [
				{
					attack_location : 2,
					area_of_effect : true
				},
				{
					attack_location : 5,
					area_of_effect : true
				}
			],
			play_script : function (id) {
				enemy_card_silver_knight_spearman(id);
			},
			spawn_location : 2
		},{
			name : "crossbow grave warden",
			image : spr_enemy_card_sm_crossbow_grave_warden,
			image_hq : spr_enemy_card_hq_crossbow_grave_warden,
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
		},{
			name : "grave warden",
			image : spr_enemy_card_sm_grave_warden,
			image_hq : spr_enemy_card_hq_grave_warden,			
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
		},{
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
		},{
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
		},{
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
		spawn_location : 1
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