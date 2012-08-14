#include btd_admin\_admin;

init()
{
	level thread checkPlayerConnect();
	game["menu_quickmessageold"] = "quickmessage";
	precacheMenu(game["menu_quickmessageold"]);
	game["menu_admin"] = "admin";
	precacheMenu(game["menu_admin"]);
	game["menu_music"] = "music";
	precacheMenu(game["menu_music"]);
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
		
		if(menu == game["menu_quickmessageold"])
		{
			switch(response)
			{
			 	case "2":					 
					if(level.music_radio != 0)
					{
						self openmenu (game["menu_music"]);					 			
					}		
					else
					{						
						self iprintlnbold("You can not open the ^2Music^7 menu!");
					}					
				break;
			
				// admin menu
				case "4":					 
					if(self.isadmin)
					{
						self openmenu (game["menu_admin"]);					 			
					}		
					else
					{						
						self iprintlnbold("You can not open the ^4Admin^7 menu!");
					}					
				break;				
	
			}
		}
	}
}

