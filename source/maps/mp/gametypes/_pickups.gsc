#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include btd_general\_dvardef;

init()
{
	precacheModel("ld_death_ground_pose_01");
	precacheModel("ld_death_ground_pose_02");
	precacheModel("ld_death_ground_pose_03");
	precacheModel("ld_death_ground_pose_04");
	
	level.pickupson = createdvar("btd_pickup_on",1,0,1,"int");
	level.pickupspawntime = createdvar("btd_pickup_spawn_time",15,5,60,"int");
	level.pickupbodies = createdvar("btd_pickup_bodies",1,0,1,"int");
	level.pickupspin = createdvar("btd_pickup_spin",1,0,1,"int");
	level.pickupfx = createdvar("btd_pickup_fx",0,0,1,"int");
	
//=========================================================================[BTD]
// Change pickups for btd
//=========================================================================[BTD]	
	if(level.oldschool)
	{			
		level.pickupson = 1;
	}

	if(level.pickupson == 0) // pickups off
	{	
		deletePickups();
		return;
	}
	
	thread initPickups();
	
	// mp_player_join
	level.oldschoolPickupSound = "oldschool_pickup";
	level.oldschoolRespawnSound = "oldschool_return";
	
	level.validPerks = [];
	for( i = 150; i < 199; i++ )
	{
		perk = tableLookup( "mp/statstable.csv", 0, i, 4 );
		if ( issubstr( perk, "specialty_" ) )
			level.validPerks[ level.validPerks.size ] = perk;
	}
	
	level.perkPickupHints = [];
	level.perkPickupHints[ "specialty_bulletdamage"			] = &"PLATFORM_PICK_UP_STOPPING_POWER";
	level.perkPickupHints[ "specialty_armorvest"			] = &"PLATFORM_PICK_UP_JUGGERNAUT";
	level.perkPickupHints[ "specialty_rof"					] = &"PLATFORM_PICK_UP_DOUBLE_TAP";
	level.perkPickupHints[ "specialty_pistoldeath"			] = &"PLATFORM_PICK_UP_LAST_STAND";
	level.perkPickupHints[ "specialty_grenadepulldeath"		] = &"PLATFORM_PICK_UP_MARTYRDOM";
	level.perkPickupHints[ "specialty_fastreload"			] = &"PLATFORM_PICK_UP_SLEIGHT_OF_HAND";

	perkPickupKeys = getArrayKeys( level.perkPickupHints ); 

	for ( i = 0; i < perkPickupKeys.size; i++ )
	{
		precacheString( level.perkPickupHints[ perkPickupKeys[i] ] );
	}
}

initPickups()
{	
	
	level.pickupAvailableEffect = loadfx( "misc/ui_pickup_available" );
	level.pickupUnavailableEffect = loadfx( "misc/ui_pickup_unavailable" );
	
	wait .5; // so all pickups have a chance to spawn and drop to the ground
	
	pickups = getentarray( "oldschool_pickup", "targetname" );
	
	for ( i = 0; i < pickups.size; i++ )
	{	
		// spawns a body under the pickup if enabled
		if(level.pickupbodies == 1)
		{
			bodygroundpoint = getPickupGroundpoint( pickups[i] );	
			num = randomInt(4) + 1;
			body = spawn("script_model", bodygroundpoint);
			body setModel("ld_death_ground_pose_0" + num);	
		}				

		thread trackPickup( pickups[i], i ); 
	}	
}

deletePickups()
{
	pickups = getentarray( "oldschool_pickup", "targetname" );
	
	for ( i = 0; i < pickups.size; i++ )
	{
		if ( isdefined( pickups[i].target ) )
			getent( pickups[i].target, "targetname" ) delete();
		pickups[i] delete();
	}
}

spawnPickupFX( groundpoint, fx )
{
	effect = spawnFx( fx, groundpoint, (0,0,1), (1,0,0) );
	triggerFx( effect );
	
	return effect;
}

playEffectShortly( fx )
{
	self endon("death");
	wait .05;
	playFxOnTag( fx, self, "tag_origin" );
}

getPickupGroundpoint( pickup )
{
	trace = bullettrace( pickup.origin, pickup.origin + (0,0,-128), false, pickup );
	groundpoint = trace["position"];
	
	finalz = groundpoint[2];
	
	for ( radiusCounter = 1; radiusCounter <= 3; radiusCounter++ )
	{
		radius = radiusCounter / 3.0 * 50;
		
		for ( angleCounter = 0; angleCounter < 10; angleCounter++ )
		{
			angle = angleCounter / 10.0 * 360.0;
			
			pos = pickup.origin + (cos(angle), sin(angle), 0) * radius;
			
			trace = bullettrace( pos, pos + (0,0,-128), false, pickup );
			hitpos = trace["position"];
			
			if ( hitpos[2] > finalz && hitpos[2] < groundpoint[2] + 15 )
				finalz = hitpos[2];
		}
	}
	return (groundpoint[0], groundpoint[1], finalz);
}

