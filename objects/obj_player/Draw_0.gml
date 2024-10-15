/// @description Insert description here
// You can write your code in this editor

/*
draw_set_color(c_black);

draw_text(16,16,string(mouse_x)+" "+string(mouse_y));

draw_set_color(c_white);

draw_text(16,16,string(hand_offset));
*/

//draw_text(16,16,string(mouse_x));



//var _center_x = room_width / 2 - hand_size / 2 * ( sprite_width + hand_spacing );
var _center_x = room_width / 2 - hand_size / 2 * ( sprite_width + hand_spacing ) + hand_spacing / 2;




for (i = 0; i < hand_size; i++) {
	if (hand[i][0]>0) {
		// existing card
		//draw_sprite(sprites[hand[i][0]],-1,_center_x+i*(sprite_width+hand_spacing),y); // show cards outside deck
		
		
		
		
		var _hand_x = _center_x;
		var _hand_y = y;
		//_above_hand_x += deck_reveal_offset*(sprite_width+deck_reveal_spacing); // offset cards
		_hand_x += hand_offset*(sprite_width+hand_spacing); // offset cards


		// tmp cordinate values
		var _tmp_x = _hand_x;
		_tmp_x += i*(sprite_width+hand_spacing);
		//if (i+1<hand_size) {_tmp_x += i*(sprite_width+hand_spacing);}
		//else {_tmp_x += i*sprite_width;}
		
		var _tmp_y = _hand_y;
		// check bounds
		//if (_tmp_x > 0-sprite_width && _tmp_x <= room_width-sprite_width) {
		if (_tmp_x > 0-sprite_width/2 && _tmp_x < room_width) {
			
			
			//if (_tmp_x<=0-sprite_width) {
			//	show_message(_tmp_x);
			//}
			
			// only draw inside the room
			if (hand[i][1]) {
				draw_sprite(sprites[hand[i][0]],-1,_tmp_x,_tmp_y);
			}
			else {
				draw_sprite(spr_card_back,-1,_tmp_x,_tmp_y);
			}
		}
	}
}






