//===========================================================================================================================================
// Zoom Mod etited by [WJF]AbneyPark - wjf-clan.xippy.co.uk
//===========================================================================================================================================
// I did not create this but the author was unkown, it was downloaded from MapsNMods.org
// However most of the code had to be rewritten to make it work and to add extra features 

// This revision of the mod uses the Melee key to zoom in and the ThrowFragGrenade key to zoom out

// for those of you that dont know, // is the start of a comment :p

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{
	//self setClientDvar("cg_thirdperson",0);	

	self.zoomtextstring = "MELEE = zoom in / FRAG = zoom out";
	self.zoom_0_string = "1x";
	self.zoom_1_string = "2x";
	self.zoom_2_string = "4x";
	self.zoom_3_string = "8x";
	self.zoom_4_string = "16x";
	self.zoom_5_string = "22x";
	self.zoom_6_string = "28x";  
	self.zoom_7_string = "34x";
	
	if(getDvarInt("scr_disable_info_text") == 1) // info text disabled
	{ 
		self.zoomtextstring = "";
	}
	
	if(getDvarInt("scr_disable_zoom_text") == 1) // zoom text disabled
	{ 
		self.zoom_0_string = "";
		self.zoom_1_string = "";
		self.zoom_2_string = "";
		self.zoom_3_string = "";
		self.zoom_4_string = "";
		self.zoom_5_string = "";
		self.zoom_6_string = ""; 
		self.zoom_7_string = "";	
	}	
	
	// this is here for a good reason do not move it to setup zoom.
	// gets the number of nades the player has on spawn
	self.frag_count = undefined;
	self.frag_count = self getammocount("frag_grenade_mp");	
	self.wasthridperson = false;	
	
	// calls Setup_zoom method
	Setup_zoom(self.frag_count);
}

// cheacks which weapon the player has chosen
Check_scoped_weapon()
{
	my_curr_weapon = self getCurrentWeapon();	
	
	if ( my_curr_weapon == "m40a3_mp" )
		return 1;
	else
	if ( my_curr_weapon == "m21_mp" )
		return 2;
	else
	if ( my_curr_weapon == "dragunov_mp" )
		return 3;
	else
	if ( my_curr_weapon == "remington700_mp" )
		return 4;
	else
	if ( my_curr_weapon == "barrett_mp" )
		return 5;
	else	
		return 0;                    
}

// sets the font for display on the screen

