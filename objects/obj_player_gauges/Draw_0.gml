/// @description draw health and stamina bars

if (instance_exists(player)) {
	if (
		instance_exists(player.discard) &&
		instance_exists(player.deck) &&
		is_array(player.hand)
	) {
		var _info_bars = [health_xscale_max,stamina_xscale_max,health_xscale,stamina_xscale];
		for (var i = 0; i < array_length(_info_bars); i++) {
			draw_sprite_stretched_ext(
				!(i%2) ? spr_health_bar : spr_stamina_bar, -1, x, 
				!(i%2) ? y : y+sprite_height,
				sprite_width*_info_bars[i], sprite_height,
				i < int64(array_length(_info_bars)/2) ? c_gray : c_white, 1
			);
		}
	}
}