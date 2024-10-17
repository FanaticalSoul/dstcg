function scr_draw_enemy_card_1 () {
	// if prizecard < 6
	
	if (enemy_count > cards_max) {
		// above max enemies on the field
		return;
	}
	
	
	enemy[enemy_count] = deck[--deck_size];
	deck[deck_size] = 0;
	deck_point ++;
	
	var _tmp_sprite = 
	
	enemy_card[enemy_count] = instance_create_depth(obj_enemy_deck_1.x,obj_enemy_deck_1.y,-enemy_count-1,obj_enemy_card,{
		placement : enemy_count,
		card_number : enemy[enemy_count],
		card_level : card_level,
		sprite_number : 1
	});
	
	enemy_count ++;
	return;
}

function scr_draw_enemy_card_2 () {
	// WoL
}

function scr_draw_enemy_card_3 () {
	// WoL
}

