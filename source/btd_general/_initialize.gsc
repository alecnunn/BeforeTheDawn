//================================================================================================
// File Name  : _intialize.gsc 
// File Info  : Used to basicly intialize the background threads and set default values for global 
//              dvars
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : Abney Park
//================================================================================================

#include maps\mp\gametypes\_hud_util;
#include btd_general\_dvardef;
#include btd_general\_hud_util;

main()
{
	set_dvars();
	call_threads();
}

//================================================================================================
// sets all the global dvars
//================================================================================================
set_dvars()
{
	level.currentspawnnum = 0;
	level.zombies = [];
	level.currentwave = 0;
	level.wavetospawn = 0;
	level.totalzomsinwave = 0;
	level.tempzombies = [];
	level.buggedzom = false;
	level.wave_barsize = 260;
	level.canjoin = "yes";
	level.zomspawns = [];
	
	level.ammo_drops = createdvar("btd_ammo_drops",1,0,1,"int");
	level.ammo_drops_start = createdvar("btd_ammo_drops_start",1,0,1,"int");
	level.ammo_drops_locations = createdvar("btd_ammo_drops_locations",1,0,1,"int");
	
	level.trade_drop = createdvar("btd_trader",1,0,1,"int");
	level.trade_drop_start = createdvar("btd_trader_start",1,0,1,"int");
	level.trade_drop_location = createdvar("btd_ammo_trader_location",1,0,1,"int");
}

//================================================================================================
// calls any threads / scripts that run in the background, ie messages / night
//================================================================================================
call_threads()
{
	thread btd_general\_music::setup_music();
	thread btd_general\_night::main();
	thread btd_general\_map_rotate::main();
	btd_admin\_admin::main();
	btd_admin\_admin_pickups::pickup_main();
	btd_general\_anti_camp_teleport::main();
	btd_general\_vision::init();
	thread btd_general\_sound_util::ambientsounds();	
	thread btd_general\_hud_util::inithud();
	thread btd_general\_ammo_drops::main();
	thread btd_general\_trader::main();
	//thread btd_general\_spotlight::main();
	thread btd_messages\_msg::main();	
	
	thread playerConnect();
}

playerConnect()
{
	while(1)
	{
		level waittill("connecting", player);
		
		player thread onPlayerConnect();
		player thread onPlayerSpawned();
	}
}

onPlayerConnect()
{
	self btd_general\_anti_camp_time::main();	
	self thread btd_messages\_msg::onPlayerConnect();
	self thread btd_admin\_admin::onPlayerConnect();
	self thread btd_general\_music::music();
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

PlayerSpawned()
{	
	self thread btd_messages\_msg::playerSpawned();
	//self thread btd_general\_spotlight::light();
	self thread btd_general\_lasers::laser();
	self thread btd_general\_sniper_zoom::main();	
	self.hasntfullammo = true;
}






