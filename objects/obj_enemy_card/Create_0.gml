/// @description set varibles

card_stats = card_get_stats(enemy_card_stats,card_name);
// set destination
des_x = x;
des_y = y;
// flip animation varibles
flip_scale_x = 1; // x scale of the card // will change to simulate the flip
// set varibles
path_speed = card_speed;
tmp_depth = depth;
card_hq = obj_visual_spoiler;
// set sprite
if (is_struct(card_stats)) {
	sout("created an enemy card ( "+string(card_stats.name)+" )");
	sprite_index = card_stats.image;
}
else sout("failed to create an enemy card");
// TF // WoL
ani_act_attack = false;
attack_count = 0;





function get_invisibility_status () {
	// only check invisiblity if a non invisible enemy exists
	var _insibility_check = false; 
	for (var i = 0; i < array_length(global.board_e_card); i++) {
		if (instance_exists(global.board_e_card[i])) {
			with (global.board_e_card[i]) {
				// do check if a card is visible
				if (!array_contains(card_stats.abilities, "invisibility")) _insibility_check = true; 
			}
		}
		if (_insibility_check) break;
	}
	return _insibility_check;
}


function is_invisible (card_id = id) {
	with (card_id) {
		var _invisible = (array_contains(card_stats.abilities, "invisibility"));
		_invisible = (get_invisibility_status() && _invisible);
		return _invisible;
	}
}