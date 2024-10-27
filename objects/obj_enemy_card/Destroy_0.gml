/// @description Insert description here
// You can write your code in this editor


// above max enemies on the field
obj_enemy_deck.enemy_count -= 1;
// get enemy stats
for (var _i = 0; _i < array_length(obj_enemy_deck.enemy); _i ++) {
	if (obj_enemy_deck.enemy[_i] == id) {
		obj_enemy_deck.enemy[_i] = noone;
		break;
	}
}
// card_placements[enemy_placement] = enemy_placement; // update this after figuring our what's stored there