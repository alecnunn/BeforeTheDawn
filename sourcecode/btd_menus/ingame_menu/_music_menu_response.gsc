#include btd_general\_dvardef;

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
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if(menu == game["menu_music"])
		{			
			switch(response)
			{		
				// Mo Music	
				case "1":
					self.playtracknew = "blank";
					self.stopmusic = true;
					self.changetrack = true;
				break;	
				
				// Track 1
				case "2":
					self.playtracknew = 0;
					self.stopmusic = false;
					self.changetrack = true;
				break;	
				
				// Track 2
				case "3":
					self.playtracknew = 1;
					self.stopmusic = false;
					self.changetrack = true;
				break;
				
				// Track 3
				case "4":
					self.playtracknew = 2;
					self.stopmusic = false;
					self.changetrack = true;
				break;
				
				// Track 4
				case "5":
					self.playtracknew = 3;
					self.stopmusic = false;
					self.changetrack = true;
				break;
				
				// Track 5
				case "6":
					self.playtracknew = 4;
					self.stopmusic = false;
					self.changetrack = true;
				break;	
			}
		}
	}
}

