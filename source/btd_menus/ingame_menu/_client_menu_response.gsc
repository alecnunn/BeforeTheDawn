#include btd_general\_dvardef;

init()
{	
	level.showcrosshair = true;
	level thread checkPlayerConnect();
	
	level.fx_light = loadFx("other/spotlight_small");

	game["menu_client"] = "client";
	precacheMenu(game["menu_client"]);
	
	createdvar("btd_client_third",1,0,1,"int");
	createdvar("btd_client_lasers",2,0,2,"int");
	createdvar("btd_client_light",0,0,1,"int");
	createdvar("btd_client_chrosshair",1,0,1,"int");
	createdvar("btd_client_fov",1,0,1,"int");	
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
	
	// 3rd person
	self setClientDvar("cg_thirdperson", 0);
	self.thirdperson = false;
	
	// laser
	self setClientDvar("cg_laserforceon", 0);
	self.laseron = false;	
	
	// croshair
	self setClientDvar("cg_drawcrosshair", 0);
	self.crosshairon = false;

	// flashlight
	self.flashlighton = false;
	
	// field of view
	self setClientDvar("cg_fov", "65");
	self.maxfov = false;
	
	for(;;)
	{
		self waittill("menuresponse", menu, response);
		
		if(menu == game["menu_client"])
		{			
			switch(response)
			{			
				// 1st or 3rd person	
				case "1":
					if(getDvarInt("btd_client_third") == 1)
					{
						if(!self.thirdperson)
						{
							self setClientDvar("cg_thirdperson",1);
							self.thirdperson = true; 
						}
						else
						{
							self setClientDvar("cg_thirdperson",0);
							self.thirdperson = false;
						}
					}
					else
					{
						self iPrintlnBold("This Feature Has Been Disabled");
					}
				break;	
				
				// laser on or off
				case "2":
					if(getDvarInt("btd_client_lasers") > 0)
					{
						if(!self.laseron)
						{
							//self setClientDvar("cg_laserforceon",1);
							self.laseron = true;
						}
						else
						{
							//self setClientDvar("cg_laserforceon",0);
							self.laseron = false;
						}
					}
					else
					{
						self iPrintlnBold("This Feature Has Been Disabled");
					}
				break;	
				
				// flashlight on or off
				case "3":
					if(getDvarInt("btd_client_light") == 1)
					{
						if(!self.flashlighton)
						{
							self.flashlighton = true;
						}
						else
						{
							self.flashlighton = false;
						}
					}
					else
					{
						self iPrintlnBold("This Feature Has Been Disabled");
					}
				break;	
				
				// chrosshair on or off
				case "4":
					if(getDvarInt("btd_client_chrosshair") == 1)
					{
						if(!self.crosshairon)
						{
							self setClientDvar("cg_drawcrosshair",1);
							self.crosshairon =  true;
						}
						else
						{
							self setClientDvar("cg_drawcrosshair",0);
							self.crosshairon =  false;
						}
					}
					else
					{
						self iPrintlnBold("This Feature Has Been Disabled");
					}
				break;	
				
				// change field of view
				case "5":
					if(getDvarInt("btd_client_fov") == 1)
					{
						if(!self.maxfov)
						{
							self setClientDvar( "cg_fov", "80" );
							self.maxfov = true;
						}
						else
						{
							self setClientDvar( "cg_fov", "65" );
							self.maxfov = false;
						}
					}
					else
					{
						self iPrintlnBold("This Feature Has Been Disabled");
					}
				break;	
				
				// client side music
				case "6":
					self iprintlnBold("Client Side Music Comming Soon!");
				break;	
			}
		}
	}
}

