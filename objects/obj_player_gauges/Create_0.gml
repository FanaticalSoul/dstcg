/// @description set inital sprite width

// store intital width // TR
//starting_sprite_width = sprite_width;
// initalize count varibles
stamina_count = 0;
health_count = 0;
stamina_max = 0;
health_max = 0;
// initalize scaling varibles
stamina_xscale = 1;
stamina_xscale_max = 1;
health_xscale = 1;
health_xscale_max = 1;
// set functions
function increment_count (value, index, check_health = true, max_count = false) {
	if (check_health) {
		if (max_count) health_max ++;
		else health_count ++;
	}
	else {
		var _split_str;
		if (is_array(value)) _split_str = string_split(value[0], " ", true, 1);
		else _split_str = string_split(value, " ", true, 1);
		if (array_length(_split_str) > 1) {
			if (_split_str[1] == "stamina") {
				if (max_count) stamina_max ++;
				else stamina_count ++;
			}
		}
	}
}

function increment_stamina_count (value, index) {
	increment_count (value, index, false);
}
function increment_stamina_max (value, index) {
	increment_count (value, index, false, true);
}
function increment_health_count (value, index) {
	increment_count (value, index);
}
function increment_health_max (value, index) {
	increment_count (value, index, true, true);
}
