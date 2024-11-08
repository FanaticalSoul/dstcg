
/// @function					enemy_card_draw([deck_id]);
/// @param {id} deck_id			enemy deck id
/// @description				output the given value

function enemy_card_draw (deck_id = id) {
	sout("enemy_card_draw was called");
	with (deck_id) {
		// above max enemies on the field
		if (get_enemy_count() > enemy_max || enemy_max > board_size) {
			sout("too many enemies on the board ( WoL )");
		}
		else {
			sout("draw enemy card"); // add to log
			deck_size --;
			// get enemy stats
			var _card_stats = card_get_stats(enemy_card_stats, deck[deck_size]);
			var _enemy_placement = struct_get(_card_stats,"spawn_location")-1;
			deck[deck_size] = "";
			// fix placement positions
			while (instance_exists(global.board_e_card[_enemy_placement])) {
				_enemy_placement = irandom_range(0,board_size-1);
			}
			// create enemy
			global.board_e_card[_enemy_placement] = instance_create_depth(x,y,-get_enemy_count()-1,obj_enemy_card,{
				placement : _enemy_placement,
				card_name : _card_stats.name,
				deck : deck_id
			});
		}
	}
	sout("enemy_card_draw was finished");
	//return;
}