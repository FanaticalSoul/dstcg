/// @description draw card

if (card_stats != noone && x > 0-sprite_width/2 && x < room_width) {
	if (ability_used) {
		sprite_index = struct_get(card_stats,"image_sm_back");
	}
	else {
		sprite_index = struct_get(card_stats,"image_sm_front");
	}
	draw_self(); // only draw inside the room
	if (selected) draw_sprite(spr_card_sm_selected,-1,x,y);
}

// drag card
if (dragable) {
	depth = -obj_player.hand_size-2;
	speed = 0;
	x = mouse_x;
	y = mouse_y;
}
/*
if (card_stats != noone && visual_spoiler) {
	if (ability_used) {
		sprite_index = struct_get(card_stats,"image_hq_back");
	}
	else {
		sprite_index = struct_get(card_stats,"image_hq_front");
	}
	draw_sprite(sprite_index,-1, room_width/2, room_height/2);
}
*/