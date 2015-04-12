//--------------------------------------------------------------[BTD]
// Script for all the new zombie spawn points for all stock maps
//--------------------------------------------------------------[BTD]

init()
{
	// here encase anything else needs adding
	zomspawns();
}

zomspawns()
{
	zomspawnpoint = [];
	
	if(getDvar("btd_random_spawns") == "")
	{
		setDvar("btd_random_spawns", 1);
	}
	
	randomspawns = getDvarInt("btd_random_spawns");
	if(randomspawns != 0 || randomspawns != 1)
	{
		randomspawns = 1;
	}
	
	// Ambush
	if(getDvar("mapname") == "mp_convoy")
	{		
		number = 0;
		if(randomspawns == 1)
		{		 
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-519.693,752.376,80.125);
				zomspawnpoint[5] = (-551.124,731.356,80.125);
				zomspawnpoint[10] = (-581.739,711.512,80.125);
				zomspawnpoint[15] = (-611.441,692.362,80.125);
				zomspawnpoint[20] = (-638.367,674.515,80.125);
				zomspawnpoint[1] = (-2659.98,-692.424,104.125);
				zomspawnpoint[6] = (-2663.42,-654.388,104.125);
				zomspawnpoint[11] = (-2666.81,-616.731,104.125);
				zomspawnpoint[16] = (-2670.06,-580.966,104.125);
				zomspawnpoint[21] = (-2673.04,-550.136,104.125);
				zomspawnpoint[2] = (1276.77,-153.461,80.9642);
				zomspawnpoint[7] = (1235.73,-156.65,81.125);
				zomspawnpoint[12] = (1199.49,-166.668,81.125);
				zomspawnpoint[17] = (1162.62,-179.283,80.9342);
				zomspawnpoint[22] = (1128.93,-191.731,80.6437);
				zomspawnpoint[3] = (2866.96,1112.65,104.125);
				zomspawnpoint[8] = (2903.06,1112.3,104.125);
				zomspawnpoint[13] = (2933.66,1112.02,104.125);
				zomspawnpoint[18] = (2968.24,1112.01,104.125);
				zomspawnpoint[23] = (3007.76,1112.04,104.125);
				zomspawnpoint[4] = (1041.23,1352.45,81.125);
				zomspawnpoint[9] = (1080.36,1353.54,80.5076);
				zomspawnpoint[14] = (1118.49,1355.99,80.2806);
				zomspawnpoint[19] = (1154.06,1359.23,80.9236);
				zomspawnpoint[24] = (1184.27,1362.57,80.7259);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-586.347,2029.07,-30.0917);
				zomspawnpoint[5] = (-607.719,2002.23,-28.9098);
				zomspawnpoint[10] = (-630.173,1974.95,-28.3003);
				zomspawnpoint[15] = (-650.764,1950.08,-28.7196);
				zomspawnpoint[20] = (-674.68,1921.11,-30.7126);
				zomspawnpoint[1] = (2655.39,1523.57,-48.7066);
				zomspawnpoint[6] = (2656.68,1487.23,-55.9357);
				zomspawnpoint[11] = (2657.97,1457.09,-60.9227);
				zomspawnpoint[16] = (2659.9,1419.36,-60.1202);
				zomspawnpoint[21] = (2661.83,1381.08,-58.2273);
				zomspawnpoint[2] = (1989.36,-412.79,-87.394);
				zomspawnpoint[7] = (2008.59,-445.109,-91.2813);
				zomspawnpoint[12] = (2027.1,-477.679,-88.3397);
				zomspawnpoint[17] = (2044.83,-508.683,-84.5852);
				zomspawnpoint[22] = (2059.22,-534.545,-78.7146);
				zomspawnpoint[3] = (134.656,-259.642,-127.875);
				zomspawnpoint[8] = (107.422,-288.545,-127.875);
				zomspawnpoint[13] = (81.3448,-316.708,-127.875);
				zomspawnpoint[18] = (56.8379,-342.958,-127.875);
				zomspawnpoint[23] = (29.7595,-371.746,-127.875);
				zomspawnpoint[4] = (-1618.85,25.0687,-63.875);
				zomspawnpoint[9] = (-1646.71,43.5993,-63.875);
				zomspawnpoint[14] = (-1672.59,59.9163,-63.875);
				zomspawnpoint[19] = (-1698.52,76.1453,-63.875);
				zomspawnpoint[24] = (-1730.52,96.2854,-63.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-2149.35,1383.9,-69.6025);
				zomspawnpoint[5] = (-2137.81,1416.63,-61.9023);
				zomspawnpoint[10] = (-2126.86,1444.45,-55.3572);
				zomspawnpoint[15] = (-2115.4,1471.86,-48.9074);
				zomspawnpoint[20] = (-2101.03,1505.5,-40.9904);
				zomspawnpoint[1] = (-21.2793,795.242,-127.875);
				zomspawnpoint[6] = (0.270129,817.225,-127.875);
				zomspawnpoint[11] = (26.7984,844.968,-127.875);
				zomspawnpoint[16] = (47.3408,866.862,-127.875);
				zomspawnpoint[21] = (72.0145,893.476,-127.875);
				zomspawnpoint[2] = (3206.19,1025.88,-34.0251);
				zomspawnpoint[7] = (3205.17,986.199,-34.4616);
				zomspawnpoint[12] = (3204.09,949.748,-37.3966);
				zomspawnpoint[17] = (3202.32,912.784,-46.6046);
				zomspawnpoint[22] = (3200.1,875.291,-51.1411);
				zomspawnpoint[3] = (948.675,-308.888,-55.875);
				zomspawnpoint[8] = (918.111,-310.157,-55.875);
				zomspawnpoint[13] = (880.315,-311.523,-55.875);
				zomspawnpoint[18] = (842.298,-311.61,-55.875);
				zomspawnpoint[23] = (804.299,-311.197,-55.875);
				zomspawnpoint[4] = (-893.781,-866.596,-55.875);
				zomspawnpoint[9] = (-913.235,-835.063,-55.875);
				zomspawnpoint[14] = (-932.176,-804.108,-55.875);
				zomspawnpoint[19] = (-948.183,-778.038,-55.875);
				zomspawnpoint[24] = (-968.385,-745.844,-55.875);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (-1440.15,926.277,-41.1968);
				zomspawnpoint[5] = (-1421.35,953.446,-40.0135);
				zomspawnpoint[10] = (-1403.98,978.605,-39.0759);
				zomspawnpoint[15] = (-1382.67,1009.5,-40.7032);
				zomspawnpoint[20] = (-1365.83,1034.46,-42.6514);
				zomspawnpoint[1] = (376.289,1724.68,-6.96652);
				zomspawnpoint[6] = (374.593,1694.32,-6.54113);
				zomspawnpoint[11] = (372.717,1656.17,-6.61544);
				zomspawnpoint[16] = (372.052,1618.36,-6.36599);
				zomspawnpoint[21] = (372.574,1580.39,-7.55871);
				zomspawnpoint[2] = (3145.93,882.31,-49.2157);
				zomspawnpoint[7] = (3112.83,882.994,-46.372);
				zomspawnpoint[12] = (3081.17,883.304,-45.7361);
				zomspawnpoint[17] = (3051.15,883.491,-45.323);
				zomspawnpoint[22] = (3013.47,884.186,-47.1638);
				zomspawnpoint[3] = (523.312,-833.258,-18.161);
				zomspawnpoint[8] = (517.463,-870.282,-18.6026);
				zomspawnpoint[13] = (512.217,-907.481,-24.364);
				zomspawnpoint[18] = (507.005,-944.864,-27.8777);
				zomspawnpoint[23] = (501.948,-982.542,-26.4428);
				zomspawnpoint[4] = (-1721.55,-699.36,-60.8758);
				zomspawnpoint[9] = (-1744.8,-729.144,-57.2461);
				zomspawnpoint[14] = (-1768.2,-758.95,-54.3885);
				zomspawnpoint[19] = (-1790.43,-787.005,-54.4937);
				zomspawnpoint[24] = (-1814.18,-816.865,-58.8766);			
			break;
		}
	}
	
	// Backlot
	else if(getDvar("mapname") == "mp_backlot")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-151.553,2237.42,60.0447);
				zomspawnpoint[5] = (-152.358,2201.52,59.6797);
				zomspawnpoint[10] = (-153.04,2170.75,59.3693);
				zomspawnpoint[15] = (-153.717,2137.51,59.2233);
				zomspawnpoint[20] = (-154.301,2105.41,58.7189);
				zomspawnpoint[1] = (-1183.85,-236.502,106.125);
				zomspawnpoint[6] = (-1183.62,-274.693,106.125);
				zomspawnpoint[11] = (-1183.37,-312.127,106.125);
				zomspawnpoint[16] = (-1182.85,-351.077,106.125);
				zomspawnpoint[21] = (-1182.02,-388.83,106.125);
				zomspawnpoint[2] = (-394.141,-2339.57,65.7023);
				zomspawnpoint[7] = (-425.006,-2361.06,64.1585);
				zomspawnpoint[12] = (-457.366,-2384.06,64.6342);
				zomspawnpoint[17] = (-487.433,-2405.37,65.3003);
				zomspawnpoint[22] = (-518.062,-2426.89,65.9727);
				zomspawnpoint[3] = (1099.28,-1482.54,72.125);
				zomspawnpoint[8] = (1063.75,-1482.35,72.125);
				zomspawnpoint[13] = (1031.82,-1482.22,72.125);
				zomspawnpoint[18] = (993.815,-1482.36,72.125);
				zomspawnpoint[23] = (956.002,-1482.63,72.125);
				zomspawnpoint[4] = (1436.22,992.289,64.125);
				zomspawnpoint[9] = (1472.68,988.315,64.125);
				zomspawnpoint[14] = (1510.89,984.615,64.125);
				zomspawnpoint[19] = (1549.89,981.183,64.125);
				zomspawnpoint[24] = (1587.01,978.16,64.125);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (247.805,559.776,69.125);
				zomspawnpoint[5] = (212.273,559.37,69.125);
				zomspawnpoint[10] = (182.255,559.052,69.125);
				zomspawnpoint[15] = (143.684,558.687,69.125);
				zomspawnpoint[20] = (105.671,558.888,69.125);
				zomspawnpoint[1] = (-61.572,-317.543,70.4272);
				zomspawnpoint[6] = (-98.4282,-318.234,69.9839);
				zomspawnpoint[11] = (-128.812,-318.868,70.3519);
				zomspawnpoint[16] = (-167.38,-319.255,69.7158);
				zomspawnpoint[21] = (-205.567,-319.017,69.1097);
				zomspawnpoint[2] = (440.617,-485.579,204.125);
				zomspawnpoint[7] = (416.905,-456.124,204.125);
				zomspawnpoint[12] = (393.196,-426.669,204.125);
				zomspawnpoint[17] = (370.459,-398.614,204.125);
				zomspawnpoint[22] = (350.827,-375.148,204.125);
				zomspawnpoint[3] = (-351.49,-1770.16,69.0526);
				zomspawnpoint[8] = (-350.553,-1807.59,69.0828);
				zomspawnpoint[13] = (-349.187,-1843.85,69.1268);
				zomspawnpoint[18] = (-347.762,-1881.99,70.2156);
				zomspawnpoint[23] = (-346.687,-1920.12,72.408);
				zomspawnpoint[4] = (1819.5,-579.266,70.3366);
				zomspawnpoint[9] = (1821.14,-615.076,72.125);
				zomspawnpoint[14] = (1822.93,-645.623,72.125);
				zomspawnpoint[19] = (1825.57,-683.327,72.9434);
				zomspawnpoint[24] = (1827.98,-720.868,72.906);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (1760.5,363.784,240.125);
				zomspawnpoint[5] = (1730.1,363.204,240.125);
				zomspawnpoint[10] = (1692.29,362.459,240.125);
				zomspawnpoint[15] = (1655.81,361.879,240.125);
				zomspawnpoint[20] = (1616.28,361.76,240.125);
				zomspawnpoint[1] = (460.397,-1492.99,68.125);
				zomspawnpoint[6] = (497.966,-1490.86,68.125);
				zomspawnpoint[11] = (536.68,-1488.72,68.125);
				zomspawnpoint[16] = (572.354,-1486.87,68.125);
				zomspawnpoint[21] = (602.428,-1485.26,64.125);
				zomspawnpoint[2] = (-310.53,-2289.07,68.464);
				zomspawnpoint[7] = (-343.652,-2311.3,67.2486);
				zomspawnpoint[12] = (-374.576,-2332.01,66.1155);
				zomspawnpoint[17] = (-405.345,-2352.63,64.9883);
				zomspawnpoint[22] = (-437.361,-2373.75,64.312);
				zomspawnpoint[3] = (-858.201,122.881,-45.875);
				zomspawnpoint[8] = (-896.016,115.192,-45.875);
				zomspawnpoint[13] = (-933.16,107.137,-45.875);
				zomspawnpoint[18] = (-970.485,99.0221,-45.875);
				zomspawnpoint[23] = (-1006.28,91.0395,-45.875);
				zomspawnpoint[4] = (-498.527,1708.62,64.125);
				zomspawnpoint[9] = (-496.974,1745.27,64.125);
				zomspawnpoint[14] = (-495.495,1780.39,64.125);
				zomspawnpoint[19] = (-494.081,1812.66,64.125);
				zomspawnpoint[24] = (-491.887,1850.6,64.125);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (842.309,1304.81,64.125);
				zomspawnpoint[5] = (879.844,1302.09,64.125);
				zomspawnpoint[10] = (915.472,1299.48,64.125);
				zomspawnpoint[15] = (945.605,1297.29,64.125);
				zomspawnpoint[20] = (983.32,1294.56,64.125);
				zomspawnpoint[1] = (832.192,-1509.33,208.125);
				zomspawnpoint[6] = (868.639,-1507.79,208.125);
				zomspawnpoint[11] = (906.796,-1506.15,208.125);
				zomspawnpoint[16] = (945.333,-1504.48,208.125);
				zomspawnpoint[21] = (975.707,-1503.17,208.125);
				zomspawnpoint[2] = (429.434,-458.501,204.125);
				zomspawnpoint[7] = (407.602,-432.421,204.125);
				zomspawnpoint[12] = (387.574,-408.543,204.125);
				zomspawnpoint[17] = (362.645,-379.104,204.125);
				zomspawnpoint[22] = (338.031,-350.151,204.125);
				zomspawnpoint[3] = (-1161.18,-460.803,106.125);
				zomspawnpoint[8] = (-1167.22,-426.304,106.125);
				zomspawnpoint[13] = (-1170.64,-388.237,106.125);
				zomspawnpoint[18] = (-1173.5,-349.39,108.125);
				zomspawnpoint[23] = (-1176.45,-311.771,106.125);
				zomspawnpoint[4] = (44.1594,1213.94,68.125);
				zomspawnpoint[9] = (68.0478,1243.01,68.125);
				zomspawnpoint[14] = (91.6977,1271.77,68.125);
				zomspawnpoint[19] = (115.755,1301.19,68.125);
				zomspawnpoint[24] = (139.784,1330.89,68.125);			
			break;
		}
	}
	
	// Bloc
	else if(getDvar("mapname") == "mp_bloc")
	{				
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
			zomspawnpoint[0] = (1024.37,-5889.78,-23.875);
			zomspawnpoint[5] = (1034.24,-5752.94,-23.875);
			zomspawnpoint[10] = (1172.39,-5752.93,-23.875);
			zomspawnpoint[15] = (1181.99,-5817.2,-23.875);
			zomspawnpoint[20] = (1145.16,-5901.77,-23.875);
			zomspawnpoint[1] = (-997.438,-6317.56,0.125);
			zomspawnpoint[6] = (-1024.82,-6289.6,0.125);
			zomspawnpoint[11] = (-1050.27,-6263.72,0.125);
			zomspawnpoint[16] = (-1071.73,-6241.92,0.125);
			zomspawnpoint[21] = (-1098.17,-6214.89,0.125);
			zomspawnpoint[2] = (-1395.46,-3938.41,5.19714);
			zomspawnpoint[7] = (-1357.91,-3941.79,4.125);
			zomspawnpoint[12] = (-1320.62,-3945.09,0.124999);
			zomspawnpoint[17] = (-1282.75,-3948.3,0.124999);
			zomspawnpoint[22] = (-1244.54,-3951.89,0.124999);
			zomspawnpoint[3] = (3223.97,-5367.46,0.125);
			zomspawnpoint[8] = (3249.68,-5393.08,0.125);
			zomspawnpoint[13] = (3271.08,-5414.4,0.125);
			zomspawnpoint[18] = (3296.1,-5439.38,0.125);
			zomspawnpoint[23] = (3324.63,-5468.38,4.125);
			zomspawnpoint[4] = (3738.36,-7811.23,11.262);
			zomspawnpoint[9] = (3708.23,-7811.58,9.17362);
			zomspawnpoint[14] = (3670.2,-7812.01,4.53842);
			zomspawnpoint[19] = (3633.15,-7811.84,4.31202);
			zomspawnpoint[24] = (3602.37,-7811.7,4.77091);	
			break;	
		
			case 1:
			// spawn set 2
			zomspawnpoint[0] = (1784.82,-4938.02,148.125);
			zomspawnpoint[5] = (1745.49,-4938.61,148.125);
			zomspawnpoint[10] = (1707.68,-4939.26,148.125);
			zomspawnpoint[15] = (1670.83,-4940.06,148.125);
			zomspawnpoint[20] = (1640.44,-4940.85,148.125);
			zomspawnpoint[1] = (1122.79,-6819.84,18.0724);
			zomspawnpoint[6] = (1122.32,-6857.03,22.125);
			zomspawnpoint[11] = (1121.62,-6894.59,23.0405);
			zomspawnpoint[16] = (1120.61,-6932.01,23.166);
			zomspawnpoint[21] = (1118.07,-6967.82,12.7227);
			zomspawnpoint[2] = (4650.92,-6690.46,0.125);
			zomspawnpoint[7] = (4649.99,-6654.55,0.125);
			zomspawnpoint[12] = (4649.55,-6624.15,0.125);
			zomspawnpoint[17] = (4648.98,-6585.2,0.125);
			zomspawnpoint[22] = (4648.51,-6547.96,0.125);
			zomspawnpoint[3] = (72.3808,-4249.21,11.9064);
			zomspawnpoint[8] = (67.5153,-4211.55,10.4329);
			zomspawnpoint[13] = (62.4794,-4173.93,8.63025);
			zomspawnpoint[18] = (57.7583,-4138.2,6.50998);
			zomspawnpoint[23] = (53.9097,-4107.9,4.73089);
			zomspawnpoint[4] = (-2713.08,-5451.13,31.9548);
			zomspawnpoint[9] = (-2676.86,-5451.6,34.2267);
			zomspawnpoint[14] = (-2646.52,-5452.05,36.1393);
			zomspawnpoint[19] = (-2608.02,-5452.47,38.1954);
			zomspawnpoint[24] = (-2570.08,-5452.61,40.4931);
			break;

			case 2:
			// spawn set 3
			zomspawnpoint[0] = (1374.09,-4771,148.125);
			zomspawnpoint[5] = (1410.59,-4771.27,148.125);
			zomspawnpoint[10] = (1449.35,-4771.8,148.125);
			zomspawnpoint[15] = (1487.35,-4772.76,148.125);
			zomspawnpoint[20] = (1524.95,-4774.26,148.125);
			zomspawnpoint[1] = (-279.077,-4361.76,4.125);
			zomspawnpoint[6] = (-277.293,-4327.98,4.125);
			zomspawnpoint[11] = (-275.694,-4297.62,4.125);
			zomspawnpoint[16] = (-273.98,-4267.27,4.125);
			zomspawnpoint[21] = (-271.224,-4229.75,4.125);
			zomspawnpoint[2] = (-2388.3,-3928.32,52.125);
			zomspawnpoint[7] = (-2428.19,-3926.69,52.125);
			zomspawnpoint[12] = (-2465.82,-3925.59,52.125);
			zomspawnpoint[17] = (-2503.23,-3924.43,52.125);
			zomspawnpoint[22] = (-2539.89,-3923.31,52.125);
			zomspawnpoint[3] = (553.276,-6717.5,8.06544);
			zomspawnpoint[8] = (515.333,-6717.43,5.95338);
			zomspawnpoint[13] = (478.851,-6717.2,5.93313);
			zomspawnpoint[18] = (439.323,-6716.79,6.07866);
			zomspawnpoint[23] = (403.838,-6715.88,10.1714);
			zomspawnpoint[4] = (3405.68,-6406.6,0.370015);
			zomspawnpoint[9] = (3444.07,-6407.17,0.38097);
			zomspawnpoint[14] = (3482.62,-6408.17,0.400308);
			zomspawnpoint[19] = (3520.8,-6409.18,0.419748);
			zomspawnpoint[24] = (3557.08,-6410.12,0.363154);
			break;

			case 3:
			// spawn set 4	
			zomspawnpoint[0] = (1199.54,-5898.59,-23.875);
			zomspawnpoint[5] = (1094.04,-5896.79,-23.875);
			zomspawnpoint[10] = (1030.47,-5841.22,-23.875);
			zomspawnpoint[15] = (1069.17,-5720.18,-23.875);
			zomspawnpoint[20] = (1182.08,-5774.51,-23.875);
			zomspawnpoint[1] = (-2748.33,-5466.95,31.1179);
			zomspawnpoint[6] = (-2712.11,-5466.72,33.3275);
			zomspawnpoint[11] = (-2681.76,-5466.53,35.1784);
			zomspawnpoint[16] = (-2644.02,-5466.3,37.4805);
			zomspawnpoint[21] = (-2606.12,-5466.07,39.9791);
			zomspawnpoint[2] = (-2132.49,-4401.5,52.125);
			zomspawnpoint[7] = (-2133.52,-4439.48,52.125);
			zomspawnpoint[12] = (-2134.57,-4478.42,52.125);
			zomspawnpoint[17] = (-2135.63,-4517.36,52.125);
			zomspawnpoint[22] = (-2136.63,-4554.97,52.125);
			zomspawnpoint[3] = (1574.48,-4961.86,148.125);
			zomspawnpoint[8] = (1606.02,-4961.94,148.125);
			zomspawnpoint[13] = (1642.69,-4962.14,148.125);
			zomspawnpoint[18] = (1680.31,-4962.31,148.125);
			zomspawnpoint[23] = (1718.31,-4962.47,148.125);
			zomspawnpoint[4] = (2205.61,-6884.87,8.51828);
			zomspawnpoint[9] = (2204.23,-6922.6,10.5577);
			zomspawnpoint[14] = (2202.9,-6958.81,12.5151);
			zomspawnpoint[19] = (2201.48,-6997.49,14.6058);
			zomspawnpoint[24] = (2200.12,-7034.65,15.668);	
			break;
		}
	}
	
	// Bog
	else if(getDvar("mapname") == "mp_bog")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(2);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (6088.37,902.948,20.1974);
				zomspawnpoint[5] = (6085.92,940.088,21.4367);
				zomspawnpoint[10] = (6082.96,977.934,23.2889);
				zomspawnpoint[15] = (6079.59,1015.17,25.1153);
				zomspawnpoint[20] = (6076.39,1051.27,26.6878);
				zomspawnpoint[1] = (4582.83,325.407,3.24352);
				zomspawnpoint[6] = (4562.99,293.04,5.32965);
				zomspawnpoint[11] = (4544.52,261.008,8.03037);
				zomspawnpoint[16] = (4529.63,234.35,9.7575);
				zomspawnpoint[21] = (4511.71,201.266,9.90771);
				zomspawnpoint[2] = (2591.07,-270.929,-10.875);
				zomspawnpoint[7] = (2570.41,-240.093,-10.875);
				zomspawnpoint[12] = (2553.34,-212.894,-10.875);
				zomspawnpoint[17] = (2535.29,-183.842,-10.875);
				zomspawnpoint[22] = (2515.11,-151.197,-10.875);
				zomspawnpoint[3] = (3069.57,1847.75,10.6632);
				zomspawnpoint[8] = (3071.82,1811.96,8.67411);
				zomspawnpoint[13] = (3073.45,1777.37,5.68707);
				zomspawnpoint[18] = (3075,1736.44,-0.524327);
				zomspawnpoint[23] = (3075.66,1698.51,-4.32077);
				zomspawnpoint[4] = (5226.87,1833.94,-14.8804);
				zomspawnpoint[9] = (5243.43,1800.74,-18.3509);
				zomspawnpoint[14] = (5256.93,1772.55,-23.0341);
				zomspawnpoint[19] = (5271.32,1742.36,-27.875);
				zomspawnpoint[24] = (5287.38,1708.13,-27.875);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (5323.84,661.077,12.125);
				zomspawnpoint[5] = (5323.02,697.366,12.125);
				zomspawnpoint[10] = (5321.83,737.059,12.125);
				zomspawnpoint[15] = (5320.47,775.035,12.125);
				zomspawnpoint[20] = (5319.43,812.647,12.125);
				zomspawnpoint[1] = (2841.53,820.627,-5.875);
				zomspawnpoint[6] = (2803.92,819.411,-5.875);
				zomspawnpoint[11] = (2771.45,818.008,-5.875);
				zomspawnpoint[16] = (2737.85,816.609,-5.875);
				zomspawnpoint[21] = (2699.11,815.248,-5.875);
				zomspawnpoint[2] = (3699.57,2139.21,26.025);
				zomspawnpoint[7] = (3739.85,2140.03,26.025);
				zomspawnpoint[12] = (3779.17,2140.77,26.025);
				zomspawnpoint[17] = (3817.17,2141.21,26.025);
				zomspawnpoint[22] = (3855.17,2141.61,26.025);
				zomspawnpoint[3] = (5935.63,2016.37,22.3639);
				zomspawnpoint[8] = (5938.48,1978.93,20.0048);
				zomspawnpoint[13] = (5941.86,1942.46,22.261);
				zomspawnpoint[18] = (5945.47,1904.71,24.6842);
				zomspawnpoint[23] = (5948.52,1873.76,26.6597);
				zomspawnpoint[4] = (4556.5,286.599,5.85686);
				zomspawnpoint[9] = (4531.05,255.964,8.27678);
				zomspawnpoint[14] = (4506.9,227.099,7.26398);
				zomspawnpoint[19] = (4483.41,199.432,6.50192);
				zomspawnpoint[24] = (4463.44,176.495,6.38295);			
			break;
		}
	}	
	
	// Burg
	if(getDvar("mapname") == "mp_burg")
	{		
		number = 0;
		if(randomspawns == 1)
		{		 
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-5134.48,-722.862,712.683);
				zomspawnpoint[5] = (-5099.73,-722.827,712.327);
				zomspawnpoint[10] = (-5058.52,-722.793,710.972);
				zomspawnpoint[15] = (-5020.72,-722.792,710.106);
				zomspawnpoint[20] = (-4985.58,-722.989,709.484);
				zomspawnpoint[1] = (-2799.06,2697.24,691.608);
				zomspawnpoint[6] = (-2761.48,2693.3,692.816);
				zomspawnpoint[11] = (-2723.14,2689.25,694.101);
				zomspawnpoint[16] = (-2688.9,2685.08,696.596);
				zomspawnpoint[21] = (-2657.47,2680.3,699.557);
				zomspawnpoint[2] = (-409.149,862.24,687.884);
				zomspawnpoint[7] = (-408.148,824.672,690.869);
				zomspawnpoint[12] = (-407.264,789.75,692.044);
				zomspawnpoint[17] = (-406.452,758.865,693.77);
				zomspawnpoint[22] = (-405.274,720.304,697.579);
				zomspawnpoint[3] = (2892.83,2291.1,688.253);
				zomspawnpoint[8] = (2856.76,2287.11,687.772);
				zomspawnpoint[13] = (2825.04,2283.54,687.4);
				zomspawnpoint[18] = (2788.23,2279.41,686.615);
				zomspawnpoint[23] = (2749.16,2275.06,687.54);
				zomspawnpoint[4] = (2422.01,-1841.16,837.764);
				zomspawnpoint[9] = (2382.6,-1847.5,833.992);
				zomspawnpoint[14] = (2347.68,-1853.15,830.66);
				zomspawnpoint[19] = (2312.76,-1858.76,827.316);
				zomspawnpoint[24] = (2272.79,-1865.14,823.472);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-652.381,281.384,1145.13);
				zomspawnpoint[5] = (-683.703,-193.336,1145.13);
				zomspawnpoint[10] = (-734.344,-960.239,1171.13);
				zomspawnpoint[15] = (583.383,-936.036,1260.13);
				zomspawnpoint[20] = (615.075,831.174,1305.13);
				zomspawnpoint[1] = (1161.01,711.414,1078.02);
				zomspawnpoint[6] = (1161.07,749.184,1076.19);
				zomspawnpoint[11] = (1161.12,787.15,1074.83);
				zomspawnpoint[16] = (1161.18,825.14,1075.91);
				zomspawnpoint[21] = (1161.23,863.315,1077.11);
				zomspawnpoint[2] = (-2711.09,-1391.81,545.383);
				zomspawnpoint[7] = (-2710.86,-1360.89,548.005);
				zomspawnpoint[12] = (-2710.82,-1322.27,545.21);
				zomspawnpoint[17] = (-2710.64,-1283.43,543.151);
				zomspawnpoint[22] = (-2710.35,-1253.46,541.723);
				zomspawnpoint[3] = (5963.06,1962.3,708.553);
				zomspawnpoint[8] = (5961.27,1925.53,699.135);
				zomspawnpoint[13] = (5959.49,1888.93,689.777);
				zomspawnpoint[18] = (5957.7,1852.02,680.919);
				zomspawnpoint[23] = (5955.9,1814.92,672.016);
				zomspawnpoint[4] = (2947.46,414.994,767.775);
				zomspawnpoint[9] = (2883.58,1019.08,772.302);
				zomspawnpoint[14] = (3487.52,967.855,771.884);
				zomspawnpoint[19] = (3699.92,637.075,765.293);
				zomspawnpoint[24] = (3428.16,399.904,776.943);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-5669.3,2157.41,502.114);
				zomspawnpoint[5] = (-5679.06,2118.31,503.223);
				zomspawnpoint[10] = (-5687.28,2084.3,504.225);
				zomspawnpoint[15] = (-5694.06,2055.07,504.603);
				zomspawnpoint[20] = (-5702.3,2019.02,502.394);
				zomspawnpoint[1] = (-417.026,-711.427,570.361);
				zomspawnpoint[6] = (-379.229,-711.237,569.404);
				zomspawnpoint[11] = (-341.235,-711.039,568.775);
				zomspawnpoint[16] = (-303.05,-710.835,568.144);
				zomspawnpoint[21] = (-265.241,-710.654,568.125);
				zomspawnpoint[2] = (449.59,789.041,832.962);
				zomspawnpoint[7] = (464.105,469.162,833.028);
				zomspawnpoint[12] = (323.002,475.023,788.617);
				zomspawnpoint[17] = (245.098,381.907,765.693);
				zomspawnpoint[22] = (441.038,646.755,830.594);
				zomspawnpoint[3] = (-1109.56,2031.65,611.144);
				zomspawnpoint[8] = (-916.353,2125.21,572.96);
				zomspawnpoint[13] = (-800.916,2168.58,566.691);
				zomspawnpoint[18] = (-664.453,2208.34,565.776);
				zomspawnpoint[23] = (-509.195,2246.47,587.25);
				zomspawnpoint[4] = (5327.14,-1161.05,753.723);
				zomspawnpoint[9] = (5332.55,-1121.43,756.586);
				zomspawnpoint[14] = (5336.9,-1086.07,759.319);
				zomspawnpoint[19] = (5340.55,-1055.97,761.34);
				zomspawnpoint[24] = (5344.72,-1020.69,761.92);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (-5632.68,-219.68,750.115);
				zomspawnpoint[5] = (-5629.9,-181.716,750.934);
				zomspawnpoint[10] = (-5627.08,-144.035,749.564);
				zomspawnpoint[15] = (-5624.26,-106.164,748.212);
				zomspawnpoint[20] = (-5621.36,-68.0834,748.125);
				zomspawnpoint[1] = (-1082.5,-673.544,622.534);
				zomspawnpoint[6] = (-1082.5,-582.4,605.037);
				zomspawnpoint[11] = (-1082.97,-488.336,600.064);
				zomspawnpoint[16] = (-1084.11,-368.164,596.927);
				zomspawnpoint[21] = (-1082.33,-203.43,597.713);
				zomspawnpoint[2] = (606.948,839.87,1305.13);
				zomspawnpoint[7] = (690.181,837.887,1305.13);
				zomspawnpoint[12] = (792.152,832.863,1305.13);
				zomspawnpoint[17] = (633.843,813.854,1149.6);
				zomspawnpoint[22] = (591.443,815.214,1149.62);
				zomspawnpoint[3] = (-83.9232,1021.2,1053.13);
				zomspawnpoint[8] = (-117.736,1021.2,1053.13);
				zomspawnpoint[13] = (-155.736,1021.19,1053.13);
				zomspawnpoint[18] = (-193.546,1021.19,1053.13);
				zomspawnpoint[23] = (-231.736,1021.18,1053.13);
				zomspawnpoint[4] = (2922.97,723.836,768.819);
				zomspawnpoint[9] = (3037.3,466.872,768.669);
				zomspawnpoint[14] = (3362.51,415.167,775.751);
				zomspawnpoint[19] = (3711.19,595.475,771.289);
				zomspawnpoint[24] = (3559.85,892.804,767.548);
			break;			
		}
	}
		
	// Broadcat
	else if(getDvar("mapname") == "mp_broadcast")
	{	
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
		
		switch(number)
		{	
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-1989.89,2374.29,-74.1101);
				zomspawnpoint[5] = (-1953.16,2368.21,-74.8233);
				zomspawnpoint[10] = (-1922.94,2363.6,-74.2229);
				zomspawnpoint[15] = (-1885.65,2358.15,-70.97);
				zomspawnpoint[20] = (-1848.88,2353.06,-66.1223);
				zomspawnpoint[1] = (853.187,1635.43,-48.2066);
				zomspawnpoint[6] = (873.478,1604.03,-46.7812);
				zomspawnpoint[11] = (889.893,1578.71,-45.2476);
				zomspawnpoint[16] = (910.421,1547.25,-45.4604);
				zomspawnpoint[21] = (931.32,1515.58,-47.6632);
				zomspawnpoint[2] = (-159.392,637.66,-31.875);
				zomspawnpoint[7] = (-140.232,603.95,-31.875);
				zomspawnpoint[12] = (-121.076,571.343,-31.875);
				zomspawnpoint[17] = (-101.559,538.942,-31.875);
				zomspawnpoint[22] = (-81.565,506.392,-31.875);
				zomspawnpoint[3] = (1070.98,247.583,136.125);
				zomspawnpoint[8] = (1051.32,278.54,136.125);
				zomspawnpoint[13] = (1031.37,310.438,136.125);
				zomspawnpoint[18] = (1015.1,336.344,136.125);
				zomspawnpoint[23] = (995.825,366.871,136.125);
				zomspawnpoint[4] = (-773.813,141.964,184.125);
				zomspawnpoint[9] = (-792.039,174.875,184.125);
				zomspawnpoint[14] = (-810.35,207.956,184.125);
				zomspawnpoint[19] = (-828.704,241.242,184.125);
				zomspawnpoint[24] = (-846.703,274.714,184.125);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-1428.71,355.691,54.7544);
				zomspawnpoint[5] = (-1446.96,387.276,46.2936);
				zomspawnpoint[10] = (-1466.52,419.137,37.5944);
				zomspawnpoint[15] = (-1486.12,450.535,28.9774);
				zomspawnpoint[20] = (-1505.2,482.264,20.3723);
				zomspawnpoint[1] = (-1189.92,3723.51,-39.9859);
				zomspawnpoint[6] = (-1219.31,3706.45,-38.6711);
				zomspawnpoint[11] = (-1255.18,3685.42,-37.0525);
				zomspawnpoint[16] = (-1288.41,3666.27,-35.6743);
				zomspawnpoint[21] = (-1321.24,3647.52,-34.6812);
				zomspawnpoint[2] = (667.544,1532.99,136.125);
				zomspawnpoint[7] = (644.75,1556.97,136.125);
				zomspawnpoint[12] = (619.498,1581.98,136.125);
				zomspawnpoint[17] = (592.548,1607.96,136.125);
				zomspawnpoint[22] = (565.457,1633.8,136.125);
				zomspawnpoint[3] = (769.801,-855.293,-31.875);
				zomspawnpoint[8] = (742.122,-841.826,-31.875);
				zomspawnpoint[13] = (707.955,-825.185,-31.875);
				zomspawnpoint[18] = (673.083,-807.882,-30.8846);
				zomspawnpoint[23] = (641.524,-792.111,-31.875);
				zomspawnpoint[4] = (-396.876,-908.112,-31.875);
				zomspawnpoint[9] = (-416.405,-875.044,-31.875);
				zomspawnpoint[14] = (-435.023,-844.544,-31.875);
				zomspawnpoint[19] = (-451.385,-818.693,-31.875);
				zomspawnpoint[24] = (-472.089,-787.047,-31.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (825.403,1660.63,-47.26);
				zomspawnpoint[5] = (850.041,1631.21,-48.036);
				zomspawnpoint[10] = (872.733,1603.65,-46.6917);
				zomspawnpoint[15] = (897.323,1572.5,-45.1007);
				zomspawnpoint[20] = (919.928,1543.71,-46.5759);
				zomspawnpoint[1] = (-311.819,533.645,136.125);
				zomspawnpoint[6] = (-326.47,498.991,136.125);
				zomspawnpoint[11] = (-341.171,464.357,136.125);
				zomspawnpoint[16] = (-356.211,428.003,136.125);
				zomspawnpoint[21] = (-370.284,392.691,136.125);
				zomspawnpoint[2] = (-1342.35,2871.44,-33.6);
				zomspawnpoint[7] = (-1307.85,2890.33,-33.2316);
				zomspawnpoint[12] = (-1274.2,2908.8,-32.8711);
				zomspawnpoint[17] = (-1240.98,2927.26,-32.4998);
				zomspawnpoint[22] = (-1209.1,2944.99,-32.1427);
				zomspawnpoint[3] = (832.296,-62.9079,-31.875);
				zomspawnpoint[8] = (801.025,-80.9488,-31.875);
				zomspawnpoint[13] = (767.744,-100.069,-31.875);
				zomspawnpoint[18] = (734.537,-118.935,-31.875);
				zomspawnpoint[23] = (701.68,-137.643,-31.875);
				zomspawnpoint[4] = (-378.448,-1037.14,-31.875);
				zomspawnpoint[9] = (-411.464,-1055.19,-31.875);
				zomspawnpoint[14] = (-445.477,-1073.78,-31.875);
				zomspawnpoint[19] = (-479.074,-1091.95,-31.875);
				zomspawnpoint[24] = (-510.728,-1108.52,-31.875);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (-862.073,-119.486,184.125);
				zomspawnpoint[5] = (-842.483,-150.502,184.125);
				zomspawnpoint[10] = (-826.614,-176.211,184.125);
				zomspawnpoint[15] = (-806.92,-208.717,184.125);
				zomspawnpoint[20] = (-787.707,-240.843,184.125);
				zomspawnpoint[1] = (1074.8,509.916,136.125);
				zomspawnpoint[6] = (1094.72,474.892,136.125);
				zomspawnpoint[11] = (1113.16,441.884,136.125);
				zomspawnpoint[16] = (1131.42,408.553,136.125);
				zomspawnpoint[21] = (1148.74,376.443,136.125);
				zomspawnpoint[2] = (755.329,-523.251,-31.875);
				zomspawnpoint[7] = (719.497,-536.224,-31.875);
				zomspawnpoint[12] = (685.789,-553.066,-31.875);
				zomspawnpoint[17] = (652.982,-570.576,-31.875);
				zomspawnpoint[22] = (619.758,-588.261,-31.875);
				zomspawnpoint[3] = (-171.909,649.306,-31.875);
				zomspawnpoint[8] = (-156.606,622.593,-31.875);
				zomspawnpoint[13] = (-137.312,589.634,-31.875);
				zomspawnpoint[18] = (-118.117,556.838,-31.875);
				zomspawnpoint[23] = (-98.9547,524.02,-31.875);
				zomspawnpoint[4] = (-1967.57,3521.11,-61.7729);
				zomspawnpoint[9] = (-1968.49,3490.53,-61.4122);
				zomspawnpoint[14] = (-1969.92,3455.6,-61.0007);
				zomspawnpoint[19] = (-1971.39,3420.67,-60.5893);
				zomspawnpoint[24] = (-1972.98,3379.66,-60.1061);			
			break;
		}
	}
	
	// Chinatown
	else if(getDvar("mapname") == "mp_carentan")
	{	
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		};
		
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (749.654,-1060.02,-3.90421);
				zomspawnpoint[5] = (749.233,-1022.97,-3.92994);
				zomspawnpoint[10] = (748.319,-992.58,-3.98587);
				zomspawnpoint[15] = (746.552,-957.661,-4.0939);
				zomspawnpoint[20] = (744.264,-917.341,2.51861);
				zomspawnpoint[1] = (391.936,2013.93,-143.875);
				zomspawnpoint[6] = (429.556,2013.94,-143.875);
				zomspawnpoint[11] = (467.37,2013.98,-143.875);
				zomspawnpoint[16] = (505.375,2014.04,-143.875);
				zomspawnpoint[21] = (543.379,2014.09,-143.875);
				zomspawnpoint[2] = (836.625,3861.45,-23.875);
				zomspawnpoint[7] = (875.169,3860.01,-23.875);
				zomspawnpoint[12] = (912.575,3858.58,-23.875);
				zomspawnpoint[17] = (950.55,3857.16,-23.875);
				zomspawnpoint[22] = (988.145,3855.74,-23.875);
				zomspawnpoint[3] = (-682.232,2591.74,-23.875);
				zomspawnpoint[8] = (-708.555,2566.47,-23.875);
				zomspawnpoint[13] = (-736.343,2540.26,-23.875);
				zomspawnpoint[18] = (-762.951,2516.14,-23.875);
				zomspawnpoint[23] = (-785.666,2495.65,-23.875);
				zomspawnpoint[4] = (1716.87,949.852,-23.875);
				zomspawnpoint[9] = (1717.96,987.846,-23.875);
				zomspawnpoint[14] = (1719.41,1018.02,-23.875);
				zomspawnpoint[19] = (1721.14,1055.22,-23.875);
				zomspawnpoint[24] = (1722.95,1091.85,-23.875);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-11.9347,-1040.45,44.7892);
				zomspawnpoint[5] = (-6.27552,-1078.31,42.0944);
				zomspawnpoint[10] = (-0.942222,-1113.81,38.2531);
				zomspawnpoint[15] = (3.52733,-1143.45,34.5523);
				zomspawnpoint[20] = (8.78738,-1179.09,30.1115);
				zomspawnpoint[1] = (1164.22,393.202,-8.53041);
				zomspawnpoint[6] = (1201.78,393.222,-10.6174);
				zomspawnpoint[11] = (1239.92,393.774,-12.7362);
				zomspawnpoint[16] = (1276.53,394.562,-14.7699);
				zomspawnpoint[21] = (1306.51,395.17,-15.908);
				zomspawnpoint[2] = (-22.2561,1917.67,-143.875);
				zomspawnpoint[7] = (14.2934,1923.85,-143.875);
				zomspawnpoint[12] = (52.4115,1930.91,-143.875);
				zomspawnpoint[17] = (89.1111,1938.32,-143.875);
				zomspawnpoint[22] = (124.127,1946.33,-143.875);
				zomspawnpoint[3] = (895.74,3862.78,-23.875);
				zomspawnpoint[8] = (933.698,3860.98,-23.875);
				zomspawnpoint[13] = (971.847,3859.19,-23.875);
				zomspawnpoint[18] = (1010,3857.33,-23.875);
				zomspawnpoint[23] = (1046.05,3855.38,-23.875);
				zomspawnpoint[4] = (1086.53,1637.35,144.125);
				zomspawnpoint[9] = (1087.08,1599.35,144.125);
				zomspawnpoint[14] = (1087.43,1559.82,144.125);
				zomspawnpoint[19] = (1087.59,1521.81,144.125);
				zomspawnpoint[24] = (1087.78,1487.42,144.125);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-173.141,525.595,0.124998);
				zomspawnpoint[5] = (-179.434,561.143,0.124998);
				zomspawnpoint[10] = (-186.227,599.497,0.124998);
				zomspawnpoint[15] = (-193.179,636.863,0.124998);
				zomspawnpoint[20] = (-200.428,674.169,0.124998);
				zomspawnpoint[1] = (812.857,188.262,-7.875);
				zomspawnpoint[6] = (848.931,189.736,-7.875);
				zomspawnpoint[11] = (886.716,191.164,-7.875);
				zomspawnpoint[16] = (917.095,192.312,-7.875);
				zomspawnpoint[21] = (955.071,193.68,-7.875);
				zomspawnpoint[2] = (460.923,1164.71,160.125);
				zomspawnpoint[7] = (423.16,1166.83,160.125);
				zomspawnpoint[12] = (385.24,1169.54,160.125);
				zomspawnpoint[17] = (347.594,1173.22,160.125);
				zomspawnpoint[22] = (309.639,1177.47,160.125);
				zomspawnpoint[3] = (-987.306,2073.86,-7.875);
				zomspawnpoint[8] = (-960.176,2098.26,-7.875);
				zomspawnpoint[13] = (-931.969,2123.73,-7.875);
				zomspawnpoint[18] = (-904.244,2148.88,-7.875);
				zomspawnpoint[23] = (-881.604,2169.45,-7.875);
				zomspawnpoint[4] = (1863.57,1886.76,-23.875);
				zomspawnpoint[9] = (1864.05,1926.67,-23.875);
				zomspawnpoint[14] = (1864.47,1963.54,-23.875);
				zomspawnpoint[19] = (1864.9,2002.29,-23.875);
				zomspawnpoint[24] = (1865.67,2040.11,-23.875);			
			break;
		}
	}
	
	// Countdown
	else if(getDvar("mapname") == "mp_countdown")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		}
		
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (2416.16,-145.955,-6.875);
				zomspawnpoint[5] = (2415.44,-115.94,-6.875);
				zomspawnpoint[10] = (2414.27,-80.0473,-6.875);
				zomspawnpoint[15] = (2413.18,-49.2838,-6.875);
				zomspawnpoint[20] = (2411.69,-12.0721,-6.875);
				zomspawnpoint[1] = (2210.09,698.5,-7.875);
				zomspawnpoint[6] = (2174.99,696.622,-7.875);
				zomspawnpoint[11] = (2144.8,695.345,-7.875);
				zomspawnpoint[16] = (2095.83,693.285,-7.875);
				zomspawnpoint[21] = (2059.38,691.711,-7.875);
				zomspawnpoint[2] = (383.795,2338.43,-23.875);
				zomspawnpoint[7] = (351.185,2357.19,-23.875);
				zomspawnpoint[12] = (318.23,2376.51,-23.875);
				zomspawnpoint[17] = (287.254,2394.68,-23.875);
				zomspawnpoint[22] = (252.525,2415.1,-23.875);
				zomspawnpoint[3] = (-2096.1,1026.3,-11.0034);
				zomspawnpoint[8] = (-2093.36,988.968,-11.3792);
				zomspawnpoint[13] = (-2090.9,953.716,-12.0505);
				zomspawnpoint[18] = (-2088.91,922.999,-12.0479);
				zomspawnpoint[23] = (-2086.75,885.247,-11.9304);
				zomspawnpoint[4] = (-1445.36,-1518.22,-6.3539);
				zomspawnpoint[9] = (-1419.48,-1547.32,-5.29455);
				zomspawnpoint[14] = (-1396.7,-1573.06,-4.26068);
				zomspawnpoint[19] = (-1371.68,-1601.38,-2.93777);
				zomspawnpoint[24] = (-1346.39,-1630.73,-1.54996);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (1349.1,341.447,-23.875);
				zomspawnpoint[5] = (1349.54,302.689,-21.4375);
				zomspawnpoint[10] = (1350.24,266.773,-23.875);
				zomspawnpoint[15] = (1351.7,227.081,-23.875);
				zomspawnpoint[20] = (1353.24,191.013,-23.875);
				zomspawnpoint[1] = (1299.67,-1604.66,4.22449);
				zomspawnpoint[6] = (1334.69,-1588.45,4.30429);
				zomspawnpoint[11] = (1365.94,-1573.65,4.3597);
				zomspawnpoint[16] = (1400.15,-1557.11,4.03297);
				zomspawnpoint[21] = (1434.15,-1540.6,3.02012);
				zomspawnpoint[2] = (-2364.79,174.529,-15.875);
				zomspawnpoint[7] = (-2358.45,211.419,-15.875);
				zomspawnpoint[12] = (-2352.07,247.725,-15.875);
				zomspawnpoint[17] = (-2345.27,285.113,-15.875);
				zomspawnpoint[22] = (-2338.39,323.064,-15.875);
				zomspawnpoint[3] = (-2146.26,1645.09,-15.875);
				zomspawnpoint[8] = (-2109.21,1645.17,-15.875);
				zomspawnpoint[13] = (-2070.64,1645.39,-15.875);
				zomspawnpoint[18] = (-2033.02,1645.64,-15.875);
				zomspawnpoint[23] = (-1995.21,1646.27,-15.875);
				zomspawnpoint[4] = (-216.527,2654.2,-23.875);
				zomspawnpoint[9] = (-186.088,2633.41,-23.875);
				zomspawnpoint[14] = (-161.297,2616.48,-23.875);
				zomspawnpoint[19] = (-130.043,2594.51,-23.875);
				zomspawnpoint[24] = (-99.6942,2571.31,-23.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (2062.71,1108.37,-23.875);
				zomspawnpoint[5] = (2064.45,1145.95,-23.875);
				zomspawnpoint[10] = (2066.14,1182.78,-23.875);
				zomspawnpoint[15] = (2067.57,1220.76,-23.875);
				zomspawnpoint[20] = (2068.47,1251.35,-23.875);
				zomspawnpoint[1] = (1204.86,1701.86,-23.875);
				zomspawnpoint[6] = (1235.49,1680.34,-23.875);
				zomspawnpoint[11] = (1266.56,1659.11,-23.875);
				zomspawnpoint[16] = (1297.61,1638.2,-23.875);
				zomspawnpoint[21] = (1329.36,1617.66,-23.875);
				zomspawnpoint[2] = (-1008.2,2349.49,-1.875);
				zomspawnpoint[7] = (-1027.65,2315.3,-1.875);
				zomspawnpoint[12] = (-1042.48,2288.98,-1.875);
				zomspawnpoint[17] = (-1060.54,2256.41,-1.875);
				zomspawnpoint[22] = (-1078.95,2223.38,-1.875);
				zomspawnpoint[3] = (-2245.35,553.985,-19.4221);
				zomspawnpoint[8] = (-2207.92,553.941,-19.2889);
				zomspawnpoint[13] = (-2175.8,553.411,-19.19);
				zomspawnpoint[18] = (-2145.42,552.226,-19.1178);
				zomspawnpoint[23] = (-2114.87,550.485,-19.0624);
				zomspawnpoint[4] = (725.095,-1968,9.91115);
				zomspawnpoint[9] = (-43.1682,-1960.05,16.125);
				zomspawnpoint[14] = (-786.585,-1934.58,36.6196);
				zomspawnpoint[19] = (-453.922,-1939.51,9.11251);
				zomspawnpoint[24] = (330.403,-1963.87,3.45042);
			break;
		}
	}
	
	// Crash / Winter Crash
	else if((getDvar("mapname") == "mp_crash") || (getDvar("mapname") == "mp_crash_snow"))
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (582.263,-1974.3,129.941);
				zomspawnpoint[5] = (558.093,-1943.77,128.847);
				zomspawnpoint[10] = (538.089,-1918.45,127.53);
				zomspawnpoint[15] = (513.603,-1887.47,125.919);
				zomspawnpoint[20] = (488.858,-1856.2,124.59);
				zomspawnpoint[1] = (-203.128,-1979.72,192.656);
				zomspawnpoint[6] = (-180.153,-1953.82,184.755);
				zomspawnpoint[11] = (-159.017,-1929.77,180.52);
				zomspawnpoint[16] = (-134.248,-1901.37,175.198);
				zomspawnpoint[21] = (-110.293,-1874.33,163.398);
				zomspawnpoint[2] = (1715.04,-188.778,71.7556);
				zomspawnpoint[7] = (1677.8,-188.352,71.0214);
				zomspawnpoint[12] = (1642.09,-187.999,70.5169);
				zomspawnpoint[17] = (1612.07,-187.701,70.517);
				zomspawnpoint[22] = (1572.74,-187.254,70.5234);
				zomspawnpoint[3] = (169.355,2205.15,236.125);
				zomspawnpoint[8] = (166.299,2169.37,236.125);
				zomspawnpoint[13] = (162.741,2130.01,236.125);
				zomspawnpoint[18] = (159.387,2092.34,236.125);
				zomspawnpoint[23] = (156.03,2054.87,236.125);
				zomspawnpoint[4] = (-614.433,439.565,233.997);
				zomspawnpoint[9] = (-576.259,438.154,233.636);
				zomspawnpoint[14] = (-537.541,436.259,233.285);
				zomspawnpoint[19] = (-500.064,434.285,231.076);
				zomspawnpoint[24] = (-463.142,432.108,229.276);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (1567.22,624.405,580.125);
				zomspawnpoint[5] = (1596.53,598.454,580.125);
				zomspawnpoint[10] = (1622.98,575.015,580.125);
				zomspawnpoint[15] = (1651.96,549.552,580.125);
				zomspawnpoint[20] = (1681.1,524.56,580.125);
				zomspawnpoint[1] = (84.723,827.209,135.284);
				zomspawnpoint[6] = (115.422,807.865,134.422);
				zomspawnpoint[11] = (147.444,787.794,133.146);
				zomspawnpoint[16] = (174.547,770.992,131.733);
				zomspawnpoint[21] = (204.398,752.496,130.177);
				zomspawnpoint[2] = (-580.121,1809.51,418.055);
				zomspawnpoint[7] = (-580.8,1774.26,416.164);
				zomspawnpoint[12] = (-581.599,1742.49,413.626);
				zomspawnpoint[17] = (-583.45,1707.04,413.803);
				zomspawnpoint[22] = (-585.142,1675.36,414.333);
				zomspawnpoint[3] = (-188.974,-1968.85,188.857);
				zomspawnpoint[8] = (-169.901,-1945.21,183.141);
				zomspawnpoint[13] = (-147.602,-1917.47,178.337);
				zomspawnpoint[18] = (-128.72,-1894.48,172.287);
				zomspawnpoint[23] = (-105.182,-1866.16,160.189);
				zomspawnpoint[4] = (1589.99,-1433.63,226.125);
				zomspawnpoint[9] = (1551.8,-1433.64,226.125);
				zomspawnpoint[14] = (1516.84,-1433.63,226.125);
				zomspawnpoint[19] = (1477.32,-1433.36,226.125);
				zomspawnpoint[24] = (1439.7,-1432.75,226.125);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (1235.03,-1802.84,64.125);
				zomspawnpoint[5] = (1236.65,-1770.57,64.125);
				zomspawnpoint[10] = (1238.49,-1735.85,64.125);
				zomspawnpoint[15] = (1240.06,-1705.87,64.125);
				zomspawnpoint[20] = (1241.84,-1670,64.125);
				zomspawnpoint[1] = (372.781,-558.039,272.125);
				zomspawnpoint[6] = (351.716,-587.189,272.125);
				zomspawnpoint[11] = (329.707,-617.7,272.125);
				zomspawnpoint[16] = (307.894,-647.889,272.125);
				zomspawnpoint[21] = (284.838,-678.357,272.125);
				zomspawnpoint[2] = (1302.33,1191.75,136.125);
				zomspawnpoint[7] = (1328.74,1216.64,136.125);
				zomspawnpoint[12] = (1356.53,1242.83,136.125);
				zomspawnpoint[17] = (1382.6,1267.53,136.125);
				zomspawnpoint[22] = (1405.48,1289.24,136.125);
				zomspawnpoint[3] = (-815.842,1323.76,243.42);
				zomspawnpoint[8] = (-778.138,1321.15,244.497);
				zomspawnpoint[13] = (-741.063,1318.48,242.12);
				zomspawnpoint[18] = (-710.43,1316.21,240.145);
				zomspawnpoint[23] = (-674.721,1313.52,239.044);
				zomspawnpoint[4] = (1714.19,-194.464,71.5079);
				zomspawnpoint[9] = (1683.98,-194.294,70.8782);
				zomspawnpoint[14] = (1646.75,-193.563,70.3124);
				zomspawnpoint[19] = (1610.66,-192.813,70.3243);
				zomspawnpoint[24] = (1580.45,-192.182,70.3343);
			break;
		}
	}
	
	// Creek
	else if(getDvar("mapname") == "mp_creek")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (69.8057,3482.14,21.0513);
				zomspawnpoint[5] = (52.8695,3514.01,19.9865);
				zomspawnpoint[10] = (38.4628,3540.5,20.4592);
				zomspawnpoint[15] = (20.6559,3573.33,25.0195);
				zomspawnpoint[20] = (2.77655,3606.65,28.4522);
				zomspawnpoint[1] = (-1359.39,5484.75,-14.6659);
				zomspawnpoint[6] = (-1336.21,5452.86,-9.99149);
				zomspawnpoint[11] = (-1315.66,5424.74,-6.95138);
				zomspawnpoint[16] = (-1297.05,5399.3,-5.80942);
				zomspawnpoint[21] = (-1274.65,5368.64,-4.44491);
				zomspawnpoint[2] = (-3363.66,5491.14,-126.648);
				zomspawnpoint[7] = (-3327.7,5521.91,-130.875);
				zomspawnpoint[12] = (-3299.15,5546.13,-125.195);
				zomspawnpoint[17] = (-3270.62,5567.89,-126.664);
				zomspawnpoint[22] = (-3246.85,5586.26,-129.838);
				zomspawnpoint[3] = (-5494.08,5765.3,167.245);
				zomspawnpoint[8] = (-5478.26,5729.07,166.771);
				zomspawnpoint[13] = (-5463.23,5692.94,166.309);
				zomspawnpoint[18] = (-5450.27,5661.29,165.907);
				zomspawnpoint[23] = (-5438.06,5631.59,165.526);
				zomspawnpoint[4] = (-1139.89,7855.36,159.296);
				zomspawnpoint[9] = (-1103.61,7858.85,153.764);
				zomspawnpoint[14] = (-1063.92,7862.82,148.099);
				zomspawnpoint[19] = (-1029.76,7866.53,142.768);
				zomspawnpoint[24] = (-990.374,7870.81,136.622);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-415.732,5147.01,122.988);
				zomspawnpoint[5] = (-439.016,5168.86,126.423);
				zomspawnpoint[10] = (-462.603,5191.21,129.964);
				zomspawnpoint[15] = (-489.962,5217.54,134.102);
				zomspawnpoint[20] = (-515.636,5242.32,138.116);
				zomspawnpoint[1] = (1436.89,5477.65,55.9751);
				zomspawnpoint[6] = (1439.68,5515.14,48.2143);
				zomspawnpoint[11] = (1442.7,5557.93,38.9064);
				zomspawnpoint[16] = (1444.14,5588.04,36.8594);
				zomspawnpoint[21] = (1446.31,5624.19,34.5216);
				zomspawnpoint[2] = (-3821.77,5615.39,184.128);
				zomspawnpoint[7] = (-3857.24,5630.56,184.128);
				zomspawnpoint[12] = (-3886.85,5643.47,184.128);
				zomspawnpoint[17] = (-3917.79,5657.13,184.128);
				zomspawnpoint[22] = (-3948.99,5671.62,184.128);
				zomspawnpoint[3] = (-5116.79,6968.4,185.522);
				zomspawnpoint[8] = (-4956.6,6914.38,174.102);
				zomspawnpoint[13] = (-4894,7042.03,173.806);
				zomspawnpoint[18] = (-4779.13,7158.96,173.164);
				zomspawnpoint[23] = (-4772.89,6891.71,169.08);
				zomspawnpoint[4] = (-3099.24,6923.95,172.123);
				zomspawnpoint[9] = (-3079.44,6900.63,172.123);
				zomspawnpoint[14] = (-3056.29,6873.68,172.123);
				zomspawnpoint[19] = (-3036.1,6850.19,172.123);
				zomspawnpoint[24] = (-3011.23,6821.2,172.123);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-1018.69,5686.5,339.829);
				zomspawnpoint[5] = (-984.381,5698.23,340.949);
				zomspawnpoint[10] = (-955.515,5708.27,339.822);
				zomspawnpoint[15] = (-927.069,5718.3,338.136);
				zomspawnpoint[20] = (-892.982,5730.03,336.148);
				zomspawnpoint[1] = (-3743.85,6140.18,184.128);
				zomspawnpoint[6] = (-3754.88,6105.8,184.128);
				zomspawnpoint[11] = (-3765.98,6070.45,184.128);
				zomspawnpoint[16] = (-3774.94,6041.4,184.128);
				zomspawnpoint[21] = (-3784.73,6009.82,184.128);
				zomspawnpoint[2] = (-3787.02,7957.07,196.725);
				zomspawnpoint[7] = (-3823.83,7953.52,196.725);
				zomspawnpoint[12] = (-3858.77,7949.61,196.725);
				zomspawnpoint[17] = (-3889.34,7946.04,196.725);
				zomspawnpoint[22] = (-3926.72,7941.81,196.725);
				zomspawnpoint[3] = (-34.549,7652.63,-84.6081);
				zomspawnpoint[8] = (-68.8061,7635.32,-84.4596);
				zomspawnpoint[13] = (-102.417,7618.42,-84.5169);
				zomspawnpoint[18] = (-132.194,7603.2,-80.6439);
				zomspawnpoint[23] = (-168.424,7584.3,-80.9504);
				zomspawnpoint[4] = (-479.891,3550.22,81.9404);
				zomspawnpoint[9] = (-517.302,3547.26,86.538);
				zomspawnpoint[14] = (-551.747,3544.77,88.361);
				zomspawnpoint[19] = (-583.741,3542.63,90.0853);
				zomspawnpoint[24] = (-620.459,3540.29,92.4506);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (-2294.85,5571.08,-90.3422);
				zomspawnpoint[5] = (-2304.1,5533.8,-90.9878);
				zomspawnpoint[10] = (-2314.74,5498.71,-92.3087);
				zomspawnpoint[15] = (-2326.71,5461.28,-93.6989);
				zomspawnpoint[20] = (-2338.18,5425.05,-94.0175);
				zomspawnpoint[1] = (-3119.85,6945.85,172.124);
				zomspawnpoint[6] = (-3097.04,6915.45,172.123);
				zomspawnpoint[11] = (-3074.22,6885.07,172.123);
				zomspawnpoint[16] = (-3053.03,6856.79,172.123);
				zomspawnpoint[21] = (-3034.75,6832.73,172.123);
				zomspawnpoint[2] = (-1190.01,7829.5,160.423);
				zomspawnpoint[7] = (-1154.64,7834.99,155.748);
				zomspawnpoint[12] = (-1124.12,7839.88,151.737);
				zomspawnpoint[17] = (-1091.43,7845.39,147.225);
				zomspawnpoint[22] = (-1053.09,7851.8,142.923);
				zomspawnpoint[3] = (1249.08,6512.43,105.188);
				zomspawnpoint[8] = (1225.43,6531.3,108.246);
				zomspawnpoint[13] = (1197.43,6553.07,105.794);
				zomspawnpoint[18] = (1173.44,6571.33,101.891);
				zomspawnpoint[23] = (1143.31,6594.46,96.1049);
				zomspawnpoint[4] = (355.581,5010.28,-10.875);
				zomspawnpoint[9] = (388.262,4990.15,-10.875);
				zomspawnpoint[14] = (418.977,4971.18,-10.875);
				zomspawnpoint[19] = (453.265,4950.04,-10.875);
				zomspawnpoint[24] = (485.852,4930.13,-10.875);		
			break;
		}		
	}
	
	// Crossfire
	else if(getDvar("mapname") == "mp_crossfire")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (3293.96,-1362.62,26.125);
				zomspawnpoint[5] = (3325.91,-1383.18,26.125);
				zomspawnpoint[10] = (3357.85,-1403.78,26.125);
				zomspawnpoint[15] = (3389.54,-1424.78,26.125);
				zomspawnpoint[20] = (3421.08,-1445.98,26.125);
				zomspawnpoint[1] = (5507.25,-1146.88,160.125);
				zomspawnpoint[6] = (5482.87,-1129.05,160.125);
				zomspawnpoint[11] = (5458.4,-1111.01,161.125);
				zomspawnpoint[16] = (5427.81,-1088.46,161.125);
				zomspawnpoint[21] = (5397.37,-1066.03,161.125);
				zomspawnpoint[2] = (5136.88,-3152.52,-71.875);
				zomspawnpoint[7] = (5114.9,-3173.52,-71.875);
				zomspawnpoint[12] = (5087.45,-3199.8,-71.875);
				zomspawnpoint[17] = (5062.85,-3223.29,-71.875);
				zomspawnpoint[22] = (5040.64,-3244.05,-71.875);
				zomspawnpoint[3] = (6514.03,-4353.57,40.125);
				zomspawnpoint[8] = (6510.5,-4390.07,40.125);
				zomspawnpoint[13] = (6507.08,-4420.29,40.125);
				zomspawnpoint[18] = (6502.64,-4458.03,40.4095);
				zomspawnpoint[23] = (6498.06,-4496.5,41.3092);
				zomspawnpoint[4] = (3336.91,-2998.01,-134.657);
				zomspawnpoint[9] = (3365.8,-3018.71,-134.752);
				zomspawnpoint[14] = (3391.07,-3036.3,-134.809);
				zomspawnpoint[19] = (3422.49,-3057.66,-134.826);
				zomspawnpoint[24] = (3454.24,-3079.24,-134.726);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (6428.48,-1798.58,45.125);
				zomspawnpoint[5] = (6407.01,-1828.79,45.125);
				zomspawnpoint[10] = (6389.71,-1853.32,45.125);
				zomspawnpoint[15] = (6367.77,-1884.82,45.125);
				zomspawnpoint[20] = (6346.16,-1916.07,45.125);
				zomspawnpoint[1] = (4005.27,-2271.6,-59.5531);
				zomspawnpoint[6] = (3973.73,-2250.42,-59.1468);
				zomspawnpoint[11] = (3943.28,-2229.99,-58.7556);
				zomspawnpoint[16] = (3911.48,-2208.84,-58.2217);
				zomspawnpoint[21] = (3876.97,-2186.63,-57.4859);
				zomspawnpoint[2] = (3517.84,-526.042,-27.1321);
				zomspawnpoint[7] = (3535.69,-550.379,-25.8542);
				zomspawnpoint[12] = (3553.73,-574.579,-24.9651);
				zomspawnpoint[17] = (3576.52,-604.98,-24.1538);
				zomspawnpoint[22] = (3599.15,-635.257,-23.058);
				zomspawnpoint[3] = (4379.63,-4727.61,29.2655);
				zomspawnpoint[8] = (4349.3,-4717.88,31.5591);
				zomspawnpoint[13] = (4313.13,-4706.24,30.3395);
				zomspawnpoint[18] = (4279.3,-4695.38,34.4226);
				zomspawnpoint[23] = (4250.69,-4685.99,38.1668);
				zomspawnpoint[4] = (5220.52,-3835.56,-109.456);
				zomspawnpoint[9] = (5221.77,-3872.79,-115.968);
				zomspawnpoint[14] = (5223.61,-3910.27,-123.118);
				zomspawnpoint[19] = (5225.41,-3943.52,-130.028);
				zomspawnpoint[24] = (5227.14,-3975.03,-135.963);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (4710.51,-1889.66,32.125);
				zomspawnpoint[5] = (4690.17,-1921.08,32.125);
				zomspawnpoint[10] = (4669.48,-1953.18,32.125);
				zomspawnpoint[15] = (4648.89,-1985.12,32.125);
				zomspawnpoint[20] = (4628.23,-2017.24,32.125);
				zomspawnpoint[1] = (4248.18,-2727.24,-63.875);
				zomspawnpoint[6] = (4227.97,-2759.42,-63.875);
				zomspawnpoint[11] = (4207.72,-2791.58,-63.875);
				zomspawnpoint[16] = (4191.25,-2817.14,-63.875);
				zomspawnpoint[21] = (4171.12,-2847.11,-63.875);
				zomspawnpoint[2] = (5706.21,-2789.54,28.1248);
				zomspawnpoint[7] = (5727.05,-2757.77,28.1248);
				zomspawnpoint[12] = (5748,-2725.83,28.1248);
				zomspawnpoint[17] = (5768.83,-2694.04,28.1248);
				zomspawnpoint[22] = (5802.29,-2642.72,28.1248);
				zomspawnpoint[3] = (5048.07,-3165.72,-71.875);
				zomspawnpoint[8] = (5038,-3201.18,-71.875);
				zomspawnpoint[13] = (5027.51,-3238.1,-71.875);
				zomspawnpoint[18] = (5017.21,-3274.28,-71.875);
				zomspawnpoint[23] = (5006.7,-3311.01,-71.875);
				zomspawnpoint[4] = (5437.05,-1094.35,161.125);
				zomspawnpoint[9] = (5406.53,-1073.92,161.125);
				zomspawnpoint[14] = (5374.86,-1053.26,161.125);
				zomspawnpoint[19] = (5344.63,-1033.52,160.125);
				zomspawnpoint[24] = (5312.32,-1012.45,160.125);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (4856.02,-454.618,16.125);
				zomspawnpoint[5] = (4822.91,-436.759,16.125);
				zomspawnpoint[10] = (4790.96,-419.548,16.125);
				zomspawnpoint[15] = (4758,-401.805,16.125);
				zomspawnpoint[20] = (4724.53,-383.812,16.125);
				zomspawnpoint[1] = (4601.42,-1857.15,160.125);
				zomspawnpoint[6] = (4637.71,-1860.84,160.125);
				zomspawnpoint[11] = (4667.96,-1863.88,160.125);
				zomspawnpoint[16] = (4706.33,-1867.74,160.125);
				zomspawnpoint[21] = (4743.93,-1871.75,160.125);
				zomspawnpoint[2] = (5591.32,-2672.5,28.1248);
				zomspawnpoint[7] = (5613.29,-2641.49,28.1248);
				zomspawnpoint[12] = (5635.5,-2610.19,28.1248);
				zomspawnpoint[17] = (5658.02,-2578.41,28.1248);
				zomspawnpoint[22] = (5679.67,-2547.87,28.1248);
				zomspawnpoint[3] = (3303.73,-3324.16,-143.875);
				zomspawnpoint[8] = (3332.99,-3340.35,-143.875);
				zomspawnpoint[13] = (3366.87,-3359.18,-143.875);
				zomspawnpoint[18] = (3394.72,-3374.79,-143.875);
				zomspawnpoint[23] = (3427.87,-3393.36,-143.875);
				zomspawnpoint[4] = (5673.04,-4862.78,-137.875);
				zomspawnpoint[9] = (5635.06,-4864.29,-137.875);
				zomspawnpoint[14] = (5597.27,-4865.65,-137.875);
				zomspawnpoint[19] = (5560.05,-4867.02,-137.875);
				zomspawnpoint[24] = (5523.22,-4868.37,-137.875);			
			break;
		}
	}

	// District
	else if(getDvar("mapname") == "mp_citystreets")
	{			
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		}
			
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (6402.08,-418.335,-3.875);
				zomspawnpoint[5] = (6368.06,-418.644,-3.875);
				zomspawnpoint[10] = (6337.67,-419.059,-3.875);
				zomspawnpoint[15] = (6299.67,-419.664,-3.875);
				zomspawnpoint[20] = (6269.65,-419.975,-3.875);
				zomspawnpoint[1] = (5004.78,-2643.87,-3.03407);
				zomspawnpoint[6] = (4967.68,-2639.27,-3.22554);
				zomspawnpoint[11] = (4929.94,-2636.72,-3.33191);
				zomspawnpoint[16] = (4899.78,-2635.03,-3.40246);
				zomspawnpoint[21] = (4843,-2629.63,-2.28552);
				zomspawnpoint[2] = (2269.82,-1240.36,-95.875);
				zomspawnpoint[7] = (2271.78,-1203.93,-95.875);
				zomspawnpoint[12] = (2273.75,-1165.4,-95.875);
				zomspawnpoint[17] = (2275.37,-1127.24,-95.875);
				zomspawnpoint[22] = (2268.06,-1309.09,-95.875);
				zomspawnpoint[3] = (2420.95,855.769,0.125);
				zomspawnpoint[8] = (2445.06,886.128,0.125);
				zomspawnpoint[13] = (2468.22,915.297,0.125);
				zomspawnpoint[18] = (2491.79,945.098,0.125);
				zomspawnpoint[23] = (2515.65,975.166,0.125);
				zomspawnpoint[4] = (4665.76,1374.95,20.125);
				zomspawnpoint[9] = (4691.96,1349.54,20.125);
				zomspawnpoint[14] = (4719.78,1323.92,20.125);
				zomspawnpoint[19] = (4746.77,1299.66,20.125);
				zomspawnpoint[24] = (4774.87,1274.35,20.125);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (5273.89,-923.146,0.125);
				zomspawnpoint[5] = (5273.61,-960.593,0.125);
				zomspawnpoint[10] = (5273.34,-998.229,0.125);
				zomspawnpoint[15] = (5273.07,-1035.86,0.125);
				zomspawnpoint[20] = (5271.43,-1075.76,0.125);
				zomspawnpoint[1] = (4444.24,-1698.97,0.125);
				zomspawnpoint[6] = (4406.65,-1700.69,0.125);
				zomspawnpoint[11] = (4369.03,-1702.09,0.125);
				zomspawnpoint[16] = (4332.95,-1703.35,0.125);
				zomspawnpoint[21] = (4302.19,-1704.49,0.125);
				zomspawnpoint[2] = (3571.64,-821.81,-3.875);
				zomspawnpoint[7] = (3538.04,-803.205,-3.875);
				zomspawnpoint[12] = (3505.22,-784.022,-3.875);
				zomspawnpoint[17] = (3472.61,-764.895,-3.875);
				zomspawnpoint[22] = (3440.46,-746.099,-3.875);
				zomspawnpoint[3] = (3734.05,911.787,0.124999);
				zomspawnpoint[8] = (3699.47,911.772,0.124999);
				zomspawnpoint[13] = (3668.88,911.762,0.124999);
				zomspawnpoint[18] = (3632.77,911.771,0.124999);
				zomspawnpoint[23] = (3601.42,911.804,0.124999);
				zomspawnpoint[4] = (4728.26,-250.073,-127.875);
				zomspawnpoint[9] = (4767.03,-249.072,-127.875);
				zomspawnpoint[14] = (4805.57,-247.608,-127.875);
				zomspawnpoint[19] = (4842.98,-246.18,-127.875);
				zomspawnpoint[24] = (4882.11,-244.915,-127.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (5259.27,-617.173,0.124999);
				zomspawnpoint[5] = (5259.21,-654.039,0.124999);
				zomspawnpoint[10] = (5258.81,-692.613,0.124999);
				zomspawnpoint[15] = (5258.42,-730.421,0.124999);
				zomspawnpoint[20] = (5258.08,-768.616,0.124999);
				zomspawnpoint[1] = (4485.64,-551.269,-127.875);
				zomspawnpoint[6] = (4446.51,-550.122,-127.875);
				zomspawnpoint[11] = (4413.67,-548.888,-127.875);
				zomspawnpoint[16] = (4383.48,-547.661,-127.875);
				zomspawnpoint[21] = (4351.2,-546.39,-127.875);
				zomspawnpoint[2] = (2332.41,-464.282,-95.875);
				zomspawnpoint[7] = (2371.55,-464.144,-95.875);
				zomspawnpoint[12] = (2409.36,-463.75,-95.875);
				zomspawnpoint[17] = (2445.27,-463.385,-95.875);
				zomspawnpoint[22] = (2483.47,-463.37,-95.875);
				zomspawnpoint[3] = (4081.35,-1410.7,-23.875);
				zomspawnpoint[8] = (4082.44,-1372.14,-23.875);
				zomspawnpoint[13] = (4083.42,-1334.54,-23.875);
				zomspawnpoint[18] = (4084.31,-1301.87,-23.875);
				zomspawnpoint[23] = (4085.36,-1258.37,-23.875);
				zomspawnpoint[4] = (4664.45,1401.39,20.125);
				zomspawnpoint[9] = (4694.68,1376.52,20.125);
				zomspawnpoint[14] = (4722.19,1354.03,20.125);
				zomspawnpoint[19] = (4745.59,1334.92,20.125);
				zomspawnpoint[24] = (4774.74,1311.14,20.125);
			break;
		}
	}

	// Downpour
	else if(getDvar("mapname") == "mp_farm")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
		
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-1266.51,-2218.23,144.663);
				zomspawnpoint[5] = (-1250.98,-2183.75,144.558);
				zomspawnpoint[10] = (-1235.56,-2149.85,144.456);
				zomspawnpoint[15] = (-1219.3,-2115.3,144.731);
				zomspawnpoint[20] = (-1183.86,-2043.55,145.068);
				zomspawnpoint[1] = (-660.265,1171.11,246.241);
				zomspawnpoint[6] = (-628.491,1173.99,245.961);
				zomspawnpoint[11] = (-584.786,1178.2,246.883);
				zomspawnpoint[16] = (-548.85,1181.57,247.637);
				zomspawnpoint[21] = (-511.181,1184.77,248.414);
				zomspawnpoint[2] = (407.215,4485.35,218.313);
				zomspawnpoint[7] = (384.138,4460.91,219.282);
				zomspawnpoint[12] = (361.872,4437.01,220.256);
				zomspawnpoint[17] = (336.103,4409.38,219.561);
				zomspawnpoint[22] = (311.814,4383.64,222.734);
				zomspawnpoint[3] = (2427.62,2131.38,217.125);
				zomspawnpoint[8] = (2406.27,2099.94,217.125);
				zomspawnpoint[13] = (2385.84,2069.95,217.125);
				zomspawnpoint[18] = (2364.63,2038.41,217.125);
				zomspawnpoint[23] = (2342.77,2005.03,217.125);
				zomspawnpoint[4] = (1205.78,-252.734,124.772);
				zomspawnpoint[9] = (1176.41,-228.941,124.178);
				zomspawnpoint[14] = (1146.06,-205.746,124.259);
				zomspawnpoint[19] = (1115.34,-182.749,124.339);
				zomspawnpoint[24] = (1085.92,-161.188,125.213);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-458.868,-748.401,292.125);
				zomspawnpoint[5] = (-419.358,-749.386,292.125);
				zomspawnpoint[10] = (-381.757,-750.788,292.125);
				zomspawnpoint[15] = (-343.622,-752.972,292.125);
				zomspawnpoint[20] = (-307.595,-755.287,292.125);
				zomspawnpoint[1] = (421.687,1398.66,217.125);
				zomspawnpoint[6] = (461.016,1394.75,217.125);
				zomspawnpoint[11] = (496.972,1391.52,217.125);
				zomspawnpoint[16] = (527.628,1388.75,217.125);
				zomspawnpoint[21] = (565.47,1385.25,217.125);
				zomspawnpoint[2] = (364.964,-1574.63,134.64);
				zomspawnpoint[7] = (403.135,-1570.56,134.3);
				zomspawnpoint[12] = (440.808,-1565.74,132.972);
				zomspawnpoint[17] = (478.461,-1560.96,131.192);
				zomspawnpoint[22] = (515.538,-1556.19,127.026);
				zomspawnpoint[3] = (1065.57,2724.09,369.125);
				zomspawnpoint[8] = (1027.58,2725.49,369.125);
				zomspawnpoint[13] = (992.056,2726.26,369.125);
				zomspawnpoint[18] = (961.09,2726.87,369.125);
				zomspawnpoint[23] = (924.424,2727.58,369.125);
				zomspawnpoint[4] = (-430.719,3116.53,216.125);
				zomspawnpoint[9] = (-435.792,3080.98,216.125);
				zomspawnpoint[14] = (-440.064,3051.27,216.125);
				zomspawnpoint[19] = (-445.289,3015.16,216.125);
				zomspawnpoint[24] = (-450.63,2977.73,216.125);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-1160.42,-917.691,172.72);
				zomspawnpoint[5] = (-1127.52,-919.396,170.605);
				zomspawnpoint[10] = (-1095.43,-921.005,171.106);
				zomspawnpoint[15] = (-1065.06,-922.332,170.404);
				zomspawnpoint[20] = (-1029.2,-923.902,169.565);
				zomspawnpoint[1] = (358.266,932.939,224.446);
				zomspawnpoint[6] = (396.825,931.87,224.458);
				zomspawnpoint[11] = (434.809,930.714,224.47);
				zomspawnpoint[16] = (472.422,929.799,224.466);
				zomspawnpoint[21] = (510.033,928.885,224.413);
				zomspawnpoint[2] = (2125.81,844.754,217.038);
				zomspawnpoint[7] = (2162.58,841.906,217.125);
				zomspawnpoint[12] = (2201.26,839.305,217.125);
				zomspawnpoint[17] = (2238.23,836.812,217.125);
				zomspawnpoint[22] = (2275.96,834.265,217.125);
				zomspawnpoint[3] = (492.502,2575.53,217.125);
				zomspawnpoint[8] = (454.879,2575.3,217.125);
				zomspawnpoint[13] = (417.064,2574.9,217.125);
				zomspawnpoint[18] = (378.873,2574.45,217.125);
				zomspawnpoint[23] = (341.065,2574.05,217.125);
				zomspawnpoint[4] = (1905.53,4447.51,230.94);
				zomspawnpoint[9] = (1870.93,4431.38,229.875);
				zomspawnpoint[14] = (1837.03,4415.1,228.731);
				zomspawnpoint[19] = (1802.92,4398.82,227.576);
				zomspawnpoint[24] = (1768.55,4382.65,226.397);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (-335.816,-1574.15,138.125);
				zomspawnpoint[5] = (-336.242,-1604.17,138.125);
				zomspawnpoint[10] = (-337.062,-1634.37,138.125);
				zomspawnpoint[15] = (-338.028,-1671.79,138.125);
				zomspawnpoint[20] = (-338.579,-1705.42,138.125);
				zomspawnpoint[1] = (-670.271,1182.68,246.23);
				zomspawnpoint[6] = (-632.135,1184.5,246.339);
				zomspawnpoint[11] = (-594.569,1186.98,247.083);
				zomspawnpoint[16] = (-556.478,1189.64,247.845);
				zomspawnpoint[21] = (-518.765,1192.24,248.598);
				zomspawnpoint[2] = (1504.29,927.767,221.125);
				zomspawnpoint[7] = (1503.93,957.792,221.125);
				zomspawnpoint[12] = (1503.52,993.701,221.125);
				zomspawnpoint[17] = (1503.2,1024.67,221.125);
				zomspawnpoint[22] = (1502.79,1064.19,221.125);
				zomspawnpoint[3] = (1125.71,4057.69,217.125);
				zomspawnpoint[8] = (1108.99,4091.18,217.125);
				zomspawnpoint[13] = (1092.23,4125.29,217.125);
				zomspawnpoint[18] = (1076.72,4157.25,217.125);
				zomspawnpoint[23] = (1059.42,4192.79,217.125);
				zomspawnpoint[4] = (1165.19,-608.154,132.125);
				zomspawnpoint[9] = (1135.02,-606.523,132.125);
				zomspawnpoint[14] = (1096.9,-604.175,132.125);
				zomspawnpoint[19] = (1059.18,-601.479,132.125);
				zomspawnpoint[24] = (1023.32,-599.602,132.125);			
			break;
		}
	}

	// Killhouse
	else if(getDvar("mapname") == "mp_killhouse")
	{		
		zomspawnpoint[0] = (1145.15,307.139,28.125);
		zomspawnpoint[5] = (1144.24,337.343,28.125);
		zomspawnpoint[10] = (1142.68,375.321,28.125);
		zomspawnpoint[15] = (1141.05,413.099,28.125);
		zomspawnpoint[20] = (1139.38,450.874,28.125);
		zomspawnpoint[1] = (60.6845,209.227,28.125);
		zomspawnpoint[6] = (90.6638,210.797,28.125);
		zomspawnpoint[11] = (126.714,212.712,28.125);
		zomspawnpoint[16] = (156.696,214.255,28.125);
		zomspawnpoint[21] = (194.83,216.362,28.125);
		zomspawnpoint[2] = (1150.43,1512.36,28.125);
		zomspawnpoint[7] = (1155.55,1549.63,28.125);
		zomspawnpoint[12] = (1160.97,1585.72,28.125);
		zomspawnpoint[17] = (1165.52,1616.16,28.125);
		zomspawnpoint[22] = (1170.81,1651.68,28.125);
		zomspawnpoint[3] = (1175.27,1681.75,28.125);
		zomspawnpoint[8] = (51.8086,2559.8,28.125);
		zomspawnpoint[13] = (77.3735,2522.82,28.125);
		zomspawnpoint[18] = (114.554,2520.53,28.125);
		zomspawnpoint[23] = (151.927,2518.4,28.125);
		zomspawnpoint[4] = (190.244,2516.19,28.125);
		zomspawnpoint[9] = (228.195,2514.17,28.125);
		zomspawnpoint[14] = (1033.67,2520.69,28.125);
		zomspawnpoint[19] = (1071.64,2519.1,28.125);
		zomspawnpoint[24] = (1109.98,2517.22,28.125);
	}

	// Overgrown
	else if(getDvar("mapname") == "mp_overgrown")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (13.4484,-3956.37,-293.139);
				zomspawnpoint[5] = (47.9547,-3954.32,-292.078);
				zomspawnpoint[10] = (78.6681,-3952.51,-291.132);
				zomspawnpoint[15] = (118.315,-3950.31,-290.895);
				zomspawnpoint[20] = (156.087,-3948.52,-290.917);
				zomspawnpoint[1] = (1161.77,-1002.36,-343.602);
				zomspawnpoint[6] = (1163.59,-964.589,-343.771);
				zomspawnpoint[11] = (1165.41,-926.252,-343.666);
				zomspawnpoint[16] = (1167.17,-889.434,-343.506);
				zomspawnpoint[21] = (1168.74,-859.26,-343.369);
				zomspawnpoint[2] = (-1328.2,-1137.62,-179.875);
				zomspawnpoint[7] = (-1313.24,-1169.85,-179.875);
				zomspawnpoint[12] = (-1299.91,-1199.06,-179.875);
				zomspawnpoint[17] = (-1284.48,-1232.96,-179.875);
				zomspawnpoint[22] = (-1270.01,-1265.2,-179.875);
				zomspawnpoint[3] = (-1764.02,-4114.9,-134.951);
				zomspawnpoint[8] = (-1802.31,-4110.83,-134.529);
				zomspawnpoint[13] = (-1840.38,-4106.78,-131.809);
				zomspawnpoint[18] = (-1876.98,-4102.71,-130.144);
				zomspawnpoint[23] = (-1915.87,-4097.49,-127.389);
				zomspawnpoint[4] = (2740.15,-2232.99,-143.875);
				zomspawnpoint[9] = (2737.3,-2272.22,-143.875);
				zomspawnpoint[14] = (2734.8,-2308.24,-143.875);
				zomspawnpoint[19] = (2732.38,-2347.69,-143.875);
				zomspawnpoint[24] = (2730.1,-2384.29,-143.875);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-726.786,-3437.31,28.125);
				zomspawnpoint[5] = (-728.956,-3467.27,28.125);
				zomspawnpoint[10] = (-731.113,-3502.56,28.125);
				zomspawnpoint[15] = (-732.981,-3543.18,28.125);
				zomspawnpoint[20] = (-734.602,-3577.92,28.125);
				zomspawnpoint[1] = (1341.4,-4314.19,-119.875);
				zomspawnpoint[6] = (1347.63,-4278.62,-119.875);
				zomspawnpoint[11] = (1354.5,-4241.05,-119.875);
				zomspawnpoint[16] = (1361.19,-4204.22,-119.875);
				zomspawnpoint[21] = (1367.38,-4169.81,-119.875);
				zomspawnpoint[2] = (1156.6,-4142.63,-13.875);
				zomspawnpoint[7] = (1156.54,-4180.26,-13.875);
				zomspawnpoint[12] = (1156.21,-4210.29,-13.875);
				zomspawnpoint[17] = (1155,-4247.53,-13.875);
				zomspawnpoint[22] = (1153.02,-4285.1,-13.875);
				zomspawnpoint[3] = (2422.83,-551.294,-136.172);
				zomspawnpoint[8] = (2398.08,-533.978,-136.997);
				zomspawnpoint[13] = (2367.46,-512.816,-138.018);
				zomspawnpoint[18] = (2338.99,-493.832,-144.205);
				zomspawnpoint[23] = (2308.07,-473.203,-152.112);
				zomspawnpoint[4] = (-727.268,-86.1856,-175.875);
				zomspawnpoint[9] = (-727.234,-55.9737,-175.875);
				zomspawnpoint[14] = (-726.305,-20.6341,-175.875);
				zomspawnpoint[19] = (-724.3,10.8532,-175.875);
				zomspawnpoint[24] = (-721.135,47.3908,-175.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-598.206,-2036.7,0.125);
				zomspawnpoint[5] = (-575.043,-2008.99,0.125);
				zomspawnpoint[10] = (-551.174,-1979.41,0.125);
				zomspawnpoint[15] = (-527.257,-1949.14,0.125);
				zomspawnpoint[20] = (-504.005,-1919.08,0.125);
				zomspawnpoint[1] = (1445.73,527.609,-328.301);
				zomspawnpoint[6] = (1443.59,491.379,-335.752);
				zomspawnpoint[11] = (1440.84,452.008,-343.829);
				zomspawnpoint[16] = (1438.2,416.204,-343.628);
				zomspawnpoint[21] = (1435.34,380.126,-340.908);
				zomspawnpoint[2] = (159.376,-5200.4,-301.728);
				zomspawnpoint[7] = (122.975,-5197.32,-297.959);
				zomspawnpoint[12] = (84.1428,-5194.02,-292.664);
				zomspawnpoint[17] = (47.5618,-5190.9,-287.786);
				zomspawnpoint[22] = (9.63834,-5187.69,-284.626);
				zomspawnpoint[3] = (1329.61,-2386.33,-159.875);
				zomspawnpoint[8] = (1131.11,-2254.75,-159.875);
				zomspawnpoint[13] = (1150.9,-2684.19,-159.875);
				zomspawnpoint[18] = (1046.01,-2849.21,-159.875);
				zomspawnpoint[23] = (966.447,-2631.54,-159.875);
				zomspawnpoint[4] = (-113.226,-2030.21,-207.836);
				zomspawnpoint[9] = (-95.5655,-1999.59,-207.875);
				zomspawnpoint[14] = (-80.1743,-1972.5,-207.875);
				zomspawnpoint[19] = (-61.9956,-1940.65,-207.875);
				zomspawnpoint[24] = (-43.5109,-1908.53,-207.875);
			break;

			case 3:
				// spawn set 4
				zomspawnpoint[0] = (-1683.4,-1944.98,-179.875);
				zomspawnpoint[5] = (-1667.88,-1970.68,-179.875);
				zomspawnpoint[10] = (-1648.58,-2002.76,-179.875);
				zomspawnpoint[15] = (-1629.67,-2035.06,-179.875);
				zomspawnpoint[20] = (-1614.44,-2061.16,-179.875);
				zomspawnpoint[1] = (1176.77,-806.05,-342.622);
				zomspawnpoint[6] = (1174.74,-843.932,-342.811);
				zomspawnpoint[11] = (1172.77,-880.74,-342.994);
				zomspawnpoint[16] = (1171.19,-910.908,-343.101);
				zomspawnpoint[21] = (1169.26,-948.098,-343.29);
				zomspawnpoint[2] = (-1874.18,-4878.17,-156.997);
				zomspawnpoint[7] = (-1865.41,-4912.39,-158.109);
				zomspawnpoint[12] = (-1855.91,-4949.06,-160.948);
				zomspawnpoint[17] = (-1844.86,-4988.98,-164.904);
				zomspawnpoint[22] = (-1835.24,-5022.67,-167.712);
				zomspawnpoint[3] = (779.488,-3497.03,-191.204);
				zomspawnpoint[8] = (777.673,-3533.01,-189.06);
				zomspawnpoint[13] = (776.25,-3571.74,-188.343);
				zomspawnpoint[18] = (775.282,-3602.55,-186.165);
				zomspawnpoint[23] = (774.326,-3639.4,-179.688);
				zomspawnpoint[4] = (2520.49,-2310.35,-159.883);
				zomspawnpoint[9] = (2484.94,-2304.6,-162.431);
				zomspawnpoint[14] = (2444.53,-2298.06,-165.424);
				zomspawnpoint[19] = (2410.67,-2292.61,-167.932);
				zomspawnpoint[24] = (2379.61,-2287.6,-170.233);
			break;
		}
	}

	// Pipeline
	else if(getDvar("mapname") == "mp_pipeline")
	{	
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
		
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-748.121,-3869.33,379.172);
				zomspawnpoint[5] = (-708.061,-3867.02,375.662);
				zomspawnpoint[10] = (-670.269,-3864.83,372.351);
				zomspawnpoint[15] = (-634.367,-3862.75,369.205);
				zomspawnpoint[20] = (-596.574,-3860.57,365.894);
				zomspawnpoint[1] = (1876.32,-8.95101,87.2546);
				zomspawnpoint[6] = (1876.37,29.9932,86.5165);
				zomspawnpoint[11] = (1876.41,65.3123,85.3127);
				zomspawnpoint[16] = (1876.44,95.8638,83.751);
				zomspawnpoint[21] = (1876.48,133.626,81.8207);
				zomspawnpoint[2] = (2505.56,3605.24,-39.875);
				zomspawnpoint[7] = (2472.09,3602.23,-39.875);
				zomspawnpoint[12] = (2441.85,3599.51,-39.875);
				zomspawnpoint[17] = (2404.2,3596.15,-39.875);
				zomspawnpoint[22] = (2365.22,3592.65,-41.1137);
				zomspawnpoint[3] = (-578.153,3844.27,7.74615);
				zomspawnpoint[8] = (-576.759,3807.24,7.8068);
				zomspawnpoint[13] = (-575.463,3770.58,4.81904);
				zomspawnpoint[18] = (-574.548,3732.94,0.126722);
				zomspawnpoint[23] = (-573.635,3694.95,0.196347);
				zomspawnpoint[4] = (-1502.87,2263.36,1.24273);
				zomspawnpoint[9] = (-1502.89,2225.36,1.15468);
				zomspawnpoint[14] = (-1502.92,2188.31,1.26399);
				zomspawnpoint[19] = (-1502.96,2148.41,1.83132);
				zomspawnpoint[24] = (-1503,2110.42,2.35306);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-1242.99,-888.286,264.125);
				zomspawnpoint[5] = (-1243.66,-851.81,264.125);
				zomspawnpoint[10] = (-1244.4,-815.147,264.125);
				zomspawnpoint[15] = (-1245.17,-776.773,264.125);
				zomspawnpoint[20] = (-1245.47,-739.339,264.125);
				zomspawnpoint[1] = (-147.758,849.299,20.5872);
				zomspawnpoint[6] = (-147.76,882.36,20.587);
				zomspawnpoint[11] = (-147.597,925.681,20.5812);
				zomspawnpoint[16] = (-147.421,962.767,17.8968);
				zomspawnpoint[21] = (-147.301,1000.1,13.2305);
				zomspawnpoint[2] = (218.865,982.825,-119.875);
				zomspawnpoint[7] = (237.963,1014.01,-119.875);
				zomspawnpoint[12] = (255.037,1041.88,-119.875);
				zomspawnpoint[17] = (272.201,1069.69,-119.875);
				zomspawnpoint[22] = (292.394,1101.88,-119.875);
				zomspawnpoint[3] = (944.256,3028.11,-71.875);
				zomspawnpoint[8] = (966.799,3058.22,-71.875);
				zomspawnpoint[13] = (988.223,3087.3,-71.875);
				zomspawnpoint[18] = (1005.39,3111.93,-71.875);
				zomspawnpoint[23] = (1026.87,3143.75,-71.875);
				zomspawnpoint[4] = (2468.53,3602.39,-39.875);
				zomspawnpoint[9] = (2436.79,3596.4,-39.875);
				zomspawnpoint[14] = (2406.77,3590.57,-39.875);
				zomspawnpoint[19] = (2369.78,3583.2,-41.115);
				zomspawnpoint[24] = (2338.29,3576.92,-39.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-1406.52,-3183.81,374.125);
				zomspawnpoint[5] = (-1376.17,-3163.56,374.125);
				zomspawnpoint[10] = (-1347.23,-3144.97,374.125);
				zomspawnpoint[15] = (-1320.82,-3128.43,374.125);
				zomspawnpoint[20] = (-1286.54,-3106.91,374.125);
				zomspawnpoint[1] = (1425.82,10.9607,48.125);
				zomspawnpoint[6] = (1390.86,10.9657,48.125);
				zomspawnpoint[11] = (1359.13,11.1388,48.125);
				zomspawnpoint[16] = (1321.12,11.2205,48.125);
				zomspawnpoint[21] = (1284.64,10.9306,48.125);
				zomspawnpoint[2] = (1367.02,3211.26,-42.0961);
				zomspawnpoint[7] = (1380,3243.76,-41.5466);
				zomspawnpoint[12] = (1393.67,3278.67,-40.9259);
				zomspawnpoint[17] = (1407.42,3314.09,-40.2822);
				zomspawnpoint[22] = (1420.38,3345.52,-39.7977);
				zomspawnpoint[3] = (-795.608,1093.95,208.125);
				zomspawnpoint[8] = (-795.622,1062.98,208.125);
				zomspawnpoint[13] = (-795.646,1025.17,208.125);
				zomspawnpoint[18] = (-795.678,986.976,208.125);
				zomspawnpoint[23] = (-795.712,954.674,208.125);
				zomspawnpoint[4] = (-1496.89,754.72,4.91919);
				zomspawnpoint[9] = (-1497.05,790.023,3.29854);
				zomspawnpoint[14] = (-1497.21,820.201,1.9142);
				zomspawnpoint[19] = (-1497.57,857.404,0.194104);
				zomspawnpoint[24] = (-1498.34,894.634,0.125002);
			break;

			case 3:
			// spawn set 4
				zomspawnpoint[0] = (1596.64,-847.52,255.132);
				zomspawnpoint[5] = (1563.56,-844.165,255.137);
				zomspawnpoint[10] = (1533.75,-840.618,254.996);
				zomspawnpoint[15] = (1501.12,-836.648,255.123);
				zomspawnpoint[20] = (1464.13,-832.347,255.819);
				zomspawnpoint[1] = (1052.66,1079.94,4.125);
				zomspawnpoint[6] = (1052.96,1116.05,4.125);
				zomspawnpoint[11] = (1053.22,1146.64,4.125);
				zomspawnpoint[16] = (1053.67,1184.83,4.125);
				zomspawnpoint[21] = (1054.28,1222.82,4.125);
				zomspawnpoint[2] = (-66.9177,2709.65,8.125);
				zomspawnpoint[7] = (-66.937,2745.95,8.125);
				zomspawnpoint[12] = (-66.9413,2776.54,8.125);
				zomspawnpoint[17] = (-66.9541,2814.54,8.125);
				zomspawnpoint[22] = (-66.7941,2853.68,8.125);
				zomspawnpoint[3] = (-1524.69,1612.63,-1.75234);
				zomspawnpoint[8] = (-1524.18,1580.34,-1.67534);
				zomspawnpoint[13] = (-1523.78,1541.8,0.0444878);
				zomspawnpoint[18] = (-1523.95,1504.79,1.92188);
				zomspawnpoint[23] = (-1524.49,1472.16,3.59346);
				zomspawnpoint[4] = (-862.339,-2141.51,438.086);
				zomspawnpoint[9] = (-871.194,-2112.86,439.437);
				zomspawnpoint[14] = (-881.965,-2076.65,441.078);
				zomspawnpoint[19] = (-891.229,-2045.54,442.49);
				zomspawnpoint[24] = (-903.352,-2006.36,442.663);
			break;	
		}
	}
	
	// project Alpha
	else if(getDvar("mapname") == "mp_pval")
	{				
		number = 0;
		//if(randomspawns == 1)
		//{		
		//	number = randomInt(4);			
		//}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-399.403,-2056.18,344.125);
				zomspawnpoint[5] = (-363.024,-2057.48,344.125);
				zomspawnpoint[10] = (-324.122,-2059.52,344.125);
				zomspawnpoint[15] = (-285.416,-2061.56,344.125);
				zomspawnpoint[20] = (-247.277,-2063.57,344.125);
				zomspawnpoint[1] = (463.206,476.622,344.125);
				zomspawnpoint[6] = (442.314,451.314,344.125);
				zomspawnpoint[11] = (417.982,422.357,344.125);
				zomspawnpoint[16] = (392.461,394.189,344.125);
				zomspawnpoint[21] = (366.369,366.292,344.125);
				zomspawnpoint[2] = (-2235.38,351.205,-327.875);
				zomspawnpoint[7] = (-2233.2,388.886,-327.875);
				zomspawnpoint[12] = (-2230.96,426.823,-327.875);
				zomspawnpoint[17] = (-2228.85,464.578,-327.875);
				zomspawnpoint[22] = (-2227.07,502.541,-327.875);
				zomspawnpoint[3] = (-2176.31,374.987,-135.875);
				zomspawnpoint[8] = (-2175.05,336.047,-135.875);
				zomspawnpoint[13] = (-2173.12,297.516,-135.875);
				zomspawnpoint[18] = (-2170.99,258.616,-135.875);
				zomspawnpoint[23] = (-2169,221.237,-135.875);
				zomspawnpoint[4] = (357.857,1820.4,344.125);
				zomspawnpoint[9] = (355.439,1858.71,344.125);
				zomspawnpoint[14] = (353.084,1896.06,344.125);
				zomspawnpoint[19] = (350.7,1934.37,344.125);
				zomspawnpoint[24] = (348.338,1972.3,344.125);
			break;	
		
			case 1:
			// spawn set 2

			break;

			case 2:
			// spawn set 3

			break;

			case 3:
			// spawn set 4	
	
			break;
		}
	}

	// Shipment
	else if(getDvar("mapname") == "mp_shipment")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);
		}
		
		switch(number)
		{		
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-622.167,142.186,201.125);
				zomspawnpoint[5] = (-621.939,105.186,201.125);
				zomspawnpoint[10] = (-621.663,67.5477,201.125);
				zomspawnpoint[15] = (-621.415,30.1098,201.125);
				zomspawnpoint[20] = (-621.189,-7.51214,201.125);
				zomspawnpoint[1] = (-105.498,69.1661,192.077);
				zomspawnpoint[6] = (-67.8646,69.6875,192.077);
				zomspawnpoint[11] = (-30.2223,69.7649,192.077);
				zomspawnpoint[16] = (7.22753,69.6544,192.077);
				zomspawnpoint[21] = (44.8638,68.8864,192.077);
				zomspawnpoint[2] = (679.876,-183.895,193.276);
				zomspawnpoint[7] = (683.624,-221.614,193.409);
				zomspawnpoint[12] = (683.529,-259.156,193.523);
				zomspawnpoint[17] = (680.957,-296.706,194.741);
				zomspawnpoint[22] = (677.424,-334.925,195.36);
				zomspawnpoint[3] = (525.974,344.918,192.077);
				zomspawnpoint[8] = (501.3,376.761,192.077);
				zomspawnpoint[13] = (478.972,405.37,192.077);
				zomspawnpoint[18] = (455.589,435.324,192.077);
				zomspawnpoint[23] = (432.353,465.156,192.077);
				zomspawnpoint[4] = (-403.568,579.892,192.077);
				zomspawnpoint[9] = (-423.772,557.357,192.077);
				zomspawnpoint[14] = (-449.481,530.645,192.077);
				zomspawnpoint[19] = (-476.922,502.712,192.105);
				zomspawnpoint[24] = (-502.126,477.108,192.14);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (691.515,42.4754,201.125);
				zomspawnpoint[5] = (691.852,82.3943,201.125);
				zomspawnpoint[10] = (692.824,120.022,201.125);
				zomspawnpoint[15] = (693.844,157.632,201.125);
				zomspawnpoint[20] = (694.844,195.05,201.125);
				zomspawnpoint[1] = (-392.381,597.453,192.077);
				zomspawnpoint[6] = (-414.981,571.522,192.077);
				zomspawnpoint[11] = (-441.57,541.002,192.077);
				zomspawnpoint[16] = (-466.886,511.882,192.077);
				zomspawnpoint[21] = (-490.101,485.228,192.118);
				zomspawnpoint[2] = (-625.677,-395.322,192.226);
				zomspawnpoint[7] = (-595.238,-418.704,192.098);
				zomspawnpoint[12] = (-565.374,-441.284,191.988);
				zomspawnpoint[17] = (-535.14,-463.975,192.59);
				zomspawnpoint[22] = (-504.631,-486.926,193.846);
				zomspawnpoint[3] = (661.998,-511.196,192.077);
				zomspawnpoint[8] = (663.716,-475.326,192.077);
				zomspawnpoint[13] = (665.186,-444.957,192.077);
				zomspawnpoint[18] = (666.989,-407.983,193.531);
				zomspawnpoint[23] = (668.833,-368.923,194.895);
				zomspawnpoint[4] = (-122.501,69.9518,192.077);
				zomspawnpoint[9] = (-84.7079,68.7562,192.077);
				zomspawnpoint[14] = (-46.725,67.5796,192.077);
				zomspawnpoint[19] = (-9.88024,66.4484,192.077);
				zomspawnpoint[24] = (29.6224,65.2258,192.077);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-607.129,-435.753,191.064);
				zomspawnpoint[5] = (-570.086,-435.81,192.084);
				zomspawnpoint[10] = (-539.572,-435.924,193.941);
				zomspawnpoint[15] = (-503.13,-436.155,201.553);
				zomspawnpoint[20] = (-467.557,-436.392,208.748);
				zomspawnpoint[1] = (-683.928,672.345,193.49);
				zomspawnpoint[6] = (-683.997,636.384,193.449);
				zomspawnpoint[11] = (-684.945,597.048,192.987);
				zomspawnpoint[16] = (-686.412,558.693,192.526);
				zomspawnpoint[21] = (-688.097,520.53,192.409);
				zomspawnpoint[2] = (462.169,395.333,192.077);
				zomspawnpoint[7] = (443.438,427.743,192.077);
				zomspawnpoint[12] = (425.283,458.726,192.077);
				zomspawnpoint[17] = (409.734,485.291,192.077);
				zomspawnpoint[22] = (390.68,517.735,192.077);
				zomspawnpoint[3] = (664.805,-479.716,192.077);
				zomspawnpoint[8] = (664.797,-441.335,192.077);
				zomspawnpoint[13] = (664.796,-401.858,193.741);
				zomspawnpoint[18] = (664.79,-363.694,194.677);
				zomspawnpoint[23] = (664.771,-327.782,194.676);
				zomspawnpoint[4] = (252.295,171.225,201.125);
				zomspawnpoint[9] = (217.986,171.295,201.125);
				zomspawnpoint[14] = (180.553,171.32,201.125);
				zomspawnpoint[19] = (142.931,171.296,201.125);
				zomspawnpoint[24] = (104.52,176.119,201.125);
			break;
		}
	}

	// Showdown
	else if(getDvar("mapname") == "mp_showdown")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (693.576,84.4129,16.1226);
				zomspawnpoint[5] = (693.257,47.9262,16.1226);
				zomspawnpoint[10] = (692.781,10.113,16.1226);
				zomspawnpoint[15] = (691.934,-28.0749,16.1226);
				zomspawnpoint[20] = (691.102,-65.8777,16.1226);
				zomspawnpoint[1] = (84.6116,635.392,192.125);
				zomspawnpoint[6] = (52.0233,637.679,192.125);
				zomspawnpoint[11] = (14.4907,640.271,192.125);
				zomspawnpoint[16] = (-20.3892,642.674,192.125);
				zomspawnpoint[21] = (-61.1301,645.698,192.125);
				zomspawnpoint[2] = (-595.867,1167.51,7.57232);
				zomspawnpoint[7] = (-596.731,1130.1,7.91482);
				zomspawnpoint[12] = (-597.6,1090.59,7.63656);
				zomspawnpoint[17] = (-598.317,1054.49,7.38236);
				zomspawnpoint[22] = (-599.073,1018.02,7.3476);
				zomspawnpoint[3] = (938.302,1425.07,1.0226);
				zomspawnpoint[8] = (913.188,1396.55,0.976081);
				zomspawnpoint[13] = (887.548,1367.22,0.839676);
				zomspawnpoint[18] = (863.787,1340.04,0.712633);
				zomspawnpoint[23] = (839.753,1312.6,0.598476);
				zomspawnpoint[4] = (-936.128,-439.016,16.1249);
				zomspawnpoint[9] = (-936.136,-476.636,16.1249);
				zomspawnpoint[14] = (-936.167,-514.638,16.1249);
				zomspawnpoint[19] = (-936.219,-549.601,16.1249);
				zomspawnpoint[24] = (-936.231,-591.402,16.1249);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (531.65,-939.877,19.1584);
				zomspawnpoint[5] = (530.851,-973.63,18.9607);
				zomspawnpoint[10] = (530.067,-1011.23,19.8507);
				zomspawnpoint[15] = (529.285,-1048.83,19.5178);
				zomspawnpoint[20] = (528.589,-1087.77,18.5962);
				zomspawnpoint[1] = (692.167,118.357,16.125);
				zomspawnpoint[6] = (692.124,79.7793,16.125);
				zomspawnpoint[11] = (692.043,42.5291,16.125);
				zomspawnpoint[16] = (691.785,4.33091,16.125);
				zomspawnpoint[21] = (690.882,-32.9052,16.125);
				zomspawnpoint[2] = (461.085,806.105,90.3055);
				zomspawnpoint[7] = (489.83,805.7,72.125);
				zomspawnpoint[12] = (517.022,804.469,54.3682);
				zomspawnpoint[17] = (545.594,803.2,33.7957);
				zomspawnpoint[22] = (584.267,802.321,8.125);
				zomspawnpoint[3] = (-267.823,1556.58,3.54831);
				zomspawnpoint[8] = (-266.943,1593.94,0.328284);
				zomspawnpoint[13] = (-265.404,1629.69,-1.875);
				zomspawnpoint[18] = (-264.691,1668.07,-1.875);
				zomspawnpoint[23] = (-264.241,1707.78,-1.875);
				zomspawnpoint[4] = (41.4892,-1848.9,16.1646);
				zomspawnpoint[9] = (3.87022,-1848.85,16.125);
				zomspawnpoint[14] = (-33.7636,-1848.7,16.125);
				zomspawnpoint[19] = (-72.6047,-1848.21,18.8635);
				zomspawnpoint[24] = (-108.284,-1847.66,17.6568);
			break;			
			
			case 2:
			// spawn set 3
				zomspawnpoint[0] = (54.5189,-1801.1,16.125);
				zomspawnpoint[5] = (17.2749,-1800.24,16.125);
				zomspawnpoint[10] = (-13.6907,-1799.3,16.125);
				zomspawnpoint[15] = (-49.775,-1798.1,16.125);
				zomspawnpoint[20] = (-79.9712,-1797.14,16.125);
				zomspawnpoint[1] = (-187.96,94.4577,0.125);
				zomspawnpoint[6] = (-11.3068,255.232,0.125);
				zomspawnpoint[11] = (152.935,170.501,0.125);
				zomspawnpoint[16] = (139.777,-22.8161,0.125);
				zomspawnpoint[21] = (-6.37078,-83.3133,0.125);
				zomspawnpoint[2] = (-283.384,1711.4,-1.875);
				zomspawnpoint[7] = (-282.322,1673.03,-1.875);
				zomspawnpoint[12] = (-280.659,1635.63,-1.875);
				zomspawnpoint[17] = (-278.86,1597.86,-1.875);
				zomspawnpoint[22] = (-276.956,1560.75,1.48893);
				zomspawnpoint[3] = (90.9208,614.276,192.125);
				zomspawnpoint[8] = (55.9781,618.125,192.125);
				zomspawnpoint[13] = (17.0765,622.444,192.125);
				zomspawnpoint[18] = (-20.3323,626.482,192.125);
				zomspawnpoint[23] = (-58.7394,630.077,192.125);
				zomspawnpoint[4] = (-953.13,-148.452,16.125);
				zomspawnpoint[9] = (-950.747,-111.198,16.125);
				zomspawnpoint[14] = (-948.276,-72.893,16.125);
				zomspawnpoint[19] = (-945.838,-35.1575,16.125);
				zomspawnpoint[24] = (-943.395,2.57824,16.125);
			break;
		}
	}

	// Strike
	else if(getDvar("mapname") == "mp_strike")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(4);			
		}
	
		switch(number)
		{
			case 0:				
				// spawn set 1	
				zomspawnpoint[0] = (-1388.03,-2980.89,210.807);
				zomspawnpoint[5] = (-1352.53,-2980.88,209.501);
				zomspawnpoint[10] = (-1314.55,-2980.86,208.105);
				zomspawnpoint[15] = (-1283.79,-2980.85,207.051);
				zomspawnpoint[20] = (-1247.33,-2980.84,205.845);
				zomspawnpoint[1] = (-1080.58,110.463,187.125);
				zomspawnpoint[6] = (-1107.47,136.777,187.125);
				zomspawnpoint[11] = (-1134.35,163.091,187.125);
				zomspawnpoint[16] = (-1161.11,189.273,187.125);
				zomspawnpoint[21] = (-1188,215.577,187.125);
				zomspawnpoint[2] = (-638.62,1786.15,8.125);
				zomspawnpoint[7] = (-638.649,1748.52,0.125);
				zomspawnpoint[12] = (-638.637,1712.42,0.125);
				zomspawnpoint[17] = (-638.628,1673.66,0.125);
				zomspawnpoint[22] = (-638.625,1636.23,0.125);
				zomspawnpoint[3] = (1495.42,937.748,158.125);
				zomspawnpoint[8] = (1461.14,922.255,158.125);
				zomspawnpoint[13] = (1424.77,905.845,158.125);
				zomspawnpoint[18] = (1390.47,890.387,158.125);
				zomspawnpoint[23] = (1356.17,874.929,158.125);
				zomspawnpoint[4] = (1798.15,-1699.79,73.248);
				zomspawnpoint[9] = (1798.11,-1660.71,71.0768);
				zomspawnpoint[14] = (1798.05,-1624.09,69.0425);
				zomspawnpoint[19] = (1798,-1587.67,67.0187);
				zomspawnpoint[24] = (1797.95,-1548.78,64.858);		
			break;

			case 1:
				// spawn set 2	
				zomspawnpoint[0] = (-410.561,-733.232,24.125);
				zomspawnpoint[5] = (-372.938,-733.263,24.125);
				zomspawnpoint[10] = (-335.318,-733.268,24.125);
				zomspawnpoint[15] = (-296.175,-733.298,24.125);
				zomspawnpoint[20] = (-258.357,-733.537,24.125);
				zomspawnpoint[1] = (-2335.02,1097.19,14.6849);
				zomspawnpoint[6] = (-2303.76,1094.76,14.6573);
				zomspawnpoint[11] = (-2267.02,1091.83,14.879);
				zomspawnpoint[16] = (-2229.51,1088.91,15.2995);
				zomspawnpoint[21] = (-2190.68,1085.88,15.7348);
				zomspawnpoint[2] = (1439.47,1663.98,24.125);
				zomspawnpoint[7] = (1437.02,1632.16,24.125);
				zomspawnpoint[12] = (1434.01,1593.7,24.125);
				zomspawnpoint[17] = (1431.46,1555.59,24.125);
				zomspawnpoint[22] = (1429.59,1517.82,24.125);
				zomspawnpoint[3] = (-652.99,929.806,52.125);
				zomspawnpoint[8] = (-527.576,818.443,52.125);
				zomspawnpoint[13] = (-528.248,670.685,52.125);
				zomspawnpoint[18] = (-763.238,676.55,52.125);
				zomspawnpoint[23] = (-772.155,837.833,52.125);
				zomspawnpoint[4] = (1295.26,-1377.62,196.125);
				zomspawnpoint[9] = (1294.95,-1409.52,196.125);
				zomspawnpoint[14] = (1294.75,-1447.14,196.125);
				zomspawnpoint[19] = (1294.55,-1484.76,196.125);
				zomspawnpoint[24] = (1294.32,-1522.19,196.125);	
			break;

			case 2:
				// spawn set 3
				zomspawnpoint[0] = (-699.482,-2959.48,209.094);
				zomspawnpoint[5] = (-699.916,-2922.05,209.069);
				zomspawnpoint[10] = (-700.447,-2884.62,208.894);
				zomspawnpoint[15] = (-701.103,-2845.88,208.557);
				zomspawnpoint[20] = (-701.625,-2807.88,208.542);
				zomspawnpoint[1] = (69.3596,-2186.91,121.883);
				zomspawnpoint[6] = (105.839,-2186.49,122.191);
				zomspawnpoint[11] = (145.151,-2186.1,123.277);
				zomspawnpoint[16] = (182.704,-2185.69,125.43);
				zomspawnpoint[21] = (219.861,-2185.05,127.963);
				zomspawnpoint[2] = (1816.38,-15.1974,24.125);
				zomspawnpoint[7] = (1814.82,-52.7885,24.125);
				zomspawnpoint[12] = (1813.28,-90.386,24.125);
				zomspawnpoint[17] = (1811.72,-128.548,24.125);
				zomspawnpoint[22] = (1810.24,-164.813,24.125);
				zomspawnpoint[3] = (-197.33,1584.95,16.125);
				zomspawnpoint[8] = (-195.206,1622.52,16.125);
				zomspawnpoint[13] = (-193.033,1660.08,16.125);
				zomspawnpoint[18] = (-191.279,1690.43,16.125);
				zomspawnpoint[23] = (-189.178,1726.47,16.125);
				zomspawnpoint[4] = (-2184.09,1080.24,15.7504);
				zomspawnpoint[9] = (-2221.68,1081.65,15.3117);
				zomspawnpoint[14] = (-2261.56,1083.16,14.8465);
				zomspawnpoint[19] = (-2297.44,1084.5,14.5408);
				zomspawnpoint[24] = (-2327.82,1085.59,14.5531);
			break;
			
			case 3:
				// spawn set 4
				zomspawnpoint[0] = (-2425.91,-691.008,26.125);
				zomspawnpoint[5] = (-2425.95,-728.443,26.125);
				zomspawnpoint[10] = (-2425.98,-766.068,26.125);
				zomspawnpoint[15] = (-2426.02,-805.973,26.125);
				zomspawnpoint[20] = (-2426.08,-843.608,26.125);
				zomspawnpoint[1] = (-632.611,1804.84,8.125);
				zomspawnpoint[6] = (-634.114,1768.78,0.125);
				zomspawnpoint[11] = (-635.846,1732.05,0.125);
				zomspawnpoint[16] = (-637.533,1695.61,0.125);
				zomspawnpoint[21] = (-638.93,1665.62,0.125);
				zomspawnpoint[2] = (1453.86,902.765,158.125);
				zomspawnpoint[7] = (1416.23,902.816,158.125);
				zomspawnpoint[12] = (1378.79,902.879,158.125);
				zomspawnpoint[17] = (1341.16,902.924,158.125);
				zomspawnpoint[22] = (1303.52,903.28,158.125);
				zomspawnpoint[3] = (279.585,-767.756,16.125);
				zomspawnpoint[8] = (284.813,-697.345,16.125);
				zomspawnpoint[13] = (320.953,-617.366,16.125);
				zomspawnpoint[18] = (317.537,-569.946,16.125);
				zomspawnpoint[23] = (315.381,-493.358,16.125);
				zomspawnpoint[4] = (-192.678,469.614,20.125);
				zomspawnpoint[9] = (-184.917,434.147,20.125);
				zomspawnpoint[14] = (-177.437,395.332,20.125);
				zomspawnpoint[19] = (-169.701,358.309,20.125);
				zomspawnpoint[24] = (-161.341,321.816,20.125);
			break;
		}
	}
	
	// Treasure
	if(getDvar("mapname") == "mp_treasure")
	{		
		number = 0;
		if(randomspawns == 1)
		{		 
			number = randomInt(3);			
		}
	
		switch(number)
		{
			case 0:
			// spawn set 1
				zomspawnpoint[0] = (-2624.9,227.194,-244.732);
				zomspawnpoint[5] = (-2650.67,252.725,-239.774);
				zomspawnpoint[10] = (-2677.55,279.358,-236.804);
				zomspawnpoint[15] = (-2701.98,303.795,-235.365);
				zomspawnpoint[20] = (-2730.84,332.956,-229.382);
				zomspawnpoint[1] = (-4967.68,2874.28,-249.092);
				zomspawnpoint[6] = (-5004.01,2878.39,-258.36);
				zomspawnpoint[11] = (-5041.51,2882.56,-255.398);
				zomspawnpoint[16] = (-5079.24,2886.17,-257.74);
				zomspawnpoint[21] = (-5114.18,2889.83,-261.532);
				zomspawnpoint[2] = (-8653.16,2883.63,-327.23);
				zomspawnpoint[7] = (-8615.15,2883.56,-327.214);
				zomspawnpoint[12] = (-8577.34,2883.15,-327.126);
				zomspawnpoint[17] = (-8540.29,2882.65,-327.02);
				zomspawnpoint[22] = (-8510.08,2882.03,-326.887);
				zomspawnpoint[3] = (-4509.44,7180.74,185.125);
				zomspawnpoint[8] = (-4509.65,7042.2,207.125);
				zomspawnpoint[13] = (-4652.36,6828.19,280.125);
				zomspawnpoint[18] = (-4585.89,6830.35,280.125);
				zomspawnpoint[23] = (-4511.06,6832.75,280.125);
				zomspawnpoint[4] = (-2803.93,6178.06,374.554);
				zomspawnpoint[9] = (-2827.21,6148.14,375.925);
				zomspawnpoint[14] = (-2851.05,6117.36,376.826);
				zomspawnpoint[19] = (-2870.8,6091.91,379.142);
				zomspawnpoint[24] = (-2890.21,6067.83,379.922);
			break;

			case 1:
			// spawn set 2
				zomspawnpoint[0] = (-2785.68,251.343,-227.226);
				zomspawnpoint[5] = (-2791.11,286.622,-227.634);
				zomspawnpoint[10] = (-2796.67,322.836,-227.282);
				zomspawnpoint[15] = (-2802.18,359.536,-222.118);
				zomspawnpoint[20] = (-2806.45,389.543,-221.305);
				zomspawnpoint[1] = (-2730.88,4203.09,131.093);
				zomspawnpoint[6] = (-2728.35,4240.95,133.138);
				zomspawnpoint[11] = (-2726.02,4275.82,134.163);
				zomspawnpoint[16] = (-2723.89,4307.09,134.506);
				zomspawnpoint[21] = (-2721.47,4342.54,134.61);
				zomspawnpoint[2] = (-7713.18,540.807,-200.346);
				zomspawnpoint[7] = (-7682.69,561.91,-205.614);
				zomspawnpoint[12] = (-7657.97,579.285,-208.514);
				zomspawnpoint[17] = (-7629.19,599.942,-213.155);
				zomspawnpoint[22] = (-7598.44,622.279,-216.662);
				zomspawnpoint[3] = (-8631.14,2903.99,-331.572);
				zomspawnpoint[8] = (-8593.15,2902.95,-331.351);
				zomspawnpoint[13] = (-8555.54,2901.94,-331.135);
				zomspawnpoint[18] = (-8518.5,2901,-330.935);
				zomspawnpoint[23] = (-8487.73,2900.21,-330.767);
				zomspawnpoint[4] = (-5774.12,6783.11,-429.875);
				zomspawnpoint[9] = (-5771.61,6821.03,-429.875);
				zomspawnpoint[14] = (-5769.52,6851.74,-429.875);
				zomspawnpoint[19] = (-5767.08,6887.57,-429.875);
				zomspawnpoint[24] = (-5764.5,6925.48,-429.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-3867.02,749.362,-225.904);
				zomspawnpoint[5] = (-3836.17,750.385,-204.981);
				zomspawnpoint[10] = (-3801.9,752.047,-190.314);
				zomspawnpoint[15] = (-3768.3,753.677,-178.595);
				zomspawnpoint[20] = (-3734.02,755.13,-160.807);
				zomspawnpoint[1] = (-2808.7,6102.18,381.269);
				zomspawnpoint[6] = (-2837.35,6090.83,378.203);
				zomspawnpoint[11] = (-2869.56,6078.45,378.88);
				zomspawnpoint[16] = (-2905.7,6064.7,379.359);
				zomspawnpoint[21] = (-2938.22,6052.45,378.198);
				zomspawnpoint[2] = (-4766.67,7250.58,-429.875);
				zomspawnpoint[7] = (-4804.66,7251.62,-429.875);
				zomspawnpoint[12] = (-4842.46,7252.66,-429.875);
				zomspawnpoint[17] = (-4880.45,7253.7,-429.875);
				zomspawnpoint[22] = (-4918.43,7254.94,-429.875);
				zomspawnpoint[3] = (-7399.21,5278.51,-283.875);
				zomspawnpoint[8] = (-7430.69,5279.13,-283.875);
				zomspawnpoint[13] = (-7468.5,5279.73,-283.875);
				zomspawnpoint[18] = (-7506.49,5275.34,-283.875);
				zomspawnpoint[23] = (-7544.58,5273.43,-283.875);
				zomspawnpoint[4] = (-6385.14,543.823,-198.423);
				zomspawnpoint[9] = (-6690.24,539.844,-209.86);
				zomspawnpoint[14] = (-6930.92,550.622,-217.079);
				zomspawnpoint[19] = (-7185.23,566.422,-209.787);
				zomspawnpoint[24] = (-7444.46,542.977,-201.671);
			break;

			case 3:
			// spawn set 4
		
			break;			
		}
	}

	// Vacant
	else if(getDvar("mapname") == "mp_vacant")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		}
	
		switch(number)
		{
			case 0:				
				// spawn set 1				
				zomspawnpoint[0] = (-1121.5,-1046.34,-103.875);
				zomspawnpoint[5] = (-1121.04,-1083.59,-103.875);
				zomspawnpoint[10] = (-1120.69,-1120.45,-103.875);
				zomspawnpoint[15] = (-1120.68,-1160.93,-103.875);
				zomspawnpoint[20] = (-1121.09,-1197.79,-103.875);
				zomspawnpoint[1] = (1578.66,-865.611,-47.875);
				zomspawnpoint[6] = (1578.58,-829.695,-47.875);
				zomspawnpoint[11] = (1577.8,-799.297,-47.875);
				zomspawnpoint[16] = (1576.09,-761.709,-47.875);
				zomspawnpoint[21] = (1573.61,-723.976,-47.875);
				zomspawnpoint[2] = (1578.96,390.686,-47.875);
				zomspawnpoint[7] = (1582.17,428.55,-47.875);
				zomspawnpoint[12] = (1585.41,466.793,-47.875);
				zomspawnpoint[17] = (1588.42,504.686,-47.875);
				zomspawnpoint[22] = (1591.19,542.586,-47.875);
				zomspawnpoint[3] = (674.156,1509.03,-113.072);
				zomspawnpoint[8] = (677.23,1547.47,-112.136);
				zomspawnpoint[13] = (680.223,1585.16,-111.875);
				zomspawnpoint[18] = (683.072,1621.34,-111.875);
				zomspawnpoint[23] = (685.473,1651.83,-111.848);
				zomspawnpoint[4] = (-1797.65,1631.69,-103.738);
				zomspawnpoint[9] = (-1797.45,1596.16,-103.5);
				zomspawnpoint[14] = (-1797.26,1565.57,-103.295);
				zomspawnpoint[19] = (-1796.83,1528.33,-103.045);
				zomspawnpoint[24] = (-1796.6,1486.95,-104.257);
			break;

			case 1:
			// spawn set 2			
				zomspawnpoint[0] = (-1854.8,52.6532,-113.462);
				zomspawnpoint[5] = (-1824.44,51.8285,-114.666);
				zomspawnpoint[10] = (-1793.69,50.9154,-115.875);
				zomspawnpoint[15] = (-1755.33,49.6515,-115.875);
				zomspawnpoint[20] = (-1717.54,48.2614,-115.875);
				zomspawnpoint[1] = (-933.416,1693.17,-103.047);
				zomspawnpoint[6] = (-894.914,1689.92,-106.089);
				zomspawnpoint[11] = (-858.152,1686.85,-109.693);
				zomspawnpoint[16] = (-828.143,1684.36,-112.239);
				zomspawnpoint[21] = (-790.284,1681.35,-115.712);
				zomspawnpoint[2] = (1478.6,324.602,-47.875);
				zomspawnpoint[7] = (1443.3,326.464,-47.875);
				zomspawnpoint[12] = (1412.77,328.261,-47.875);
				zomspawnpoint[17] = (1374.26,330.532,-47.875);
				zomspawnpoint[22] = (1337.09,332.763,-47.875);
				zomspawnpoint[3] = (23.1083,-238.692,-47.875);
				zomspawnpoint[8] = (-11.9074,-222.97,-47.875);
				zomspawnpoint[13] = (-46.3351,-207.334,-47.875);
				zomspawnpoint[18] = (-80.7118,-191.587,-47.875);
				zomspawnpoint[23] = (-115.625,-175.647,-47.875);
				zomspawnpoint[4] = (354.481,-1207.04,-101.464);
				zomspawnpoint[9] = (317.29,-1208.64,-95.875);
				zomspawnpoint[14] = (281.395,-1210.37,-103.875);
				zomspawnpoint[19] = (242.88,-1212.45,-103.875);
				zomspawnpoint[24] = (207.028,-1214.52,-103.875);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (-1983.91,-225.69,-111.023);
				zomspawnpoint[5] = (-1946.46,-229.068,-111.645);
				zomspawnpoint[10] = (-1910.51,-232.353,-111.321);
				zomspawnpoint[15] = (-1880.64,-235.383,-110.972);
				zomspawnpoint[20] = (-1845.48,-238.929,-111.351);
				zomspawnpoint[1] = (-1796.9,1639.68,-103.792);
				zomspawnpoint[6] = (-1798.16,1601.89,-103.538);
				zomspawnpoint[11] = (-1799.76,1564.12,-103.285);
				zomspawnpoint[16] = (-1801.31,1525.96,-103.029);
				zomspawnpoint[21] = (-1802.39,1490.11,-104.297);
				zomspawnpoint[2] = (683.818,1663.73,-111.814);
				zomspawnpoint[7] = (680.74,1625.09,-111.875);
				zomspawnpoint[12] = (677.723,1587.02,-111.875);
				zomspawnpoint[17] = (674.877,1549.12,-112.141);
				zomspawnpoint[22] = (672.63,1513.1,-113.008);
				zomspawnpoint[3] = (712.88,305.458,-47.875);
				zomspawnpoint[8] = (714.203,335.463,-47.875);
				zomspawnpoint[13] = (716.022,373.233,-47.875);
				zomspawnpoint[18] = (717.867,411.003,-47.875);
				zomspawnpoint[23] = (719.719,449.151,-47.875);
				zomspawnpoint[4] = (339.824,-1225.47,-95.875);
				zomspawnpoint[9] = (301.632,-1224.85,-103.875);
				zomspawnpoint[14] = (266.963,-1223.4,-103.875);
				zomspawnpoint[19] = (229.945,-1221.81,-103.875);
				zomspawnpoint[24] = (192.184,-1219.84,-103.875);
			break;
		}		
	}

	// Wetwork
	else if(getDvar("mapname") == "mp_cargoship")
	{		
		number = 0;
		if(randomspawns == 1)
		{		
			number = randomInt(3);			
		}
	
		switch(number)
		{
			case 0:				
			// spawn set 1	
				zomspawnpoint[0] = (3353.88,102.181,336.125);
				zomspawnpoint[5] = (3350.94,66.2444,336.125);
				zomspawnpoint[10] = (3347.74,28.758,336.125);
				zomspawnpoint[15] = (3344.53,-8.73149,336.125);
				zomspawnpoint[20] = (3340.76,-48.4732,336.125);
				zomspawnpoint[1] = (917.636,5.07925,16.125);
				zomspawnpoint[6] = (957.543,4.81616,16.125);
				zomspawnpoint[11] = (995.166,4.59077,16.125);
				zomspawnpoint[16] = (1032.79,4.35678,16.125);
				zomspawnpoint[21] = (1070.23,4.11553,16.125);
				zomspawnpoint[2] = (-500.158,-4.42826,16.125);
				zomspawnpoint[7] = (-536.079,-4.3618,16.125);
				zomspawnpoint[12] = (-575.601,-3.36448,16.125);
				zomspawnpoint[17] = (-613.208,-2.36795,16.125);
				zomspawnpoint[22] = (-650.246,-1.4084,16.125);
				zomspawnpoint[3] = (-2851.33,-340.931,64.125);
				zomspawnpoint[8] = (-2888.81,-337.596,64.125);
				zomspawnpoint[13] = (-2926.09,-334.262,64.125);
				zomspawnpoint[18] = (-2963.56,-330.633,64.125);
				zomspawnpoint[23] = (-3003.27,-326.563,64.125);
				zomspawnpoint[4] = (-2862.73,317.743,64.125);
				zomspawnpoint[9] = (-2900.36,319.277,64.125);
				zomspawnpoint[14] = (-2938,319.403,64.125);
				zomspawnpoint[19] = (-2975.43,319.615,64.125);
				zomspawnpoint[24] = (-3013.07,320.049,64.125);	
			break;

			case 1:
			// spawn set 2			
				zomspawnpoint[0] = (3857.35,-1.79966,212.125);
				zomspawnpoint[5] = (3819.96,-1.05831,212.125);
				zomspawnpoint[10] = (3781.2,-0.144028,212.125);
				zomspawnpoint[15] = (3743.24,1.67188,212.125);
				zomspawnpoint[20] = (3705.66,3.43624,212.125);
				zomspawnpoint[1] = (2109.59,44.6764,26.125);
				zomspawnpoint[6] = (2111.09,7.06453,26.125);
				zomspawnpoint[11] = (2112.25,-32.8449,26.125);
				zomspawnpoint[16] = (2112.44,-70.4838,26.125);
				zomspawnpoint[21] = (2112.58,-108.114,26.125);
				zomspawnpoint[2] = (1029.87,-119.328,176.125);
				zomspawnpoint[7] = (1029.82,-81.6981,176.125);
				zomspawnpoint[12] = (1029.8,-44.0758,176.125);
				zomspawnpoint[17] = (1029.84,-6.63993,176.125);
				zomspawnpoint[22] = (1029.86,30.982,176.125);
				zomspawnpoint[3] = (-575.827,-83.1451,176.125);
				zomspawnpoint[8] = (-575.095,-45.5096,176.125);
				zomspawnpoint[13] = (-574.182,-5.60417,176.125);
				zomspawnpoint[18] = (-573.184,32.0202,176.125);
				zomspawnpoint[23] = (-572.117,69.6438,176.125);
				zomspawnpoint[4] = (-2374.15,-107.972,224.125);
				zomspawnpoint[9] = (-2374.22,-70.3369,224.125);
				zomspawnpoint[14] = (-2374.28,-32.8928,224.125);
				zomspawnpoint[19] = (-2374.88,4.74676,224.125);
				zomspawnpoint[24] = (-2376.18,44.6424,224.125);
			break;

			case 2:
			// spawn set 3
				zomspawnpoint[0] = (293.284,-578.201,16.125);
				zomspawnpoint[5] = (256.866,-576.084,16.125);
				zomspawnpoint[10] = (226.517,-574.317,16.125);
				zomspawnpoint[15] = (190.287,-572.221,16.125);
				zomspawnpoint[20] = (160.124,-570.5,16.125);
				zomspawnpoint[1] = (36.3371,590.512,16.125);
				zomspawnpoint[6] = (73.7827,591.467,16.125);
				zomspawnpoint[11] = (111.428,591.456,16.125);
				zomspawnpoint[16] = (149.066,591.18,16.125);
				zomspawnpoint[21] = (188.984,590.789,16.125);
				zomspawnpoint[2] = (-1761.07,176.182,25.125);
				zomspawnpoint[7] = (-1760.84,138.558,25.125);
				zomspawnpoint[12] = (-1760.6,100.931,25.125);
				zomspawnpoint[17] = (-1760.35,63.4927,25.125);
				zomspawnpoint[22] = (-1760.12,25.869,25.125);
				zomspawnpoint[3] = (-3324.85,-102.158,224.125);
				zomspawnpoint[8] = (-3326.01,-64.7438,224.125);
				zomspawnpoint[13] = (-3327.16,-27.1354,224.125);
				zomspawnpoint[18] = (-3328.4,12.7472,224.125);
				zomspawnpoint[23] = (-3329.56,50.353,224.125);
				zomspawnpoint[4] = (2491.34,2.40729,16.125);
				zomspawnpoint[9] = (2461.33,1.62497,16.125);
				zomspawnpoint[14] = (2425.62,0.708681,16.125);
				zomspawnpoint[19] = (2385.14,0.185665,16.125);
				zomspawnpoint[24] = (2347.89,0.0503085,16.125); 
			break;			
		}
	}
	
	// BTD Maze
	else if(getDvar("mapname") == "mp_btd_maze")
	{
		zomspawnpoint[0] = (3282.82,-4201.69,24.1868);
		zomspawnpoint[5] = (3282.77,-4246.09,24.1868);
		zomspawnpoint[10] = (3282.58,-4285.69,24.1868);
		zomspawnpoint[15] = (3282.31,-4325.29,24.1868);
		zomspawnpoint[20] = (3282,-4364.89,24.1868);
		zomspawnpoint[1] = (4342.25,911.702,24.1266);
		zomspawnpoint[6] = (4301.11,912.381,24.1266);
		zomspawnpoint[11] = (4261.51,913.034,24.1266);
		zomspawnpoint[16] = (4221.92,913.687,24.1266);
		zomspawnpoint[21] = (4177.52,914.419,24.1266);
		zomspawnpoint[2] = (-1070.17,3337.49,24.1315);
		zomspawnpoint[7] = (-1067.29,3305.23,24.1315);
		zomspawnpoint[12] = (-1063.83,3266.42,24.1315);
		zomspawnpoint[17] = (-1061.33,3226.74,24.1315);
		zomspawnpoint[22] = (-1060.58,3187.05,24.1315);
		zomspawnpoint[3] = (-3344.76,-2910.78,24.1387);
		zomspawnpoint[8] = (-3293.83,-2911.95,24.1387);
		zomspawnpoint[13] = (-3254.24,-2912.86,24.1387);
		zomspawnpoint[18] = (-3214.65,-2913.76,24.1387);
		zomspawnpoint[23] = (-3175.06,-2914.67,24.1387);
		zomspawnpoint[4] = (-142.331,-233.032,-171.869);
		zomspawnpoint[9] = (-96.5601,-230.397,-171.869);
		zomspawnpoint[14] = (-57.4243,-228.154,-171.869);
		zomspawnpoint[19] = (-17.8891,-225.889,-171.869);
		zomspawnpoint[24] = (21.6461,-223.625,-171.869);
	}

	for(i = 0; i < zomspawnpoint.size; i++)
	{
			temp = spawnStruct();
			temp.origin = zomspawnpoint[i];
			level.zomspawns[level.zomspawns.size] = temp;
	}
}