/// @description Insert description here



// placement cords

background_offset = [0,56];
card_spacing = 8;

// |  24, 88 |  64, 88 | 104, 88 |
// |  24,144 |  64,144 | 104,144 |

var _cord_x = sprite_width /2+card_spacing+background_offset[0];
var _cord_y = sprite_height/2+card_spacing+background_offset[1];


for (i = 0; i < 2; i++) {
	for (j = 0; j < 3; j++) {
		enemy_cords[i][j] = [
			_cord_x+j*(sprite_width +card_spacing),
			_cord_y+i*(sprite_height+card_spacing)
		];
		//show_debug_message("enemy_cords["+string(i)+"]["+string(j)+"] = "+string(enemy_cords[i][j]));
	}
}

i = 0;
j = 0;