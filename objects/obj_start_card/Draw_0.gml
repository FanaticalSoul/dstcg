/// @description draw object
// draw card back
if (!show_card) sprite_index = spr_start_card_sm_back;
// draw card if it has stats and a name
else if (card_stats != noone) {
	if (struct_get(card_stats[0],"name") != "") sprite_index = struct_get(card_stats[0],"image");
}
// only draw inside the room or if path ended
if ((x > -card_width/2 && x < room_width)||!path_position) {
	draw_self();
	if (selected) {
		if (player.action_pay_stamina) draw_sprite(spr_card_sm_selected_alt,-1,x,y);
		else draw_sprite(spr_card_sm_selected,-1,x,y);
	}
}