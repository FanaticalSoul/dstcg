function scr_hero_field_set(){
	// pick positions on field
	var _field_rows = 2;
	var _field_size = 6;
	i = 0;
	for (iy = 0; iy < _field_rows; iy++) {
		for (ix = 0; ix < _field_size/_field_rows; ix++) {
			field_cords[i][0] =  24+ix*(8+32); // 24
			field_cords[i][1] = 208+iy*(8+48); // 208
			field_card [i] = noone;
			i++;
		}
	}
	i = 0;
	iy = 0;
	ix = 0;
	return;
}