trackPickup( pickup, id )
{
	groundpoint = getPickupGroundpoint( pickup );
	
	if(level.pickupfx == 1)
	{
		effectObj = spawnPickupFX( groundpoint, level.pickupAvailableEffect );	
	}
	else
	{
		effectObj = undefined;
	}
	
	if(level.pistolonly)
	{			
		if(getDvarInt("btd_pistol_frags") == 1)
		{
			// grenades enabled
			pickpistol = randomInt(5);	
		}
		else
		{
			// grenades disabled
			pickpistol = randomInt(4);
		}	
		
		if(pickpistol == 0)
		{
			classname = "weapon_beretta_mp";
		}
		else if(pickpistol == 1)
		{
			classname = "weapon_usp_mp";
		}
		else if(pickpistol == 2)
		{	
			classname = "weapon_colt45_mp";
		}
		else if(pickpistol == 3)
		{
			classname = "weapon_deserteagle_mp";
		} 
		else
		{
			// only possible if pickpistol = 4
			classname = "weapon_frag_grenade_mp";
		}
	}			
	else
	{
		classname = pickup.classname;
	}

	origin = pickup.origin;
	angles = pickup.angles;
	spawnflags = pickup.spawnflags;
	model = pickup.model;
	
	isWeapon = false;
	isPerk = false;
	weapname = undefined;
	perk = undefined;
	trig = undefined;
	respawnTime = level.pickupspawntime;
	droped = undefined;

	if ( issubstr( classname, "weapon_" ) )
	{
		isWeapon = true;
		weapname = pickup maps\mp\gametypes\_weapons::getItemWeaponName();	
	}
	else if ( classname == "script_model" )
	{
		isPerk = true;
		perk = pickup.script_noteworthy;
		for ( i = 0; i < level.validPerks.size; i++ )
		{
			if ( level.validPerks[i] == perk )
				break;
		}
		if ( i == level.validPerks.size )
		{
			maps\mp\_utility::error( "oldschool_pickup with classname script_model does not have script_noteworthy set to a valid perk" );
			return;
		}
		trig = getent( pickup.target, "targetname" );
		
		if ( !getDvarInt( "scr_game_perks" ) )
		{
			pickup delete();
			trig delete();
			if(level.pickupfx == 1)
			{
				effectObj delete();
			}
			return;
		}
		
		if ( isDefined( level.perkPickupHints[ perk ] ) )
			trig setHintString( level.perkPickupHints[ perk ] );
	}
	else
	{
		maps\mp\_utility::error( "oldschool_pickup with classname " + classname + " is not supported (at location " + pickup.origin + ")" );
		return;
	}
	
	if ( isDefined( pickup.script_delay ) )
	{
		respawnTime = pickup.script_delay;
	}
	
	if ( isWeapon && level.pistolonly == true )
	{
		pistolhack = true;
	}
	else
	{
		pistolhack = false;
	}
	
	while(1)
	{
		if(level.pickupspin == 1)
		{
			pickup thread spinPickup();
		}
		
		player = undefined;		
		
		// used for debug
		//iprintln("pickup weapname = " + weapname);
		//iprintln("pickup classname = " + pickup.classname);	
		//iprintln("pistolhack = " + pistolhack);	
		
		if ( isWeapon )
		{
			pickup thread changeSecondaryGrenadeType( weapname );
			pickup setPickupStartAmmo( weapname );
					
			if(pistolhack == false)
			{
				while(1)
				{
					
					pickup waittill( "trigger", player, dropped );
					
					if ( !isdefined( pickup ) )
					break;
				
					// player only picked up ammo. the pickup still remains.
					assert( !isdefined( dropped ) );
					
				}				

				if ( isdefined( dropped ) )
				{
					dropDeleteTime = 5;
					if ( dropDeleteTime > respawnTime )
						dropDeleteTime = respawnTime;
					dropped thread delayedDeletion( dropDeleteTime );
				}
			}	
			else
			{
				pickup delete();
			}
		}
		else
		{
			assert( isPerk );
			
			/*
			while(1)
			{
				trig waittill( "trigger", player );
				if ( !player hasPerk( perk ) )
					break;
			}
			*/
			
			trig waittill( "trigger", player );				
			
			pickup delete();
			trig triggerOff();
		}
		
		
		if ( isWeapon )
		{
			if ( weaponInventoryType( weapname ) == "item" && (!isdefined( player.inventoryWeapon ) || weapname != player.inventoryWeapon) )
			{
				player removeInventoryWeapon();
				player.inventoryWeapon = weapname;
				player SetActionSlot( 3, "weapon", weapname );
				// this used to reset the action slot to alt mode when your ammo is up for the weapon.
				// however, this isn't safe for C4, which you need to still have even when you have no ammo, so you can detonate.
				//player thread resetActionSlotToAltMode( weapname );
			}
		}
		else
		{
			assert( isPerk );
			
			if ( !player hasPerk( perk ) )
			{
				player setPerk( perk );
///////// Removed By KiLL3R ///////////
//				player showPerk( player.numperks, perk, -50 );
//				player thread hidePerkNameAfterTime( player.numperks, 3.0 );

//				player.numPerks++;
///////////////////////////////////////
			}
		}
		
		thread playSoundinSpace( level.oldschoolPickupSound, origin );
		
		if(level.pickupfx == 1)
		{
			effectObj delete();
			effectObj = spawnPickupFX( groundpoint, level.pickupUnavailableEffect );
		}
		
		if(pistolhack == false)
		{
			wait respawnTime;
			pickup playSound( level.oldschoolRespawnSound );
		}
		else
		{	
			wait 0.1;
			pistolhack = false;
		}
		
		pickup = spawn( classname, origin, spawnflags );
		pickup.angles = angles;
		if ( isPerk )
		{
			pickup setModel( model );
			trig triggerOn();
		}
		
		if(level.pickupfx == 1)
		{
			effectObj delete();
			effectObj = spawnPickupFX( groundpoint, level.pickupAvailableEffect ); 
		}       
	}
}


