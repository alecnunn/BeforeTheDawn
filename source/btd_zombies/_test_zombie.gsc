//================================================================================================
// File Name  : _test_zombie.gsc 
// File Info  : Used to spawn the test zombies and moniter thier health ect
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R / Abney Park
//================================================================================================

#include maps\mp\gametypes\_hud_util;
#include btd_general\_sound_util;
#include btd_general\_hud_util;
#include k3\_dvardef;

main()
{
	precache();

	level.zomspawns = [];
	
	thread k3\_spawns::init();

	level.currentspawnnum = 0;
	level.zombies = [];
	level.currentwave = 0;
	level.wavetospawn = 0;
	level.totalzomsinwave = 0;
	level.tempzombies = [];
	level.buggedzom = false;
	level.wave_barsize = 260;
	
	

	if(level.zomdifficulty == 1)			// difficulty = Easy
		level.zommaxhealth = int(level.zombiehealth * 0.8);
	else if(level.zomdifficulty == 2)		// difficulty = Normal
		level.zommaxhealth = int(level.zombiehealth * 1.2);
	else if(level.zomdifficulty == 3)		// difficulty = Hard
		level.zommaxhealth = int(level.zombiehealth * 1.4);
	else if(level.zomdifficulty == 4)		// difficulty = Extra Hard
		level.zommaxhealth = int(level.zombiehealth * 1.7);
	else if(level.zomdifficulty == 5)		// difficulty = Impossible
		level.zommaxhealth = int(level.zombiehealth * 2.00);


	thread add_new_zom_on_bugged_one();	
	thread monitorplayers();
	
	
	thread playerConnect();

	wait 0.05;
//	if(level.zommusic)
//		thread music();
//		ambientPlay("zombie_music");
}

precache()
{
	precacheModel("zombie");
	precacheModel("night_sphere");

	precacheShader("waypoint_target");
	precacheShader("hud_lowhealth_warning");

	precacheString(&"Zombies:");
	precacheString(&"Current Wave:");
	precacheString(&"/");
	precacheString(&"Health:");

	level.fx_gib = loadFx("k3/bloodfx/gib");
//	level.fx_ammobox = loadFx("");

	level.zom_headshot = createdvar("btd_zomheadshot",30,0,999999,"int");
	level.killsprees = createdvar("btd_killsprees",1,0,1,"int");
	level.painsounds = createdvar("btd_painsounds",75,0,100,"int");
	level.deathsounds = createdvar("btd_deathsounds",75,0,100,"int");
	level.zomdifficulty = createdvar("btd_difficulty",2,1,5,"int");
	level.maxzombies = createdvar("btd_maxzombies",50,20,70,"int");
	level.markernum = createdvar("btd_numzomsmarker",6,1,1024,"int");
	level.zombiehealth = createdvar("btd_zombiehealth",150,1,10000,"int");
	level.zomwaves = createdvar("btd_zombiewaves",15,1,50,"int");
	level.zomspawntime = createdvar("btd_zombiespawntime",0.5,0.1,5,"float");
	level.zommusic = createdvar("btd_music",1,0,1,"int");
	level.zomdmg = createdvar("btd_zomdmg",5,1,500,"int");
	level.allowragdoll = 1;
	setDvar("scr_killcam_time",10);
	setDvar("scr_killcam_posttime",2);
}

night()
{
	wait 0.05;
	night_sphere = spawn("script_model",level.mapCenter);
	night_sphere setModel("night_sphere");
	setExpFog(100,600,0,0,0,0);
}

marker()
{
	if(isDefined(self.markerent))
		return;

	self.markerent = spawn("script_model",self.origin + (0,0,80));
	self.markerent setModel("tag_origin");
	wait 0.05;
	if(!isDefined(self))
	{
		self.markerent delete();	// NEED TO FIX
		return;
	}
	self.markerent linkto(self);

	self.marker = newHudElem();
	self.marker.hideWhenInMenu = true;
	self.marker SetTargetEnt(self.markerent);
	self.marker.sort = 1;
	self.marker setWayPoint(true, "waypoint_target");
	self thread deletemarkerondeath();
	self thread deletemarkeronmorezoms();
}

deletemarkerondeath()
{
	self endon("markers_deleted");
	self waittill("death");
	self.marker destroy();
	self.markerent unlink();
	self.markerent delete();
}

deletemarkeronmorezoms()
{
	self endon("death");
	while(1)
	{
		if(level.zombies.size > level.markernum)
			break;
		wait 0.05;
	}
	self notify("markers_deleted");
	self.marker destroy();
	self.markerent unlink();
	self.markerent delete();
}

