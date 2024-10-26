/// @description Insert description here
// set deck varibles
//visual_spoiler = instance_create_depth(x-208/2,y+sprite_width/2,depth-1,obj_visual_spoiler);
//image_xscale = 2;
deck_size = 0; // cards in deck
deck_offset = 0;
view_spacing = card_height; // space between views
// set selection varibles
var selection_max = 9;
for (var _i = 0; _i < selection_max; _i++) {
	selection[_i] = "";
}
selection_offset = 0;
selection_size = 0;
// set selection // TF // WoL
var _i = 0;
selection[_i++] = "remant of humanity";
selection[_i++] = "talisman";
selection[_i++] = "kite shield";
selection[_i++] = "spear";
selection[_i++] = "herald armour";
selection[_i++] = "dex stamina";
selection[_i++] = "str stamina";
selection[_i++] = "int stamina";
selection[_i++] = "fth stamina";
selection_size = _i;


selected = false;
card_stats = scr_start_card_stats_set();
selection_size = 9; // humanity, stamina, 4 equipments

for (_i = 0; _i < max_deck; _i++) {
	deck[_i] = "";
}
//y_view = 700;
selection_filter = "";
// have deck act as a psuedo-hand
