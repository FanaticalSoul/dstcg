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
		if (mouse_check_button_pressed(mb_left) && (_ene_act_phase || _cha_act_phase)) {
			if (x == des_x && y == des_y) selected = !selected;
		}
		// hold [ mouse right ] // visual spoiler
		if (mouse_check_button(mb_right)) {
			if (card_stats != noone) {
				if (ability_used) card_hq.sprite_index = struct_get(card_stats,"image_hq_back");
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
//scr_sout_last_key();
if (keyboard_key_press(37) || keyboard_key_press(38) || keyboard_key_press(39) || keyboard_key_press(40)) {
	/////////////////////////////////////////////////////
}