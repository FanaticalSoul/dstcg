/// @description Insert description here

//
enemy_to_field = true ;
enemy_on_field = false;
path_speed = 1;

// placement cords


//deck = obj_enemy_deck.deck;
enemy_cords = obj_enemy_deck.enemy_cords;
sprites = obj_enemy_deck.sprites;
// set destination
des_x = x;
des_y = y;

// get sprite
sprite_index = sprites[card_number+(card_level-1)*20];

//show_debug_message("created");