/// @description draw hero

//show_debug_message("str "+string(card_stats));


if (!card_visable) sprite_index = spr_card_back;
//else if (card_number>0) {
//else if (card_number != "") {
else if (card_stats != noone) {
	if (struct_get(card_stats[0],"name") != "") {
		//sprite_index = sprites[card_number];
		sprite_index = struct_get(card_stats[0],"image");
		if (selected) sprite_index = spr_start_card_stamina_str;
	}
}

if (x > 0-sprite_width/2 && x < room_width) draw_self(); // only draw inside the room
else if (!path_position) draw_self();