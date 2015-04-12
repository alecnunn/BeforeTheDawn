#include btd_general\_dvardef;


startsurvival()
{


	level.canjoin = "yes";
	number_of_waves = level.zomwaves;
	
	level.start_zoms = createdvar("btd_start_zoms",5,5,50,"int");
	level.grace_time = createdvar("btd_grace_time",120,10,300,"int");
	level.zom_multiply_factor = createdvar("btd_multiply_factor",3,1,5,"int");
	level.zom_dynamic_factor = createdvar("btd_dynamic_factor",5,5,10,"int");
	wave_settings = createdvar("btd_wave_settings",1,1,2,"int");

	time = 0;	
	
	// these are here so we dont get some stupid undefined errors
	num = 0;
	num_zoms = 0;
	wave_num_zoms = 0;
	
	// default wave setting	
	wave_settings = 1;		
	
	
	level.status = "grace";	
	if(level.ammo_drops == 1 && level.ammo_drops_start == 1)
	{
		level notify("ammo_notify");
	}	
	if(level.trade_drop == 1 && level.trade_drop_start == 1)
	{
		level notify("trade_notify");
	}	

	// for however many number of waves
	for(w =0 ;w < number_of_waves; w++)
	{	
		// gets the random spawn points
		btd_gametypes\survival\_survival_spawns::init();

		spawn = false;
		players = getentarray("player","classname");
		
		
		if(!players.size)
		{
			level.canjoin = "yes";
			
			w--;
			wait 5;
			continue;
		}			
		
		for(i=0;i<players.size;i++)
		{
			if(players[i].sessionstate != "spectator")
				spawn = true;
		}

		// if no players wait 5 seconds and check again
		if(!spawn)
		{
				level.canjoin = "yes";
				
				w--;
				wait 5;
				continue;
		}		
		
		// if in the grace period
		if (level.status == "grace")
		{	
			players = getentarray("player","classname");
		
			if(!players.size)
			{
				level.canjoin = "yes";
				
				w--;
				wait 5;
				continue;
			}	
		
			level.canjoin = "yes";	
			
			if(w > 0)
			{			
				for(i=0;i<players.size;i++)
				{
					if(players[i].team == "allies" && players[i].sessionstate == "spectator")
					players[i] thread maps\mp\gametypes\_globallogic::spawnPlayer();
					wait 0.1;
				}	
			}
				
			wait level.grace_time;
			level.status = "play";
		}
		
		// spawn zombie wave
		if (level.status == "play")
		{	
			level.canjoin = "no";
			
			level.currentwave = w + 1;				

			zoms_left_to_do = 0;	
			
			// this is where we work out how many zombies are in a wave	
			
			// dynamicly based on number of players and the current wave number						
			if(wave_settings == 1)
			{
				waveFactor = level.zom_dynamic_factor;
				players = getentarray("player","classname");					
				wave = (w + 1);						
				num = int (20 + (players.size * (waveFactor + wave)) + (wave * (wave * (waveFactor / 2)))) ;					
				wave_num_zoms = num;			
			}			
			
			// zombies from last wave are multiplyed by a factor
			else if(wave_settings == 2)
			{
				if(w == 0)
				{
					num_zoms = level.start_zoms;
				}
				else
				{				
					if(level.zom_multiply_factor == 1)		// difficulty = Easy
						num_zoms = num_zoms * 1.2; 
					else if(level.zom_multiply_factor == 2)	// difficulty = Moderate
						num_zoms = num_zoms * 1.4;
					else if(level.zom_multiply_factor == 3)	// difficulty = Hard
						num_zoms = num_zoms * 1.6;
					else if(level.zom_multiply_factor == 4)	// difficulty = Extra Hard
						num_zoms = num_zoms * 1.8;
					else if(level.zom_multiply_factor == 5)	// difficulty = Impossible
						num_zoms = num_zoms * 2.0;

					num_zoms = int(num_zoms);					
				}
				
				num = num_zoms;
				wave_num_zoms = num_zoms;
			}
			
			// players can choose the number of zombies in a wave
			else if(wave_settings == 3)
			{
				//abney add stuff here when new zombies come along
			}
			
			level.totalzomsinwave = num;
			level.wavetospawn = level.totalzomsinwave;

			// this is used so that the wave bar strength goes to the max at the beginning of the wave, spawnStruct() doesnt cause lag cuz it doesnt count as an entity
			level.tempzombies = [];
			for(z=0;z<level.totalzomsinwave;z++)
			{
				level.tempzombies[z] = spawnStruct();
				level.tempzombies[z].health = level.zommaxhealth;
			}
			z = 0;

			if(level.maxzombies && num > level.maxzombies)
			{
				num = level.maxzombies;
				zoms_left_to_do = wave_num_zoms - num;
			}
			
			if(players.size == 1)
				time = 2.5;
			else if(players.size == 2)
				time = 1.5;		
			else if(players.size > 2 && players.size < 5)
				time = 0.8;
			else if(players.size >= 5 && players.size < 10)
				time = 0.5; 
			else if(players.size > 10)
				time = 0.3;	

			iPrintlnBold("^1" + wave_num_zoms + " ^2INCOMMING ^1ZOMBIES!!!");
			level notify("wave_start");
			while(1)
			{	
				// spawn however many zoms are in the wave
				for(i=0;i<num;i++)
				{		
					wait time; 
					ent = k3\_zombie::spawnzombie();
					if(level.wavetospawn > 0)
					{
						level.wavetospawn = level.wavetospawn - 1;
					}
					z++;
					if(isDefined(level.tempzombies[z]))
						level.tempzombies[z] = undefined;
						
					ent.pers["isBot"] = true;		
					ent.bIsBot = true;
					ent thread svr\PeZBOT::Connected();			
				}

				if(zoms_left_to_do > 0)
				{
					while(level.maxzombies && level.zombies.size >= level.maxzombies - 20) // stay here until theres less than 80 zoms left
						wait 0.05;
				}
				else
					break;

				num = level.maxzombies - level.zombies.size;
				zoms_left_to_do = zoms_left_to_do - num;
				if(zoms_left_to_do < 0)
					zoms_left_to_do = 0;
			}

			while(level.zombies.size > 0 || level.buggedzom) // stay here until theres 0 zoms left
			{
				wait 0.5;
			}
			
			level notify("wave_end");				
			level.status = "grace";
			
			if(level.ammo_drops == 1)
			{
				level notify("ammo_notify");
			}	
			if(level.trade_drop == 1)
			{
				level notify("trade_notify");
			}		

			wait 2;
			iPrintlnBold("^1Zombie ^2attack wave ^1" + (w + 1) + " ^2has been defeated!");			
		}	
	}
		
	iPrintlnBold("Well done, the zombies are all dead!");
	wait 5;
	thread maps\mp\gametypes\_globallogic::endGame("allies", "^1The zombies have been defeated!");	
}