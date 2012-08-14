//================================================================================================
// File Name  : _laser.gsc 
// File Info  : Should the players laser be on or not.
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : Abney Park
//================================================================================================


//================================================================================================
// Player Laser Thread
//================================================================================================
laser()
{
	self endon("disconnect");
	self endon("joined_spectators");
	self endon("death");	
	
	self.my_old_weapon = "";	
		
	while(1)
	{		
		self.my_curr_weapon = self getCurrentWeapon();
		
		if(self.my_curr_weapon != self.my_old_weapon)
		{		
			if(self.laseron)
			{
				if(getDvarInt("btd_client_lasers") == 1)
				{
					self setClientDvar("cg_laserforceon",1);
				}
				else if(getDvarInt("btd_client_lasers") == 2)
				{				
					if(self checklaser() == true)
					{
						self setClientDvar("cg_laserforceon",1);
					}
					else
					{
						self setClientDvar("cg_laserforceon",0);
					}
				
					my_old_weapon = self getCurrentWeapon();				
				}
			}
			else 
			{
				self setClientDvar("cg_laserforceon",0);
			}
		}
		
		wait 0.1;
	}
} 

checklaser()
{
	self.my_curr_weapon = self getCurrentWeapon();
	
	if( self.my_curr_weapon == "winchester1200_reflex_mp" ||  self.my_curr_weapon == "winchester1200_mp" ||  self.my_curr_weapon == "winchester1200_grip_mp" ||
		self.my_curr_weapon == "m1014_reflex_mp" ||  self.my_curr_weapon == "m1014_mp" ||  self.my_curr_weapon == "m1014_grip_mp" ||  
		self.my_curr_weapon == "m4_silencer_mp" ||  self.my_curr_weapon == "m4_reflex_mp" ||  self.my_curr_weapon == "m4_mp" ||  self.my_curr_weapon == "m4_gl_mp" || self.my_curr_weapon == "m4_acog_mp" ||
		self.my_curr_weapon == "m16_silencer_mp" ||  self.my_curr_weapon == "m16_reflex_mp" ||  self.my_curr_weapon == "m16_mp" ||  self.my_curr_weapon == "m16_gl_mp" || self.my_curr_weapon == "m16_acog_mp" ||
		self.my_curr_weapon == "g3_silencer_mp" ||  self.my_curr_weapon == "g3_reflex_mp" ||  self.my_curr_weapon == "g3_mp" ||  self.my_curr_weapon == "g3_gl_mp" || self.my_curr_weapon == "g3_acog_mp" ||
		self.my_curr_weapon == "g36c_silencer_mp" ||  self.my_curr_weapon == "g36c_reflex_mp" ||  self.my_curr_weapon == "g36c_mp" ||  self.my_curr_weapon == "g36c_gl_mp" || self.my_curr_weapon == "g36c_acog_mp" ||
		self.my_curr_weapon == "p90_silencer_mp" ||  self.my_curr_weapon == "p90_reflex_mp" ||  self.my_curr_weapon == "p90_mp" ||  self.my_curr_weapon == "p90_acog_mp" ||
		self.my_curr_weapon == "mp5_silencer_mp" ||  self.my_curr_weapon == "mp5_reflex_mp" ||  self.my_curr_weapon == "mp5_mp" ||  self.my_curr_weapon == "mp5_acog_mp" ||
		self.my_curr_weapon == "usp_mp" ||  self.my_curr_weapon == "usp_silencer_mp" )
	{		
		return true; // yes laser is allowed	
	}
	else
	{
		return false; // no laser not allowed
	}
}




 