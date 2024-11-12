/// @description set varibles and stats

// initalize varibles
card_hq = obj_visual_spoiler;
dragable = false;
selected = false;
// set varibles
path_speed = card_speed;
temp_depth = depth;
//inital_x = x;
//inital_y = y;
des_x = x;
des_y = y;
// set card stats
sout("created "+string(character)+" card");
card_stats = card_get_stats(character_card_stats, character);
//sout(card_stats);
act_ability_target_id = noone;
act_ability_target = false;
condition_stack = []; // TF
end_c_act_phase = false;

function character_apply_condition_damage (condition, character_id = id) {
	with (character_id) {
		for (var i = 0; i < array_length(conditions); i++) {
			if (conditions[i] == condition) {
				damage_taken += 1;
				array_delete(conditions, i, 1);
				break;
			}
		}
	}
}

function get_character_placement (character_id = id) {
	var _character_placement = -1;
	with (character_id) {
		for (var i = 0; i < board_size; i++) {
			if (global.board_c_card[i]==id) {
				_character_placement = i;
				break;
			}
		}
	}
	return _character_placement;
}