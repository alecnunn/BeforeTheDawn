#include btd_general\_dvardef;

startsurvival()
{
	number_of_waves = level.zomwaves;
	
	level.start_zoms = createdvar("btd_start_zoms",5,5,50,"int");
	level.grace_time = createdvar("btd_grace_time",120,10,300,"int");
	
	num_zoms = level.start_zoms;
	
	time = 0;	
	
	level.status = "grace";	

	for(w=0;w<number_of_waves;w++)
	{	
		btd_gametypes\survival\_survival_spawns::init();
		
		if (level.status == "grace")
		{	
			level.canjoin = "yes";
			wait level.grace_time;
			level.status = "play";
		}
		
		if (level.status == "play")
		{	
			players = getentarray("player","classname");
			
			if(!players.size)
			{
					level.canjoin = "yes";
					w--;
					wait 5;
					continue;
			}	 
			
			level.canjoin = "no";		
			
			level.currentwave = w + 1;		
			
			if(players.size == 1)
				time = 2;
			else if(players.size == 2)
				time = 1;		
			else if(players.size > 2 && players.size < 5)
				time = 0.6;
			else if(players.size >= 5 && players.size < 10)
				time = 0.4; 
			else if(players.size > 10)
				time = 0.2;		

			zoms_left_to_do = 0;
			num = num_zoms;
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

			iPrintln("total " + num + " zombies");
			if(level.maxzombies && num > level.maxzombies)
			{
				num = level.maxzombies;
				zoms_left_to_do = num_zoms - num;
			}

			iPrintlnBold("^1" + num_zoms + " ^2INCOMMING ^1ZOMBIES!!!");
			level notify("wave_start");
			while(1)
			{	
				for(i=0;i<num;i++)
				{
					wait time; 
					ent = k3\_zombie::spawnzombie();
					level.wavetospawn = level.wavetospawn - 1;
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
				wait 0.05;

			if(level.zomdifficulty == 1)		// difficulty = Easy
				num_zoms = num_zoms * 1.2; 
			else if(level.zomdifficulty == 2)	// difficulty = Moderate
				num_zoms = num_zoms * 1.4;
			else if(level.zomdifficulty == 3)	// difficulty = Hard
				num_zoms = num_zoms * 1.6;
			else if(level.zomdifficulty == 4)	// difficulty = Extra Hard
				num_zoms = num_zoms * 1.8;
			else if(level.zomdifficulty == 5)	// difficulty = Impossible
				num_zoms = num_zoms * 2.0;

			num_zoms = int(num_zoms);

			level notify("wave_end");
			wait 2;
			iPrintlnBold("^1Zombie ^2attack wave ^1" + (w + 1) + " ^2has been defeated!");
			
			level.status = "grace";				
		}	
	}
		
	iPrintlnBold("Well done, the zombies are all dead!");
	wait 5;
	thread maps\mp\gametypes\_globallogic::endGame("tie", "^1The zombies have been defeated!");	
	
}
