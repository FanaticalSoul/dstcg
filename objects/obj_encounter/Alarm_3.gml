/// @description start enemy act phase
global.phase_e_place = false;
global.phase_e_act = true;
// sort enemy array
with (obj_enemy_deck) {
	array_sort(enemy_card, function(inst1, inst2) {
		if (instance_exists(inst1) && instance_exists(inst2)) {
			return inst1.placement - inst2.placement;
		}
		else return array_length(enemy_card);
	});
}
// start enemy act phase
if (global.phase_e_act && alarm[4] == -1) {
	card_placement = 0;
	alarm[4] = obj_enemy_deck.card_draw_frame_delay;
}