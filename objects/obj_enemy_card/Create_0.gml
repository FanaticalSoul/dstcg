/// @description set varibles

// set destination
des_x = x;
des_y = y;
// flip animation varibles
flip_scale_x = 1; // x scale of the card // will change to simulate the flip
//flip_active = false; // whether the card is currently flipping
//flip_finished = false; // whether the card is flipped (showing the back)
// set varibles
path_speed = card_speed;
card_hq = obj_visual_spoiler;
// set sprite
if (is_struct(card_stats)) sprite_index = card_stats.image;
// TF // WoL
ani_act_attack = false;