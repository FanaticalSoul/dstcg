function scr_enemy_card_draw () {
	// above max enemies on the field
	if (enemy_count > enemy_max) return; // WoL
	deck_size --;
	// get enemy stats
	enemy[enemy_count] = scr_get_stats(deck[deck_size], enemy_card_stats, false);
	if (enemy[enemy_count] == undefined) enemy[enemy_count] = noone;
	
	//enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
	var _enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
	deck[deck_size] = "";
	// fix placement positions
	/*
	while (card_placements[enemy_placement] != noone) {
		enemy_placement = irandom_range(0,board_size-1); // TF
	}
	*/
	while (card_placements[_enemy_placement] != noone) {
		_enemy_placement = irandom_range(0,board_size-1); // TF
	}
	//card_placements[enemy_placement] = enemy_placement;
	card_placements[_enemy_placement] = _enemy_placement;
	// add enemy grid tracking outside draw method to be called in draw method
	/*
	enemy_card[enemy_count] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
		placement : enemy_placement,
		card_stats : enemy[enemy_count]
	});
	*/
	enemy_card[enemy_count] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
		placement : _enemy_placement,
		card_stats : enemy[enemy_count]
	});
	enemy_count ++;
	return;
}