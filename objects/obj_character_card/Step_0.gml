/// @description step
// move towards origin
if (point_distance(x,y,des_x,des_y) > path_speed) move_towards_point(des_x,des_y,path_speed);
else {
	speed = 0;
	x = des_x;
	y = des_y;
}
// mouse over card
if (scr_mouse_over_card()) {
	// temporary fix to overlay // WoL
	if (player.deck.deck_reveal == false) {
		// get phases
		var _place_phase = player.character_placement_phase;
		var _cha_act_phase = player.character_activation_phase;
		var _ene_act_phase = player.enemy_activation_phase;
		// press [ mouse left ] // make card dragable
		if (mouse_check_button_pressed(mb_left) && _place_phase) {
			if (x == des_x && y == des_y) dragable = true;
		}
		// press [ mouse left ] // toggle selection
		if (mouse_check_button_pressed(mb_left) && (
			(_ene_act_phase && player.reaction) || 
			(_cha_act_phase && (!action_ability || !action_movement))
		)) {
			if (x == des_x && y == des_y) selected = !selected;
		}
		// hold [ mouse right ] // visual spoiler
		if (mouse_check_button(mb_right)) {
			if (card_stats != noone) {
				if (action_ability) card_hq.sprite_index = struct_get(card_stats,"image_hq_back");
				else card_hq.sprite_index = struct_get(card_stats,"image_hq_front");
			}
			card_hq.visible = true;
		}
		else {
			card_hq.sprite_index = spr_card_hq;
			card_hq.visible = false;
		}
	}
}
// release [ mouse left ] // stop draging card
if (mouse_check_button_released(mb_left) && dragable) dragable = false;
// reset depth upon returning to start
if (!dragable && depth != temp_depth && x == des_x && y == des_y) depth = temp_depth;
// move character
if (keyboard_check_pressed(37) || keyboard_check_pressed(38) || keyboard_check_pressed(39) || keyboard_check_pressed(40)) {
	// set modifiers
	var _move_mod = 0;
	if (keyboard_check_pressed(38)) _move_mod = -board_cols;
	else if (keyboard_check_pressed(39)) _move_mod = 1;
	else if (keyboard_check_pressed(40)) _move_mod = board_cols;
	else if (keyboard_check_pressed(37)) _move_mod = -1;
	// check if movement conditions are met
	if (selected && !action_movement && player.character_activation_phase && _move_mod != 0) {
		// get player placement
		var _character_placement = -1;
		for (var _i = 0; _i < board_size; _i++) {
			if (player.board_card[_i]==id) {
				_character_placement = _i;
				break;
			}
		}
		if (
			_character_placement+_move_mod >= 0 && 
			_character_placement+_move_mod < board_size &&
			_character_placement >= 0
		) {
			// validate movement
			if (player.board_card[_character_placement+_move_mod] == noone) {
				// remove prior instance of object from field
				player.board_card[_character_placement] = noone;
				// do movement
				player.board_card[_character_placement+_move_mod] = id;
				des_x = player.board_cords[_character_placement+_move_mod][0];
				des_y = player.board_cords[_character_placement+_move_mod][1];
				// finish movement
				action_movement = true;
			}
		} 
	}
}