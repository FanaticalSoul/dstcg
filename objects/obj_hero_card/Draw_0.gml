/// @description Insert description here

if (!card_visable) sprite_index = spr_card_back;
else if (card_number>0) sprite_index = sprites[card_number];

if (x > 0-sprite_width/2 && x < room_width) draw_self(); // only draw inside the room
else if (!path_position) draw_self();