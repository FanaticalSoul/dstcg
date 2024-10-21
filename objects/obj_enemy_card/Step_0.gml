/// @description Insert description here

// mouse over card
if (scr_mouse_over_card()) {
	// hold [ mouse right ] // visual spoiler
	if (mouse_check_button(mb_right)) visual_spoiler = true;
	else visual_spoiler = false;
}

// flip animation // needs revisions
if (flip_active) {
    // Decrease scale_x to 0, then switch sprites and increase it back to 1
    if (!flip_finished) {
        flip_scale_x -= flip_speed;   // Shrinking the card
        if (flip_scale_x <= 0) {
            flip_finished = true;      // Mark as flipped
            flip_scale_x = 0;         // Prevent negative scale
        }
    } else {
        flip_scale_x += flip_speed;   // Expanding the card
        if (flip_scale_x >= 1) {
            flip_scale_x = 1;         // Full-size again
            flip_active = false;    // Flip finished
        }
    }
}
else if (enemy_on_field && !flip_finished) {
	if (!point_distance(x,y,des_x,des_y) && !flip_active) {
		flip_active = true
	}
}

// alarm on card draw
if (enemy_to_field && alarm[0] == -1) alarm[0] = 1;

if (enemy_on_field) {
	if (placement != -1) {
		des_x = enemy_cords[placement][0];
		des_y = enemy_cords[placement][1];
		// end path early if placement location is above or bellow path
		if (x <= des_x) path_end();
	}
	

	// check if another card is in that exact position
	//instance_place_list(des_x,des_y,obj_enemy_card,ds_list_create(),false)
	
	
	
	
	
	if (point_distance(x,y,des_x,des_y) > path_speed) {
		move_towards_point(des_x,des_y,path_speed);
	}
	else {
		speed = 0;
		x = des_x;
		y = des_y;
		depth = 0; // "reset" depth
	}
}

