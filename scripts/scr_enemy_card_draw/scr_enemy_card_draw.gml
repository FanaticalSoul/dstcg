function scr_enemy_card_draw () {
	// above max enemies on the field
	if (enemy_count > enemy_max) return; // WoL
	deck_size --;
	for (var _i = 0; _i < array_length(enemy_card_stats); _i++) {
		if (struct_get(enemy_card_stats[_i],"name") == deck[deck_size]) {
			enemy[enemy_count] = enemy_card_stats[_i];
			break;
		}
	}
	enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
	deck[deck_size] = "";
	// fix placement positions
	while (card_placements[enemy_placement] != noone) {
		enemy_placement = irandom_range(0,board_size-1); // TF
	}
	card_placements[enemy_placement] = enemy_placement;
	// add enemy grid tracking outside draw method to be called in draw method
	enemy_card[enemy_count] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
		placement : enemy_placement,
		card_stats : enemy[enemy_count]
	});
	enemy_count ++;
	return;
}