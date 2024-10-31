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
			// card selection //
			if (player.character_activation_phase || 
			(player.enemy_activation_phase && player.reaction)) { // conditional to use card on enemy activation
				if (player.action_pay_stamina) {
					// if only selecting stamina
					if (card_stats[0].type == "stamina") {
						if (selected) scr_start_card_stamina_unselect ();
						else {
							selected = true;
							player.stamina_selection[array_length(player.stamina_selection)] = id;
						}
					}
					else if (array_length(player.stamina_selection) == 0 && 
					array_length(player.selection)==1) {
						if (player.selection[0] == id) {
							// if card selected was the equipment
							player.action_pay_stamina = false;
							with (player.selection[0]) scr_start_card_unselect ();
						}
					}
				}
				else {
					// select or unselect card
					selected = !selected;
					if (selected) player.selection[array_length(player.selection)] = id;
					else scr_start_card_unselect ();
				}
			}
			// resolve damage //
			else if (player.character_card.damage_taken > 0) {
				scr_start_card_stamina_discard (id); // TF
				player.character_card.damage_taken --;
			}
		}
	}

	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right)) {
		if (card_stats != noone) card_hq.sprite_index = struct_get(card_stats[0],"image_hq");
		card_hq.visible = true;
	}
	else {
		card_hq.sprite_index = spr_card_hq;
		card_hq.visible = false;
	}
}



// if this card is the only card selected // keep out of hover over card area
if (selected && array_length(player.selection)==1) {
	// press [ number ] // do script
	if (keyboard_check_pressed(1+48)) {
		if (
			card_stats[0].name == "remant of humanity" || 
			card_stats[0].name == "spear"
		) {
			card_stats[1].play_script(id);
		}
	}
	else if (keyboard_check_pressed(2+48)) {
		if (
			card_stats[0].name == "talisman" || 
			card_stats[0].name == "spear"
		) {
			card_stats[2].play_script(id);
		}
	}
	else if (keyboard_check_pressed(3+48)) {
		if (
			card_stats[0].name == "spear"
		) {
			card_stats[3].play_script(id);
		}
	}
}