/// @description Insert description here

if (point_distance(x,y,des_x,des_y) > speed) {
	move_towards_point(des_x,des_y,speed);
}
else {
	x = des_x;
	y = des_y;
	speed = 0;
}
