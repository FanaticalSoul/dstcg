
/// @function					enemy_card_draw([deck_id]);
/// @param {id} deck_id			enemy deck id
/// @description				output the given value

function enemy_card_draw (deck_id = id) {
	with (deck_id) {
		// above max enemies on the field
		if (enemy_count > enemy_max) {
			// WoL
			sout("too many enemies on the board");
			return;
		}
		sout("enemy card draw"); // output action
		deck_size --;
		// get enemy stats
		enemy[enemy_count] = card_get_stats(enemy_card_stats, deck[deck_size]);
		//if (enemy[enemy_count] == {}) enemy[enemy_count] = {};
		//enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
		var _enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
		deck[deck_size] = "";
		// fix placement positions
		/*
		while (card_placements[enemy_placement] != noone) {
			enemy_placement = irandom_range(0,board_size-1); // TF
		}
		*/
		//while (card_placements[_enemy_placement] != noone) {
		//sout(global.board_e_card[0] == {  });
		while (array_length(global.board_e_card[_enemy_placement])!=0) {
			// WoL // add a way to exit this loop
			_enemy_placement = irandom_range(0,board_size-1); // TF
			//sout("in loop");
		}
		//card_placements[enemy_placement] = enemy_placement;
		//global.board_e_card[_enemy_placement] = _enemy_placement;
		// add enemy grid tracking outside draw method to be called in draw method
		/*
		enemy_card[enemy_count] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
			placement : enemy_placement,
			card_stats : enemy[enemy_count]
		});

		enemy_card[enemy_count] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
			placement : _enemy_placement,
			card_stats : enemy[enemy_count]
		});
		*/
		//sout(global.board_e_card);
		global.board_e_card[_enemy_placement] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
			placement : _enemy_placement,
			card_stats : enemy[enemy_count]
		});
		//sout("created "+enemy_card[enemy_count].card_stats.name);
		enemy_count ++;
	}
	return;
}