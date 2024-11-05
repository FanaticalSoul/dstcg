/// @description start enemy act phase
global.phase_e_place = false;
// sort enemy array
/*
with (e_deck) {
	array_sort(enemy_card, function(inst1, inst2) {
		if (instance_exists(inst1) && instance_exists(inst2)) {
			return inst1.placement - inst2.placement;
		}
		else return array_length(enemy_card);
	});
}
*/
// start enemy act phase
global.phase_e_act = true;
sout("phase 4 - enemy activation");
if (global.phase_e_act && alarm[4] == -1) {
	card_placement = 0;
	// skip activations of non-existant enemies
	while (card_placement < enemy_max) {
		if (global.board_e_card[card_placement] == noone) card_placement++;
		else break;
	}
	// activate card
	alarm[4] = e_deck.card_draw_frame_delay;
}