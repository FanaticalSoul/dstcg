/// @description handle keybinds
// on [ mouse scroll ] // hand view navigation
if (mouse_y <= y+card_height/2  && mouse_y >= y-card_height/2 &&
mouse_x >= x && mouse_x <= sprite_width && selection_size > cards_visable) {
	var _hidden_cards = selection_size-cards_visable;
	if (mouse_wheel_up()   && selection_offset+2 <  _hidden_cards/2) selection_offset += 0.5; // increment hand view
	if (mouse_wheel_down() && selection_offset+2 > -_hidden_cards/2) selection_offset -= 0.5; // decrement hand view
}


/*
else
{
    instance_create_layer(x, y, "Effects", obj_Explosion);
    instance_destroy();
}
*/