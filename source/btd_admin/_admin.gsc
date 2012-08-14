//================================================================================================
// File Name  : _admin.gsc 
// File Info  : Checks if player is admins and sets names ect, also calls rest of admin scripts
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : Abney Park
//================================================================================================

main()
{
	read_admin_info();
	thread playerConnect();
}

read_admin_info()
{	
	// gets the admins names
	level.admin1_name = getDvar("btd_admin1_name");
	level.admin2_name = getDvar("btd_admin2_name");
	level.admin3_name = getDvar("btd_admin3_name");
	level.admin4_name = getDvar("btd_admin4_name");
	level.admin5_name = getDvar("btd_admin5_name");
	level.admin6_name = getDvar("btd_admin6_name");
	level.admin7_name = getDvar("btd_admin7_name");
	level.admin8_name = getDvar("btd_admin8_name");
	level.admin9_name = getDvar("btd_admin9_name");

	//gets the admins guids
	level.admin1_guid = getDvar("btd_admin1_guid");
	level.admin2_guid = getDvar("btd_admin2_guid");
	level.admin3_guid = getDvar("btd_admin3_guid");
	level.admin4_guid = getDvar("btd_admin4_guid");
	level.admin5_guid = getDvar("btd_admin5_guid");
	level.admin6_guid = getDvar("btd_admin6_guid");
	level.admin7_guid = getDvar("btd_admin7_guid");
	level.admin8_guid = getDvar("btd_admin8_guid");
	level.admin9_guid = getDvar("btd_admin9_guid");
}

get_admin_name()
{
	my_guid = self getGuid();
	
	if(my_guid == level.admin1_guid)
	{
		return level.admin1_name;
	}
	else if(my_guid == level.admin2_guid)
	{
		return level.admin2_name;
	}
	else if(my_guid == level.admin3_guid)
	{
		return level.admin3_name;
	}
	else if(my_guid == level.admin4_guid)
	{
		return level.admin4_name;
	}
	else if(my_guid == level.admin5_guid)
	{
		return level.admin5_name;
	}
	else if(my_guid == level.admin6_guid)
	{
		return level.admin6_name;
	}
	else if(my_guid == level.admin7_guid)
	{
		return level.admin7_name;
	}
	else if(my_guid == level.admin8_guid)
	{
		return level.admin8_name;
	}
	else if(my_guid == level.admin9_guid)
	{
		return level.admin9_name;
	}
}

playerConnect()
{
	while(1)
	{
		level waittill("connecting", player);
		player thread onPlayerConnect();
	}
}

onPlayerConnect()
{	
	self check_is_admin();	
	self thread btd_admin\_admin_pickups::onPlayerConnected();
}

check_is_admin()
{	
	if(self getGuid() == level.admin1_guid || self getGuid() == level.admin2_guid || self getGuid() == level.admin3_guid || self getGuid() == level.admin4_guid || self getGuid() == level.admin5_guid || self getGuid() == level.admin6_guid || self getGuid() == level.admin7_guid || self getGuid() == level.admin8_guid || self getGuid() == level.admin9_guid)
	{
		self.isadmin = true;
	}
	else
	{
		self.isadmin = false;
	}
}