//================================================================================================
// File Name  : _anti_camp_teleport.gsc 
// File Info  : Mods anti camping system
//              Teleports players if they try to reach a camping spot
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : Abney Park
//================================================================================================

main()
{	
	check();
}

//================================================================================================
// Check Enabled
//================================================================================================
check()
{	
	choice = getDvarInt("btd_anticamp");
		
	if(choice == 1 || choice == 3) // teleport
	{
		spawntrigs();
	}
	else
	{
		return;
	}
}

//================================================================================================
// Teleport System
//================================================================================================
// trig = spawn("trigger_radius",(x,y,z),0,radius,height);

// spawning of triggers for all stock maps
spawntrigs()
{
	// Ambush
	if(getDvar("mapname") == "mp_convoy")
	{
		// top of building by gas tank
		trig = spawn("trigger_radius",(-1003,943,208),0,50,100);
		trig.goto = (-974,628,80); 
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-753,810,208),0,50,100);
		trig.goto = (-974,628,80);
		trig thread waitfortrig();
		
		// jump from gas tank
		trig = spawn("trigger_radius",(-450,198,88),0,35,100);
		trig.goto = (-385,141,-53);
		trig thread waitfortrig();
		
		// bombed out buildings wall 1
		trig = spawn("trigger_radius",(796,1219,48),0,50,100);
		trig.goto = (696,1214,-65);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(777,1165,72),0,50,100);
		trig.goto = (696,1214,-65);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(757,1110,80),0,50,100);
		trig.goto = (696,1214,-65);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(737,1058,72),0,50,100);
		trig.goto = (696,1214,-65);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(654,1108,-3),0,50,100);
		trig.goto = (696,1214,-65);
		trig thread waitfortrig();
		
		// bombed out buildings wall 2
		trig = spawn("trigger_radius",(655,811,112),0,50,100);
		trig.goto = (716,472,-61);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(638,761,112),0,50,100);
		trig.goto = (716,472,-61);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(643,418,89),0,50,100);
		trig.goto = (716,472,-61);
		trig thread waitfortrig();
		
		// bombed out buildings windows 3
		trig = spawn("trigger_radius",(1141,373,116),0,50,100);
		trig.goto = (1016,-38,-63);
		trig thread waitfortrig();
	}
	
	// Backlot
	else if(getDvar("mapname") == "mp_backlot")
	{	
		// r700 ladder
		trig = spawn("trigger_radius",(491,-591,334),0,50,100);
		trig.goto = (519,-569,70);
		trig thread waitfortrig();
	}
	
	// Bloc
	else if(getDvar("mapname") == "mp_bloc")
	{
		// stair well
		trig = spawn("trigger_radius",(2552,-5244,164),0,10,100);
		trig.goto = (2697,-5133,0);
		trig thread waitfortrig();
		
		// pool ledge
		trig = spawn("trigger_radius",(-2812,-4166,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2812,-4077,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2243,-407,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2243,-4173,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2411,-4077,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2637,-4077,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2736,-4077,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2525,-4077,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2303,-4077,-15),0,10,100);
		trig.goto = (-2530,-4205,-159);
		trig thread waitfortrig();
	}
	
	// Bog
	else if(getDvar("mapname") == "mp_bog")
	{	
		// container 1
		trig = spawn("trigger_radius",(5329,630,109),0,50,100);
		trig.goto = (5324,660,12);
		trig thread waitfortrig();
		
		// container 2
		trig = spawn("trigger_radius",(4312,1888,94),0,50,100);
		trig.goto = (4454,1923,0);
		trig thread waitfortrig();
		
		// canopy by fruit stall
		trig = spawn("trigger_radius",(2672,206,105),0,50,100);
		trig.goto = (2531,121,-9);
		trig thread waitfortrig();
	}
	
	// Broadcat
	else if(getDvar("mapname") == "mp_broadcast")
	{	
		// bus & car park canopy
		trig = spawn("trigger_radius",(-670,2181,94),0,35,100);
		trig.goto = (-772,2229,-39);
		trig thread waitfortrig();
		
		// top of doors
		trig = spawn("trigger_radius",(-244,-756,277),0,50,100);
		trig.goto = (-259,-853,184);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-174,-857,277),0,50,100);
		trig.goto = (-259,-853,184);
		trig thread waitfortrig();
		
		// house 1 and walls
		trig = spawn("trigger_radius",(-1863,2150,80),0,15,100);
		trig.goto = (-2161,2185,-63);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1670,2167,80),0,35,100);
		trig.goto = (-2161,2185,-63);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1880,2235,37),0,35,100);
		trig.goto = (-2161,2185,-63);
		trig thread waitfortrig();
		
		// walls
		trig = spawn("trigger_radius",(-384,2789,50),0,35,100);
		trig.goto = (-320,2864,-36);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-405,2823,50),0,35,100);
		trig.goto = (-320,2864,-36);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-430,2864,50),0,35,100);
		trig.goto = (-320,2864,-36);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-475,2932,50),0,35,100);
		trig.goto = (-320,2864,-36);
		trig thread waitfortrig();
		
		// walls
		trig = spawn("trigger_radius",(-928,3003,50),0,35,100);
		trig.goto = (-841,3038,-32);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1006,2956,50),0,35,100);
		trig.goto = (-841,3038,-32);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1081,2910,50),0,35,100);
		trig.goto = (-841,3038,-32);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1163,2862,50),0,35,100);
		trig.goto = (-841,3038,-32);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1242,2814,50),0,35,100);
		trig.goto = (-841,3038,-32);
		trig thread waitfortrig();
		
		// house 2 by stairs
		trig = spawn("trigger_radius",(-872,3205,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-900,3188,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-933,3169,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-959,3154,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-991,3135,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1025,3116,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1056,3098,186),0,10,100);
		trig.goto = (-1065,3267,146);
		trig thread waitfortrig();
		
		// room1 a
		trig = spawn("trigger_radius",(758,922,204),0,35,100);
		trig.goto = (828,769,136);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(739,713,186),0,35,100);
		trig.goto = (828,769,136);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(968,743,186),0,35,100);
		trig.goto = (828,769,136);
		trig thread waitfortrig();
		
		// room1 b
		trig = spawn("trigger_radius",(1260,237,186),0,35,100);
		trig.goto = (1170,178,136);
		trig thread waitfortrig();
		
		
	}
	
	// Countdown
	else if(getDvar("mapname") == "mp_countdown")
	{
		// silo grate glitch 1
		trig = spawn("trigger_radius",(730,-1770,40),0,50,100);
		trig.goto = (719,-1583,16);
		trig thread waitfortrig();
		
		// silo grate glitch 2
		trig = spawn("trigger_radius",(-35,-1771,40),0,50,100);
		trig.goto = (-39,-1596,16);
		trig thread waitfortrig();
		
		// silo grate glitch 3
		trig = spawn("trigger_radius",(-787,-1776,46),0,50,100);
		trig.goto = (-780,-1574,15);
		trig thread waitfortrig();
		
		// rocket silo glitch
		trig = spawn("trigger_radius",(-641,1036,-59),0,29,100);
		trig.goto = (-479,1043,-59);
		trig thread waitfortrig();
		
		// rocket vechile 1
		trig = spawn("trigger_radius",(-1631,-632,146),0,20,100);
		trig.goto = (-1345,-698,-23);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1633,-679,147),0,20,100);
		trig.goto = (-1345,-698,-23);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1644,-722,143),0,20,100);
		trig.goto = (-1345,-698,-23);
		trig thread waitfortrig();
		
		// rocket vechile 2
		trig = spawn("trigger_radius",(-68,-979,137),0,20,100);
		trig.goto = (217,-883,-19);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-41,-1011,143),0,20,100);
		trig.goto = (217,-883,-19);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-35,-1054,135),0,20,100);
		trig.goto = (217,-883,-19);
		trig thread waitfortrig();
	}
	
	// Crash / Winter Crash
	else if((getDvar("mapname") == "mp_crash") || (getDvar("mapname") == "mp_crash_snow"))
	{	
		// ladder by open grass
		trig = spawn("trigger_radius",(766,-1165,220),0,35,100);
		trig.goto = (814,-1223,127);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(768,-968,291),0,35,100);
		trig.goto = (814,-1223,127);
		trig thread waitfortrig();
		
		// fence by ladder
		trig = spawn("trigger_radius",(447,-1021,200),0,35,100);
		trig.goto = (340,-1151,96);
		trig thread waitfortrig();
		
		// chopper 
		trig = spawn("trigger_radius",(996,584,322),0,50,100);
		trig.goto = (623,499,139);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(405,481,271),0,50,100);
		trig.goto = (623,499,139);
		trig thread waitfortrig();		
		trig = spawn("trigger_radius",(821,555,238),0,50,100);
		trig.goto = (623,499,139);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(773,541,242),0,50,100);
		trig.goto = (623,499,139);
		trig thread waitfortrig();
	}	
	
	// Creek
	else if(getDvar("mapname") == "mp_creek")
	{
		// small wooden hut
		trig = spawn("trigger_radius",(-627,5424,292),0,40,100);
		trig.goto = (-487,5226,134);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-522,5420,303),0,40,100);
		trig.goto = (-487,5226,134);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-408,5416,317),0,40,100);
		trig.goto = (-487,5226,134);
		trig thread waitfortrig();
		
		// roof large
		trig = spawn("trigger_radius",(-3180,6828,408),0,40,100);
		trig.goto = (-3428,6855,164);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-3246,6802,384),0,40,100);
		trig.goto = (-3428,6855,164);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-3312,6776,357),0,40,100);
		trig.goto = (-3428,6855,164);
		trig thread waitfortrig();
		
		// roof small
		trig = spawn("trigger_radius",(-3333,7263,314),0,40,100);
		trig.goto = (-3390,7154,158);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-3281,7205,313),0,40,100);
		trig.goto = (-3390,7154,158);
		trig thread waitfortrig();
	}
	
	// Crossfire
	else if(getDvar("mapname") == "mp_crossfire")
	{	
		// ledge outside windows
		trig = spawn("trigger_radius",(5135,-1082,160),0,15,100);
		trig.goto = (5152,-1118,24);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(5186,-1120,160),0,15,100);
		trig.goto = (5152,-1118,24);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(5268,-1179,160),0,15,100);
		trig.goto = (5152,-1118,24);
		trig thread waitfortrig();
		
		// ledge outside broken wall
		trig = spawn("trigger_radius",(5130,-979,194),0,15,100);
		trig.goto = (5111,-929,24);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(5150,-953,187),0,15,100);
		trig.goto = (5111,-929,24);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(5167,-930,194),0,15,100);
		trig.goto = (5111,-929,24);
		trig thread waitfortrig();		
		
		// ledge two
		trig = spawn("trigger_radius",(5529,-1368,160),0,15,100);
		trig.goto = (5603,-1434,24);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(5685,-1483,160),0,15,100);
		trig.goto = (5603,-1434,24);
		trig thread waitfortrig();
		
		// ladder jump to balcony
		trig = spawn("trigger_radius",(6397,-1293,219),0,35,100);
		trig.goto = (6309,-1344,10);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(6367,-1342,219),0,35,100);
		trig.goto = (6309,-1344,10);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(6244,-1514,219),0,35,100);
		trig.goto = (6309,-1344,10);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(6290,-1454,219),0,35,100);
		trig.goto = (6309,-1344,10);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(6331,-1393,219),0,35,100);
		trig.goto = (6309,-1344,10);
		trig thread waitfortrig();
	}
	
	// District
	else if(getDvar("mapname") == "mp_citystreets")
	{
		// archway
		trig = spawn("trigger_radius",(3145,-504,54),0,35,100);
		trig.goto = (3110,-312,-95);
		trig thread waitfortrig();
		
		// cloth cover
		trig = spawn("trigger_radius",(5993,376,6),0,50,100);
		trig.goto = (5988,149,-135);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(5992,-57,5),0,50,100);
		trig.goto = (5988,149,-135);
		trig thread waitfortrig();
	}
	
	// Downpour
	else if(getDvar("mapname") == "mp_farm")
	{
		// tractor
		trig = spawn("trigger_radius",(592,1675,326),0,50,100);
		trig.goto = (681,1808,216);
		trig thread waitfortrig();
		
		// dragnov ladder
		trig = spawn("trigger_radius",(235,1293,393),0,5,100);
		trig.goto = (-123,1244,246);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(235,1210,393),0,5,100);
		trig.goto = (-123,1244,246);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(284,1268,385),0,5,100);
		trig.goto = (-123,1244,246);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(281,1232,385),0,5,100);
		trig.goto = (-123,1244,246);
		trig thread waitfortrig();
	}
	
	// Overgrown
	else if(getDvar("mapname") == "mp_overgrown")
	{
		// house jump to second floor
		trig = spawn("trigger_radius",(-482,-3733,-15),0,35,100);
		trig.goto = (-550,-3585,-99);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-483,-3413,-8),0,35,100);
		trig.goto = (-550,-3585,-99);
		trig thread waitfortrig();
		
		// fence 1
		trig = spawn("trigger_radius",(1273,-1865,-76),0,35,100);
		trig.goto = (1325,-1938,-183);
		trig thread waitfortrig();
		
		// fence 2
		trig = spawn("trigger_radius",(-421,-4736,-36),0,35,100);
		trig.goto = (-516,-4707,-134);
		trig thread waitfortrig();
	}
	
	// Pipeline
	else if(getDvar("mapname") == "mp_pipeline")
	{
		// large roof 1
		trig = spawn("trigger_radius",(1130,340,179),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1061,340,179),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(987,340,179),0,35,100);
		trig.goto = (857,394,2);;
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(910,340,179),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(835,340,179),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(756,340,179),0,35,100);;
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(684,340,179),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(615,340,179),0,35,100);;
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(534,340,179),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1337,325,184),0,35,100);;
		trig.goto = (857,394,2);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1225,332,180),0,35,100);
		trig.goto = (857,394,2);
		trig thread waitfortrig();
				
		// large roof 2
		trig = spawn("trigger_radius",(756,1959,185),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(822,1958,186),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(879,1958,186),0,40,100);
		trig.goto = (1091,2008,0);;
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(943,1958,185),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1103,1976,173),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1019,1963,182),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(659,1961,184),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(532,1985,172),0,40,100);
		trig.goto = (1091,2008,0);
		trig thread waitfortrig();
		
		// ladder
		trig = spawn("trigger_radius",(1008,1316,195),0,35,100);
		trig.goto = (1027,1398,4);
		trig thread waitfortrig();
		
		// guard hut
		trig = spawn("trigger_radius",(-137,271,162),0,35,100);
		trig.goto = (-199,447,42);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-57,272,162),0,35,100);
		trig.goto = (-199,447,42);
		trig thread waitfortrig();	
		
		// arch
		trig = spawn("trigger_radius",(-749,680,202),0,5,100);
		trig.goto = (-578,641,-6);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-792,680,208),0,5,100);
		trig.goto = (-578,641,-6);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-845,679,193),0,5,100);
		trig.goto = (-578,641,-6);
		trig thread waitfortrig();	
		
		// hole in wall by stairs
		trig = spawn("trigger_radius",(-930,1643,196),0,35,100);
		trig.goto = (-677,1645,9);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-928,1683,192),0,35,100);
		trig.goto = (-677,1645,9);
		trig thread waitfortrig();		
		trig = spawn("trigger_radius",(-895,1579,208),0,2,100);
		trig.goto = (-677,1645,9);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-895,1547,208),0,2,100);
		trig.goto = (-677,1645,9);
		trig thread waitfortrig();	
		trig = spawn("trigger_radius",(-896,1510,208),0,2,100);
		trig.goto = (-677,1645,9);
		trig thread waitfortrig();
		
		// windows
		trig = spawn("trigger_radius",(-369,2078,220),0,35,100);
		trig.goto = (-323,1920,9);
		trig thread waitfortrig(); 
		trig = spawn("trigger_radius",(-545,2066,220),0,35,100);
		trig.goto = (-323,1920,9);
		trig thread waitfortrig();		
		trig = spawn("trigger_radius",(-32,1989,220),0,2,100);
		trig.goto = (-323,1920,9);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-32,2043,220),0,2,100);
		trig.goto = (-323,1920,9);
		trig thread waitfortrig();		
		
		// wall
		trig = spawn("trigger_radius",(647,3328,128),0,15,100);
		trig.goto = (581,3423,4);
		trig thread waitfortrig();	
		trig = spawn("trigger_radius",(681,3328,128),0,15,100);
		trig.goto = (581,3423,4);
		trig thread waitfortrig();	
		trig = spawn("trigger_radius",(719,3328,128),0,15,100);
		trig.goto = (581,3423,4);
		trig thread waitfortrig();	
		trig = spawn("trigger_radius",(753,3329,128),0,15,100);
		trig.goto = (581,3423,4);
		trig thread waitfortrig();	
		trig = spawn("trigger_radius",(795,3329,128),0,15,100);
		trig.goto = (581,3423,4);
		trig thread waitfortrig();	
	}
	
	// Showdown 
	if(getDvar("mapname") == "mp_showdown")
	{
		// tall frame work top shelf
		trig = spawn("trigger_radius",(-563,-331,265),0,35,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-559,-285,265),0,35,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-557,-244,265),0,35,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-554,-208,265),0,35,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-551,-167,265),0,35,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-549,-129,265),0,35,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		
		// small frame work top shelf
		trig = spawn("trigger_radius",(-197,448,129),0,50,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-364,442,129),0,50,100);
		trig.goto = (-553,-70,0);
		trig thread waitfortrig();
		
		// wodden bars sticking out by small van
		trig = spawn("trigger_radius",(1078,-633,182),0,35,100);
		trig.goto = (1019,-726,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1078,-724,182),0,35,100);
		trig.goto = (1019,-726,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1078,-808,184),0,35,100);
		trig.goto = (1019,-726,16);
		trig thread waitfortrig();
	}
	
	// Strike
	else if(getDvar("mapname") == "mp_strike")
	{
		// court yard wall large
		trig = spawn("trigger_radius",(-1282,-1207,123),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1281,-872,123),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1282,-515,124),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1282,-1115,105),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1281,-609,105),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1282,-1050,104),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1282,-951,105),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1280,-763,105),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1279,-668,105),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1375,-516,105),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1479,-516,123),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1383,-1216,104),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1527,-1211,123),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1571,-516,122),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1697,-513,104),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1618,-1213,122),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-1715,-1216,104),0,35,100);
		trig.goto = (-1529,-873,7);
		trig thread waitfortrig();
		
		// court yard wall small
		trig = spawn("trigger_radius",(-264,288,100),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-265,190,102),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-288,118,103),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-383,118,102),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-491,122,102),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-825,118,102),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-740,117,103),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-947,121,102),0,35,100);
		trig.goto = (-632,362,16);
		trig thread waitfortrig();
		
		// phone
		trig = spawn("trigger_radius",(-2075,490,95),0,35,100);
		trig.goto = (-2214,494,12);
		trig thread waitfortrig();
		
		// stall by phone
		trig = spawn("trigger_radius",(-2077,706,103),0,50,100);
		trig.goto = (-2093,1047,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2075,780,105),0,50,100);
		trig.goto = (-2093,1047,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-2071,874,106),0,50,100);
		trig.goto = (-2093,1047,16);
		trig thread waitfortrig();
		
		// stall not by phone
		trig = spawn("trigger_radius",(824,295,99),0,50,100);
		trig.goto = (840,-13,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(819,205,105),0,50,100);
		trig.goto = (840,-13,16);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(813,112,105),0,50,100);
		trig.goto = (840,-13,16);
		trig thread waitfortrig();
	}
	
	// Wetwork
	else if(getDvar("mapname") == "mp_cargoship")
	{
		// jumps to containers from platform 1
		trig = spawn("trigger_radius",(950,-615,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1064,-617,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1178,-618,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1205,-554,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1205,-441,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(30,-450,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(727,-538,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(622,-439,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(714,-616,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(616,-624,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(616,-532,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1205,455,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(1212,571,229),0,100,100);
		trig.goto = (1032,5,176);
		trig thread waitfortrig();
		
		// jumps to containers from platform 1
		trig = spawn("trigger_radius",(-859,-439,229),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-861,-523,229),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-869,-622,229),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-206,-417,229),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-209,-494,229),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-212,-569,229),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-234,439,228),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-234,528,228),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-234,614,228),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-863,431,230),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();
		trig = spawn("trigger_radius",(-863,504,230),0,100,100);
		trig.goto = (-585,-17,176);
		trig thread waitfortrig();	
	}
}

// moniters triggers till a player moves within range
waitfortrig()
{ 
	while(1)
	{
		self waittill("trigger",player);
		if(player.sessionstate != "playing")
		continue;

		player setOrigin(self.goto);
		player iPrintlnBold("You have been prevented from reaching a camping spot!");		
	}
}