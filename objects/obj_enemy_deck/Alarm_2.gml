/// @description activate enemies
//sout("activate enemies")
// activate enemy cards
// sort by position


// TF
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
	array_foreach(enemy_card, function(value, index) {
		if (instance_exists(value)) {
			// do particle effect for attack
			instance_create_depth(value.x, value.y, value.depth+1, obj_particle_card_ripple);
			// activate enemy
			value.card_stats.play_script(value.id);
		}
	});
}
*/