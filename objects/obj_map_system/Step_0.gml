/// @description Insert description here

for (var i = 0; i < board_m_size; i++) {
	var _m_card = global.board_m_card[i];
	if (instance_exists(_m_card)) {
		with (_m_card) {
			// enter the room
			if (!cleared && active && alarm[0] == -1) alarm[0] = 1;
		}
	}
}
// if an encounter is not active, check if the bonfire is active
var _bonfire = get_data_file(file_map)[1].bonfire;
// move to bonfire room
if (_bonfire) room_goto_bonfire();