#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include btd_general\_dvardef;

init()
{
	// start of oldschool loadout -----------------------------------------------------------------

	oldschoolWeaponPrimary = getDvar("btd_oldschool_primary");	
	oldschoolWeaponSecondary = getDvar("btd_oldschool_Secondary");
	
	if(!checksub(oldschoolWeaponPrimary))
	{
		oldschoolWeaponPrimary = "mp5_mp";
	}	
	if(!checkpistol(oldschoolWeaponSecondary))
	{
		oldschoolWeaponSecondary = "usp_mp";
	}

	//Default oldschool loadout
	oldschoolLoadout = spawnstruct();	
	oldschoolLoadout.primaryWeapon = oldschoolWeaponPrimary;	
	oldschoolLoadout.secondaryWeapon = oldschoolWeaponSecondary;	
	oldschoolLoadout.inventoryWeapon = "";
	oldschoolLoadout.inventoryWeaponAmmo = 0;	
	//grenade types: "", "frag", "smoke", "flash"
	oldschoolLoadout.grenadeTypePrimary = "frag";
	oldschoolLoadout.grenadeCountPrimary = 1;	
	oldschoolLoadout.grenadeTypeSecondary = "";
	oldschoolLoadout.grenadeCountSecondary = 0;	
	
	// start of pistol only loadout --------------------------------------------------------------
	
	pistolWeaponPrimary = getDvar("btd_pistol_primary");	
	pistolWeaponSecondary = getDvar("btd_pistol_secondary");
	getDvarInt("btd_pistol_frag");
	
	if(!checkpistol(pistolWeaponPrimary) || pistolWeaponPrimary == pistolWeaponSecondary)
	{
		pistolWeaponPrimary = "deserteagle_mp";
	}		
	if(!checkpistol(pistolWeaponSecondary) || pistolWeaponSecondary == pistolWeaponPrimary )
	{
		pistolWeaponSecondary = "usp_mp";
	}
	
	// New pistol only loadout
	pistolLoadout = spawnstruct();	
	pistolLoadout.primaryWeapon = pistolWeaponPrimary;	
	pistolLoadout.secondaryWeapon = pistolWeaponSecondary;	
	pistolLoadout.inventoryWeapon = "";
	pistolLoadout.inventoryWeaponAmmo = 0;	
	//grenade types: "", "frag", "smoke", "flash"
	if(getDvarInt("btd_pistol_frags") == 1)
	{
		pistolLoadout.grenadeTypePrimary = "frag";
	}
	else
	{
		pistolLoadout.grenadeTypePrimary = "";
	}
	pistolLoadout.grenadeCountPrimary = 1;	
	pistolLoadout.grenadeTypeSecondary = "";
	pistolLoadout.grenadeCountSecondary = 0;
	
	// set correct loadout ----------------------------------------------------------------------	
	
	if(level.pistolonly)
	{
		level.oldschoolLoadout = pistolLoadout;	
	}
	else
	{
		level.oldschoolLoadout = oldschoolLoadout;	
	}
}

