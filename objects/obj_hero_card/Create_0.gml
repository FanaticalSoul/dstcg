/// @description Insert description here
//game_start = false;
path_speed = card_speed;
// temporary varibles
temp_depth = depth;
inital_x = x;
inital_y = y;
des_x = x;
des_y = y;
dragable = false;
selected = false;
visual_spoiler = false;
ability_used = false;
// set sprite // (temporary code) // TF
card_stats = noone;
var _tmp_card_stats = scr_hero_card_stats_set();
for (i = 0; i < array_length(_tmp_card_stats); i++ ) {
	if (struct_get(_tmp_card_stats[i],"name") == hero_class) {
		card_stats = _tmp_card_stats[i]
		break;
	}
}
//sprite_index = sprite_front;
/*// WoL //
hero_ability_used = false; // recharges at bonfire
// WoL //*/