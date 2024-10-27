/// @description handle keybinds, animation state, and movement within hand
// alarm on card draw
if (card_to_hand && alarm[0] == -1) alarm[0] = 1;
// position card within hand
if (card_in_hand) {
	// flip card over when hidden off screen
	if (!show_card && path_position>=0.5) show_card = true;
	// set des cords
	var _card_size_x = card_width+card_spacing;
	var _center_x = room_width/2-player.hand_size/2*_card_size_x;
	des_x = _center_x+(player.hand_offset+hand_position)*_card_size_x;
	des_x += _card_size_x/2; // offset
	des_y = player.y;
	// move towards placement within hand
	if (point_distance(x,y,des_x,des_y) > path_speed) move_towards_point(des_x,des_y,path_speed);
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
			if (player.character_activation_phase || player.enemy_activation_phase) {
				// select or unselect card
				selected = !selected;
				if (selected) player.selection[array_length(player.selection)] = id;
				else scr_start_card_unselect ();
			}
		}
	}
	// press [ mouse right ] // if only card selected // do script instead of showing spoiler
	if (mouse_check_button_pressed(mb_right) && selected && array_length(player.selection)==1) {
		if (card_stats[0].name == "remant of humanity") {
			card_stats[0].play_script(id);
		}
		else if (card_stats[0].name == "talisman") {
			card_stats[1].play_script(id);
		}
	}
	// hold [ mouse right ] // visual spoiler // do not delete the code bellow
	else if (mouse_check_button(mb_right)) {
		if (card_stats != noone) card_hq.sprite_index = struct_get(card_stats[0],"image_hq");
		card_hq.visible = true;
	}
	else {
		card_hq.sprite_index = spr_card_hq;
		card_hq.visible = false;
	}
}