giveLoadout()
{
	assert( isdefined( level.oldschoolLoadout ) );
	
	loadout = level.oldschoolLoadout;
	
	primaryTokens = strtok( loadout.primaryWeapon, "_" );
	self.pers["primaryWeapon"] = primaryTokens[0];
	
	self maps\mp\gametypes\_teams::playerModelForWeapon( self.pers["primaryWeapon"] );		
	
	self GiveWeapon( loadout.primaryWeapon );
	self giveStartAmmo( loadout.primaryWeapon );
	self setSpawnWeapon( loadout.primaryWeapon );
	
	// give secondary weapon
	self GiveWeapon( loadout.secondaryWeapon );
	self giveStartAmmo( loadout.secondaryWeapon );
	
	self SetActionSlot( 1, "nightvision" );
	
	if ( loadout.inventoryWeapon != "" )
	{
		self GiveWeapon( loadout.inventoryWeapon );
		self maps\mp\gametypes\_class::setWeaponAmmoOverall( loadout.inventoryWeapon, loadout.inventoryWeaponAmmo );
		
		self.inventoryWeapon = loadout.inventoryWeapon;
		
		self SetActionSlot( 3, "weapon", loadout.inventoryWeapon );
		self SetActionSlot( 4, "" );
	}
	else
	{
		self SetActionSlot( 3, "altMode" );
		self SetActionSlot( 4, "" );
	}
	
	if ( loadout.grenadeTypePrimary != "" )
	{
		grenadeTypePrimary = level.weapons[ loadout.grenadeTypePrimary ];
		
		self GiveWeapon( grenadeTypePrimary );
		self SetWeaponAmmoClip( grenadeTypePrimary, loadout.grenadeCountPrimary );
		self SwitchToOffhand( grenadeTypePrimary );
	}
	
	if ( loadout.grenadeTypeSecondary != "" )
	{
		grenadeTypeSecondary = level.weapons[ loadout.grenadeTypeSecondary ];
		
		if ( grenadeTypeSecondary == level.weapons["flash"])
			self setOffhandSecondaryClass("flash");
		else
			self setOffhandSecondaryClass("smoke");
		
		self giveWeapon( grenadeTypeSecondary );
		self SetWeaponAmmoClip( grenadeTypeSecondary, loadout.grenadeCountSecondary );
	}
}

/*
onPlayerConnect()
{
	for(;;)
	{
		level waittill ( "connecting", player );

		player thread onPlayerSpawned();
	}
}


onPlayerSpawned()
{
	self endon( "disconnect" );

	for(;;)
	{
		self waittill( "spawned_player" );
		
		self.inventoryWeapon = undefined;
		
		self clearPerks();
		self.numPerks = 0;
		self thread clearPerksOnDeath();
		
		self thread watchWeaponsList();
	}
}

clearPerksOnDeath()
{
	self endon("disconnect");
	self waittill("death");
	
	self clearPerks();
	for ( i = 0; i < self.numPerks; i++ )
	{
		self hidePerk( i, 0.05 );
	}
	self.numPerks = 0;
}

watchWeaponsList()
{
	self endon("death");
	
	waittillframeend;
	
	self.weapons = self getWeaponsList();
	
	for(;;)
	{
		self waittill( "weapon_change", newWeapon );
		
		self thread updateWeaponsList( .05 );
	}
}

updateWeaponsList( delay )
{
	self endon("death");
	self notify("updating_weapons_list");
	self endon("updating_weapons_list");
	
	self.weapons = self getWeaponsList();
}

hadWeaponBeforePickingUp( newWeapon )
{
	for ( i = 0; i < self.weapons.size; i++ )
	{
		if ( self.weapons[i] == newWeapon )
			return true;
	}
	return false;
}

*/

checkpistol( weapon )
{	
	if( weapon == "barreta_mp" ||  weapon == "beretta_silencer_mp" || 
		weapon == "colt45_mp" ||  weapon == "colt45_silencer_mp" || 
		weapon == "usp_mp" ||  weapon == "usp_silencer_mp" || 
		weapon == "deaserteagle_mp" || weapon == "deaserteaglegold_mp" )
	{		
		return true; // yes is pistol	
	}
	else
	{
		return false; // no not pistol	
	}
}

checksub( weapon )
{	
	if( weapon == "p90_silencer_mp" ||  weapon == "p90_reflex_mp" ||  weapon == "p90_mp" ||  weapon == "p90_acog_mp" ||
		weapon == "mp5_silencer_mp" ||  weapon == "mp5_reflex_mp" ||  weapon == "mp5_mp" ||  weapon == "mp5_acog_mp" ||
		weapon == "skorpion_silencer_mp" ||  weapon == "skorpion_reflex_mp" ||  weapon == "skorpion_mp" ||  weapon == "skorpion_acog_mp" ||
		weapon == "uzi_silencer_mp" ||  weapon == "uzi_reflex_mp" ||  weapon == "uzi_mp" ||  weapon == "uzi_acog_mp" ||
		weapon == "ak74u_silencer_mp" ||  weapon == "ak74u_reflex_mp" ||  weapon == "v_mp" ||  weapon == "ak74u_acog_mp" )

	{		
		return true; // yes is submachine gun	
	}
	else
	{
		return false; // no not submachine gun
	}
}
