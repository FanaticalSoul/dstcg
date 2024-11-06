/// @description keybinds and flip animation

// mouse over card
if (is_mouse_over_card()) {
	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right) && is_struct(card_stats)) {
		card_hq.sprite_index = card_stats.image_hq;
		card_hq.visible = true;
	}
	else {
		card_hq.sprite_index = spr_card_hq;
		card_hq.visible = false;
	}
}
// flip animation
if (ani_act_flip) {
    // decrease scale_x to 0, then switch sprites and increase it back to 1
    if (!ani_fin_flip) {
        flip_scale_x -= flip_speed; // shrinking the card
        if (flip_scale_x <= 0) {
            ani_fin_flip = true; // mark as flipped
            flip_scale_x = 0; // prevent negative scale
        }
    } else {
        flip_scale_x += flip_speed; // expanding the card
        if (flip_scale_x >= 1) {
            flip_scale_x = 1; // full-size card
            ani_act_flip = false; // flip finished
			//sout("finished flip");
        }
    }
}
// if the card is not flipping and the enemy is on the board
else if (
	ani_fin_board && !ani_act_board && x == des_x && y == des_y && // on board
	!ani_act_flip && !ani_fin_flip
) {	// flip the card
	if (!point_distance(x,y,des_x,des_y) && !ani_act_flip) ani_act_flip = true;
}
// alarm on card draw
if (ani_act_board && alarm[0] == -1) alarm[0] = 1;
// if the enemy is on the board
if (ani_fin_board) {
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

