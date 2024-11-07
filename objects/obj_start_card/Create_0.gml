/// @description initalize external varibles and path speed

// initalize varibles
selected = false;
des_x = x;
des_y = y;
// set varibles
path_speed = card_speed;
card_hq = obj_visual_spoiler;
// show_card // hide card for draw animation

/// @function					remove_from_hand(player_id, [card_id]);
/// @param {id} player_id		id of player
/// @param {id} card_id			id of the card
/// @description				remove card from player's hand

function remove_from_hand (player_id, card_id = id) {
	with (player_id) {
		var _card_pos = card_id.hand_position;
		// if card is positioned in player hand
		if (_card_pos != -1) {
			// remove card from hand
			array_delete(hand,_card_pos,1);
			hand_size --;
			// move all cards over in hand
			for (var i = _card_pos; i < hand_size; i++) {
				hand[i].hand_position = hand[i].hand_position-1;
			}
			// add empty card back to hand
			array_push(hand,noone);
			// fix offset
			hand_offset = 0;
		}
	}
}