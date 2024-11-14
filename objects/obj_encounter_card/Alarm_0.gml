/// @description trigger encounter

sout("test");
// save room state
save_game_test();
global.tmp_e_cards = ["test"];
global.room_index = 3;
room_goto(global.room_index);
// load encounter with random enemies based off stats