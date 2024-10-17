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
if (mouse_x >= x-sprite_width /2 && mouse_x <= x+sprite_width /2 &&
mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) {
	// temporary fix to overlay
	if (obj_start_deck.deck_reveal == false) {
		// press [ mouse left ] // make card dragable
		if (mouse_check_button_pressed(mb_left)) {
			if (x == des_x && y == des_y) dragable = true;
		}
		/*// WoL // hold [ mouse right ] // visual spoiler //
		if (mouse_check_button(mb_right)) {
			show_debug_message("visual spoiler");
		}
		// WoL //*/
	}

}
// release [ mouse left ] // stop draging card
if (mouse_check_button_released(mb_left)) dragable = false;
// reset depth upon returning to start
if (!dragable && depth != temp_depth && x == des_x && y == des_y) depth = temp_depth;