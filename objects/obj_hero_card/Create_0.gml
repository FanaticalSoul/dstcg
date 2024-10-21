/// @description Insert description here
game_start = false;
path_speed = card_speed;
// temporary varibles
temp_depth = depth;
inital_x = x;
inital_y = y;
des_x = x;
des_y = y;
dragable = false;
// set sprite // (temporary code) // TF
hero_card_stats = scr_hero_card_stats_set();
for (i = 0; i < array_length(hero_card_stats); i++ ) {
	if (struct_get(hero_card_stats[i],"name") == hero_class) {
		sprite_front = struct_get(hero_card_stats[i],"image_sm_front");
		sprite_back  = struct_get(hero_card_stats[i],"image_sm_back" );
	}
}
sprite_index = sprite_front;
/*// WoL //
hero_ability_used = false; // recharges at bonfire
// WoL //*/