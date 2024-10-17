/// @description draw card

/*// WoL //
if (!hero_ability_used) sprite_index = spr_card_back;
else if (card_number>0) sprite_index = sprites[card_number];
// WoL //*/


if (x > 0-sprite_width/2 && x < room_width) draw_self(); // only draw inside the room

// drag card
if (dragable) {
	depth = -obj_player.hand_size-2;
	speed = 0;
	x = mouse_x;
	y = mouse_y;
}
