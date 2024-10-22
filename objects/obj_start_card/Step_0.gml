/// @description handle keybinds, animation state, and movement within hand
// alarm on card draw
if (card_to_hand && alarm[0] == -1) alarm[0] = 1;
// position card within hand
if (card_in_hand) {
	// flip card over when hidden off screen
	if (!show_card && path_position>=0.5) show_card = true;
	var _card_size_x = sprite_width+player.hand_spacing;
	var _center_x = room_width/2-player.hand_size/2*_card_size_x;
	des_x = _center_x+(player.hand_offset+hand_position)*_card_size_x;
	des_x += _card_size_x/2; // offset
	des_y = player.y;
	
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
if (scr_mouse_over_card()) {
	// press [ mouse left ] // select card
	if (mouse_check_button_pressed(mb_left)) {
		if (show_card && x == des_x && y == des_y) {
			if (obj_player.character_activation_phase || obj_player.enemy_activation_phase) {
				selected = !selected;
				if (selected) obj_player.selection[array_length(obj_player.selection)] = id;
				else scr_start_card_unselect ();
			}
		}
	}
	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right)) {
		if (card_stats != noone) obj_visual_spoiler.sprite_index = struct_get(card_stats[0],"image_hq");
		obj_visual_spoiler.visible = true;
	}
	else {
		obj_visual_spoiler.sprite_index = spr_card_hq;
		obj_visual_spoiler.visible = false;
	}
}