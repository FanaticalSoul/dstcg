/// @description keybinds and flip animation

if (instance_exists(deck)) { // TF // only step if deck exists
	// mouse over card
	if (is_mouse_over_card()) {
		// hold [ mouse right ] // visual spoiler // take into account invisibility
		if (mouse_check_button(mb_right) && card_stats != {}) {
			if (!is_invisible() && instance_exists(obj_player)) {
				// if the player isn't revealing their deck or discard
				if (!(obj_player.deck.deck_reveal || obj_player.discard.discard_reveal)) {
					card_hq.sprite_index = card_stats.image_hq;
					card_hq.visible = true;
				}
			}
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
				// finish flip
	            flip_scale_x = 1; // full-size card
	            ani_act_flip = false; // flip finished
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
			depth = tmp_depth; // "reset" depth // WoL
		}
	}
}