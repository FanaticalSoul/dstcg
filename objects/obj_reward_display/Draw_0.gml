/// @description Insert description here
// You can write your code in this editor

for (var i = 0; i < array_length(rewards[0]); i++) {
	draw_sprite(spr_start_card_sm_back, -1, x+i*reward_spacing, y);
}

// draw soul count
var _r = card_width*3/8;
draw_set_color(c_black);
draw_circle(x, y, _r, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x,y,int64(rewards[1]));
draw_circle(x, y, _r, true );
//
var _y = y+(card_height+card_spacing)*1;
for (var i = 0; i < array_length(loot[0]); i++) {
	var _sprite = card_get_stats(start_card_stats, loot[0][i])[0].image;
	draw_sprite(_sprite, -1, x+i*reward_spacing, _y);
}
draw_set_color(c_black);
draw_circle(x, _y, _r, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, _y, int64(loot[1]));
draw_circle(x, _y, _r, true );
/*
_y = y+(card_height+card_spacing)*2;
for (var i = 0; i < inventory_size; i++) {
	draw_sprite(spr_start_card_sm_back, -1, x+i*inventory_spacing, _y);
}
draw_set_color(c_black);
draw_circle(x, _y, _r, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, _y, int64(get_data_inventory()[1]));
draw_circle(x, _y, _r, true );
*/