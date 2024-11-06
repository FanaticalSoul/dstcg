function scr_start_card_unselect () {
	selected = false;
	for (var _i = 0; _i < array_length(player.selection); _i ++) {
		if (player.selection[_i] == id) {
			array_delete(player.selection,_i,1);
			break;
		}
	}
	return;
}

function scr_start_card_stamina_unselect () {
	selected = false;
	for (var _i = 0; _i < array_length(player.selection_stamina); _i ++) {
		if (player.selection_stamina[_i] == id) {
			array_delete(player.selection_stamina,_i,1);
			break;
		}
	}
	return;
}