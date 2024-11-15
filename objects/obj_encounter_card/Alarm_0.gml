/// @description trigger encounter

sout("test alarm");
// save room state
save_game_map();
// get random cards from decks // WoL











global.tmp_e_cards = ["test"];
global.room_index = 3;
room_goto(global.room_index);
// load encounter with random enemies based off stats