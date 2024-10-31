/// @description scale health bar width
image_xscale = (deck.deck_size+deck.player.hand_size) / max_deck * ending_sprite_width/starting_sprite_width;
// update stamina count
stamina_count = 0;
array_foreach(deck.deck,function (value, index) {
	var _split_str = string_split(value[0], " ", true, 1);
	if (array_length(_split_str) > 1) {
		if (_split_str[1] == "stamina") stamina_count ++;
	}
},0,deck.deck_size);
array_foreach(deck.player.hand,function (value, index) {
	var _split_str = string_split(value, " ", true, 1);
	if (array_length(_split_str) > 1) {
		if (_split_str[1] == "stamina") stamina_count ++;
	}
},0,deck.player.hand_size);
stamina_xscale = stamina_count / max_deck * ending_sprite_width/starting_sprite_width;