Write_message_to_hud(state)
{   
	if (state == 1) return 0;
	
// ===== Info Text =====

	//set default to cyan incase the dvar is not set
	ht1 = 0.000; ht2 = 1.000; ht3 = 1.000;

	// reads from the dvar changing to the specified colour	

	if(getDvarInt("scr_info_text") == 1) // red
	{ ht1 = 1.000; ht2 = 0.000; ht3 = 0.000; }

	if(getDvarInt("scr_info_text") == 2) // green
	{ ht1 = 0.150; ht2 = 0.550; ht3 = 0.150; }

	if(getDvarInt("scr_info_text") == 3) // yellow
	{ ht1 = 1.000; ht2 = 1.000; ht3 = 0.000; }

	if(getDvarInt("scr_info_text") == 4) // blue
	{ ht1 = 0.000; ht2 = 0.000; ht3 = 1.000; }

	if(getDvarInt("scr_info_text") == 5) // cyan
	{ ht1 = 0.000; ht2 = 1.000; ht3 = 1.000; }

	if(getDvarInt("scr_info_text") == 6) // pink
	{ ht1 = 1.000; ht2 = 0.735; ht3 = 0.796; }

	if(getDvarInt("scr_info_text") == 7) // white
	{ ht1 = 1.000; ht2 = 1.000; ht3 = 1.000; }	

	if(getDvarInt("scr_info_text") == 8) // black
	{ ht1 = 0.000; ht2 = 0.000; ht3 = 0.000; }

	self.zoomtext = NewClientHudElem(self); 
	self.zoomtext.color = (ht1,ht2,ht3);
	self.zoomtext.alignX = "right";
	self.zoomtext.alignY = "top";
	self.zoomtext.x = 418;
	self.zoomtext.y = 32;
	self.zoomtext.archived = true;
	self.zoomtext.fontScale = 1.4; 
	self.zoomtext.alpha = 1;
	self.zoomtext setText( self.zoomtextstring );
	
// ===== Start Zoom Text =====

	self.zoom_0_text = NewClientHudElem(self);
	self.zoom_0_text.alignX = "right";
	self.zoom_0_text.alignY = "top";
	self.zoom_0_text.x = 175;
	self.zoom_0_text.y = 48;
	self.zoom_0_text.archived = true;
	self.zoom_0_text.fontScale = 1.4;
	self.zoom_0_text.alpha = 1;
	self.zoom_0_text setText( self.zoom_0_string );

	self.zoom_1_text = NewClientHudElem(self);
	self.zoom_1_text.alignX = "right";
	self.zoom_1_text.alignY = "top";
	self.zoom_1_text.x = 220;
	self.zoom_1_text.y = 48;
	self.zoom_1_text.archived = true;
	self.zoom_1_text.fontScale = 1.4;
	self.zoom_1_text.alpha = 1;
	self.zoom_1_text setText( self.zoom_1_string );

	self.zoom_2_text = NewClientHudElem(self);
	self.zoom_2_text.alignX = "right";
	self.zoom_2_text.alignY = "top";
	self.zoom_2_text.x = 265;
	self.zoom_2_text.y = 48;
	self.zoom_2_text.archived = true;
	self.zoom_2_text.fontScale = 1.4;
	self.zoom_2_text.alpha = 1;
	self.zoom_2_text setText( self.zoom_2_string );

	self.zoom_3_text = NewClientHudElem(self);
	self.zoom_3_text.alignX = "right";
	self.zoom_3_text.alignY = "top";
	self.zoom_3_text.x = 310;
	self.zoom_3_text.y = 48;
	self.zoom_3_text.archived = true;
	self.zoom_3_text.fontScale = 1.4;
	self.zoom_3_text.alpha = 1;
	self.zoom_3_text setText( self.zoom_3_string );

	self.zoom_4_text = NewClientHudElem(self);
	self.zoom_4_text.alignX = "right";
	self.zoom_4_text.alignY = "top";
	self.zoom_4_text.x = 355;
	self.zoom_4_text.y = 48;
	self.zoom_4_text.archived = true;
	self.zoom_4_text.fontScale = 1.4;
	self.zoom_4_text.alpha = 1;
	self.zoom_4_text setText( self.zoom_4_string );

	self.zoom_5_text = NewClientHudElem(self);
	self.zoom_5_text.alignX = "right";
	self.zoom_5_text.alignY = "top";
	self.zoom_5_text.x = 400;
	self.zoom_5_text.y = 48;
	self.zoom_5_text.archived = true;
	self.zoom_5_text.fontScale = 1.4;
	self.zoom_5_text.alpha = 1;
	self.zoom_5_text setText( self.zoom_5_string );

	self.zoom_6_text = NewClientHudElem(self);
	self.zoom_6_text.alignX = "right";
	self.zoom_6_text.alignY = "top";
	self.zoom_6_text.x = 445;
	self.zoom_6_text.y = 48;
	self.zoom_6_text.archived = true;
	self.zoom_6_text.fontScale = 1.4;
	self.zoom_6_text.alpha = 1;
	self.zoom_6_text setText( self.zoom_6_string );

	self.zoom_7_text = NewClientHudElem(self);
	self.zoom_7_text.alignX = "right";
	self.zoom_7_text.alignY = "top";
	self.zoom_7_text.x = 490;
	self.zoom_7_text.y = 48; 
	self.zoom_7_text.archived = true;
	self.zoom_7_text.fontScale = 1.4;
	self.zoom_7_text.alpha = 1;
	self.zoom_7_text setText( self.zoom_7_string );
}

