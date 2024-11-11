/// @description handle keybinds, animation state, and movement within hand

if (instance_exists(player)) { // TF // only step if player exists
	// alarm on card draw
	if (ani_act_draw && alarm[0] == -1) alarm[0] = 1;
	// position card within hand
	if (ani_fin_draw) {
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
	// while card is in hand
	if (hand_position != -1) {
		// mouse over card
		if (is_mouse_over_card()) {
			// press [ mouse left ] // select card
			if (mouse_check_button_pressed(mb_left)) {
				if (show_card && x == des_x && y == des_y) {
					// card selection //
					if (global.phase_c_act || (global.phase_e_act && global.phase_react)) {
						if (player.pay_stamina) {
							// if only selecting stamina
							if (card_stats[0].type == "stamina") {
								if (selected) start_card_stamina_unselect();
								else {
									selected = true;
									// unselect character card
									if (instance_exists(player.character)) player.character.selected = false;
									//sout(["stamina",player.selection_stamina]);
									player.selection_stamina[array_length(player.selection_stamina)] = id;
								}
							}
							else if (array_length(player.selection_stamina) == 0 && 
							array_length(player.selection)==1) {
								if (player.selection[0] == id) {
									// if card selected was the equipment
									player.pay_stamina = false;
									//with (player.selection[0]) start_card_unselect ();
									start_card_unselect(player.selection[0]);
								}
							}
						}
						else {
							// select or unselect card
							selected = !selected;
							if (selected) {
								// unselect character card
								if (instance_exists(player.character)) player.character.selected = false;
							}
							if (selected) player.selection[array_length(player.selection)] = id;
							else start_card_unselect();
						}
					}
					// resolve damage //
					else if (player.character.damage_taken > 0) {
				
						//scr_start_card_stamina_discard (id); // TF
						start_card_discard (player.discard);
				
						player.character.damage_taken --;
					}
				}
			}
			// hold [ mouse right ] // visual spoiler
			else if (mouse_check_button(mb_right) && card_stats != noone) {
				card_hq.sprite_index = card_stats[0].image_hq;
				card_hq.visible = true;
			}
		}
		// if this card is the only card selected // keep out of hover over card area
		if (selected && array_length(player.selection)==1) {
			// press [ number ] // do script
			if (card_stats[0].type == "equipment") {
				for (var i = 1; i <= 3; i++) {
					if (keyboard_check_pressed(i+48) || (keyboard_check_pressed(32) && player.last_valid_num==i)) {
						//sout(card_stats);
						if (array_length(card_stats)-1 >= i) {
							card_stats[i].play_script(id);
							// allow space bar to be used when an action is selected
							if (keyboard_check_pressed(i+48)) player.last_valid_num = i;
							else player.last_valid_num = -1;
						}
					}
				}
			}
		}
	}
}