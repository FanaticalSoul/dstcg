/// @description set varibles and stats
// initalize varibles
card_stats = noone;
card_hq = obj_visual_spoiler;
dragable = false;
selected = false;
ability_used = false; // WoL // recharges at bonfire
// set varibles
path_speed = card_speed;
temp_depth = depth;
inital_x = x;
inital_y = y;
des_x = x;
des_y = y;
// set card stats
var _tmp_card_stats = scr_character_card_stats_set();
for (var _i = 0; _i < array_length(_tmp_card_stats); _i++ ) {
	if (struct_get(_tmp_card_stats[_i],"name") == character) {
		card_stats = _tmp_card_stats[_i]
		break;
	}
}