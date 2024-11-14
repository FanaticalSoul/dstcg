function scr_encounter_card_stats_set () {
	var _card_stats = [{
			name : "ashen hollow",
			image : spr_encounter_card_sm_ashen_hollow,
			image_hq : spr_encounter_card_hq_ashen_hollow,
			encounter_level : 1,
			encounter : [
				[[1,0,0],1],[[3,0,0],1],
				[[2,1,0],2],[[5,0,0],2]
			]
		},{
			name : "the forgotten",
			image : spr_encounter_card_sm_the_forgotten,
			image_hq : spr_encounter_card_hq_the_forgotten,
			encounter_level : 1,
			encounter : [
				[[2,0,0],1],[[2,0,0],1],
				[[2,1,0],2],[[4,0,0],2]
			]
		},{
			name : "high wall of lothric",
			image : spr_encounter_card_sm_high_wall_of_lothric,
			image_hq : spr_encounter_card_hq_high_wall_of_lothric,
			encounter_level : 2,
			encounter : [
				[[0,1,0],2],[[0,2,0],2],
				[[3,2,0],2],[[3,3,0],2]
			]
		},{
			name : "prison tower",
			image : spr_encounter_card_sm_prison_tower,
			image_hq : spr_encounter_card_hq_prison_tower,
			encounter_level : 2,
			encounter : [
				[[0,1,0],2],[[0,2,1],2],
				[[2,2,0],2],[[2,3,0],2]
			]
		},{
			name : "forgotten gorge",
			image : spr_encounter_card_sm_forgotten_gorge,
			image_hq : spr_encounter_card_hq_forgotten_gorge,
			encounter_level : 2,
			encounter : [
				[[2,0,0],2],[[0,2,0],2],
				[[0,3,0],2],[[0,4,0],2]
			]
		}
	];
	return _card_stats;
}