//================================================================================================
// File Name  : _multikill.gsc 
// File Info  : Plays and displayes multikil sounds / messages
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R
//================================================================================================

#include btd_general\_hud_util;

multikill()
{
	if(getDvarInt("btd_multikill") == 1)
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
}