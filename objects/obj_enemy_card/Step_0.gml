/// @description Insert description here


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

