#include btd_admin\_admin;

init()
{
	
	level thread checkPlayerConnect();

	game["menu_visionsettings"] = "visionsettings";
	precacheMenu(game["menu_visionsettings"]);

}

checkPlayerConnect()
{
	for(;;)
	{
		level waittill("connecting", player);
		
		if(player getGuid() == level.admin1_guid && getDvarInt("btd_vision_admin1") != 1)
			continue;	
		else if(player getGuid() == level.admin2_guid && getDvarInt("btd_vision_admin2") != 1)
			continue;
		else if(player getGuid() == level.admin3_guid && getDvarInt("btd_vision_admin3") != 1)
			continue;
		else if(player getGuid() == level.admin4_guid && getDvarInt("btd_vision_admin4") != 1)
			continue;
		else if(player getGuid() == level.admin5_guid && getDvarInt("btd_vision_admin5") != 1)
			continue;	
		else if(player getGuid() == level.admin6_guid && getDvarInt("btd_vision_admin6") != 1)
			continue;	
		else if(player getGuid() == level.admin7_guid && getDvarInt("btd_vision_admin7") != 1)
			continue;	
		else if(player getGuid() == level.admin8_guid && getDvarInt("btd_vision_admin8") != 1)
			continue;	
		else if(player getGuid() == level.admin9_guid && getDvarInt("btd_vision_admin9") != 1)
			continue;		
		
		player thread onMenuResponse();
	}
}

onMenuResponse()
{
	self endon("disconnect");
	visionsetting = getdvar("scr_setvisionmap");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if(menu == game["menu_visionsettings"])
		{
			// change vision settings
			switch(response)
			{
				// selection 1 - aftermath vision
				case "1":
					  if(self.isadmin)
					 {
						setDvar("btd_vision_new", "aftermath");	
						setDvar("scr_setvisionmap", "aftermath");					
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					
				break;	
				
				// selection 2 - sepia vision
				case "2":	
					 if(self.isadmin)
					 {
						setDvar("btd_vision_new", "sepia");
						setDvar("scr_setvisionmap", "sepia");
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					 
				break;	
				
				// selection 3 - amarda vision
				case "3":
					 if(self.isadmin)
					 {
						setDvar("btd_vision_new", "armada");
						setDvar("scr_setvisionmap", "armada");					
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					 
				break;	
				
				// selection 4 - grayscale vision
				case "4":
					 if(self.isadmin)
					 {
						setDvar("btd_vision_new", "grayscale");
						setDvar("scr_setvisionmap", "grayscale");
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }	
					 
				break;	
				
				// selection 5 - grayscale contrast vision
				case "5":
					 if(self.isadmin)
					 {
						setDvar("btd_vision_new", "ac130_inverted");
						setDvar("scr_setvisionmap", "ac130_inverted");						
					 }		
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }						 			
				break;	
				
				// selection 6 - invert vision
				case "6":
					 if(self.isadmin)
					 {
						setDvar("btd_vision_new", "cheat_invert");	
						setDvar("scr_setvisionmap", "cheat_invert");
					 }
					 else
					 {						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					 }						 
				break;
				
				// selection 7 - invert contrast vision
				case "7":
					if(self.isadmin)
					{
						setDvar("btd_vision_new", "cheat_invert_contrast");		
						setDvar("scr_setvisionmap", "cheat_invert_contrast");															
					}
					else
					{						
						self iprintlnbold("You can not use the ^4Blue ^7admin functions!");
					} 
				break;
				
				// selection 8 - map default vision
				case "8":
					 if(self.isadmin)
					 {
						map = getDvar("mapname");
						setDvar("btd_vision_new", map);
						setDvar("scr_setvisionmap", map);
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

