//================================================================================================
// File Name  : _hud_util.gsc 
// File Info  : Spawns the test zombies
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R / Abney Park
//================================================================================================

#include maps\mp\gametypes\_hud_util;

inithud()
{
	numzomsx = 228;
	zomsleftx = 328;
	currentwavex = 426; 
	
	level.numzombiesword = newhudelem();
	level.numzombiesword.alignX = "right";
	level.numzombiesword.alignY = "middle";
	level.numzombiesword.horzAlign = "fullscreen";
	level.numzombiesword.vertAlign = "fullscreen";
	level.numzombiesword.x = numzomsx - 2;
	level.numzombiesword.y = 23;
	level.numzombiesword.alpha = 1;
	level.numzombiesword.sort = 2;
	level.numzombiesword.fontscale = 1.4;
	level.numzombiesword.color = (1,0,0);
	level.numzombiesword setText("Zombies:");

	level.numzombies = newhudelem();
	level.numzombies.alignX = "left";
	level.numzombies.alignY = "middle";
	level.numzombies.horzAlign = "fullscreen";
	level.numzombies.vertAlign = "fullscreen";
	level.numzombies.x = numzomsx + 2;
	level.numzombies.y = 23;
	level.numzombies.alpha = 1;
	level.numzombies.sort = 2;
	level.numzombies.fontscale = 1.4;
	level.numzombies.color = (0,1,0);
	
	level.zombiesleftword = newhudelem();
	level.zombiesleftword.alignX = "right";
	level.zombiesleftword.alignY = "middle";
	level.zombiesleftword.horzAlign = "fullscreen";
	level.zombiesleftword.vertAlign = "fullscreen";
	level.zombiesleftword.x = zomsleftx - 2;
	level.zombiesleftword.y = 23;
	level.zombiesleftword.alpha = 1;
	level.zombiesleftword.sort = 2;
	level.zombiesleftword.fontscale = 1.4;
	level.zombiesleftword.color = (1,0,0);
	level.zombiesleftword setText("Left To Spawn:");

	level.zombiesleft = newhudelem();
	level.zombiesleft.alignX = "left";
	level.zombiesleft.alignY = "middle";
	level.zombiesleft.horzAlign = "fullscreen";
	level.zombiesleft.vertAlign = "fullscreen";
	level.zombiesleft.x = zomsleftx + 2;
	level.zombiesleft.y = 23;
	level.zombiesleft.alpha = 1;
	level.zombiesleft.sort = 2;
	level.zombiesleft.fontscale = 1.4;
	level.zombiesleft.color = (0,1,0);	

	level.currentwaveword = newhudelem();
	level.currentwaveword.alignX = "right";
	level.currentwaveword.alignY = "middle";
	level.currentwaveword.horzAlign = "fullscreen";
	level.currentwaveword.vertAlign = "fullscreen";
	level.currentwaveword.x = currentwavex - 2;
	level.currentwaveword.y = 23;
	level.currentwaveword.alpha = 1;
	level.currentwaveword.sort = 2;
	level.currentwaveword.fontscale = 1.4;
	level.currentwaveword.color = (1,0,0);
	level.currentwaveword setText("Current Wave:");

	level.currentwavenum = newhudelem();
	level.currentwavenum.alignX = "left";
	level.currentwavenum.alignY = "middle";
	level.currentwavenum.horzAlign = "fullscreen";
	level.currentwavenum.vertAlign = "fullscreen";
	level.currentwavenum.x = currentwavex + 2;
	level.currentwavenum.y = 23;
	level.currentwavenum.alpha = 1;
	level.currentwavenum.sort = 2;
	level.currentwavenum.fontscale = 1.4;
	level.currentwavenum.color = (0,1,0);

	level.currentwavenumslash = newhudelem();
	level.currentwavenumslash.alignX = "left";
	level.currentwavenumslash.alignY = "middle";
	level.currentwavenumslash.horzAlign = "fullscreen";
	level.currentwavenumslash.vertAlign = "fullscreen";
	level.currentwavenumslash.x = currentwavex + 15;
	level.currentwavenumslash.y = 23;
	level.currentwavenumslash.alpha = 1;
	level.currentwavenumslash.sort = 2;
	level.currentwavenumslash.fontscale = 1.4;
	level.currentwavenumslash.color = (1,0,0);
	level.currentwavenumslash setText("/");

	level.currentwavenummax = newhudelem();
	level.currentwavenummax.alignX = "left";
	level.currentwavenummax.alignY = "middle";
	level.currentwavenummax.horzAlign = "fullscreen";
	level.currentwavenummax.vertAlign = "fullscreen";
	level.currentwavenummax.x = currentwavex + 25;
	level.currentwavenummax.y = 23;
	level.currentwavenummax.alpha = 1;
	level.currentwavenummax.sort = 2;
	level.currentwavenummax.fontscale = 1.4;
	level.currentwavenummax.color = (0,1,0);
	level.currentwavenummax setValue(level.zomwaves);

	level.zombiewavelife = newhudelem();
	level.zombiewavelife.alignX = "left";
	level.zombiewavelife.alignY = "top";
	level.zombiewavelife.horzAlign = "fullscreen";
	level.zombiewavelife.vertAlign = "fullscreen";
	level.zombiewavelife.x = 320 - (level.wave_barsize / 2.0);
	level.zombiewavelife.y = 6;
	level.zombiewavelife.alpha = 1;
	level.zombiewavelife.sort = 4;
	level.zombiewavelife.color = (1,0,0);
	level.zombiewavelife setShader("white",1,8);

	level.zombiewavelifeback = newhudelem();
	level.zombiewavelifeback.alignX = "center";
	level.zombiewavelifeback.alignY = "top";
	level.zombiewavelifeback.horzAlign = "fullscreen";
	level.zombiewavelifeback.vertAlign = "fullscreen";
	level.zombiewavelifeback.x = 320;
	level.zombiewavelifeback.y = 5;
	level.zombiewavelifeback.alpha = 0.6;
	level.zombiewavelifeback.sort = 3;
	level.zombiewavelifeback.color = (0,0,0);
	level.zombiewavelifeback setShader("white",(level.wave_barsize + 4),10);

	oldwidth = 1;
	scaletime = 0.5;
	if(level.zomspawntime < 0.5)
		scaletime = level.zomspawntime;
	while(1)
	{
		level.numzombies setValue(level.zombies.size);
		level.zombiesleft setValue(level.wavetospawn);
		level.currentwavenum setValue(level.currentwave);
		wait 0.05;
		if(level.zombies.size <= level.markernum)
		{
			for(i=0;i<level.zombies.size;i++)
				level.zombies[i] thread k3\_zombie::marker();
		}

		if(!level.zombies.size && !level.buggedzom)
		{
			level.zombiewavelife scaleOverTime(0.5,1,8);
			continue;
		}

		totalhealth = 0;
		maxhealth = level.totalzomsinwave * level.zommaxhealth;

		for(i=0;i<level.totalzomsinwave;i++)
		{
			if(!isDefined(level.zombies[i]) && isDefined(level.tempzombies[i]))
				totalhealth += level.tempzombies[i].health;
			else if(isDefined(level.zombies[i]))
				totalhealth += level.zombies[i].health;
		}

		width = int(totalhealth/maxhealth * (level.wave_barsize + 4));
		if(width <= 0)
			width = 1;
		if(width != oldwidth)
			level.zombiewavelife scaleOverTime(scaletime,width,8);
		oldwidth = width;
	}
}

