/// @description when reduced to zero hit points

//var _enemy_id = id;
//var _enemy_placement = placement;
//with (deck) {
// above max enemies on the field
deck.enemy_count --;

// get enemy stats

/*/ TR // I'm uncertain what this was for
for (var i = 0; i < array_length(deck.enemy); i++) {
	if (deck.enemy[i] == id) {
		deck.enemy[i] = {};
		break;
	}
}
// TR /*/

global.board_e_card[placement] = noone;
//}
// card_placements[enemy_placement] = enemy_placement; // update this after figuring our what's stored there