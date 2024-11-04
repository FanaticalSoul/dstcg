/// @description set varibles and stats
// initalize varibles
card_stats = noone;
card_hq = obj_visual_spoiler;
dragable = false;
selected = false;
// action varibles
act_ability = false; // character ability action // WoL // recharges at bonfire
act_move = false; // character movement action
// set varibles
path_speed = card_speed;
temp_depth = depth;
inital_x = x;
inital_y = y;
des_x = x;
des_y = y;
// set card stats
var _card_stats = scr_character_card_stats_set();
for (var i = 0; i < array_length(_card_stats); i++ ) {
	if (struct_get(_card_stats[i],"name") == character) {
		card_stats = _card_stats[i]
		break;
	}
}
// conditions // WoL
conditions = [];
damage_taken = 0;
damage_stack = 0; // use this to make reactions easier to work with