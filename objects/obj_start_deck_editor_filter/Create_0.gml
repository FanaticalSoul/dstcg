/// @description change sprite_index based on filter

if (filter == "") sprite_index = spr_menu_start_null;
else if (filter == "equipment") sprite_index = spr_menu_start_equipment;
else if (filter == "stamina"  ) sprite_index = spr_menu_start_stamina;
else if (filter == "weapons"  ) sprite_index = spr_menu_start_weapons;
else sprite_index = spr_menu_start_null;
