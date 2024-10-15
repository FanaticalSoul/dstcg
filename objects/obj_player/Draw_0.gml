/// @description Insert description here

//draw_set_color(c_black);
//draw_text(16,16,string(hand_offset));

for (i = 0; i < hand_size; i++) {
	if (hand[i][0]>0) {
		// tmp cordinate values
		var _card_size_x = sprite_width+hand_spacing;
		var _center_x = room_width/2-hand_size/2*_card_size_x+hand_spacing/2;
		var _tmp_x = _center_x+(hand_offset+i)*_card_size_x; // offset cards
		// check bounds
		if (_tmp_x > 0-sprite_width/2 && _tmp_x < room_width) {
			// only draw inside the room
			if (hand[i][1]) draw_sprite(sprites[hand[i][0]],-1,_tmp_x,y);
			else draw_sprite(spr_card_back,-1,_tmp_x,y);
		}
	}
}