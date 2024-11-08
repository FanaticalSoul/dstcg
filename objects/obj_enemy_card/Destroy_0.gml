/// @description when reduced to zero hit points

if (instance_exists(deck)) {
	// above max enemies on the field
	deck.enemy_count --;
}
// get enemy stats
global.board_e_card[placement] = noone;