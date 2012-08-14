//================================================================================================
// File Name  : _msg.gsc 
// File Info  : Starts and displays the server messages
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R
//================================================================================================

#include btd_general\_dvardef;
#include btd_general\_hud_util;

main()
{
	level.msg_interval = createdvar("btd_msg_interval",10,1,120,"int");
	level.welcomemsg_interval = createdvar("btd_welcomemsg_interval",1,0,120,"int");

	thread domessages();
}

onPlayerConnect()
{
	self.pers["donewelcome"] = false;
	//self.donewelcome = false;
}

playerSpawned()
{
	self thread dowelcome();
}

dowelcome()
{
	self endon("disconnect");
	if(self.pers["donewelcome"])
		return;
	//if(self.donewelcome)
		

	wait 1;

	num = 0;
	while(1)
	{
		msg = getdvar("btd_welcomemsg" + num);
		if(msg != "")
		{
			self thread dohud(msg);
//			self iPrintlnBold(msg);
			wait level.welcomemsg_interval;
		}
		else
			break;
		num++;
	}

	self.pers["donewelcome"] = true;
	//self.donewelcome = true;
}

domessages()
{
	level endon("game_ended");
	num = 0;
	wait level.msg_interval;
	while(1)
	{
		msg = getdvar("btd_msg" + num);
		if(msg != "")
		{
			iPrintln(msg);
			wait level.msg_interval;
		}
		else if(msg == "" && num != 0)
		{
			num = 0;
			continue;
		}
		else if(msg == "" && num == 0)
			break;
		num++;
	}
}