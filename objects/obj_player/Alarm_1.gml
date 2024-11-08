/// @description create associated character

var _x = character_cords[0];
var _y = character_cords[1];

//sout(character_load);

character = instance_create_depth(_x, _y, depth, obj_character_card, {
	character : character_load,
	player : id,
	inital_x : _x,
	inital_y : _y
});