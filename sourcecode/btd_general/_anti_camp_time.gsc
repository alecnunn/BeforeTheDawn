//================================================================================================
// File Name  : _anti_camp.gsc 
// File Info  : Mods anti camping system
//              Punishes a player if they are camping 
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : Abney Park
//================================================================================================

#include maps\mp\gametypes\_hud_util;

main()
{	
	check();
}

//================================================================================================
// What is the anti camp system to be used
//================================================================================================
check()
{	
	choice = getDvarInt("btd_anticamp");
		
	if(choice == 2 || choice == 3) // time
	{
		self thread campcheck();
	}
	else
	{
		return;
	}
}

//================================================================================================
// Time System
//================================================================================================
campcheck()
{
	self endon("death");
	self endon("disconnect");
	
	self.campingtime = 0;
	show_warning = false;	
	self.iscamper = false;
	
	maxcamptime = getDvarInt("btd_camp_max_time");
	warntime = getDvarInt("btd_camp_warn_time");		
	punishment = getDvarInt("btd_camp_punishment");

	// continus loop
	while(1)
	{
		wait 0.01;

		// campsystem only counts while zombies have spawned
		if(level.status == "play")
		{
			// spec dont count
			if(self.sessionstate != "playing")
			{
				wait 1;
				continue;
			}	

			startpos = self.origin;
			wait 1;
			endpos = self.origin;	

			// camp distance
			if(distance(startpos, endpos) < 50) 
			{
				self.campingtime++;
				self.iscamper = true;
			}
			else
			{
				self.campingtime = 0; 
				self.iscamper = false;
				show_warning = false;
			}		

			// do we show warning messages to campers
			if(self.campingtime >= warntime && warntime != 0) 
			{
				show_warning = true;
			}

			// show warning message if time is right
			if(show_warning)
			{
				self iprintlnbold("You are camping please move");
			}

			// camper ingnored warning punish them
			if(self.campingtime >= maxcamptime)
			{
				switch(punishment)
				{
					case 1:
					// move to spec
					movetospec();
					break;
					
					case 2: // drop health
					drophealth();
					break;
					
					case 3: // kill player
					killplayer();
					break;
				}			
			}
		}
	}
}

//================================================================================================
// Camper Punishments 
//================================================================================================

movetospec()
{
	if(self.pers["team"] != "spectator" && self.sessionstate == "playing" && self.iscamper == true)
	{
		self.sessionstate = "spectator";
		self iprintln("You have been moved to spec as you were camping camping!");
		
		self.campingtime = 0; 
		self.iscamper = false;
		show_warning = false;
	}
}

drophealth()
{
	health = getDvarInt("btd_camp_drophealth");
	if(!isDefined(health))
	{
		health = 5;
	}
	
	if(self.iscamper == true)
	{
		self.health = self.health - getDvarInt("btd_camp_drophealth");
		self iprintln("You are losing health as you are camping!");		
	
		if(self.health < 1)
		{
			killplayer();
		}	
	}
}

killplayer()
{	
	self iprintlnBold("You were killed as you ingnored the warning!");	
	self suicide();
	
	self.campingtime = 0; 
	self.iscamper = false;
	show_warning = false;
}