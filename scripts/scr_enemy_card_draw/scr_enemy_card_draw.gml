function scr_enemy_card_draw () {
	if (enemy_count > enemy_max) {
		// above max enemies on the field // WoL
		return;
	}
	//enemy[enemy_count] = deck[--deck_size];
	//enemy[enemy_count] = deck[--deck_size][0];
	//enemy[enemy_count] = deck[--deck_size];
	deck_size --;
	//show_debug_message(string(deck[deck_size]));
	//show_debug_message(string(enemy_card_stats));
	for (i = 0; i < array_length(enemy_card_stats); i++) {
		if (struct_get(enemy_card_stats[i],"name") == deck[deck_size]) {
			enemy[enemy_count] = enemy_card_stats[i];
			//show_debug_message("changed");
			break;
		}
	}
	
	
	
	//enemy_placement = deck[deck_size][1]-1;
	enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
	deck[deck_size] = "";
	
	
	// fix placement positions
	while (card_placements[enemy_placement] != noone) {
		enemy_placement = irandom_range(0,field_spaces-1);
	}
	card_placements[enemy_placement] = enemy_placement;
	
	
	
	
	
	
	
	//deck_point ++;
	
	
	// add enemy grid tracking outside draw method to be called in draw method
	
	enemy_card[enemy_count] = instance_create_depth(obj_enemy_deck.x,obj_enemy_deck.y,-enemy_count-1,obj_enemy_card,{
		//placement : enemy_count,
		placement : enemy_placement,
		//card_number : enemy[enemy_count],
		card_stats : enemy[enemy_count],
		card_level : card_level
	});
	
	enemy_count ++;
	return;
}