// changes the colour of the selected zoom factor depending on the setting of the Dvar
Update_active_zoom(act_num)
{
self.zoomtext setText( self.zoomtextstring );

// ===== Update Zoom Text =====

	//set default to white incase the dvar is not set
	uzt1 = 1.000; uzt2 = 1.000; uzt3 = 1.000;
	
	// reads from the dvar changing to the specified colour	

	if(getDvarInt("scr_zoom_text") == 1) // red
	{ uzt1 = 1.000; uzt2 = 0.000; uzt3 = 0.000; }

	if(getDvarInt("scr_zoom_text") == 2) // green
	{ uzt1 = 0.150; uzt2 = 0.550; uzt3 = 0.150; }

	if(getDvarInt("scr_zoom_text") == 3) // yellow
	{ uzt1 = 1.000; uzt2 = 1.000; uzt3 = 0.000; }

	if(getDvarInt("scr_zoom_text") == 4) // blue
	{ uzt1 = 0.000; uzt2 = 0.000; uzt3 = 1.000; }

	if(getDvarInt("scr_zoom_text") == 5) // cyan
	{ uzt1 = 0.000; uzt2 = 1.000; uzt3 = 1.000; }

	if(getDvarInt("scr_zoom_text") == 6) // pink
	{ uzt1 = 1.000; uzt2 = 0.735; uzt3 = 0.796; }

	if(getDvarInt("scr_zoom_text") == 7) // white
	{ uzt1 = 1.000; uzt2 = 1.000; uzt3 = 1.000; }	
	
	if(getDvarInt("scr_zoom_text") == 8) // black
	{ uzt1 = 0.000; uzt2 = 0.000; uzt3 = 0.000; }

	self.zoom_0_text.color = (uzt1,uzt2,uzt3);
	self.zoom_1_text.color = (uzt1,uzt2,uzt3);
	self.zoom_2_text.color = (uzt1,uzt2,uzt3);
	self.zoom_3_text.color = (uzt1,uzt2,uzt3);
	self.zoom_4_text.color = (uzt1,uzt2,uzt3);
	self.zoom_5_text.color = (uzt1,uzt2,uzt3);
	self.zoom_6_text.color = (uzt1,uzt2,uzt3);
	self.zoom_7_text.color = (uzt1,uzt2,uzt3);

// ===== Zoom Highlight Text =====

	//set default to blue incase the dvar is not set
	zht1 = 0.000; zht2 = 0.000; zht3 = 1.000;

	// reads from the dvar changing to the specified colour
	
	if(getDvarInt("scr_zoom_highlight_text") == 1) // red
	{ zht1 = 1.000; zht2 = 0.000; zht3 = 0.000; }
	
	if(getDvarInt("scr_zoom_highlight_text") == 2) // green
	{ zht1 = 0.150; zht2 = 0.550; zht3 = 0.150; }

	if(getDvarInt("scr_zoom_highlight_text") == 3) // yellow
	{ zht1 = 1.000; zht2 = 1.000; zht3 = 0.000; }

	if(getDvarInt("scr_zoom_highlight_text") == 4) // blue
	{ zht1 = 0.000; zht2 = 0.000; zht3 = 1.000; }

	if(getDvarInt("scr_zoom_highlight_text") == 5) // cyan
	{ zht1 = 0.000; zht2 = 1.000; zht3 = 1.000; }

	if(getDvarInt("scr_zoom_highlight_text") == 6) // pink
	{ zht1 = 1.000; zht2 = 0.735; zht3 = 0.796; }

	if(getDvarInt("scr_zoom_highlight_text") == 7) // white
	{ zht1 = 1.000; zht2 = 1.000; zht3 = 1.000; }	
	
	if(getDvarInt("scr_zoom_highlight_text") == 8) // black
	{ zht1 = 0.000; zht2 = 0.000; zht3 = 0.000; }

	if (act_num == 0)
	self.zoom_0_text.color = (zht1,zht2,zht3);
	else if (act_num == 1)
	self.zoom_1_text.color = (zht1,zht2,zht3);
	else if (act_num == 2)
	self.zoom_2_text.color = (zht1,zht2,zht3);
	else if (act_num == 3)
	self.zoom_3_text.color = (zht1,zht2,zht3);
	else if (act_num == 4)
	self.zoom_4_text.color = (zht1,zht2,zht3);
	else if (act_num == 5)
	self.zoom_5_text.color = (zht1,zht2,zht3);
	else if (act_num == 6)
	self.zoom_6_text.color = (zht1,zht2,zht3);
	else if (act_num == 7)
	self.zoom_7_text.color = (zht1,zht2,zht3);
}

