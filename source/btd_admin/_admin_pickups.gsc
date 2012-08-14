//================================================================================================
// File Name  : _admin_pickups.gsc 
// File Info  : Allows set admins to pickup / move / drop players and zombies
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R / Abney Park
//================================================================================================

#include btd_general\_dvardef;
#include btd_admin\_admin;

pickup_main()
{
	createdvar("btd_pickup_admin1",1,0,1,"int");
	createdvar("btd_pickup_admin2",1,0,1,"int");
	createdvar("btd_pickup_admin3",1,0,1,"int");
	createdvar("btd_pickup_admin4",1,0,1,"int");
	createdvar("btd_pickup_admin5",1,0,1,"int");
}

onPlayerConnected()
{
	self thread pickups();
}

pickups()
{		
	// if the player is not an admin then the script dies
	if(!self.isadmin)
		return;

	while(1)
	{
		wait 0.05;
		if(!isPlayer(self))
			break;

		// checks that the admins pickups are enabled
		if(self getGuid() == level.admin1_guid && getDvarInt("btd_pickup_admin1") != 1)
			continue;	
		else if(self getGuid() == level.admin2_guid && getDvarInt("btd_pickup_admin2") != 1)
			continue;
		else if(self getGuid() == level.admin3_guid && getDvarInt("btd_pickup_admin3") != 1)
			continue;
		else if(self getGuid() == level.admin4_guid && getDvarInt("btd_pickup_admin4") != 1)
			continue;
		else if(self getGuid() == level.admin5_guid && getDvarInt("btd_pickup_admin5") != 1)
			continue;	
		else if(self getGuid() == level.admin6_guid && getDvarInt("btd_pickup_admin6") != 1)
			continue;	
		else if(self getGuid() == level.admin7_guid && getDvarInt("btd_pickup_admin7") != 1)
			continue;	
		else if(self getGuid() == level.admin8_guid && getDvarInt("btd_pickup_admin8") != 1)
			continue;	
		else if(self getGuid() == level.admin9_guid && getDvarInt("btd_pickup_admin9") != 1)
			continue;	
			
		if(!self useButtonPressed())
			continue;

		if(self getStance() == "prone")
			start = self.origin + (0,0,11);
		else if(self getStance() == "crouch")
			start = self.origin + (0,0,40);
		else
			start = self.origin + (0,0,60);

		end = start + maps\mp\_utility::vector_Scale(anglestoforward(self getPlayerAngles()),999999);
		trace = bulletTrace(start,end,true,self);
		dist = distance(start,trace["position"]);

		ent = trace["entity"];

		if(!isDefined(ent))
			continue;

		if(ent.classname != "player" && (ent.classname != "script_model" || !isDefined(ent.targetname) || (isDefined(ent.targetname) && ent.targetname != "zom")))
			continue;

		if(isPlayer(ent))
			ent iPrintlnBold("^2You were picked up by admin ^4" + get_admin_name() + "^7!");

		self iPrintlnBold("^2You picked up ^7" + ent.name);

		linker = spawn("script_origin",trace["position"]);

		ent linkto(linker);

		while(isPlayer(self) && self useButtonPressed())
			wait 0.05;

		while(isPlayer(self) && !self useButtonPressed())
		{
			wait 0.05;

			if(!isPlayer(self) || !isDefined(ent))
				break;

			if(self getStance() == "prone")
				start = self.origin + (0,0,11);
			else if(self getStance() == "crouch")
				start = self.origin + (0,0,40);
			else
				start = self.origin + (0,0,60);

			end = start + maps\mp\_utility::vector_Scale(anglestoforward(self getPlayerAngles()),dist);
			trace = bulletTrace(start,end,false,ent);
			dist = distance(start,trace["position"]);

			if(self meleeButtonPressed() && !self adsButtonPressed())
				dist -= 15;
			else if(self meleeButtonPressed() && self adsButtonPressed())
				dist += 15;

			end = start + maps\mp\_utility::vector_Scale(anglestoforward(self getPlayerAngles()),dist);
			trace = bulletTrace(start,end,false,ent);
			linker.origin = trace["position"];
		}

		if(isDefined(ent))
		{
			ent unlink();
			if(isPlayer(ent))
				ent iPrintlnBold("^2You were dropped up by the admin!");

			self iPrintlnBold("^2You dropped ^7" + ent.name);
		}

		linker delete();

		while(isPlayer(self) && self useButtonPressed())
			wait 0.05;
	}
}