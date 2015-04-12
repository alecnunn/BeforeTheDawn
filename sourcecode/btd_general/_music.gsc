#include btd_general\_dvardef;

int()
{
	thread setup_music();
}

setup_music()
{
	level.music_artist = createdvar("btd_music_artist",0,0,2,"int");
	level.music_random = createdvar("btd_music_random",1,0,1,"int");
	level.music_tracks = createdvar("btd_music_tracks",5,0,9,"int");
	
	if(level.music_artist == 1)
	{	
		level.trackname[0] = "Dark Night";
		level.trackname[1] = "Premonition";
		level.trackname[2] = "Regression";
		level.trackname[3] = "Dead Pool";
		level.trackname[4] = "vemon";
		
		level.tracklength[0] = 181;
		level.tracklength[1] = 189;
		level.tracklength[2] = 172;
		level.tracklength[3] = 176;
		level.tracklength[4] = 249;
		
		for(i = 0; i < 5; i++)
		{		
			level.artistname[i] = "Michel Top";
		}	
		
		level.music_tracks = 5;
	}
	else if(level.music_artist == 2)
	{	
		level.trackname[0] = getDvar("btd_custom_track1");		
		level.trackname[1] = getDvar("btd_custom_track2");	
		level.trackname[2] = getDvar("btd_custom_track3");	
		level.trackname[3] = getDvar("btd_custom_track4");	
		level.trackname[4] = getDvar("btd_custom_track5");
		
		level.artistname[0] = getDvar("btd_custom_artist1");
		level.artistname[1] = getDvar("btd_custom_artist2");
		level.artistname[2] = getDvar("btd_custom_artist3");
		level.artistname[3] = getDvar("btd_custom_artist4");
		level.artistname[4] = getDvar("btd_custom_artist5");
		
		level.tracklength[0] = getDvarInt("btd_custom_length1");
		level.tracklength[1] = getDvarInt("btd_custom_length2");
		level.tracklength[2] = getDvarInt("btd_custom_length3");
		level.tracklength[3] = getDvarInt("btd_custom_length4");
		level.tracklength[4] = getDvarInt("btd_custom_length5");
	}
}

music()
{
	mString1 = ("^3[^72^3] ^7- " + level.artistname[0] + ": " + level.trackname[0]);
	self setclientdvar("music1", mString1);
	mString2 = ("^3[^73^3] ^7- " + level.artistname[1] + ": " + level.trackname[1]);
	self setclientdvar("music2", mString2);
	mString3 = ("^3[^74^3] ^7- " + level.artistname[2] + ": " + level.trackname[2]);
	self setclientdvar("music3", mString3);
	mString4 = ("^3[^75^3] ^7- " + level.artistname[3] + ": " + level.trackname[3]);
	self setclientdvar("music4", mString4);
	mString5 = ("^3[^76^3] ^7- " + level.artistname[4] + ": " + level.trackname[4]);	
	self setclientdvar("music5", mString5);
	
	wait 2;

	self.track = 0;
	self.songplaying = "blank";
	self.playtracknew = 0;
	self.changetrack = false;

	if(level.music_artist == 1)
	{	
		self.zomtrack = "zom_track_mt_";		
	}
	else if(level.music_artist == 2)
	{		
		self.zomtrack = "zom_track_cust_";
	}
	
	ambientStop(2);
	
	if(level.music_random == 1)
	{
		self.playtrack = randomInt(level.music_tracks);
	}
	else
	{
		self.playtrack = self.track;
	}	
	
	while(1)
	{
		//level waittill("wave_start");
		//ambientStop(2);
				
		// no music
		if(level.music_artist == 0)
		{
			wait 2;
			continue;
		}	
		
		wait 2;
		
		if(self.playtracknew != self.playtrack && self.changetrack == true)
		{
			self.playtrack = self.playtracknew;
			self.changetrack = false;
			self iPrintln("Track changing");	
			wait 2;			
		}
		
		self.songtoplay = self.zomtrack + self.playtrack;
		
		//self iPrintln("song to play = " + self.songtoplay);	
		
		if(self.songtoplay != self.songplaying )
		{			
			//track_sound = self.songplaying;
			self StopLocalSound(self.songplaying);
		}
		
		if( SoundExists(self.songtoplay) && (self.songtoplay != self.songplaying))
		{		
			//track_sound = self.songtoplay;	
			self PlayLocalSound(self.songtoplay);
			self iPrintln("Now Playing: " + level.trackname[self.playtrack] + " by " + level.artistname[self.playtrack]);
			self.songplaying = self.songtoplay;	
			
			self thread track_wait();			
		}
		
		wait 2;
		
		//self iPrintln("song playing = " + self.songplaying);
			
		//level waittill("wave_end");
		//ambientStop(5);
		//wait 3;
		//ambientPlay("ambient_pipeline",3);
	}
}

track_wait()
{
	wait level.tracklength[self.playtrack];
	
	if(self.changetrack == false)
	{				
		if(level.music_random == 1)
		{
			self.track = randomInt(level.music_tracks);
		}
		else
		{
			self.track++;
			if(self.track > ( level.music_tracks - 1))
			{
				self.track = 0;
			}
		}
	}
}




