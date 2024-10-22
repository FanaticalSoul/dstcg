function scr_sout_last_key () {
	if (keyboard_lastkey != vk_nokey) {
		show_debug_message(string(keyboard_lastkey));
	    keyboard_lastkey = vk_nokey;
	}
}

function scr_mouse_over_card () {
	if (mouse_x >= x-sprite_width /2 && mouse_x <= x+sprite_width /2 &&
	mouse_y >= y-sprite_height/2 && mouse_y <= y+sprite_height/2) return true;
	else return false;
}

function scr_start_card_unselect () {
	selected = false;
	for (var _i = 0; _i < array_length(obj_player.selection); _i ++) {
		if (obj_player.selection[_i] == id) {
			array_delete(obj_player.selection,_i,1);
			break;
		}
	}
	return;
}