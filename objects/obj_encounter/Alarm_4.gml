/// @description enemy act phase
/*
var _test = false;
if (_test) {
	sout(enemy_card);
	array_foreach(enemy_card, function(value, index) {
		if (instance_exists(value)) {
			sout([index,value.card_stats.name]);
		}
	});
}
else {
*/
with (obj_enemy_deck) {
	enemy_card[obj_encounter.card_placement]
	array_foreach(enemy_card, function(value, index) {
		if (instance_exists(value)) {
			// do particle effect for attack
			instance_create_depth(value.x, value.y, value.depth+1, obj_particle_card_ripple);
			// activate enemy
			value.card_stats.play_script(value.id);
		}
	});
}