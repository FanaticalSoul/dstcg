/// @description draw object
if (!show_card) sprite_index = spr_start_card_sm_back;
else if (card_stats != noone) {
	if (struct_get(card_stats[0],"name") != "") {
		sprite_index = struct_get(card_stats[0],"image");
	}
}
if ((x > 0-sprite_width/2 && x < room_width)||!path_position) {
	// only draw inside the room or if path ended
	draw_self();
	if (selected) draw_sprite(spr_card_sm_selected,-1,x,y)
}
