/// @description scale health bar width

// update stamina count
health_count  = 0;
stamina_count = 0;
var _card_zones = [
	[deck.deck,deck.deck_size],
	[deck.player.hand,deck.player.hand_size]
];
for (var i = 0; i < array_length(_card_zones); i++) {
	array_foreach(_card_zones[i][0],increment_health_count ,0,_card_zones[i][1]);
	array_foreach(_card_zones[i][0],increment_stamina_count,0,_card_zones[i][1]);
}
// get max stamina
health_max  = 0;
stamina_max = 0;
array_push(_card_zones,[deck.discard.discard,deck.discard.discard_size]);
for (var i = 0; i < array_length(_card_zones); i++) {
	array_foreach(_card_zones[i][0],increment_health_max ,0,_card_zones[i][1]);
	array_foreach(_card_zones[i][0],increment_stamina_max,0,_card_zones[i][1]);
}
// scale images
//health_xscale = health_count / max_deck * ending_sprite_width/starting_sprite_width;
health_xscale = health_count / max_deck * ending_sprite_width/sprite_width;
health_xscale_max = health_max / max_deck * ending_sprite_width/sprite_width;
stamina_xscale = stamina_count / max_deck * ending_sprite_width/sprite_width;
stamina_xscale_max = stamina_max / max_deck * ending_sprite_width/sprite_width;