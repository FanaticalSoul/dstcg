/// @description initalize external varibles and path speed
// initalize varibles
//card_to_hand = true;
//card_in_hand = false;
selected = false;
des_x = x;
des_y = y;
// set varibles
path_speed = card_speed;
card_hq = obj_visual_spoiler;
// show_card // hide card for draw animation

// remove from hand method
function remove_from_hand () {
	if (hand_position != -1) {
		// remove card from hand
		array_delete(player.hand,hand_position,1);
		player.hand_size --;
		// move all cards over in hand
		for (var i = hand_position; i < player.hand_size; i++) {
			player.hand[i].hand_position = player.hand[i].hand_position-1;
		}
		array_push(player.hand,noone); // add empty card back to hand
	}
}
