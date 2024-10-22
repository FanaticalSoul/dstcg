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