/// @description Insert description here

show_debug_message("created");

// placement cords
player = obj_player;
enemy_field_offset = [0,56];
card_spacing = player.hand_spacing;

speed = 10;

// |  24, 88 |  64, 88 | 104, 88 |
// |  24,144 |  64,144 | 104,144 |

// set enemy placement positions
var _cord_x = sprite_width /2+card_spacing+enemy_field_offset[0];
var _cord_y = sprite_height/2+card_spacing+enemy_field_offset[1];
i = 0;
for (iy = 0; iy < 2; iy++) {
	for (ix = 0; ix < 3; ix++) {
		enemy_cords[i] = [
			_cord_x+ix*(sprite_width +card_spacing),
			_cord_y+iy*(sprite_height+card_spacing)
		];
		//show_debug_message("enemy_cords["+string(i)+"] = "+string(enemy_cords[i]));
		i++;
	}
}
i = 0;

// set destination
des_x = x;
des_y = y;