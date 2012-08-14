//================================================================================================
// File Name  : _trader.gsc 
// File Info  : Used to spawn the ammo trader
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : KiLL3R 
//================================================================================================

main()
{
	precacheModel("body_trader");
	precacheShader("waypoint_trader");
	
	game["menu_buymenu"] = "buymenu";
	precacheMenu(game["menu_buymenu"]);

	traderspawn = gettraderspawn();

	while(1)
	{
		level waittill("trade_notify");

		trace = bulletTrace(traderspawn.origin + (0,0,40), traderspawn.origin, false, undefined);

		traderdrop = spawn("script_model", trace["position"] + (0,0,2));
		traderdrop.angles = (traderspawn.angles);	
		traderdrop setModel("body_trader");
		traderdrop.trigger = spawn("trigger_radius",traderdrop.origin,0,120,120);
		
		traderdrop.trigger thread traderdrop();

		if(level.trade_drop_location == 1)
		{
			traderdrop.marker = newHudElem();
			traderdrop.marker.hideWhenInMenu = true;
			traderdrop.marker SetTargetEnt(traderdrop);
			traderdrop.marker.sort = 1;
			traderdrop.marker setWayPoint(true, "waypoint_trader");
		}		
		
		iPrintlnBold("^3Trader shop is now open!");

		level waittill("wave_start");

		traderdrop.marker destroy();
		traderdrop.trigger delete();
		traderdrop delete();
		
		//tag_stowed_back
	}
}

traderdrop()
{
	level endon("wave_start");
	while(1)
	{
		self waittill("trigger", player);			

		//angles = player GetPlayerAngles();		
		//player iprintlnBold("angles = " + angles);
		
		if ( player UseButtonPressed())
		{
			//player iprintlnBold("Buy Menu Comming Soon");
			player openMenu(game["menu_buymenu"]);
		}	
		
		wait 1;
	}
}

gettraderspawn()
{
	traderspawnpoint = (0,0,0);	
	traderspawnangles = (0,0,0);

	// Ambush
	if(getDvar("mapname") == "mp_convoy")
	{		
		traderspawnpoint = (-888,-824,-55);
		traderspawnangles = (0,153,0);
	}
	
	// Backlot
	else if(getDvar("mapname") == "mp_backlot")
	{		
		traderspawnpoint = (-465,-1348,64);
		traderspawnangles = (0,0,0);
	}
	
	// Bloc
	else if(getDvar("mapname") == "mp_bloc")
	{		
		traderspawnpoint = (2017,-4934,12);
		traderspawnangles = (0,179,0);
	}
	
	// Bog
	else if(getDvar("mapname") == "mp_bog")
	{		
		traderspawnpoint = (3429,1449,25);
		traderspawnangles = (0,90,0);
	}
	
	// Burg
	if(getDvar("mapname") == "mp_burg")
	{		
		traderspawnpoint = (-453,-655,570);
		traderspawnangles = (0,0,0);
	}
		
	// Broadcat
	else if(getDvar("mapname") == "mp_broadcast")
	{		
		traderspawnpoint = (-824,892,136);
		traderspawnangles = (0,25,0);
	}
	
	// Chinatown
	else if(getDvar("mapname") == "mp_carentan")
	{		
		traderspawnpoint = (750,-13,-7);
		traderspawnangles = (0,90,0);
	}
	
	// Countdown
	else if(getDvar("mapname") == "mp_countdown")
	{		
		traderspawnpoint = (-2070,1081,-9);
		traderspawnangles = (0,-90,0);
	}
	
	// Crash / Winter Crash
	else if(getDvar("mapname") == "mp_crash")
	{		
		traderspawnpoint = (791,-39,152);
		traderspawnangles = (0,179,0);
	}
	
	// Creek
	else if(getDvar("mapname") == "mp_creek")
	{		
		traderspawnpoint = (-2376,5318,-91);
		traderspawnangles = (0,65,0);
	}
	
	// Crossfire
	else if(getDvar("mapname") == "mp_crossfire")
	{		
		traderspawnpoint = (5595,-3180,-74);
		traderspawnangles = (0,145,0);
	}

	// Downpour
	else if(getDvar("mapname") == "mp_farm")
	{		
		traderspawnpoint = (1021,4212,217);
		traderspawnangles = (0,-60,0);
	}

	// Overgrown
	else if(getDvar("mapname") == "mp_overgrown")
	{		
		traderspawnpoint = (-313,403,-175);
		traderspawnangles = (0,-135,0);
	}

	// Pipeline
	else if(getDvar("mapname") == "mp_pipeline")
	{		
		traderspawnpoint = (-121,135,14);
		traderspawnangles = (0,35,0);
	}

	// Shipment
	else if(getDvar("mapname") == "mp_shipment")
	{		
		traderspawnpoint = (702,-55,218);
		traderspawnangles = (10,150,0);
	}

	// Showdown
	else if(getDvar("mapname") == "mp_showdown")
	{		
		traderspawnpoint = (0,710,192);
		traderspawnangles = (0,-90,0);
	}		
		
	// Strike
	else if(getDvar("mapname") == "mp_strike")
	{		
		traderspawnpoint = (197,1461,28);
		traderspawnangles = (0,89,0);
	}
	
	// Treasure
	if(getDvar("mapname") == "mp_treasure")
	{		
		traderspawnpoint = (-3691,6647,319);
		traderspawnangles = (0,179,0);
	}

	// Vacant
	else if(getDvar("mapname") == "mp_vacant")
	{		
		traderspawnpoint = (731,574,-47);
		traderspawnangles = (0,-90,0);
	}

	// Wetwork
	else if(getDvar("mapname") == "mp_cargoship")
	{		
		traderspawnpoint = (-2332,7,64);
		traderspawnangles = (0,0,0);
	}

	tradetemp = spawnStruct();
	tradetemp.origin = traderspawnpoint;	
	tradetemp.angles = traderspawnangles;
	return tradetemp;
}
