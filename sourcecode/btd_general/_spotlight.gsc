//================================================================================================
// File Name  : _sotlight.gsc 
// File Info  : Spawns a big black sphere in the sky to make maps darker / night like
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R / Abney Park
//================================================================================================

main()
{
	precache();	
}

precache()
{
	level.fx_spotlight = loadFx("misc/flashlight");
}

//================================================================================================
// Player Spot Light Thread
//================================================================================================
light()
{
	self endon("disconnect");
	self endon("joined_spectators");
	self endon("death");
	
	self.lightfx = "off";
		
	while(1)
	{		
		if(self.flashlighton == true && self.lightfx == "off")
		{		
			self thread playFX();			
			self.lightfx = "on";
		}
		
		else if(self.flashlighton == false && self.lightfx == "on")		
		{	
			self notify("light_fx_stop");
			self.lightfx = "off";		
		}
		
		wait 1;
	}
} 

playFX()
{
	self endon("light_fx_stop");
	while(1)
	{
		self.fx = playfxontag(level.fx_spotlight, self, "tag_inhand");
		
		wait 1.0250;
	}
}

 