spawnzombie(health)
{
	num = level.currentspawnnum;
	level.currentspawnnum++;
	if(level.currentspawnnum >= level.zomspawns.size)
		level.currentspawnnum = 0;
	zom = spawn("script_model", level.zomspawns[num].origin);
	zom setModel("zombie");
	zom.angles = level.zomspawns[num].angles;
	zom.targetname = "zom";
	zom.name = "^1A Zombie";
	zom.currentsurface = "default";
	zom.wasbugged = false;
	zom.attacksoundplaying = false;

	zom thread moveparts("tag_l_arm_",12);
	zom thread moveparts("tag_r_arm_",12);
	zom thread moveparts("tag_l_leg_",11);
	zom thread moveparts("tag_r_leg_",11);
	zom thread dmg(health);
	zom thread undermap();
	zom thread zombie_sounds();
	zom thread footsteps();

	level.zombies[level.zombies.size] = zom;	

	return zom;
	
	iprintln("defenders = " + level.defend);
}

moveparts(tag, frames)
{
	self endon("death");

	if(!isDefined(tag) || !isDefined(frames))
		return;

	wait 0.05;

	show = 1;
	forward = true;
	while(1)
	{
		if(forward)
		{
			self showPart(tag + show);
			for(i=1;i<frames + 1;i++)
			{
				if(i == show)
					continue;
				self hidePart(tag + i);
			}
			wait 0.05;
			show++;
			if(show > (frames - 1))
				forward = false;
		}
		else
		{
			show--;
			if(show < 2)
			{
				forward = true;
				show = 1;
				wait 0.05;
				continue;
			}
			self showPart(tag + show);
			for(i=1;i<frames + 1;i++)
			{
				if(i == show)
					continue;
				self hidePart(tag + i);
			}
			wait 0.05;
		}
	}
}

dmg(health)
{
	self endon("death_dmg");
	wait 0.05;

	maxhealth = level.zommaxhealth;

	if(!isDefined(health))
		health = maxhealth;

	health = int(health);
	maxhealth = int(maxhealth);

	self.health = health;
	self.maxhealth = maxhealth;
	self setCanDamage(1);
	oldhealth = self.health;
	self.attackers = [];
	while(1)
	{
		self waittill("damage", iDamage, attacker, vDir, vPoint, sMeansOfDeath, modelName, tagName, partName, iDFlags);
		if(self.health == oldhealth)
			self.health = self.health - iDamage;

		if(isPlayer(attacker))
		{
			if(maps\mp\gametypes\_class::isPrimaryDamage(sMeansOfDeath) && isDefined(partName) && partName == "tag_head")
			{
				extradmg = iDamage * (100 + level.zom_headshot) / 100;
				extradmg = int(extradmg - iDamage);
				self.health = self.health - extradmg;
				sMeansOfDeath = "MOD_HEAD_SHOT";
			}

			newattacker = true;
			for(i=0;i<self.attackers.size;i++)
			{
				if(!isDefined(self.attackers[i]))
					continue;
				if(self.attackers[i] != attacker)
					continue;
				newattacker = false;
			}

			if(newattacker)
				self.attackers[self.attackers.size] = attacker;

			if(sMeansofDeath == "MOD_MELEE")
				earthquake(0.7,1,self.origin + (0,0,40),60);

			extradmg = iDamage;

			attacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(false);

			if(attacker maps\mp\gametypes\_class::cac_hasSpecialty("specialty_bulletdamage") && maps\mp\gametypes\_class::isPrimaryDamage(sMeansOfDeath))
				extradmg = iDamage * (100 + level.cac_bulletdamage_data) / 100;
			else if(attacker maps\mp\gametypes\_class::cac_hasSpecialty("specialty_explosivedamage") && maps\mp\gametypes\_class::isExplosiveDamage(sMeansOfDeath))
				extradmg = iDamage * (100 + level.cac_explosivedamage_data) / 100;

			extradmg = int(extradmg - iDamage);
			self.health = self.health - extradmg;
		}

		oldhealth = self.health;
//		self playSound("generic_pain_arab_" + (randomInt(8) + 1));
		self playSound("zom_pain");
		if(self.health <= 0)
			break;
	}

	self notify("death");
	self notify("disconnect");	// quick hax, cant be assed to change all the endons in pezzes scripts :p
	if(isPlayer(attacker))
	{
		if(level.killsprees)
			attacker thread k3\_killspree::check_for_rampage(self);

//		attacker thread dotaunt();
		attacker thread multikill();

		if(sMeansofDeath == "MOD_HEAD_SHOT")
		{
			attacker.headkills++;
			if(attacker.headkills == 3)
				attacker thread dohud("^1Head hunter!", "headhunter", 1, 1);
			else if(attacker.headkills >= 5)
			{
				attacker thread dohud("^1Bulls Eye!", "bullseye", 1, 1);
				attacker.headkills = 0;
			}
			else
				attacker thread dohud("^1Headshot!", "headshot", 1, 1);
		}

//		iPrintln(attacker.name + " ^7killed a ^1Zombie!");
//		attacker iPrintlnBold("^7You killed a ^1Zombie!");

		attacker thread maps\mp\gametypes\_rank::giveRankXP("kill", 10);
		attacker.score += 10;
		attacker.pers["score"] = attacker.score;
		attacker.kills++;
		attacker.pers["kills"] = attacker.kills;
	}

	if(!self.wasbugged)
	{
		for(i=0;i<self.attackers.size;i++)
		{
			if(!isPlayer(self.attackers[i]))
				continue;

			if(isPlayer(attacker) && self.attackers[i] == attacker)
				continue;

			self.attackers[i] thread maps\mp\gametypes\_rank::giveRankXP("assist", 2);
			self.attackers[i].score += 2;
			self.attackers[i].pers["score"] = self.attackers[i].score;
			self.attackers[i].assists++;
			self.attackers[i].pers["assists"] = self.attackers[i].assists;
		}
	}
	origin = self.origin + (0,0,10);
	playfx(level.fx_gib, origin);
	thread playsoundatlocation("gib", origin, 3);
	self delete();

	zombies = level.zombies;
	level.zombies = [];
	for(i=0;i<zombies.size;i++)
	{
		if(isDefined(zombies[i]))
			level.zombies[level.zombies.size] = zombies[i];
	}
}