hud_health()
{
	self notify("stop_healthbar_thread");
	self endon("disconnect");
	self endon("stop_healthbar_thread");

	widthofbar = 128;
	x = 10;
	y = 415;

	if(isDefined(self.healthword))
		self.healthword destroy();

	if(isDefined(self.healthnum))
		self.healthnum destroy();

	if(isDefined(self.healthbar))
		self.healthbar destroy();

	if(isDefined(self.healthbarback))
		self.healthbarback destroy();

	if(isDefined(self.healthwarning))
		self.healthwarning destroy();

	self.healthword = newclienthudelem(self);
	self.healthword.alignX = "left";
	self.healthword.alignY = "middle";
	self.healthword.horzAlign = "fullscreen";
	self.healthword.vertAlign = "fullscreen";
	self.healthword.x = x;
	self.healthword.y = y - 10;
	self.healthword.alpha = 1;
	self.healthword.sort = 2;
	self.healthword.fontscale = 1.4;
	self.healthword.color = (0,1,0);
	self.healthword setText("Health:");

	self.healthnum = newclienthudelem(self);
	self.healthnum.alignX = "left";
	self.healthnum.alignY = "middle";
	self.healthnum.horzAlign = "fullscreen";
	self.healthnum.vertAlign = "fullscreen";
	self.healthnum.x = x + 40;
	self.healthnum.y = y - 10;
	self.healthnum.alpha = 1;
	self.healthnum.sort = 2;
	self.healthnum.fontscale = 1.4;
	self.healthnum.color = (0,1,0);

	self.healthbar = newclienthudelem(self);
	self.healthbar.alignX = "left";
	self.healthbar.alignY = "middle";
	self.healthbar.horzAlign = "fullscreen";
	self.healthbar.vertAlign = "fullscreen";
	self.healthbar.x = x;
	self.healthbar.y = y;
	self.healthbar.alpha = 1;
	self.healthbar.sort = 2;
	self.healthbar.color = (0,1,0);
	self.healthbar setShader("white",128,6);

	self.healthbarback = newclienthudelem(self);
	self.healthbarback.alignX = "left";
	self.healthbarback.alignY = "middle";
	self.healthbarback.horzAlign = "fullscreen";
	self.healthbarback.vertAlign = "fullscreen";
	self.healthbarback.x = x;
	self.healthbarback.y = y;
	self.healthbarback.alpha = 0.5;
	self.healthbarback.sort = 1;
	self.healthbarback.color = (0,0,0);
	self.healthbarback setShader("white",128,10);

	self.healthwarning = newclienthudelem(self);
	self.healthwarning.alignX = "center";
	self.healthwarning.alignY = "middle";
	self.healthwarning.horzAlign = "fullscreen";
	self.healthwarning.vertAlign = "fullscreen";
	self.healthwarning.x = x + 140;
	self.healthwarning.y = y;
	self.healthwarning.alpha = 0;
	self.healthwarning.sort = 2;
	self.healthwarning.color = (1,1,1);
	self.healthwarning setShader("hud_lowhealth_warning",32,32);

	self thread pulsesize();

	while(1)
	{
		if(self.sessionstate != "playing" || !isDefined(self.health) || !isDefined(self.maxhealth))
		{
			self.healthword.alpha = 0;
			self.healthnum.alpha = 0;
			self.healthbar.alpha = 0;
			self.healthbarback.alpha = 0;
			self.healthwarning.alpha = 0;
			wait 0.05;
			continue;
		}
		self.healthword.alpha = 1;
		self.healthnum.alpha = 1;
		self.healthbar.alpha = 1;
		self.healthbarback.alpha = 0.5;
		warninghealth = int(self.maxhealth / 3);
		if(self.health <= warninghealth)
			self.healthwarning.alpha = 1;
		else
			self.healthwarning.alpha = 0;
		
		width = int(self.health/self.maxhealth*128);
		if(width <= 0)
			width = 1;
		green = (self.health/self.maxhealth);
		red = (1 - green);
		self.healthbar setShader("white", width, 6);
		self.healthbar.color = (red,green,0);
		self.healthnum.color = (red,green,0);
		self.healthnum setValue(self.health);
		wait 0.05;
	}
}

