/// @description set varibles
// initalize varibles
enemy_to_board = true ;
enemy_on_board = false;
// set destination
des_x = x;
des_y = y;
// flip animation varibles
flip_scale_x = 1; // x scale of the card // will change to simulate the flip
flip_active = false; // whether the card is currently flipping
flip_finished = false; // whether the card is flipped (showing the back)
// set varibles
path_speed = card_speed;
card_hq = obj_visual_spoiler;
enemy_cords = obj_enemy_deck.enemy_cords; // placement cords
// set sprite
sprite_index = card_stats.image;
// TF // TT7 //
wounds = 0;
conditions = [];
attack_animation = false;