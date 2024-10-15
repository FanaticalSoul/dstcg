/// @description Insert description here
// You can write your code in this editor

for (i = 0; i < hand_size; i++) {
	if (hand[i][0]>0) {
		// existing card
		draw_sprite(sprites[hand[i][0]],-1,x+i*sprite_width,y); // show cards outside deck
	}
}