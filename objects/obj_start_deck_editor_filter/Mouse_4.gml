/// @description Insert description here

var _filter = filter;
with (deck_editor) {
	if (selection_filter == _filter) selection_filter = "";
	else selection_filter = _filter;
	selection_offset = 0;
}