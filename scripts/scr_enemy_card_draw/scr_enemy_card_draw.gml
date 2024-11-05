
/// @function					enemy_card_draw([deck_id]);
/// @param {id} deck_id			enemy deck id
/// @description				output the given value

function enemy_card_draw (deck_id = id) {
	with (deck_id) {
		// above max enemies on the field
		if (enemy_count > enemy_max || enemy_max > board_size) {
			// WoL
			sout("too many enemies on the board");
			return;
		}
		sout("enemy card draw"); // output action
		deck_size --;
		// get enemy stats
		enemy[enemy_count] = card_get_stats(enemy_card_stats, deck[deck_size]);
		
		
		
		
		var _enemy_placement = struct_get(enemy[enemy_count],"spawn_location")-1;
		deck[deck_size] = "";
		// fix placement positions
		while (global.board_e_card[_enemy_placement] != noone) {
			_enemy_placement = irandom_range(0,board_size-1);
		}
		
		//sout(global.board_e_card);
		sout(enemy[enemy_count]);
		global.board_e_card[_enemy_placement] = instance_create_depth(x,y,-enemy_count-1,obj_enemy_card,{
			placement : _enemy_placement,
			card_stats : enemy[enemy_count]
		});
		//sout("created "+enemy_card[enemy_count].card_stats.name);
		enemy_count ++;
	}
	return;
}