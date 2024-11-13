/// @description set inital sprite width

// store intital width // TR
//starting_sprite_width = sprite_width;
// initalize count varibles
stamina_min = 0;
stamina_mid = 0;
stamina_max = 0;
health_min  = 0;
health_mid  = 0;
health_max  = 0;
// initalize scaling varibles
stamina_xscale_min = 1
stamina_xscale_mid = 1;
stamina_xscale_max = 1;
health_xscale_min  = 1;
health_xscale_mid  = 1;
health_xscale_max  = 1;
// set functions
function increment_count (value, index, check_health, count) {
	if (check_health) {
		if      (count == 1) health_min++;
		else if (count == 2) health_mid++;
		else if (count == 3) health_max++;
	}
	else {
		var _split_str;
		if (is_array(value)) _split_str = string_split(value[0], " ", true, 1);
		else if (is_string(value)) _split_str = string_split(value, " ", true, 1);
		else {
			_split_str = string_split(value.card_stats[0].name, " ", true, 1);
		}
		if (array_length(_split_str) > 1) {
			if (_split_str[1] == "stamina") {
				if      (count == 1) stamina_min++;
				else if (count == 2) stamina_mid++;
				else if (count == 3) stamina_max++;
			}
		}
	}
}

function increment_stamina_min (value, index) {
	increment_count (value, index, false, 1);
}
function increment_stamina_mid (value, index) {
	increment_count (value, index, false, 2);
}
function increment_stamina_max (value, index) {
	increment_count (value, index, false, 3);
}
function increment_health_min (value, index) {
	increment_count (value, index, true , 1);
}
function increment_health_mid (value, index) {
	increment_count (value, index, true , 2);
}
function increment_health_max (value, index) {
	increment_count (value, index, true , 3);
}

sout("created gauge");