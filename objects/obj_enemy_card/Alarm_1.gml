/// @description wound / death check

// check if wounds are fatal
if (wounds >= card_stats.hit_points) {
	// try to reanimate
	//sout(card_stats);
	var _can_reanimate = array_contains(card_stats.abilities, "reanimate");
	if (_can_reanimate && !reanimated) {
		sout(card_name+" has reanimated");
		// reset hitpoints and conditions
		conditions = [];
		wounds = 0;
		reanimated = true;
	}
	else instance_destroy(); // toggle destroy method
}