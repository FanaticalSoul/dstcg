/// @description Insert description here
// set deck varibles
deck_size = 0; // cards in deck
deck_offset = 0;
// set selection varibles
for (var _i = 0; _i < selection_size; _i++) {
	selection[_i] = "";
}
selection_offset = 0;
selection_size = 0;
// set selection // TF // WoL
var _i = 0;
selection[_i++] = "remant of humanity";
selection[_i++] = "remant of humanity";
selection[_i++] = "remant of humanity";
selection[_i++] = "remant of humanity";
selection[_i++] = "remant of humanity";
selection[_i++] = "remant of humanity";
selection[_i++] = "remant of humanity";
selection[_i++] = "str stamina";
selection[_i++] = "int stamina";
selection[_i++] = "fth stamina";
selection_size = _i;


selected = false;
card_stats = scr_start_card_stats_set();
selection_size = 9; // humanity, stamina, 4 equipments

for (var _i = 0; _i < max_deck; _i++) {
	deck[_i] = "";
}
//y_view = 700;


