function scr_enemy_card_draw () {
	if (enemy_count > enemy_max) {
		// above max enemies on the field // WoL
		return;
	}
	//enemy[enemy_count] = deck[--deck_size];
	enemy[enemy_count] = deck[--deck_size][0];
	enemy_placement = deck[deck_size][1]-1;
	deck[deck_size] = 0;
	
	
	// fix placement positions
	while (card_placements[enemy_placement] != noone) {
		enemy_placement = irandom_range(0,enemy_max-1);
	}
	card_placements[enemy_placement] = enemy_placement;
	
	
	
	
	
	
	
	//deck_point ++;
	
	
	// add enemy grid tracking outside draw method to be called in draw method
	
	enemy_card[enemy_count] = instance_create_depth(obj_enemy_deck.x,obj_enemy_deck.y,-enemy_count-1,obj_enemy_card,{
		//placement : enemy_count,
		placement : enemy_placement,
		card_number : enemy[enemy_count],
		card_level : card_level
	});
	
	enemy_count ++;
	return;
}

