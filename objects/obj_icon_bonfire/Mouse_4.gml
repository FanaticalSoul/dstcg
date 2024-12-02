/// @description Insert description here

sout("bonfire_icon pressed");
// go to bonfire ( only allow if it's lower then level 5
if (file_exists(file_deck)) {
	if (int64(get_data_file(file_deck)[2])+1 > 5) instance_destroy();
	else bonfire_rest();
}