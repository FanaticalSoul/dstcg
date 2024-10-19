/// @description draw hero
if (!card_visable) sprite_index = spr_start_card_back;
else if (card_stats != noone) {
	if (struct_get(card_stats[0],"name") != "") {
		sprite_index = struct_get(card_stats[0],"image");
		if (selected) sprite_index = spr_start_card_stamina_str;
	}
}
if (x > 0-sprite_width/2 && x < room_width) draw_self(); // only draw inside the room
else if (!path_position) draw_self();