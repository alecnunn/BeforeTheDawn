// ===== Simple Message Generator =====

main()
{
	print_text();
}

print_text()
{
	for (;;)
	{
		ym_delay = getdvarint("sv_ymdelay");
		if (ym_delay < 1) setdvar("ym_delay", "5");

		ym_m1 = getdvar("sv_lineym1");
		if ( isdefined(ym_m1) ) iprintln(ym_m1);

		wait ym_delay;

		ym_m2 = getdvar("sv_lineym2");
		if ( isdefined(ym_m2) ) iprintln(ym_m2);

		wait ym_delay;

		ym_m3 = getdvar("sv_lineym3");
		if ( isdefined(ym_m3) ) iprintln(ym_m3);

		wait ym_delay;
		
                ym_m4 = getdvar("sv_lineym4");
		if ( isdefined(ym_m4) ) iprintln(ym_m4);

		wait ym_delay;

		ym_m5 = getdvar("sv_lineym5");
		if ( isdefined(ym_m5) ) iprintln(ym_m5);

		wait ym_delay;

		ym_m6 = getdvar("sv_lineym6");
		if ( isdefined(ym_m6) ) iprintln(ym_m6);

		wait ym_delay;

		ym_m7 = getdvar("sv_lineym7");
		if ( isdefined(ym_m7) ) iprintln(ym_m7);

		wait ym_delay;

		ym_m8 = getdvar("sv_lineym8");
		if ( isdefined(ym_m8) ) iprintln(ym_m8);

		wait ym_delay;

		wait 0.10;
	}            
}