undermap()
{
	self endon("death");
	while(1)
	{
		wait 0.05;
		undermap = 0;
		if(self.origin[2] >= level.spawnMins[2])
			continue;
		while(1)
		{
			if(distance(self.origin,(self.origin[0],self.origin[1],level.spawnMins[2])) < 100)
				break;
			undermap++;
			if(undermap > 200)
				break;
			wait 0.05;
		}
		if(undermap >= 50)
			break;
	}
	level notify("bugged_zom",self.health);
	self notify("damage", self.maxhealth, undefined, (0,1,0), self.origin, "MOD_SUICIDE", "", "", "", 1);
}

zombie_sounds()
{
	self endon("death");
	while(1)
	{
		wait 3 + randomInt(5);
		self playSound("zombie_moan");
	}
}

footsteps()
{
	self endon("death");
	while(1)
	{
		wait 0.4 + randomFloat(0.2);
		self playSound("step_run_" + self.currentsurface);
	}
}

attacksound()
{
	self playSound("zom_attack");
	self.attacksoundplaying = true;
	self thread attacksoundwait();
}

attacksoundwait()
{
	self endon("death");
	wait 2;
	self.attacksoundplaying = false;
}

add_new_zom_on_bugged_one()
{
	wait 1;
	while(1)
	{
		level waittill("bugged_zom",health);
		thread bugged_zom_thingy();
		wait 0.05;
		zombie = spawnzombie(health);
		zombie.bIsBot = true;
		zombie thread svr\PeZBOT::Connected();
	}
}

bugged_zom_thingy()
{
	level notify("bugged_zom_thingy");
	level endon("bugged_zom_thingy");
	level.buggedzom = true;
	wait 0.05;
	level.buggedzom = false;
}

monitorplayers()
{
	level endon("game_ended");
	had_playing_players = false;
	while(1)
	{
		playing_players = false;
		players = getentarray("player","classname");
		for(i=0;i<players.size;i++)
		{
			if(players[i].sessionstate == "playing")
			{
				had_playing_players = true;
				playing_players = true;
			}
		}

		if(!playing_players && had_playing_players)
		{
			wait 2;
			thread maps\mp\gametypes\_globallogic::endGame("tie", "^1The zombies have eaten all of us!");
		}

		wait 0.05;
	}
}

monitorme()
{
	self endon("disconnect");
	wait 0.05;
	while(1)
	{
		if(level.allowragdoll)
		{
			self setClientDvar("ragdoll_explode_force",60000);
			self setClientDvar("ragdoll_explode_upbias",2);
		}
		self setClientDvar("cg_cursorHints",1);
		self setClientDvar("r_lighttweaksunlight",0.3);
		wait 3;
	}
}

playerConnect()
{
	while(1)
	{
		level waittill("connecting", player);
		player thread onPlayerConnect();
		player thread onPlayerDisconnect();
		player thread onPlayerSpawned();
		player thread onJoinedSpectators();
		player thread onPlayerKilled();
	}
}

