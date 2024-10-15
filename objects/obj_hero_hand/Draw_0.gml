/// @description Insert description here
// You can write your code in this editor
var _center_x = room_width / 2 - hand_size / 2 * ( sprite_width + hand_spacing );


for (i = 0; i < hand_size; i++) {
	if (hand[i][0]>0) {
		// existing card
		draw_sprite(sprites[hand[i][0]],-1,_center_x+i*(sprite_width+hand_spacing),y); // show cards outside deck
	}
}