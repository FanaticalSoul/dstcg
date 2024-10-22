function scr_enemy_card_draw () {
	if (enemy_count > enemy_max) {
		// above max enemies on the field // WoL
		return;
	}
	deck_size --;
	for (i = 0; i < array_length(enemy_card_stats); i++) {
		if (struct_get(enemy_card_stats[i],"name") == deck[deck_size]) {
			enemy[enemy_count] = enemy_card_stats[i];
			break;
		}
	}
	enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
	deck[deck_size] = "";
	// fix placement positions
	while (card_placements[enemy_placement] != noone) {
		enemy_placement = irandom_range(0,field_spaces-1);
	}
	card_placements[enemy_placement] = enemy_placement;
	// add enemy grid tracking outside draw method to be called in draw method
	enemy_card[enemy_count] = instance_create_depth(obj_enemy_deck.x,obj_enemy_deck.y,-enemy_count-1,obj_enemy_card,{
		placement : enemy_placement,
		card_stats : enemy[enemy_count]
	});
	enemy_count ++;
	return;
}