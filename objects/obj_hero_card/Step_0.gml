/// @description handle keybinds, animation state, and movement within hand

// alarm on card draw
if (card_to_hand && alarm[0] == -1) alarm[0] = 1;

// position card within hand
if (card_in_hand) {
	// flip card over when hidden off screen
	//if (!card_visable && path_position) card_visable = true;
	if (!card_visable && path_position>=0.5) card_visable = true;
	var _card_size_x = sprite_width+player.hand_spacing;
	var _center_x = room_width/2-player.hand_size/2*_card_size_x;
	des_x = _center_x+(player.hand_offset+hand_position)*_card_size_x;
	des_x += _card_size_x/2; // offset
	des_y = player.y;
	
	// end path early if placement location is above or bellow path
	//if (x <= des_x && y == des_y) path_end();
	
	// move towards placement within hand
	if (point_distance(x,y,des_x,des_y) > path_speed) {
		move_towards_point(des_x,des_y,path_speed);
	}
	else {
		speed = 0;
		x = des_x;
		y = des_y;
	}
}

// mouse over card
if (mouse_x >= x-sprite_width /2 && mouse_x <= x+sprite_width /2 &&
mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) {
	// press [ mouse left ] // make card dragable
	if (mouse_check_button_pressed(mb_left)) {
		if (card_visable && x == des_x && y == des_y) dragable = true;
	}
	// release [ mouse left ] // stop draging card
	if (mouse_check_button_released(mb_left)) {
		dragable = false;
		depth = temp_depth;
	}
	// hold [ mouse right ] // visual spoiler // WoL
	if (mouse_check_button(mb_right)) {
		show_debug_message("visual spoiler");
	}
}