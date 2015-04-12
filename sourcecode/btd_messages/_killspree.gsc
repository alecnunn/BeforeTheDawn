//================================================================================================
// File Name  : _killspree.gsc 
// File Info  : Plays and displayes killspree sounds / messages
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R
//================================================================================================

#include btd_general\_hud_util;

check_for_rampage(victim)
{
	if(getDvarInt("btd_killsprees") == 1)
	{	
		self.kill_spree++;

		if(self.kill_spree == 5)
		{
			wait 0.9;
			iprintln(self.name +"^2 is on a ^1KILLING SPREE^2 with ^15 ^2kills in a row!");
			self thread dohud("^2You're on a ^1KILLING SPREE!", "killingspree");
		}
		else if(self.kill_spree == 10)
		{ 
			wait 0.9;
			iprintln(self.name +"^2 is on a ^1RAMPAGE^2 with ^110 ^2kills in a row!");
			self thread dohud("^2You're on a ^1RAMPAGE!", "rampage");
		}
		else if(self.kill_spree == 20)
		{
			wait 0.9;
			iprintln(self.name +"^2 is ^1DOMINATING^2 with ^120 ^2kills in a row!");
			self thread dohud("^2You're ^1DOMINATING!", "dominating");
		}
		else if(self.kill_spree == 30)
		{
			wait 0.9;
 			iprintln(self.name +"^2 is ^1UNSTOPPABLE^2 with ^130 ^2kills in a row!");
			self thread dohud("^2You're ^1UNSTOPPABLE!", "unstoppable");
		}
		else if(self.kill_spree == 50)
		{
			wait 0.9;
 			iprintln(self.name +"^2 is ^1SLAUGHTERING^2 with ^150 ^2kills in a row!");
			self thread dohud("^2You're ^1SLAUGHTERING!", "slaughter");
		}
		else if(self.kill_spree == 100)
		{
			wait 0.9;
  			iprintln(self.name +" ^2is a ^1MONSTER^2 with ^1100 ^2kills in a row!");
			self thread dohud("^1MONSTER KILLER!", "monster");
		}
		else if(self.kill_spree == 250)
		{
			wait 0.9;
 			iprintln("^1Mega Kill! ^7"+ self.name +" ^2has ^1250 ^2kills in a row!");
			self thread dohud("^1Mega Kill!", "holyshit");
		}
		else if(self.kill_spree == 500)
		{
			wait 0.9;
			iprintln(self.name +"^2 is ^1GODLIKE^2 with ^1500 ^2kills in a row!");
			self thread dohud("^1GOD LIKE!", "godlike");
		}
	}
}

check_for_endoframpage(eInflictor,attacker)
{
	if(getDvarInt("btd_killsprees") == 1)
	{	
		if(!isDefined(eInflictor) || isPlayer(eInflictor) || !isDefined(eInflictor.targetname) || (isDefined(eInflictor.targetname) && eInflictor.targetname != "zom"))
		{
			if(!isDefined(attacker) || (isDefined(attacker) && !isPlayer(attacker)))
				attacker = self;
		}

		attacker = eInflictor;

		if(self.kill_spree >= 5 && self.kill_spree <= 10)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1KILLING SPREE");
				self thread dohud(attacker.name + " ^2Ended your ^1KILLING SPREE!", "doh");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1KILLING SPREE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1KILLING SPREE");
				self thread dohud("^2You ended your own ^1KILLING SPREE!", "doh");
			}
		}
		else if(self.kill_spree >= 10 && self.kill_spree <= 20)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1RAMPAGE");
				self thread dohud(attacker.name + " ^2Ended your ^1RAMPAGE!", "endit");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1RAMPAGE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1RAMPAGE");
				self thread dohud("^2You ended your own ^1RAMPAGE!", "endit");
			}
		}
		else if(self.kill_spree >= 20 && self.kill_spree <= 30)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1DOMINATION");
				self thread dohud(attacker.name + " ^2Ended your ^1DOMINATION!", "hallelujah");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1DOMINATION!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1DOMINATION");
				self thread dohud("^2You ended your own ^1DOMINATION!", "hallelujah");
			}
		}
		else if(self.kill_spree >= 30 && self.kill_spree <= 50)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1UNSTOPPABLE KILLING SPREE!");
				self thread dohud(attacker.name + " ^2Ended your ^1UNSTOPPABLE KILLING SPREE!", "killspree_end");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1UNSTOPPABLE KILLING SPREE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1UNSTOPPABLE KILLING SPREE");
				self thread dohud("^2You ended your own ^1UNSTOPPABLE KILLING SPREE!", "killspree_end");
			}
		}
		else if(self.kill_spree >= 50 && self.kill_spree <= 100)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1SLAUGHTERING KILLING SPREE!");
				self thread dohud(attacker.name + " ^2Ended your ^1SLAUGHTERING KILLING SPREE!", "hallelujah");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1SLAUGHTERING KILLING SPREE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1SLAUGHTERING KILLING SPREE");
				self thread dohud("^2You ended your own ^1SLAUGHTERING KILLING SPREE!", "hallelujah");
			}
		}
		else if(self.kill_spree >= 100 && self.kill_spree <= 250)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1MONSTER KILLING SPREE!");
				self thread dohud(attacker.name + " ^2Ended your ^1MONSTER KILLING SPREE!", "hallelujah");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1MONSTER SLAUGHTERING KILLING SPREE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1MONSTER SLAUGHTERING KILLING SPREE");
				self thread dohud("^2You ended your own ^1MONSTER SLAUGHTERING KILLING SPREE!", "hallelujah");
			}
		}
		else if(self.kill_spree >= 250 && self.kill_spree <= 500)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1MEGA KILL KILLING SPREE!");
				self thread dohud(attacker.name + " ^2Ended your ^1MEGA KILL KILLING SPREE!", "hallelujah");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1MEGA KILL KILLING SPREE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1MEGA KILL KILLING SPREE");
				self thread dohud("^2You ended your own ^1MEGA KILL KILLING SPREE!", "hallelujah");
			}
		}
		else if(self.kill_spree >= 500)
		{
			if(attacker != self)
			{
				iprintln(attacker.name + " ^1Has Ended^7 " + self.name + "'s ^1GOD LIKE KILLING SPREE!");
				self thread dohud(attacker.name + " ^2Ended your ^1GOD LIKE KILLING SPREE!", "hallelujah");
				attacker thread dohud("^2You ended ^7" + self.name + "'s ^1GOD LIKE SLAUGHTERING KILLING SPREE!");
			}
			else
			{
				iprintln(self.name + " ^2Ended his own ^1GOD LIKE KILLING SPREE");
				self thread dohud("^2You ended your own ^1GOD LIKE KILLING SPREE!", "hallelujah");
			}
		}

		self.kill_spree = 0;
	}
}