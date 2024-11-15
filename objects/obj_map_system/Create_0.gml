/// @description Insert description here

global.board_m_cords = [
	[3, 72,33],
	[2,136,33],
	[2, 64,89],
	[1,104,89],
	[1,144,89]
];

if (array_length(i_board_m_cards)==0) {
	for (var i = 0; i < board_m_size; i++) {
		global.board_m_card[i] = noone;
	}
}
// set random seed // use for replicating issues
if (random_get_seed() == 0) {
	if (i_random_seed == 0) randomize(); 
	else random_set_seed(i_random_seed);
}

sout("created map system");
sout("random seed: "+string(random_get_seed()));