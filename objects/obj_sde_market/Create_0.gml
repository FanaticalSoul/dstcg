/// @description WoL

selection_offset = 0;
//visual_spoiler = .visual_spoiler;

card_selection = [
	["int/fth stamina", 2],
	["dex/int stamina", 2],
	["str/fth stamina", 2],
	["str/dex stamina", 2],
	["int+fth stamina", 5],
	["dex+int stamina", 5],
	["str+fth stamina", 5],
	["str+dex stamina", 5]
];



function is_x_soul_stamina (card_name, souls) {
	if (is_stamina(card_name)) {
		if (get_market_cost(card_name)==souls) return true;
	}
	return false;
}

function get_market_cost (card_name) {
	for (var i = 0; i < array_length(card_selection); i++) {
		if (card_selection[i][0] == card_name) return card_selection[i][1];
	}
	return -1;
}



//selected = "";