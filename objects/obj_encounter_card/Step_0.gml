/// @description Insert description here

if (is_mouse_over_card() && card_stats != {}) {
	// hold [ mouse left ] // flip encounter
	if (mouse_check_button(mb_left)) {
		ani_act_flip = true;
	}
	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right)) {
		card_hq.sprite_index = card_stats.image_hq;
		card_hq.visible = true;
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
