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