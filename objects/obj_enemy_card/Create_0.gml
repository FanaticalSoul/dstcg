/// @description Insert description here


// flip animation varibles // needs revisions
flip_speed = 0.08;    // Speed of the flip animation
flip_scale_x = 1;         // X scale of the card, will change to simulate the flip
flip_active = false;    // Whether the card is currently flipping
flip_finished = false;     // Whether the card is flipped (showing the back)
visual_spoiler = false;

//
enemy_to_field = true ;
enemy_on_field = false;
path_speed = card_speed;

// placement cords


//deck = obj_enemy_deck.deck;
enemy_cords = obj_enemy_deck.enemy_cords;
// set destination
des_x = x;
des_y = y;

// get sprite
//sprite_index = sprites[card_number+(card_level-1)*20];
sprite_index = card_stats.image;

//show_debug_message("created");