pulsesize()
{
	self notify("stop_pulse_thread");
	self endon("disconnect");
	self endon("stop_pulse_thread");
	while(1)
	{
		self.healthwarning scaleOverTime(0.5,64,64);
		wait 0.5;
		self.healthwarning scaleOverTime(0.5,32,32);
		wait 0.5;
	}
}

dohud(msg, sound, msgdelay, sounddelay, type)
{
	if(!isPlayer(self))
		return;

	if(!isDefined(msgdelay))
		msgdelay = 0;

	if(!isDefined(sounddelay))
		sounddelay = 0;

	if(!isDefined(type))
		type = self.notifyText;

	hudstuff = spawnstruct();
	hudstuff.msg = msg;
	hudstuff.sound = sound;
	hudstuff.msgdelay = msgdelay;
	hudstuff.sounddelay = sounddelay;
	hudstuff.type = type;

	self thread nowdohud(hudstuff);
}

nowdohud(hudstuff)
{
	self endon("disconnect");

	if(self.doinghud)
	{
		self.btdhudQueue[self.btdhudQueue.size] = hudstuff;
		return;
	}

	self.doinghud = true;

	duration = 5.0;
	glowColor = (1,0,0);
	glowAlpha = 1;
	hudstuff.type setPoint( "CENTER", "CENTER", 0, 100);
	hudstuff.type setPulseFX(40, int(duration*1000), 1000);
	hudstuff.type.glowColor = glowColor;
	hudstuff.type.glowAlpha = glowAlpha;
	hudstuff.type.alpha = 1;
	hudstuff.type.label = &"";

	if(isDefined(hudstuff.msg))
		self.notifyText setText(hudstuff.msg);
	if(isDefined(hudstuff.sound))
	{
		wait hudstuff.sounddelay;
		self playlocalsound(hudstuff.sound);
	}

	wait 2;

	self.doinghud = false;

	if(self.btdhudQueue.size > 0)
	{
		hudstuff = self.btdhudQueue[0];
		
		newQueue = [];
		for (i=1;i<self.btdhudQueue.size;i++)
			self.btdhudQueue[i-1] = self.btdhudQueue[i];
		self.btdhudQueue[i-1] = undefined;

		self thread nowdohud(hudstuff);
	}
}