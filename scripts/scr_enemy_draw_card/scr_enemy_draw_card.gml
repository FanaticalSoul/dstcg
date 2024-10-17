function scr_enemy_draw_card () {
	if (enemy_count > enemy_max) {
		// above max enemies on the field // WoL
		return;
	}
	enemy[enemy_count] = deck[--deck_size];
	deck[deck_size] = 0;
	//deck_point ++;
	
	enemy_card[enemy_count] = instance_create_depth(obj_enemy_deck.x,obj_enemy_deck.y,-enemy_count-1,obj_enemy_card,{
		placement : enemy_count,
		card_number : enemy[enemy_count],
		card_level : card_level
	});
	
	enemy_count ++;
	return;
}