Destroy_newhudel()
{
	self.zoomtext destroy();
	self.zoom_0_text destroy();
	self.zoom_1_text destroy();
	self.zoom_2_text destroy(); 
	self.zoom_3_text destroy();
	self.zoom_4_text destroy();
	self.zoom_5_text destroy();
	self.zoom_6_text destroy();
	self.zoom_7_text destroy();
}

Update_Zoom_Fov(sniper_zoom_mode)
{
	if (sniper_zoom_mode == 0)   {self setclientDvar ("cg_fovmin", "51");}   else
	if (sniper_zoom_mode == 1)   {self setclientDvar ("cg_fovmin", "40");}   else
	if (sniper_zoom_mode == 2)   {self setclientDvar ("cg_fovmin", "30");}   else
	if (sniper_zoom_mode == 3)   {self setclientDvar ("cg_fovmin", "20");}   else
	if (sniper_zoom_mode == 4)   {self setclientDvar ("cg_fovmin", "11");}   else
	if (sniper_zoom_mode == 5)   {self setclientDvar ("cg_fovmin", "7");}    else
	if (sniper_zoom_mode == 6)   {self setclientDvar ("cg_fovmin", "4");}    else
	if (sniper_zoom_mode == 7)   {self setclientDvar ("cg_fovmin", "1");}
}

