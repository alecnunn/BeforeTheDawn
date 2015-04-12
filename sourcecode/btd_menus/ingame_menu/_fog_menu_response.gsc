#include btd_admin\_admin;

init()
{	
	// the next values set the default menu fog levels
	
	if(getDvar("btd_fog_menu1") == "") 
	{
		setDvar("btd_fog_menu1", "100 6000");		
	}
	level.menu_fog1 = getDvar("btd_fog_menu1");
	
	if(getDvar("btd_fog_menu2") == "") 
	{
		setDvar("btd_fog_menu2", "100 4000");		
	}
	level.menu_fog2 = getDvar("btd_fog_menu2");
	
	if(getDvar("btd_fog_menu3") == "") 
	{
		setDvar("btd_fog_menu3", "100 2000");		
	}
	level.menu_fog3 = getDvar("btd_fog_menu3");
	
	if(getDvar("btd_fog_menu4") == "") 
	{
		setDvar("btd_fog_menu4", "100 1000");		
	}
	level.menu_fog4 = getDvar("btd_fog_menu4");
	
	if(getDvar("btd_fog_menu5") == "") 
	{
		setDvar("btd_fog_menu5", "100 500");		
	}
	level.menu_fog5 = getDvar("btd_fog_menu5");
	
	if(getDvar("btd_fog_menu6") == "") 
	{
		setDvar("btd_fog_menu6", "100 250");		
	}
	level.menu_fog6 = getDvar("btd_fog_menu6");
	
	// end default menu fog levels
	
	level thread checkPlayerConnect();

	game["level.menu_fogsettings"] = "fogsettings";
	precacheMenu(game["level.menu_fogsettings"]);
}

checkPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);
		
		if(player getGuid() == level.admin1_guid && getDvarInt("btd_fog_admin1") != 1)
			continue;	
		else if(player getGuid() == level.admin2_guid && getDvarInt("btd_fog_admin2") != 1)
			continue;
		else if(player getGuid() == level.admin3_guid && getDvarInt("btd_fog_admin3") != 1)
			continue;
		else if(player getGuid() == level.admin4_guid && getDvarInt("btd_fog_admin4") != 1)
			continue;
		else if(player getGuid() == level.admin5_guid && getDvarInt("btd_fog_admin5") != 1)
			continue;	
		else if(player getGuid() == level.admin6_guid && getDvarInt("btd_fog_admin6") != 1)
			continue;	
		else if(player getGuid() == level.admin7_guid && getDvarInt("btd_fog_admin7") != 1)
			continue;
		else if(player getGuid() == level.admin8_guid && getDvarInt("btd_fog_admin8") != 1)
			continue;	
		else if(player getGuid() == level.admin9_guid && getDvarInt("btd_fog_admin9") != 1)
			continue;			
		
		player thread onMenuResponse();
	}
}

onMenuResponse()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if(menu == game["level.menu_fogsettings"])
		{
			// change vision settings
			switch(response)
			{
				// selection 1 - fog level 1
				case "1":
					 if(self.isadmin)
					 {
						setDvar("btd_fog", level.menu_fog1);
					 }	
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					
				break;	
				
				// selection 2 - fog level 2
				case "2":	
					 if(self.isadmin)
					 {
						setDvar("btd_fog", level.menu_fog2);
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					 
				break;	
				
				// selection 3 - fog level 3
				case "3":
					 if(self.isadmin)
					 {
						setDvar("btd_fog", level.menu_fog3);
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					 
				break;	
				
				// selection 4 - fog level 4
				case "4":
					 if(self.isadmin)
					 {
						setDvar("btd_fog", level.menu_fog4);
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					 
				break;	
				
				// selection 5 - fog level 5
				case "5":
					 if(self.isadmin)
					 {
						setDvar("btd_fog", level.menu_fog5);
					 }		
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }						 			
				break;	
				
				// selection 6 - fog level 6
				case "6":
					 if(self.isadmin)
					 {
						setDvar("btd_fog", level.menu_fog6);
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

