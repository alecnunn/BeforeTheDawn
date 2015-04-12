ambientsounds()
{
	thread gunfire();
	thread explosions();
}

gunfire()
{
	while(1)
	{
		wait randomInt(5) + 5;
		num = randomInt(100);
		if(num < 15)
			sound = "elm_gunfire_50cal_med";
		else if(num >= 15 && num < 30)
			sound = "elm_gunfire_ak47_med";
		else if(num >= 30 && num < 45)
			sound = "elm_gunfire_m16_med";
		else if(num >= 45 && num < 60)
			sound = "elm_gunfire_m240_med";
		else if(num >= 60 && num < 75)
			sound = "elm_gunfire_mp5_med";
		else if(num >= 75 && num < 90)
			sound = "elm_gunfire_usassault_med";
		else
			sound = "elm_gunfire_miniuzi_med";
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
			players[i] playLocalSound(sound);
	}
}

explosions()
{
	while(1)
	{
		wait randomInt((10) + 5);
		
		num = randomInt(100);
		if(num < 50)
			sound = "elm_artillery_med";
		else
			sound = "elm_explosions_med";
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
			players[i] playLocalSound(sound);
	}
}

dotaunt()
{
	level endon("game_ended");
	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	wait 1;
	self playSound("taunt");
}

playdelayedlocalsound(sound, delay)
{
	if(!isDefined(sound))
		sound = "null";
	if(!isDefined(delay))
		delay = 1;

	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	wait delay;
	self playLocalSound(sound);
}

playsoundatlocation(sound, where, time)
{
	if(!isDefined(sound))
		sound = "null";
	if(!isDefined(where))
		where = (0,0,0);
	if(!isDefined(time))
		time = 5;

	sounder = spawn("script_origin", where);
	wait 0.05;
	sounder playSound(sound);
	wait time;
	sounder delete();
}

playlooplocalsound(sound,waittime,end)
{
	if(!isDefined(sound))
		sound = "null";
	if(!isDefined(waittime))
		waittime = 1;

	if(isDefined(end))
		self endon(end);
	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	while(1)
	{
		self playLocalSound(sound);
		wait waittime;
	}
}