/// @description Insert description here
// You can write your code in this editor

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
switch (hero_class) {
	case "assassin":
		sprite_front = spr_hero_card_sm_assassin_front;
		sprite_back  = spr_hero_card_sm_assassin_back ;
		break;
	case "herald":
		sprite_front = spr_hero_card_sm_herald_front;
		sprite_back  = spr_hero_card_sm_herald_back ;
		break;
	case "sorcerer":
		sprite_front = spr_hero_hero_sm_sorcerer_front;
		sprite_back  = spr_hero_card_sm_sorcerer_back ;
		break;
	case "knight":
		sprite_front = spr_hero_card_sm_knight_front;
		sprite_back  = spr_hero_card_sm_knight_back ;
		break;
	default:
		sprite_front = spr_hero_card_sm_front;
		sprite_back  = spr_hero_card_sm_back ;
		break;
}

sprite_index = sprite_front;



//player = obj_player;

// set placements for hero card
// ( the one at the start and to allow you to change it's position later on )

// get locations this card can be placed in
//obj_player.field_cords;

// get cards placed already
//obj_player.field_card ;

/*// WoL //
hero_ability_used = false; // recharges at bonfire
// WoL //*/