/// @description keybinds and flip animation

// mouse over card
if (is_mouse_over_card()) {
	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right) && array_length(card_stats) > 0) {
		card_hq.sprite_index = card_stats.image_hq;
		card_hq.visible = true;
	}
	else {
		card_hq.sprite_index = spr_card_hq;
		card_hq.visible = false;
	}
}
// flip animation
if (flip_active) {
    // decrease scale_x to 0, then switch sprites and increase it back to 1
    if (!flip_finished) {
        flip_scale_x -= flip_speed; // shrinking the card
        if (flip_scale_x <= 0) {
            flip_finished = true; // mark as flipped
            flip_scale_x = 0; // prevent negative scale
        }
    } else {
        flip_scale_x += flip_speed; // expanding the card
        if (flip_scale_x >= 1) {
            flip_scale_x = 1; // full-size card
            flip_active = false; // flip finished
        }
    }
}
// if the card is not flipping and the enemy is on the board
else if (enemy_on_board && !flip_finished) {
	// flip the card
	if (!point_distance(x,y,des_x,des_y) && !flip_active) flip_active = true;
}
// alarm on card draw
if (enemy_to_board && alarm[0] == -1) alarm[0] = 1;
// if the enemy is on the board
if (enemy_on_board) {
	// change des cords
	if (placement != -1) {
		des_x = global.board_e_cords[placement][0];
		des_y = global.board_e_cords[placement][1];
		// end path early if placement location is above or bellow path
		if (x <= des_x) path_end();
	}
	// move card towards des cords
	if (point_distance(x,y,des_x,des_y) > path_speed) move_towards_point(des_x,des_y,path_speed);
	else {
		speed = 0;
		x = des_x;
		y = des_y;
		depth = 0; // "reset" depth // WoL
	}
}

