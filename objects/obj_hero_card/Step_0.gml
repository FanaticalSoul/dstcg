/// @description Insert description here
if (card_to_hand) {
	if (alarm[0] == -1) alarm[0] = 1;
}
if (card_in_hand) {
	var _card_size_x = sprite_width+player.hand_spacing;
	var _center_x = room_width/2-player.hand_size/2*_card_size_x+player.hand_spacing/2;
	pos_x_1 = _center_x+(player.hand_offset+hand_position)*_card_size_x;
	pos_y_1 = player.y;
	if (point_distance(x,y,pos_x_1,pos_y_1) > 10) {
		move_towards_point(pos_x_1,pos_y_1,10);
	}
	else {
		speed = 0;
		x = pos_x_1;
		y = pos_y_1;
	}
}