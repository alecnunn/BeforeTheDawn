init()
{
	thread vision();
}

vision()
{
	oldvisionsetting = getdvar("scr_setvisionmap");
	while(1)
	{
		wait 0.05;
		visionsetting = getdvar("scr_setvisionmap");
		if(visionsetting != oldvisionsetting)
		{
			visionSetNaked( visionsetting );
			oldvisionsetting = visionsetting;
		}
	}
}


