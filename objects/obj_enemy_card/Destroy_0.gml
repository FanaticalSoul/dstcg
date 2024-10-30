/// @description when reduced to zero hit points
var _enemy_id = id;
var _enemy_placement = placement;
with (obj_enemy_deck) {
	// above max enemies on the field
	enemy_count -= 1;
	// get enemy stats
	for (var _i = 0; _i < array_length(enemy); _i ++) {
		if (enemy[_i] == _enemy_id) {
			enemy[_i] = noone;
			break;
		}
	}
	card_placements[_enemy_placement] = noone;
}
// card_placements[enemy_placement] = enemy_placement; // update this after figuring our what's stored there