Setup_zoom(frag_count)
{
	self endon("disconnect");
	self endon("death");
	self endon("joined_spectators");
	self endon("killed_player");

	if(isdefined(self.zoomtext)){Destroy_newhudel();} 
	if(isdefined(self.zoom_0_text)){Destroy_newhudel();} //just to secure
	if(isdefined(self.zoom_1_text)){Destroy_newhudel();} //just to secure
	if(isdefined(self.zoom_2_text)){Destroy_newhudel();} //just to secure	

	//******** initialize zoom ********
	
	messagestate = 0;
	press_use_text_showed_rifle = 0;
	sniper_zoom_switch_wait = 0;
	sniper_zoom_mode = 0;	
	
	// default zoom for each weapon
	sniper_zoom_mode_m40a3 = 4;
	sniper_zoom_mode_m21 = 4;
	sniper_zoom_mode_drag = 4;
	sniper_zoom_mode_r700 = 4;
	sniper_zoom_mode_m82 = 4;	
	
	// to be able to remember the ads count for each weapon
	m40a3_ads_count = 1;
	m21_ads_count = 1;
	drag_ads_count = 1;
	r700_ads_count = 1;
	m82_ads_count = 1;

	if(Check_scoped_weapon() != 0)
	{	
		self setclientDvar ("cg_fovmin", "20");
	}
	
	while(1)
	{
		if(isDefined(self.scopeoverlay))
		{self.scopeoverlay destroy();}

		startZoom = 4;	
		minZoom = 1;
		maxZoom = 6;		

		if (Check_scoped_weapon() == 1) // M40A3
		{
			startZoom = getDvarInt("scr_m40a3_start_zoom");	
			minZoom = getDvarInt("scr_m40a3_min_zoom");	
			maxZoom = getDvarInt("scr_m40a3_max_zoom");
		}
		if (Check_scoped_weapon() == 2) // M21
		{
			startZoom = getDvarInt("scr_m21_start_zoom");
			minZoom = getDvarInt("scr_m21_min_zoom");	
			maxZoom = getDvarInt("scr_m21_max_zoom");
		}
		if (Check_scoped_weapon() == 3) // DRAGUNOV
		{
			startZoom = getDvarInt("scr_drag_start_zoom");
			minZoom = getDvarInt("scr_drag_min_zoom");	
			maxZoom = getDvarInt("scr_drag_max_zoom");
		}
		if (Check_scoped_weapon() == 4) // REMINGTON 700
		{
			startZoom = getDvarInt("scr_r700_start_zoom");			
			minZoom = getDvarInt("scr_r700_min_zoom");	 
			maxZoom = getDvarInt("scr_r700_max_zoom");
		}
		if (Check_scoped_weapon() == 5) // BARRETT 50.CAL
		{
			startZoom = getDvarInt("scr_m82_start_zoom");			
			minZoom = getDvarInt("scr_m82_min_zoom");	
			maxZoom = getDvarInt("scr_m82_max_zoom");
		}	
		
		// converts from dvar values to values used in script
		// using 0 in the dvars created a few issues and caused the zoom to break slightly

		startZoom = startZoom - 1;
		minZoom = minZoom - 1;
		maxZoom = maxZoom - 1;			

		// just a few checks to make sure the zoom dosnt screw up when configs are out of bounds or zoom config is missing
		
		if (minZoom > maxZoom) // minZoom cannot be greater than maxZoom
		{
			// reverts to default settings
			minZoom =0;
			maxZoom =7;	
		}
		if (maxZoom < minZoom) // maxZoom can not be less than minZoom
		{
			// reverts to default settings
			minZoom =0;
			maxZoom =7;
		}
		if (maxZoom == minZoom) // Zoom would be disabled
		{
			// makes sure startZoom is same as maxZoom
			startZoom = maxZoom;
			
			// changes text apearing on screen
			self.zoomtextstring = "Sorry Zoom Feature Has Been Disabled";
			
			if(getDvarInt("scr_disable_info_text") == 1) // info text disabled
			{ 
				self.zoomtextstring = "";
			}
			
			self.zoom_0_string = "";
			self.zoom_1_string = "";
			self.zoom_2_string = "";
			self.zoom_3_string = "";
			self.zoom_4_string = "";
			self.zoom_5_string = "";
			self.zoom_6_string = ""; 
			self.zoom_7_string = "";
		}
		if (startZoom < minZoom) // startZoom cannot be less that minZoom
		{		
			startZoom = minZoom;
		}	

		// only when scope is first lifted
		if ((Check_scoped_weapon() == 1) && (m40a3_ads_count == 1))
		{
			sniper_zoom_mode_m40a3 = startZoom;
		}
		if ((Check_scoped_weapon() == 2) && (m21_ads_count == 1))
		{
			sniper_zoom_mode_m21 = startZoom;
		}
		if ((Check_scoped_weapon() == 3) && (drag_ads_count == 1))
		{ 
			sniper_zoom_mode_drag = startZoom;
		}
		if ((Check_scoped_weapon() == 4) && (r700_ads_count == 1))
		{
			sniper_zoom_mode_r700 = startZoom;
		} 
		if ((Check_scoped_weapon() == 5) && (m82_ads_count == 1))
		{
			sniper_zoom_mode_m82 = startZoom;
		}
		
		//if the frag key is pressed while not ads, gets current nades remaining
		if (self FragButtonPressed() &&  (self playerADS() == 0))
		{			
			self.frag_count = self getammocount("frag_grenade_mp");	
			//self.frag_count = self.frag_count - 1;			
		}
		
		//******** settings for rifle zoom ********

		if ( (self ADSButtonPressed()) && (self playerADS() == 1) && (Check_scoped_weapon() !=0))
		{	
			if(self.thirdperson == true)
			{
				self.wasthridperson = true;				
				self setClientDvar("cg_thirdperson",0);				
			}
			
			if (Check_scoped_weapon() == 1) 
			{ 
				sniper_zoom_mode = sniper_zoom_mode_m40a3;
				m40a3_ads_count = 2;
			}
			if (Check_scoped_weapon() == 2) 
			{ 
				sniper_zoom_mode = sniper_zoom_mode_m21; 
				m21_ads_count = 2;
			}
			if (Check_scoped_weapon() == 3) 
			{ 
				sniper_zoom_mode = sniper_zoom_mode_drag;
				drag_ads_count = 2;
			}
			if (Check_scoped_weapon() == 4) 
			{ 
				sniper_zoom_mode = sniper_zoom_mode_r700;
				r700_ads_count = 2;
			}
			if (Check_scoped_weapon() == 5) 
			{ 
				sniper_zoom_mode = sniper_zoom_mode_m82;
				m82_ads_count = 2;
			}							
		
			// check that the zoomtext isn't showed every loop
			if (press_use_text_showed_rifle != 1) 	 
			{									
				Update_Zoom_Fov(sniper_zoom_mode);
				thread Write_message_to_hud(press_use_text_showed_rifle);
				press_use_text_showed_rifle = 1;
				Update_active_zoom(sniper_zoom_mode);
			}			
			
			// sets the frag grenade ammo to 0 while using a scoped weapon
			self setWeaponAmmoStock( "frag_grenade_mp", 0);
			self setWeaponAmmoStock( "frag_grenade_short_mp", 0);
			self.fragstaken = true;
			
			//******** zoom in (melee) ********
 
			if ( self MeleeButtonPressed() && (sniper_zoom_switch_wait == 0) )
			{
				sniper_zoom_mode = sniper_zoom_mode +1;

				if (sniper_zoom_mode <= minZoom) {sniper_zoom_mode = minZoom;}
				if (sniper_zoom_mode >= maxZoom) {sniper_zoom_mode = maxZoom;}				
						
				Update_Zoom_Fov(sniper_zoom_mode);
				Update_active_zoom(sniper_zoom_mode);
				
				// for rifles to retain zoom factors
				if (Check_scoped_weapon() == 1) 
				{ sniper_zoom_mode_m40a3 = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 2) 
				{ sniper_zoom_mode_m21 = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 3) 
				{ sniper_zoom_mode_drag = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 4) 
				{ sniper_zoom_mode_r700 = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 5) 
				{ sniper_zoom_mode_m82 = sniper_zoom_mode; }	
				
				sniper_zoom_switch_wait = 1;
				
				wait 0.05;
			}
						
			//check for the release of the Melee button
			if (self MeleeButtonPressed() == 0) 
			{
				sniper_zoom_switch_wait = 0;
			}
				
			//******** zoom out (throw frag grenade) ********

			if (self FragButtonPressed() && (sniper_zoom_switch_wait == 0) )
			{
				sniper_zoom_mode = sniper_zoom_mode -1;

				if (sniper_zoom_mode <= minZoom) {sniper_zoom_mode = minZoom;}
				if (sniper_zoom_mode >= maxZoom) {sniper_zoom_mode = maxZoom;}
									
				Update_Zoom_Fov(sniper_zoom_mode);
				Update_active_zoom(sniper_zoom_mode);
				
				// for rifles to retain zoom factors
				if (Check_scoped_weapon() == 1) 
				{ sniper_zoom_mode_m40a3 = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 2) 
				{ sniper_zoom_mode_m21 = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 3)  
				{ sniper_zoom_mode_drag = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 4) 
				{ sniper_zoom_mode_r700 = sniper_zoom_mode; }
				if (Check_scoped_weapon() == 5) 
				{ sniper_zoom_mode_m82 = sniper_zoom_mode; }
					
				wait 0.05;
			}
			 
			//check for the release of the Frag button
			if (self FragButtonPressed() == 0)  
			{
				sniper_zoom_switch_wait = 0;				
			}		
		}
		else
		{
			if(self.wasthridperson == true)
			{
				self.wasthridperson = false;				
				self setClientDvar("cg_thirdperson",1);	
				self.thirdperson = true;
			}
		
			// sets the players frag grenade count back to how many they had 
			if(isDefined(self.fragstaken))
			{				
				self setWeaponAmmoStock( "frag_grenade_mp", self.frag_count);
				self setWeaponAmmoStock( "frag_grenade_short_mp", self.frag_count);
				self.fragstaken = undefined;
			}
			
			if (press_use_text_showed_rifle == 1) 
			{
				Destroy_newhudel();
				press_use_text_showed_rifle = 0;
			}			
		}	

		//******** end setzoom ********
		
		if(Check_scoped_weapon() == 0){self setclientDvar ("cg_fovmin", "10");}
		
		wait 0.001;
	}	
	
}