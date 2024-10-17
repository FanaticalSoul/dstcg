/// @description handle keybinds, animation state, and movement within hand

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
// release [ mouse left ] // stop draging card
if (mouse_check_button_released(mb_left)) {
	dragable = false;
	depth = temp_depth;
}