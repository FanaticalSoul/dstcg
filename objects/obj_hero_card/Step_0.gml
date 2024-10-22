/// @description step

// move towards origin
if (point_distance(x,y,des_x,des_y) > path_speed) {
	move_towards_point(des_x,des_y,path_speed);
}
else {
	speed = 0;
	x = des_x;
	y = des_y;
}
// mouse over card
if (scr_mouse_over_card()) {
	// temporary fix to overlay
	if (obj_start_deck.deck_reveal == false) {
		// press [ mouse left ]
		if (mouse_check_button_pressed(mb_left) && !obj_player.encounter_start) {
			// make card dragable
			if (x == des_x && y == des_y) dragable = true;
		}
		if (mouse_check_button_pressed(mb_left ) && obj_player.encounter_start) {
			// toggle selection
			if (x == des_x && y == des_y) selected = !selected;
		}
		
		// hold [ mouse right ] // visual spoiler
		if (mouse_check_button(mb_right) && obj_player.encounter_start) {
			if (card_stats != noone) {
				if (ability_used) obj_visual_spoiler.sprite_index = struct_get(card_stats,"image_hq_back");
				else obj_visual_spoiler.sprite_index = struct_get(card_stats,"image_hq_front");
			}
			obj_visual_spoiler.visible = true;
		}
		else {
			obj_visual_spoiler.sprite_index = spr_card_hq;
			obj_visual_spoiler.visible = false;
		}
	}
}

// release [ mouse left ]
if (mouse_check_button_released(mb_left ) && dragable) {
	// stop draging card
	dragable = false;
}
// reset depth upon returning to start
if (!dragable && depth != temp_depth && x == des_x && y == des_y) depth = temp_depth;