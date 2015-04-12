//================================================================================================
// File Name  : _night.gsc 
// File Info  : Spawns a big black sphere in the sky to make maps darker / night like
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R / Abney Park
//================================================================================================

main()
{
	precache();
	thread night();
	thread fog();
}

precache()
{
	precacheModel("night_sphere");
}

//================================================================================================
// Main Night Thread
//================================================================================================
night()
{
	wait 0.05;
	night_sphere = spawn("script_model",level.mapCenter);
	night_sphere setModel("night_sphere");
	
	if(getDvar("btd_fog_night") == "") 
	{
		setDvar("btd_fog_night", "100 1000");		
	}
	nightfog = getDvar("btd_fog_night");
	
	if(getDvar("btd_fog_day") == "") 
	{
		setDvar("btd_fog_day", "100 6000");
	}	
	dayfog = getDvar("btd_fog_day");
	
	if(getDvar("btd_night") == "") 
	{
		setDvar("btd_night", 1)	;	
	}
	level.nighton = getDvarInt("btd_night");
		
	night_sphere show();
	level.isnight = true;	
	
	while(1)
	{			
		level.nighton = getDvarInt("btd_night");
		
		if(level.nighton == 1  && !level.isnight)
		{
			if(getDvarInt("btd_fog_nightchange") == 1) 
			{								
				setDvar("btd_fog", nightfog);
			}
			
			night_sphere show();
			level.isnight = true;		 
		}
		else if(level.nighton == 0 && level.isnight)
		{
			if(getDvarInt("btd_fog_nightchange") == 1) 
			{
				setDvar("btd_fog", dayfog);
			}
			
			night_sphere hide();	
			level.isnight = false;
		}	
		
		wait 0.5;
	}
} 

fog()
{
	wait 0.05;
	
	if(getDvar("btd_fog") == "" && getDvarInt("btd_fog_nightchange") != 1) 
	{
		setDvar("btd_fog", "100 3000");
	}
	
	level.startfog = getDvar("btd_fog");	
	fog = getDvar("btd_fog");
	fog = StrTok(fog, " ");
	setExpFog(int(fog[0]),int(fog[1]),0,0,0,0);		
    oldfog = fog;	
	
	while(1)
	{			
		fog = getDvar("btd_fog");
		fog = StrTok(fog, " ");
				
		if(fog != oldfog)
		{
			setExpFog(int(fog[0]),int(fog[1]),0,0,0,0);	
		}

		wait 0.5;
	}
} 