onPlayerConnect()
{
	self.firstspawn = true;
	self.btdhudQueue = [];
	self.doinghud = false;
	self.kill_spree = 0;
	self.headkills = 0;
	self.multi = 0;
	self.isammoing = false;
	self thread monitorme();
	self thread hud_health();
	self thread k3\_msg::onPlayerConnect();
	self thread k3\_admin_lol::onPlayerConnect();
}

onPlayerDisconnect()
{
	self waittill("disconnect");
}

onPlayerSpawned()
{
	self endon("disconnect");
	
	while(1)
	{
		self waittill("spawned_player");
		self thread playerSpawned();
	}
}

playerSpawned()
{
	thread zoom\zoom::main();
	self thread k3\_msg::playerSpawned();
}

onJoinedSpectators()
{
	self endon("disconnect");

	while(1)
	{
		self waittill("joined_spectators");
		self thread joinedSpectators();
	}
}

joinedSpectators()
{

}

onPlayerKilled()
{
	self endon("disconnect");

	while(1)
	{
		self waittill("death");
		self thread playerKilled_threads();
	}
}

playerKilled_threads()
{

}

PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if(isDefined(eInflictor) && isDefined(eInflictor.targetname) && eInflictor.targetname == "zom" && sMeansofDeath == "MOD_MELEE")
		earthquake(0.7,1,self.origin + (0,0,40),60);

	if(randomInt(100) < level.painsounds)
	{
		sound = undefined;
		if(self.team == "allies" && game["allies"] == "marines")
			sound = "american";
		else if(self.team == "allies" && game["allies"] == "sas")
			sound = "british";
		else if(self.team == "axis" && (game["axis"] == "opfor" || game["axis"] == "arab"))
			sound = "arab";
		else if(self.team == "axis" && game["axis"] == "russian")
			sound = "russian";

		if(isDefined(sound))
			self playSound("generic_pain_" + sound + "_" + (randomInt(8) + 1));
	}
}

PlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	if(level.killsprees)
		self thread k3\_killspree::check_for_endoframpage(eInflictor,attacker);

	if(isDefined(eInflictor) && isDefined(eInflictor.targetname) && eInflictor.targetname == "zom" && sMeansofDeath == "MOD_MELEE")
		earthquake(0.7,1,self.origin + (0,0,40),60);

	if(randomInt(100) < level.deathsounds)
	{
		sound = undefined;
		if(self.team == "allies" && game["allies"] == "marines")
			sound = "american";
		else if(self.team == "allies" && game["allies"] == "sas")
			sound = "british";
		else if(self.team == "axis" && (game["axis"] == "opfor" || game["axis"] == "arab"))
			sound = "arab";
		else if(self.team == "axis" && game["axis"] == "russian")
			sound = "russian";

		if(isDefined(sound))
			thread playsoundatlocation("generic_death_" + sound + "_" + (randomInt(8) + 1), self.origin, 3);
	}	
}

multikill()
{
	self.multi++;
	wait 0.2;
	if(self.multi > 1)
	{
		iprintln(self.name + " ^2got a multikill with ^1" + self.multi + " ^2kills!");
		self dohud("^2You got a multikill with ^1" + self.multi + " ^2kills.", "multikill", 1, 0);
	}
	self.multi = 0;
}

delayStartRagdoll(ent, sHitLoc, vDir, sWeapon, eInflictor, sMeansOfDeath)
{
	if(isDefined(ent))
	{
		deathAnim = ent getcorpseanim();
		if(animhasnotetrack(deathAnim, "ignore_ragdoll"))
			return;
	}

	if(level.allowragdoll)
	{
		if(!isDefined(vDir))
			vDir = (0,0,0);

		explosionPos = ent.origin + (0, 0, maps\mp\gametypes\_globallogic::getHitLocHeight(sHitLoc));
		explosionPos -= vDir * 20;
		explosionRadius = 40;
		explosionForce = 0.75;

		ent startragdoll(1);

		wait 0.05;

		if(!isDefined(ent))
			return;

		// apply extra physics force to make the ragdoll go crazy
		physicsExplosionSphere( explosionPos, explosionRadius, explosionRadius/2, explosionForce );
	}

	wait 0.2;

	if(!isDefined(ent))
		return;

	if(ent isRagDoll())
		return;

	deathAnim = ent getcorpseanim();

	startFrac = 0.35;

	if(animhasnotetrack(deathAnim, "start_ragdoll"))
	{
		times = getnotetracktimes(deathAnim, "start_ragdoll");
		if(isDefined(times))
			startFrac = times[0];
	}

	waitTime = startFrac * getanimlength(deathAnim);
	wait waitTime;

	if(isDefined(ent))
	{
		println("Ragdolling after " + waitTime + " seconds");
		ent startragdoll(1);
	}
}