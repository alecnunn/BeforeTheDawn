//================================================================================================
// File Name  : _ammo_drops.gsc 
// File Info  : Used to spawn the ammo drops and give players health and ammo
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R 
//================================================================================================

main()
{
	precacheModel("com_bomb_objective");
	precacheShader("waypoint_ammo_box");

	ammospawns = getentarray("mp_tdm_spawn","classname");
	customammospawns = getentarray("mp_sab_spawn_allies","classname");		
	
	if(ammospawns.size < 2)
	{			
		ammospawns = getentarray("mp_dm_spawn","classname");	

		if(ammospawns.size < 2)
			return;
	}

	while(1)
	{
		level waittill("ammo_notify");
		while(1)
		{
			num[0] = randomInt(ammospawns.size);
			
			if(getDvar("mapname") == "mp_btd_maze")
			{
				num[1] = randomInt(customammospawns.size);
			}
			else
			{
				num[1] = randomInt(ammospawns.size);
			}

			if(num[0] != num[1]) // so that 2 dont spawn at the same place
				break;

			wait 0.05;
		}

		ammodrop = [];
		for(i=0;i<2;i++)
		{
			trace = bulletTrace(ammospawns[num[i]].origin + (0,0,40), ammospawns[num[i]].origin + (0,0,-100), false, undefined);

			ammodrop[i] = spawn("script_model", trace["position"] + (0,0,2));
			ammodrop[i].angles = maps\mp\_utility::orientToNormal(trace["normal"]);

			ammodrop[i] setModel("com_bomb_objective");

			ammodrop[i].trigger = spawn("trigger_radius",ammodrop[i].origin,0,120,120);
			ammodrop[i].trigger thread ammodrop();

			if(level.ammo_drops_locations == 1)
			{
				ammodrop[i].marker = newHudElem();
				ammodrop[i].marker.hideWhenInMenu = true;
				ammodrop[i].marker SetTargetEnt(ammodrop[i]);
				ammodrop[i].marker.sort = 1;
				ammodrop[i].marker setWayPoint(true, "waypoint_ammo_box");
			}
		}
		
		iPrintlnBold("^3Ammo drops are now ready!");

		level waittill("wave_start");

		for(i=0;i<ammodrop.size;i++)
		{
			if(level.ammo_drops_locations == 1)
			{
				ammodrop[i].marker destroy();
			}
//			objective_delete(i + 1);
//			playfx(level.fx_ammobox, ammodrop[i].origin);
			ammodrop[i].trigger delete();
			ammodrop[i] delete();
		}
	}
}

ammodrop()
{
	level endon("wave_start");
	while(1)
	{
		self waittill("trigger", player);

		if(player.sessionstate != "playing")
			continue;
		if(player.isammoing)
			continue;

		player.isammoing = true;

		player thread ammoingwait();
		player playlocalsound("weap_pickup");

		if(player.hasntfullammo)
		{		
			// need ammo restock here
			weapList = player GetWeaponsList();
			for(w=0;w<weapList.size;w++)
			{
				clipCount = 0;
				if(weapList[w] == "none")
					continue;
					
				player giveMaxAmmo(weapList[w]);
					
				if(player HasPerk("specialty_extraammo"))
				{
					clipCount = player GetWeaponAmmoStock( weapList[w] );
					player iprintlnBold("clipcount" + clipCount);
				}
			}
		}
		
		player.hasntfullammo = false;
		player thread hashadammo();	

		if(player.health <= player.maxhealth - 10)
			player.health = player.health + 10;
		else if(player.health > player.maxhealth - 10)
			player.health = player.maxhealth;
	}
}

ammoingwait()
{
	wait 0.75;
	self.isammoing = false;
}

hashadammo()
{
	wait level.grace_time;
	self.hasntfullammo = true;
}