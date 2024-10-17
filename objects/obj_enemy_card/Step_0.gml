/// @description Insert description here

if (placement != -1) {
	des_x = enemy_cords[placement][0];
	des_y = enemy_cords[placement][1];
}

if (point_distance(x,y,des_x,des_y) > speed) {
	move_towards_point(des_x,des_y,speed);
}
else {
	x = des_x;
	y = des_y;
	speed = 0;
}