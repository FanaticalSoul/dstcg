/// @description Insert description here
// You can write your code in this editor
for (i = 0; i < 6; i++) {
	var _tmp_x = obj_player.field_cords[i][0];
	var _tmp_y = obj_player.field_cords[i][1];
	if (
		x > _tmp_x - sprite_width /2 && 
		x < _tmp_x + sprite_width /2 &&
		y > _tmp_y - sprite_height/2 && 
		y < _tmp_y + sprite_height/2
	) {
		if (obj_player.field_card[i] == noone) {
			// remove prior instance of object from field
			for (j = 0; j < 6; j++) {
				if (obj_player.field_card[j] == id) {
					obj_player.field_card[j] = noone;
					break;
				}
			}
			des_x = _tmp_x;
			des_y = _tmp_y;
			obj_player.field_card[i] = id;
			// start game?
			scr_start_game ();
			break;
		}
	}
	/* // momentarily remove the ability to move the card back to the side
	else if (
		x > inital_x - sprite_width /2 && 
		x < inital_x + sprite_width /2 &&
		y > inital_y - sprite_height/2 && 
		y < inital_y + sprite_height/2
	) {
		// remove prior instance of object from field
		for (j = 0; j < 6; j++) {
			if (obj_player.field_card[j] == id) {
				obj_player.field_card[j] = noone;
				break;
			}
		}
		des_x = inital_x;
		des_y = inital_y;
		break;
	}
	*/
}