hidePerkNameAfterTime( index, delay )
{
	self endon("disconnect");
	
	wait delay;
	
	self thread hidePerk( index, 2.0, true );
}


playSoundinSpace( alias, origin )
{
	org = spawn( "script_origin", origin );
	org.origin = origin;
	org playSound( alias  );
	wait 10; // MP doesn't have "sounddone" notifies =(
	org delete();
}

setPickupStartAmmo( weapname )
{
	curweapname = weapname;
	altindex = 0;
	while ( altindex == 0 || (curweapname != weapname && curweapname != "none") )
	{
		allammo = weaponStartAmmo( curweapname );
		clipammo = weaponClipSize( curweapname );
		
		reserveammo = 0;
		if ( clipammo >= allammo )
		{
			clipammo = allammo;
		}
		else
		{
			reserveammo = allammo - clipammo;
		}
		
		self itemWeaponSetAmmo( clipammo, reserveammo, altindex );
		curweapname = weaponAltWeaponName( curweapname );
		altindex++;
	}
}

changeSecondaryGrenadeType( weapname )
{
	self endon("trigger");
	
	if ( weapname != level.weapons["smoke"] && weapname != level.weapons["flash"] && weapname != level.weapons["concussion"] )
		return;
	
	offhandClass = "smoke";
	if ( weapname == level.weapons["flash"] )
		offhandClass = "flash";
	
	trig = spawn( "trigger_radius", self.origin - (0,0,20), 0, 128, 64 );
	self thread deleteTriggerWhenPickedUp( trig );
	
	while(1)
	{
		trig waittill( "trigger", player );
		if ( player getWeaponAmmoTotal( level.weapons["smoke"] ) == 0 && 
			player getWeaponAmmoTotal( level.weapons["flash"] ) == 0 && 
			player getWeaponAmmoTotal( level.weapons["concussion"] ) == 0 )
		{
			player setOffhandSecondaryClass( offhandClass );
		}
	}
}

deleteTriggerWhenPickedUp( trig )
{
	self waittill("trigger");
	trig delete();
}

resetActionSlotToAltMode( weapname )
{
	self notify("resetting_action_slot_to_alt_mode");
	self endon("resetting_action_slot_to_alt_mode");
	
	while(1)
	{
		if ( self getWeaponAmmoTotal( weapname ) == 0 )
		{
			curweap = self getCurrentWeapon();
			if ( curweap != weapname && curweap != "none" )
				break;
		}
		wait .2;
	}
	
	self removeInventoryWeapon();
	self SetActionSlot( 3, "altmode" );
}

getWeaponAmmoTotal( weapname )
{
	return self getWeaponAmmoClip( weapname ) + self getWeaponAmmoStock( weapname );
}

removeInventoryWeapon()
{
	if ( isDefined( self.inventoryWeapon ) )
		self takeWeapon( self.inventoryWeapon );
	self.inventoryWeapon = undefined;
}

spinPickup()
{
	if ( self.spawnflags & 2 || self.classname == "script_model" )
	{
		self endon("death");
		
		org = spawn( "script_origin", self.origin );
		org endon("death");
		
		self linkto( org );
		self thread deleteOnDeath( org );
		
		while(1)
		{
			org rotateyaw( 360, 3, 0, 0 );
			wait 2.9;
		}
	}
}

deleteOnDeath( ent )
{
	ent endon("death");
	self waittill("death");
	ent delete();
}

delayedDeletion( delay )
{
	self thread delayedDeletionOnSwappedWeapons( delay );
	
	wait delay;
	
	if ( isDefined( self ) )
	{
		self notify("death");
		self delete();
	}
}

delayedDeletionOnSwappedWeapons( delay )
{
	self endon("death");
	while(1)
	{
		self waittill( "trigger", player, dropped );
		if ( isdefined( dropped ) )
			break;
	}
	dropped thread delayedDeletion( delay );
}


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

