//================================================================================================
// File Name  : _map_rotate.gsc 
// File Info  : Rotates map if empty for however many mins dvar is set to
// Mod        : Before The Dawn Apha - www.before-dawn.co.uk
// Authors    : Abney Park
//================================================================================================

#include btd_general\_dvardef;

main()
{
	level.rotateifempty = createdvar("btd_rotate_empty_map",5,0,10,"int");
	server_emptytime = 0;
	
	if(level.rotateifempty > 0)
	{
		while(server_emptytime < level.rotateifempty)
		{
			wait 60;
			num_players = 0;
			players = getentarray("player", "classname");
			
			for(i = 0; i < players.size; i++)
			{
				if(isdefined(players[i]) && isPlayer(players[i]) && players[i].sessionstate == "playing")
				{
					num_players++; 
				}
			}

			// Need at least 1 playing clients			
			if(num_players >= 1)
			{
				server_emptytime = 0;
			}
			else
			{
				server_emptytime ++;
			}
		}
		
		exitLevel(false);
	}
}