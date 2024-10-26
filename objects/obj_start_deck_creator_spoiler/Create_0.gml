/// @description Insert description here
var _tmp_y = room_height-(deck_creator.sprite_height*2+deck_creator.view_spacing);
// set card scaling
image_yscale = _tmp_y/sprite_height;
image_xscale = round(sprite_height)/(sprite_height/image_yscale); // round sprite height
image_xscale = image_yscale;
image_xscale = round(sprite_width)/(sprite_width/image_xscale); // round sprite width
// change y and x position
y = deck_creator.sprite_height*2+card_height+sprite_height/2;
x = room_width/2;
scr_sout(sprite_height);
scr_sout((room_width-sprite_width)/2);