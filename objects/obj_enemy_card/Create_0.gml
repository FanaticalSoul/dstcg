/// @description set varibles

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
