/// @description draw and drag the object
// only draw inside the room
if (card_stats != noone && x > -card_width/2 && x < room_width
 && y > -card_height/2 && y < room_height) {
	if (ability_used) sprite_index = struct_get(card_stats,"image_sm_back");
	else sprite_index = struct_get(card_stats,"image_sm_front");
	draw_self();
	if (selected) draw_sprite(spr_card_sm_selected,-1,x,y); // selected draw
}
// drag card
if (dragable) {
	depth = -player.hand_size-2;
	speed = 0;
	x = mouse_x;
	y = mouse_y;
}
// draw wound counters
var _tmp_x = x-card_width/2+4;
var _i = 0;
var _counters = 0;
while (_i+9 < damage_taken) {
	draw_sprite(
		spr_counter_sm_wound_3,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	_i += 10;
	_counters += 1;
}
while (_i+4 < damage_taken) {
	draw_sprite(
		spr_counter_sm_wound_2,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	_i += 5;
	_counters += 1;
}
while (_i < damage_taken) {
	draw_sprite(
		spr_counter_sm_wound_1,
		-1,
		_tmp_x+_counters*4,
		y-card_height/2-4
	);
	_i++;
	_counters += 1;
}