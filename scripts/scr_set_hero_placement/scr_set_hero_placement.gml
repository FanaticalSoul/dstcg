function scr_set_hero_placement(){
	// pick positions on field
	var _field_rows = 2;
	var _field_size = 6;
	i = 0;
	for (iy = 0; iy < _field_rows; iy++) {
		for (ix = 0; ix < _field_size/_field_rows; ix++) {
			hero_field_cords[i][0] =  24+ix*(8+32); // 24
			hero_field_cords[i][1] = 208+iy*(8+48); // 208
			i++;
		}
	}
}