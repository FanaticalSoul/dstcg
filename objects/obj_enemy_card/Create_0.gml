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
if (card_stats == noone) card_stats = {};
else if (array_length(card_stats) > 0) sprite_index = card_stats.image;
// TF // WoL
attack_animation = false;