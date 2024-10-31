/// @description activate enemies
sout("activate enemies")

// activate enemy cards
// sort by position
array_sort(enemy_card, function(inst1, inst2) {
	if (instance_exists(inst1) && instance_exists(inst2)) {
		return inst1.placement - inst2.placement;
	}
	else return 0;
});
// TF
var _test = false;
if (_test) {
	array_foreach(enemy_card, function(value, index) {
		if (instance_exists(value)) {
			sout([index,value.card_stats.name]);
		}
	});
}
else {
	array_foreach(enemy_card, function(value, index) {
		if (instance_exists(value)) {
			// do particle effect for attack
			instance_create_depth(value.x, value.y, value.depth+1, obj_particle_card_ripple);
			
			
			value.card_stats.play_script(value.id);
			// activate this enemy
			/*
			sout([index,value.card_stats.name]);
			*/
		}
	});
}
/*
array_foreach(enemy, function(value, index) {
	sout([index,value]);
	return;
});
*/