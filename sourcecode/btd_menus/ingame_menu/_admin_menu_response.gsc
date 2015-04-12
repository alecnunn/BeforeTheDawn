#include btd_admin\_admin;

init()
{	
	level thread checkPlayerConnect();
}

checkPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);		
		player thread onMenuResponse();
	}
}

onMenuResponse()
{
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if(menu == game["menu_admin"])
		{			
			switch(response)
			{
				// night on/off
				case "1":
					if(self.isadmin)
					 {
					 	// checks that the admins pickups are enabled
						if(self getGuid() == level.admin1_guid && getDvarInt("btd_night_admin1") != 1)
							continue;	
						else if(self getGuid() == level.admin2_guid && getDvarInt("btd_night_admin2") != 1)
							continue;
						else if(self getGuid() == level.admin3_guid && getDvarInt("btd_night_admin3") != 1)
							continue;
						else if(self getGuid() == level.admin4_guid && getDvarInt("btd_night_admin4") != 1)
							continue;
						else if(self getGuid() == level.admin5_guid && getDvarInt("btd_night_admin5") != 1)
							continue;
						else if(self getGuid() == level.admin6_guid && getDvarInt("btd_night_admin6") != 1)
							continue;
						else if(self getGuid() == level.admin7_guid && getDvarInt("btd_night_admin7") != 1)
							continue;
						else if(self getGuid() == level.admin8_guid && getDvarInt("btd_night_admin8") != 1)
							continue;
						else if(self getGuid() == level.admin9_guid && getDvarInt("btd_night_admin9") != 1)
							continue;
							
						if(getDvar("btd_night") == "1")
						{
							setDvar("btd_night", 0);
						}		
						else if(getDvar("btd_night") == "0")
						{
							setDvar("btd_night", 1);
						}						
			
					}		
					else
					{						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					}		
				break;			
			}
		}
	}
}