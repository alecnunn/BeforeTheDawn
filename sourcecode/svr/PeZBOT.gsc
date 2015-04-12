////////////////////////////////////////////////////////////////
// PeZBOT, version: 006p
// Author: PEZZALUCIFER
// Changed by AbneyPark & Kill3r for Before The Dawn
// Removed all that that wasnt needed
////////////////////////////////////////////////////////////////

#include btd_general\_dvardef;

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
init()
{
	if (getdvar("svr_pezbots_drawdebug") == "")				setdvar("svr_pezbots_drawdebug", 0);
	if (getdvar("svr_pezbots_skill") == "")					setdvar("svr_pezbots_skill", 1.0);
	if (getdvar("svr_pezbots_mode") == "")					setdvar("svr_pezbots_mode", "normal");
	if (getdvar("svr_pezbots_WPDrawRange") == "")			setdvar("svr_pezbots_WPDrawRange", 1500);

	setdvar("sv_punkbuster", 0);
	
	level.zomspeed = createdvar("btd_zomspeed",8,1,10,"int");

	level.smokeList = []; 
	level.smokeListCount = 0;
	
	//load waypoints for level
	LoadStaticWaypoints();

	if(getdvar("svr_pezbots_mode") == "dev")
	{ 
		setdvar("svr_pezbots_drawdebug", 1);
		thread StartDev();
		thread DrawStaticWaypoints();
	}
	else
	{
		thread StartNormal();
		thread MonitorPlayerMovement();
		//thread UpdateSmokeList();
		//thread DrawStaticWaypoints();
	}
	
}

////////////////////////////////////////////////////////////
// monitors player movement for "Obvious" sentient behaviours
// also checks for buggy bots and kills them
////////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
MonitorPlayerMovement()
{
	while(1)
	{
		zoms = getentarray("zom","targetname");
		for(i=0;i<zoms.size;i++)
		{
			player = zoms[i];

			if(!isdefined(player.lastOrigin))
			{
				player.lastOrigin = player.origin;
			}
			else
			{
				player.fVelSquared = DistanceSquared(player.origin, player.lastOrigin);
			}

			player.lastOrigin = player.origin;

			if(isDefined(player.bIsBot) && player.bIsBot)
			{
				if(player.fVelSquared <= 4 && !player IsStunned())
				{
					player.buggyBotCounter++;
				}
				else
				{
					player.buggyBotCounter = 0;
				}

				//stuck so reset
				if(player.buggyBotCounter >= 50)
				{
					player BotReset();
					player.timesreset = player.timesreset + 1;
				}
				
				if(player.timesreset >= 5)
				{
					level notify("bugged_zom",player.health);
					player notify("damage", player.maxhealth, undefined, (0,1,0), player.origin, "MOD_SUICIDE", "", "", "", 1);
				}
				
				
			}
		}	
		wait 0.05;
	}
}

////////////////////////////////////////////////////////////
// can we debugdraw???
///////////////////////////////////////////////////////////
CanDebugDraw()
{
	if(getdvarInt("svr_pezbots_drawdebug") >= 1)
	{
		return true;
	}
	else
	{
		return false;
	}
}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////

// CHANGED FOR BEFORE THE DAWN
PreCache()
{
  
}

////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
AddTargetable(name)
{
	i = self.targetables.size;
	self.targetables[i] = spawn("script_origin", (0,0,0));
	wait 0.05;
	self.targetables[i] linkto(self, name, (0,0,0), (0,0,0));
}

////////////////////////////////////////////////////////////
// initialises target positions on bot
////////////////////////////////////////////////////////////
InitTargetables()
{
	if(isdefined(self.bIsBot))
	{
		self.attachmentMover = spawn("script_origin", self.origin);
		self linkto(self.attachmentMover);

		//clamp to ground on spawn   
		trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-200), false, self);
		if(trace["fraction"] < 1 && !isdefined(trace["entity"]))
		{
			self.attachmentMover.origin = trace["position"];
		}
	}
	self.targetables = [];
	AddTargetable("j_spine4");  
}

////////////////////////////////////////////////////////////
// Destroys target positions on bot
////////////////////////////////////////////////////////////
DeinitTargetables()
{
	if(isdefined(self.targetables))
	{
		for(i = 0; i < self.targetables.size; i++) 
		{
			self.targetables[i] unlink();
			self.targetables[i] delete();
		}
		self.targetables = undefined;
	}

	if(isdefined(self.bIsBot))
	{
		if(isdefined(self.attachmentMover))
		{
			self.attachmentMover unlink();
			self.attachmentMover delete();
		}
	}
}

////////////////////////////////////////////////////////////
// gets a target position
////////////////////////////////////////////////////////////
GetTargetablePos()
{
	if(isdefined(self.targetables))
	{
		return self.targetables[randomint(self.targetables.size)] GetOrigin();
	}
	return self GetEye();  
}

////////////////////////////////////////////////////////////
// resets a bot
////////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
BotReset()
{
	self notify("BotReset");
	self BotGoal_ClearGoals();
	self.state = "combat";
	self.stance = "stand";
	self.bombActionTimer = 0;
	self.vMoveDirection = (0,1,0);
	level.MoveSpeed = 0.0;
	self.bFaceNearestEnemy = true;
	self.buggyBotCounter = 0;
	self.lastOrigin = self.origin;
	self.bIsBot = true;
	self.bSpamAnims = false;
	self.vObjectivePos = self.origin;
	self.bClampToGround = true;
	self.commandIssued = "-1";
	self.currentStaticWp = -1;
	self.flankSide = (randomIntRange(0,2) - 0.5) * 2.0;
	self.fTargetMemory = gettime()-15000;
	self.rememberedTarget = undefined;  
}

////////////////////////////////////////////////////////////
// called when bot connects, restarts threads if they were stopped by disconnect
////////////////////////////////////////////////////////////
//CHANGED FOR BEFORE THE DAWN
Connected()
{
	println("connected called on bot");

	if(isDefined(self.bIsBot) && self.bIsBot)
	{
		if(!isdefined(self.bThreadsRunning) || (isdefined(self.bThreadsRunning) && self.bThreadsRunning == false))
		{
			println("Restarting threads for " + self.name);
			self.selectedClass = true;

			self BotReset();
			self thread PeZBOTMainLoop();
		}
	}
}

////////////////////////////////////////////////////////////
// called when bot disconnects
////////////////////////////////////////////////////////////
Disconnected()
{

}

////////////////////////////////////////////////////////////
// kicks all bots
///////////////////////////////////////////////////////////
KickAllBots()
{
	if(getdvar("svr_pezbots_botKickCount") != "")
	{
		//dont try kick bots twice.. duh
		if(getdvarint("svr_pezbots_botKickCount") > 0)
		{
			return;	  
		}
	}

	//kick all bots	
	humanPlayerCount = 0;
	botKickCount = 0;
	players = level.players;
	if(players.size > 0)
	{
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(isDefined(player.bIsBot) && player.bIsBot)
			{
				entityNumber = player getEntityNumber();
				kick(entityNumber);
				
				if(!isDefined(player.bIsDog)) //kick doggies but dont respawn them
				{
					botKickCount++;
				}	
			}
			else
			{
				humanPlayerCount++;
			}
		}
	}	
	setDvar("svr_pezbots_botKickCount", botKickCount);
	setDvar("svr_pezbots_humanPlayerCount", humanPlayerCount);
	setDvar("svr_pezbots_botKickProcess", 1);
}

////////////////////////////////////////////////////////////
// sets player name (doesnt seems to work)
///////////////////////////////////////////////////////////
SetPlayerName(name)
{
	self setClientDvar("name", name);
	SetClientNameMode( "auto_change" );
}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
PrintPlayerPos()
{
	while(1)
	{
		if(isDefined(level.players))
		{
			for(i = 0; i < level.players.size; i++)
			{
				if(!isDefined(level.players[i].bIsBot))
				{
					iprintln("pos: " + level.players[i].origin[0] + ", " + level.players[i].origin[1] + ", " + level.players[i].origin[2]);
				}
			}
		}
		wait 2.0;
	}
}

////////////////////////////////////////////////////////////
// returns one of the buttons pressed
////////////////////////////////////////////////////////////
GetButtonPressed()
{
	if(isDefined(self))
	{
		if(self attackbuttonpressed())
		{
			return "AddWaypoint";
		}
		else
		if(self adsbuttonpressed())
		{
			return "DeleteWaypoint";
		}
		else
		if(self usebuttonpressed())
		{
			return "LinkWaypoint";
		}
		else
		if(self fragbuttonpressed())
		{
			return "UnlinkWaypoint";
		}
		else
		if(self meleebuttonpressed())
		{
			return "SaveWaypoints";
		}
	}  
	return "none";
}

////////////////////////////////////////////////////////////
// Start in dev mode 
///////////////////////////////////////////////////////////
StartDev()
{
	wait 5;
	level.wpToLink = -1;
	level.linkSpamTimer = gettime();
	level.saveSpamTimer = gettime();

	while(1)
	{
		level.playerPos = level.players[0].origin;
		switch(level.players[0] GetButtonPressed())
		{
			case "AddWaypoint":
			{
				AddWaypoint(level.playerPos);
				break;
			}

			case "DeleteWaypoint":
			{
				DeleteWaypoint(level.playerPos);
				level.wpToLink = -1;
				break;
			}

			case "LinkWaypoint":
			{
				LinkWaypoint(level.playerPos);
				break;
			}

			case "UnlinkWaypoint":
			{
				UnLinkWaypoint(level.playerPos);
				break;
			}

			case "SaveWaypoints":
			{
				SaveStaticWaypoints();
				break;
			}

			default:
			break;
		}
		wait 0.001;  
	}
}

////////////////////////////////////////////////////////////
// Adds a waypoint to the static waypoint list
////////////////////////////////////////////////////////////
AddWaypoint(pos)
{
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = distance(level.waypoints[i].origin, pos);
    
    if(distance <= 30.0)
    {
      return;
    }
  }

  level.waypoints[level.waypointCount] = spawnstruct();
  level.waypoints[level.waypointCount].origin = pos;
  level.waypoints[level.waypointCount].type = "stand";
  level.waypoints[level.waypointCount].children = [];
  level.waypoints[level.waypointCount].childCount = 0;
  level.waypointCount++;

  iprintln("Waypoint Added");
  
}

////////////////////////////////////////////////////////////
// removes a waypoint from the static waypoint list
////////////////////////////////////////////////////////////
DeleteWaypoint(pos)
{
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = distance(level.waypoints[i].origin, pos);
    
    if(distance <= 30.0)
    {

      //remove all links in children
      //for each child c
      for(c = 0; c < level.waypoints[i].childCount; c++)
      {
        //remove links to its parent i
        for(c2 = 0; c2 < level.waypoints[level.waypoints[i].children[c]].childCount; c2++)
        {
          // child of i has a link to i as one of its children, so remove it
          if(level.waypoints[level.waypoints[i].children[c]].children[c2] == i)
          {
            //remove entry by shuffling list over top of entry
            for(c3 = c2; c3 < level.waypoints[level.waypoints[i].children[c]].childCount-1; c3++)
            {
              level.waypoints[level.waypoints[i].children[c]].children[c3] = level.waypoints[level.waypoints[i].children[c]].children[c3+1];
            }
            //removed child
            level.waypoints[level.waypoints[i].children[c]].childCount--;
            break;
          }
        }
      }
      
      //remove waypoint from list
      for(x = i; x < level.waypointCount-1; x++)
      {
        level.waypoints[x] = level.waypoints[x+1];
      }
      level.waypointCount--;
      
      //reassign all child links to their correct values
      for(r = 0; r < level.waypointCount; r++)
      {
        for(c = 0; c < level.waypoints[r].childCount; c++)
        {
          if(level.waypoints[r].children[c] > i)
          {
            level.waypoints[r].children[c]--;
          }
        }
      
      }

      iprintln("Waypoint Deleted");
      
      return;
    }
  }
}


////////////////////////////////////////////////////////////
//Links one waypoint to another
////////////////////////////////////////////////////////////
LinkWaypoint(pos)
{
  //dont spam linkage
  if((gettime()-level.linkSpamTimer) < 1000)
  {
    return;
  }
  level.linkSpamTimer = gettime();
  
  wpToLink = -1;
  
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = distance(level.waypoints[i].origin, pos);
    
    if(distance <= 30.0)
    {
      wpToLink = i;
      break;
    }
  }
  
  //if the nearest waypoint is valid
  if(wpToLink != -1)
  {
    //if we have already pressed link on another waypoint, then link them up
    if(level.wpToLink != -1 && level.wpToLink != wpToLink)
    {
      level.waypoints[level.wpToLink].children[level.waypoints[level.wpToLink].childcount] = wpToLink;
      level.waypoints[level.wpToLink].childcount++;
      
      level.waypoints[wpToLink].children[level.waypoints[wpToLink].childcount] = level.wpToLink;
      level.waypoints[wpToLink].childcount++;
      
      iprintln("Waypoint " + wpToLink + " Linked to " + level.wpToLink);
      level.wpToLink = -1;
    }
    else //otherwise store the first link point
    {
      level.wpToLink = wpToLink;
      iprintln("Waypoint Link Started");
    }

  }
  else
  {
    level.wpToLink = -1;
    iprintln("Waypoint Link Cancelled");
  }
}

////////////////////////////////////////////////////////////
//Breaks the link between two waypoints
////////////////////////////////////////////////////////////
UnLinkWaypoint(pos)
{
  //dont spam linkage
  if((gettime()-level.linkSpamTimer) < 1000)
  {
    return;
  }
  level.linkSpamTimer = gettime();
  
  wpToLink = -1;
  
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = distance(level.waypoints[i].origin, pos);
    
    if(distance <= 30.0)
    {
      wpToLink = i;
      break;
    }
  }
  
  //if the nearest waypoint is valid
  if(wpToLink != -1)
  {
    //if we have already pressed link on another waypoint, then break the link
    if(level.wpToLink != -1 && level.wpToLink != wpToLink)
    {
      //do first waypoint
      for(i = 0; i < level.waypoints[level.wpToLink].childCount; i++)
      {
        if(level.waypoints[level.wpToLink].children[i] == wpToLink)
        {
          //shuffle list down
          for(c = i; c < level.waypoints[level.wpToLink].childCount-1; c++)
          {
            level.waypoints[level.wpToLink].children[c] = level.waypoints[level.wpToLink].children[c+1];
          }
          level.waypoints[level.wpToLink].childCount--;
          break;
        }
      }
      
      //do second waypoint  
      for(i = 0; i < level.waypoints[wpToLink].childCount; i++)
      {
        if(level.waypoints[wpToLink].children[i] == level.wpToLink)
        {
          //shuffle list down
          for(c = i; c < level.waypoints[wpToLink].childCount-1; c++)
          {
            level.waypoints[wpToLink].children[c] = level.waypoints[wpToLink].children[c+1];
          }
          level.waypoints[wpToLink].childCount--;
          break;
        }
      }
      
      iprintln("Waypoint " + wpToLink + " Broken to " + level.wpToLink);
      level.wpToLink = -1;
    }
    else //otherwise store the first link point
    {
      level.wpToLink = wpToLink;
      iprintln("Waypoint Link Started");
    }
  }
  else
  {
    level.wpToLink = -1;
    iprintln("Waypoint Link Cancelled");
  }
}

////////////////////////////////////////////////////////////
// Saves waypoints out to a file
////////////////////////////////////////////////////////////
SaveStaticWaypoints()
{


  if((gettime()-level.saveSpamTimer) < 1500)
  {
    return;
  }
  level.saveSpamTimer = gettime();
  
  setdvar("logfile", 1);
  
  filename = "PeZBOT_" + tolower(getdvar("mapname")) + "_WP.csv";
/*
  file = openfile(filename, "write");
  
  if(file == -1)
  {
    iprintln("Save Failed");
    return;
  }
*/

  println(filename);
  for(i = 0; i < level.waypointCount; i++)
  {
    string = i + "," + level.waypoints[i].origin[0] + " " + level.waypoints[i].origin[1] + " " + level.waypoints[i].origin[2] + ",";
    for(c = 0; c < level.waypoints[i].childCount; c++)
    {
      string = string + level.waypoints[i].children[c];
      if(c < level.waypoints[i].childCount-1)
      {
        string = string + " ";
      }
    }
    
    string = string + "," + level.waypoints[i].type;
  //  fprintln(file, string);
  println(string);
  }

//  fprintln(file, level.waypointCount + ",end");
  println(level.waypointCount + ",end");
  
//  closefile(file);

  setdvar("logfile", 0);
  
  iprintln("Save Successful");

  


}


////////////////////////////////////////////////////////////
// start in normal mode
///////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
StartNormal()
{
	gt = getDvar("set btd_gametype");
	
	if(gt != "SUR" || gt != "TDM")
	{
		gt = "SUR";
	}
	
	if(gt == "SUR" ) // survival
	{
		thread btd_gametypes\survival\_survival_logic::startsurvival();
	}
	else if (gt == "TDM")
	{
		thread btd_gametypes\survival\_survival_logic::startsurvival();
	}
	
}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;

	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;

  class = "assault_mp";
  
	switch(randomInt(5))
	{
		case 0:		
			class = "assault_mp";		
		case 1:		
			class = "specops_mp";		
		case 2:		
			class = "heavygunner_mp";		
		case 3:		
			class = "demolitions_mp";		
		case 4:		
			class = "sniper_mp";		
		break;
	}
  self.weaponPrefix = "ak47_mp";

  self notify("menuresponse", "changeclass", class);

  self waittill("spawned_player");
	
	self.selectedClass = true;
	
	self thread PeZBOTMainLoop();
	
}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
VectorCross( v1, v2 )
{
	return ( v1[1]*v2[2] - v1[2]*v2[1], v1[2]*v2[0] - v1[0]*v2[2], v1[0]*v2[1] - v1[1]*v2[0] );
}

////////////////////////////////////////////////////////////
// offsets the eye pos a bit higher
///////////////////////////////////////////////////////////
GetEyePos()
{
  return (self getEye() + (0,0,20));
}

////////////////////////////////////////////////////////////
// IsFacingAtTarget
///////////////////////////////////////////////////////////
//CHANGED FOR BEFORE THE DAWN
IsFacingAtTarget()
{
  	if(!isDefined(self.bestTarget))
	{
		return false;
	}
  
	dirToTarget = VectorNormalize(self.bestTarget.origin-self.origin);
  
	forward = AnglesToForward(self.angles);
  
	dot = vectordot(dirToTarget, forward);
  
	if(dot > 0.75)
	{
		return true;
	}
	  
	return false;
}


////////////////////////////////////////////////////////////
// CanSeeTarget
///////////////////////////////////////////////////////////
CanSeeTarget()
{
  if(!isDefined(self.bestTarget))
  {
    return false;
  }

  //can't see sh!t  
  if(self maps\mp\_flashgrenades::isFlashbanged())
  {
//    print3d(self.origin, "flashed", (1,0,0), 2);
    return false;
  }
  
  dot = 1.0;
  
  if((gettime()-self.fTargetMemory) < 5000 &&	(isdefined(self.rememberedTarget) && self.rememberedTarget == self.bestTarget && self.rememberedTarget.sessionstate == "playing"))
  {
    return true;
  }
  else
  {
    self.rememberedTarget = undefined;
  }
  
  //if nearest target hasn't attacked me, check to see if it's in front of me
  if(!AttackedMe(self.bestTarget))
  {
    targetPos = self.bestTarget GetEyePos();
    eyePos = self GetEyePos();
    fwdDir = anglestoforward(self.angles);
    dirToTarget = vectorNormalize(targetPos-eyePos);
    dot = vectorDot(fwdDir, dirToTarget);
  }


  //try see through smoke
  if(!SmokeTrace(self GetEyePos(), self.bestTarget GetEyePos()))
  {
    return false;
  }
  
  //in front of us and is being obvious
  if(dot > 0.25 && self.bestTarget IsBeingObvious(self))
  {
  
    //do a ray to see if we can see the target
    visTrace = bullettrace(self GetEyePos(), self.bestTarget GetEyePos(), false, self);
    if(visTrace["fraction"] == 1)
    {
      if(CanDebugDraw())
      {
        line(self GetEyePos(), visTrace["position"], (0,1.0,0));
      }
      self.fTargetMemory = gettime(); //remember target
      self.rememberedTarget = self.bestTarget;
      return true;
    }
    else
    {
      if(CanDebugDraw())
      {
        line(self GetEyePos(), visTrace["position"], (1,0,0));            
      }
      return false;
    }
  }
  
  return false;
}

////////////////////////////////////////////////////////////
// returns true if shooting, moving over a certain speed (depending on skill) etc..
// obviousTo is the player they are being obvious to
////////////////////////////////////////////////////////////
IsBeingObvious(obviousTo)
{

  obviousDist = distance(obviousTo.origin, self.origin);

  if(obviousDist < 800.0)
  {
    return true;    
  }

  if(isdefined(self.bIsBot))
  {
    if(self.bThrowingGrenade || self.bShooting)
    {
      return true;
    }
  }
  else
  {
    if(self AttackButtonPressed())
    {
      return true;
    }
  }
  
  if(isdefined(self.fVelSquared))
  {
    if(self.fVelSquared > (4.0*4.0))
    {
      return true;
    }
  }

  return false;
}

////////////////////////////////////////////////////////////
// CanSee a player?
///////////////////////////////////////////////////////////
CanSee(target)
{

  if(self maps\mp\_flashgrenades::isFlashbanged())
  {
    return false;
  }


  //do a ray to see if we can see the target
  visTrace = bullettrace(self GetEyePos(), target GetEyePos(), false, self);
  if(visTrace["fraction"] == 1)
  {
    if(CanDebugDraw())
    {
      line(self GetEyePos(), visTrace["position"], (1,7,0));
    }
    return true;
  }
  else
  {
    if(CanDebugDraw())
    {
      line(self GetEyePos(), visTrace["position"], (1,0,0));            
    }
    return false;
  }
}

////////////////////////////////////////////////////////////
// CanSee a position
///////////////////////////////////////////////////////////
CanSeePos(target)
{
  if(self maps\mp\_flashgrenades::isFlashbanged())
  {
    return false;
  }

  //do a ray to see if we can see the target
  visTrace = bullettrace(self GetEyePos(), target, false, self);
  if(visTrace["fraction"] == 1)
  {
    if(CanDebugDraw())
    {
      line(self GetEyePos(), visTrace["position"], (1,7,0));
    }
    return true;
  }
  else
  {
    if(CanDebugDraw())
    {
      line(self GetEyePos(), visTrace["position"], (1,0,0));            
    }
    return false;
  }
}

////////////////////////////////////////////////////////////
// Try play the current game type
///////////////////////////////////////////////////////////
TryPlayGame()
{

  //clear movein commands from leader if we have called it last frame
  if(isDefined(self.leader) && isDefined(self.bFollowTheLeader))
  {
    if(self.bFollowTheLeader == false && isDefined(self.leader.commandIssued) && self.leader.commandIssued == "2")
    {
      self.leader.commandIssued = "-1";
    }
  }


    if(isDefined(self.bestTarget))
    {
      //use position of nearest waypoint so not as to go wandering off
      //zombie mods probably want to just set the objective pos as self.bestTarget.origin so they can get into melee range
 
      self SetObjectivePos(self.bestTarget.origin);
       
          targetRange = DistanceSquared(self.bestTarget.origin, self.origin);
          //if(targetRange < (150*150) && self CanSeeTarget())
          if(targetRange < (50*50) && self CanSeeTarget())
          {
            self thread BotMelee();
          }
          else
          {
            self PathToObjective();
          }
    }
  

}

////////////////////////////////////////////////////////////
// Decide whether to follow static waypoints or path dynamically
////////////////////////////////////////////////////////////
PathToObjective()
{
  if(self IsStunned())
  {
    return;
  }
  
  //waypoints are closer to our objective so path using waypoints
  if(isDefined(level.waypoints) && level.waypointCount > 0 && self AnyWaypointCloserToObjectiveThanMe(self.vObjectivePos))
  { 
    if(self.currentStaticWp == -1)
    {
      wpPos = level.waypoints[GetNearestStaticWaypoint(self.origin)].origin;
      
      wpPos = (wpPos[0], wpPos[1], self.origin[2]);
      
      distance = Distance(self.origin, wpPos);
      if(distance <= (level.MoveSpeed + 5.0)) //close enough to waypoint so start following
      {
        self BotGoal_EnterGoal("StaticWaypointFollowGoal");
      }
      else //too far from waypoint so move over to it
      { 
        self.vObjectivePos = wpPos;
        self BotGoal_EnterGoal("DynWaypointFollowGoal");
      }
    }
  }
  else
  {
    self BotGoal_EnterGoal("DynWaypointFollowGoal");
  }
}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
PeZBOTMainLoop()
{
	self endon( "disconnect" );

   self.bThreadsRunning = true;    

	self.bMeleeAttacking = false;
	self.vObjectivePos = self.origin;
	self.currentGoal = "none";
	self.buggyBotCounter = 0;
	self.lastOrigin = self.origin;
	self.fTargetMemory = gettime()-15000;
	
	self.vMoveDirection = (0,1,0);
	level.MoveSpeed = 0.0;
	self.bFaceNearestEnemy = true;
	self.currentStaticWp = -1;
  self.bClampToGround = true;
	self.flankSide = (randomIntRange(0,2) - 0.5) * 2.0;
	
   	self.state = "combat";
	  self.stance = "stand"; 	

  self thread TargetBestEnemy();
  self thread ClampToGround();

  
	for(;;)
	{
		 
		//if(self CanSeeTarget())
		//{
		//	self.bFaceNearestEnemy = true;           
		//}
		
		self TryPlayGame();
	  
    if(CanDebugDraw())
    {
	    //debug
      print3d(self.origin + (0, 0, 75), "STATE: " + self.state, (1,0,0), 2);
      print3d(self.origin + (0, 0, 65), "GOAL: " + self.currentGoal, (1,0,0), 2);
      print3d(self.vObjectivePos, self.name + " ObjectivePos", (1,0,0), 2);
      print3d(self.origin + (0, 0, 85), "weapon: " + self GetCurrentWeapon(), (1,0,0), 2);
      print3d(self.origin + (0, 0, 95), "movespeed: " + level.MoveSpeed, (1,0,0), 2);
      print3d(self.origin + (0, 0, 105), "currentStaticWP: " + self.currentStaticWp, (1,0,0), 2);
      
      
    }
    

    
	  wait 0.01;
	}

}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
CanMove(from, direction, distance)
{
  //ray cast against everything
  trace = bulletTrace(from, from + (direction * distance), true, self);

  //line to collision is red
//  line(from, trace["position"], (1,0,0));

//  print3d( self.origin + ( 0, 0, 65 ),"Fraction " + trace["fraction"], (1,0,0), 2);
 
  return (trace["fraction"] == 1.0);
}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
ClampToGround()
{
	self endon("death");

	while(1)
	{
		if(self.bClampToGround)
		{
			trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, self);
			if(isdefined(trace["entity"]) && isDefined(trace["entity"].targetname) && trace["entity"].targetname == "zom")
				trace = bulletTrace(self.origin + (0,0,50), self.origin + (0,0,-40), false, trace["entity"]);

//			line(self.origin + (0,0,50), trace["position"], (1,0,1));
  
//			if(trace["fraction"] < 1 && !isdefined(trace["entity"]))

			//smooth clamp
//			self.origin = ((trace["position"] * 0.5) + (self.origin * 0.5));
			self.origin = (trace["position"]);
			self.currentsurface = trace["surfacetype"];
			if(self.currentsurface == "none")
				self.currentsurface = "default";
		}
		wait 0.05;
	}
}

////////////////////////////////////////////////////////////
// returns true if attacker attacked me
///////////////////////////////////////////////////////////
AttackedMe(attacker)
{
  if(!isDefined(self.attackers))
  {
    return false;
  }
  
  if(isDefined(self.murderer) && self.murderer == attacker)
  {
//    print3d(self.origin + (0,0,100), "Chasing MURDERER", (0,0,1), 4);
    return true;
  }
  
  for(i = 0; i < self.attackers.size; i++)
  {
    if(isDefined(self.attackers[i]) && self.attackers[i] == attacker)
    {
      return true;
    }
  }
  
  return false;
}

////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
SetBotAngles(angles)
{
  if(isDefined(self.bIsDog) && self.bIsDog)
  {
    adjustedAngles = (0, angles[1], 0);
    self setplayerangles(adjustedAngles);
  }
  else
  {
//    self setplayerangles(angles);
	self.angles = (0,angles[1],0);
  }
}

////////////////////////////////////////////////////////////
// will try target nearest enemy
// if someone is attacking the bot, and the bot can see its attacker, it will use that target
///////////////////////////////////////////////////////////
// CHANGED FOR BFORE THE DAWN
TargetBestEnemy()
{
	self endon( "disconnect" );
  
  while(1)
  {
		players = getentarray("player", "classname");
		nearestTarget = undefined;
		nearestDistance = 9999999999;
		
		
		if(players.size > 0)
		{
		  for(i = 0; i < players.size; i++)
		  {
			  player = players[i];
	//		  if(self IsEnemy(player) && isdefined(player.sessionstate) && player.sessionstate == "playing")
			  if(isdefined(player.sessionstate) && player.sessionstate == "playing")
			  {
			    tempDist = DistanceSquared(self.origin, player.origin);
			    //if closer or attacked me and can see, then set nearest
			    //  if(tempDist < nearestDistance || (self AttackedMe(player) && self CanSee(player)))
			    if(tempDist < nearestDistance)
			    {
					/*
					 if(isDefined(nearestTarget))
					 {  //if something has shot at me and i can see it, dont wanna go any further
						 if(!(self AttackedMe(nearestTarget) && self CanSee(nearestTarget)))
						{
							 nearestDistance = tempDist;
							 nearestTarget = player;
						}
					 }
					 else //just set nearest target
					{
						nearestDistance = tempDist;
						 nearestTarget = player;
					}			     
					 */
			      
					nearestDistance = tempDist;
					 nearestTarget = player;
			      
			    }
			  }
			}
		  
		  self.bestTarget = nearestTarget;
		
		  //only face if allowed
      if(self.bFaceNearestEnemy && isdefined(self.bestTarget) && !self IsStunned())
      {
        targetPos = self.bestTarget GetTargetablePos();
        
		    //calc direction of nearest target
			  targetDirection = VectorNormalize(targetPos - self GetEyePos());
			  
//			  line(self GetEyePos(), targetPos, (1,0,0));
  			
			  //turn to face target
//        targetAngles = vectorToAngles(targetDirection);
//			  self SetBotAngles(VectorSmooth(self.angles, targetAngles, 0.125));

        skillBias = 0.0;
        //trace to see if we can actually see our target, if not decrease accuracy heaps
        visTrace = bullettrace(self GetEyePos(), self.bestTarget GetEyePos(), false, self);
        if(visTrace["fraction"] != 1)
        {
          skillBias = 2.0;        
        }
        
        skill = (1.0 - Clamp(0.0, getdvarFloat("svr_pezbots_skill"), 1.0)) * (5.0+skillBias);
        
        angles = vectorToAngles(VectorNormalize(VectorSmooth(anglesToForward(self.angles), targetDirection, 0.25)));
        //spray and pray depending on skill
        if(skill > 0 && !isDefined(self.bIsDog) && self.bShooting)
        {
          angles = (angles[0]+randomfloatrange(skill*-1.0, skill), angles[1]+randomfloatrange(skill*-1.0, skill), angles[2]+randomfloatrange(skill*-1.0, skill));
        }
        
        self SetBotAngles(angles);

			}
	  }
			
    wait 0.05;
  }
}

////////////////////////////////////////////////////////////
// melee a target
///////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
BotMelee()
{
	if(self.bMeleeAttacking)
	{
		return;
	}

	//clear static waypoint usage so we dont get stuck  
	self.currentStaticWp = -1;

	//cancel any previous moves
	self notify("BotMovementComplete");
	self endon ("disconnect");
	self endon ("BotMeleeComplete");
	self endon ("killed_player");
	self.bMeleeAttacking = true;

	vMoveTarget = self.bestTarget.origin + (VectorNormalize(self.origin - self.bestTarget.origin) * 10);
	fMoveSpeed = 0.1;

	while(self.bMeleeAttacking)
	{
		moveTarget = (vMoveTarget[0], vMoveTarget[1], self.origin[2]);
		distance = DistanceSquared(moveTarget, self.origin);

		//hit stuff while we lunge
		// if(isDefined(self.bestTarget) && self.bestTarget.sessionstate != "dead" && DistanceSquared(self.bestTarget.origin, self.origin) <= ((fMoveSpeed*2)*(fMoveSpeed*2)))
		// if(DistanceSquared(self.bestTarget.origin, self.origin) <= ((fMoveSpeed*2)*(fMoveSpeed*2)))
		//{
			newent = spawnstruct();
			newent.isPlayer = true;
			newent.isADestructable = false;
			newent.entity = self.bestTarget;
			newent.damageCenter = self.bestTarget.origin;

			killer = self;
			damageAmount = 10000;  

			//kill target

			self.bestTarget thread [[level.callbackPlayerDamage]](self,self.bestTarget,level.zomdmg,0,"MOD_MELEE","",self.bestTarget.origin,VectorNormalize(self.bestTarget.origin - self.origin),"none",0);
			if(!self.attacksoundplaying)
			self thread k3\_zombie::attacksound();

			self.bMeleeAttacking = false;
			self notify("BotMeleeComplete");

			//      self SetOrigin(self.origin + (VectorNormalize(moveTarget-self.origin) * fMoveSpeed));
			//      self.attachmentMover.origin = self.origin + (VectorNormalize(moveTarget-self.origin) * fMoveSpeed);
			self PushOutOfPlayers();


			if(distance <= (fMoveSpeed*fMoveSpeed) || !isDefined(self.bestTarget) || (isDefined(self.bestTarget) && self.bestTarget.sessionstate != "playing"))
			{
				self.bMeleeAttacking = false;
				self notify("BotMeleeComplete");
			} 
		//}
		//wait 0.0001;
		wait 0.01;
	}

}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
BotMove(_vMoveTarget, _fMoveSpeed)
{
  //cancel any previous moves
  self notify( "BotMovementComplete" );

  //regular cheap movement  
	self.vMoveTarget = _vMoveTarget;
	
	//calc move direction
	moveDirection = VectorNormalize(self.vMoveTarget - self.origin);
	
	//get forward direction
  forward = anglesToForward(self.angles);	
  
  //get dot between forward and our move direction
  dot = vectordot(forward, moveDirection);  

  
//start move thread
  self thread BotMoveThread(); 
  
  //start movement monitor thread
  self thread MonitorMovement();

}

////////////////////////////////////////////////////////////
// push self out of other players
///////////////////////////////////////////////////////////
PushOutOfPlayers()
{
  //Commented out as of 006p to prevent bots getting stuck
  //zombie mods probably want to re-enable this


  //push out of other players
  players = level.players;
  for(i = 0; i < players.size; i++)
  {
    player = players[i];
    
    if(player == self)
      continue;
      
    distance = distance(player.origin, self.origin);
    minDistance = 30;
    if(distance < minDistance) //push out
    {
      
      pushOutDir = VectorNormalize((self.origin[0], self.origin[1], 0)-(player.origin[0], player.origin[1], 0));
      trace = bulletTrace(self.origin + (0,0,20), (self.origin + (0,0,20)) + (pushOutDir * ((minDistance-distance)+10)), false, self);

      //debug
      if(CanDebugDraw())
      {
        print3d(self.origin + (0, 0, 85), "PUSHOUT " + distance, (1,0,0), 2);
        line(self.origin + (0,0,20), (self.origin + (0,0,20)) + (pushOutDir * ((minDistance-distance)+10)), (1,0,0));
      }
      
      //no collision, so push out
      if(trace["fraction"] == 1)
      {
        pushoutPos = self.origin + (pushOutDir * (minDistance-distance));
         self.origin = (pushoutPos[0], pushoutPos[1], self.origin[2]);
//       self SetOrigin((pushoutPos[0], pushoutPos[1], self.origin[2])); 
//        self.attachmentMover.origin = (pushoutPos[0], pushoutPos[1], self.origin[2]);
      }
    }
  }

}

////////////////////////////////////////////////////////////
// Monitors the movement speed and anim based on direction
///////////////////////////////////////////////////////////
MonitorMovement()
{
	self endon("BotMovementComplete");
	self endon("disconnect");
	self endon("killed_player");
  self endon("BotReset");

  while(1)
  {
	  //calc move direction
	  moveDirection = VectorNormalize(self.vMoveTarget - self.origin);
  	
	  //get forward direction
    forward = anglesToForward(self.angles);	

    //get dot between forward and our move direction
    dot = vectordot(forward, moveDirection);
    
    wait 0.2;
  }

}

////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
// CHANGED FOR BEFORE THE DAWN
BotMoveThread()
{
	
	level.MoveSpeed = level.zomspeed;
	//level.MoveSpeed = 8;
	
	self endon("BotMovementComplete");
	self endon("disconnect");
	self endon("killed_player");
	self endon("BotReset");
  
  while(1)
  {
    if(self IsStunned())
    {
      self notify( "BotMovementComplete" );
    }
  
    moveTarget = (self.vMoveTarget[0], self.vMoveTarget[1], self.origin[2]);
    distance = DistanceSquared(moveTarget, self.origin);
    if(distance <= (level.MoveSpeed*level.MoveSpeed))
    {
      self.origin = moveTarget;
      self notify( "BotMovementComplete" );
    }
    else
    {
      self.origin = (self.origin + (VectorNormalize(moveTarget-self.origin) * level.MoveSpeed));
      self PushOutOfPlayers();
    }
    wait 0.005;
  }
}

////////////////////////////////////////////////////////////
// smooth between two vectors by factor 'fFactor' in the form (vC = (vA * (1-factor)) + (vB * factor));)
///////////////////////////////////////////////////////////
VectorSmooth(vA, vB, fFactor)
{
  fFactorRecip = 1.0-fFactor;
  
  vRVal = ((vA * fFactorRecip) + (vB * fFactor));
  
  return vRVal;
}


////////////////////////////////////////////////////////////
// 
///////////////////////////////////////////////////////////
IsEnemy(player)
{

  if(player != self && player.sessionteam != "spectator" && player.pers["team"] != "spectator" && (player.pers["team"] != self.pers["team"] || getdvar("g_gametype") == "dm"))
  {
    return (true);
  }
  
  return (false);
}


////////////////////////////////////////////////////////////
// finds a safe spot to move to in the direction specified
///////////////////////////////////////////////////////////
FindSafeMoveToPos(direction, distance)
{
	from = self.origin + (0,0,20);
	bCanMove = false;
	//try move in direction 
  if(CanMove(from, direction, distance))
  {
    bCanMove = true;
  }
  else // try strafe
  {
    //get right direction from cross product
    direction = VectorCross(direction, (0,0,1));
    
    //dont always strafe right
    direction = direction * ((RandomInt(2) - 0.5) * 2.0);
    
    //halve distance for tight areas
    distance = distance * 0.5;
    
    //try strafe 
    if(CanMove(from, direction, distance))
    {
      bCanMove = true;
    }
    else //try strafe opposite direction
    {
      direction = direction * -1.0;
      if(CanMove(from, direction, distance))
      {
        bCanMove = true;
      }
    }
  }

  safePos = self.origin;
  
  //woohoo, i can move
  if(bCanMove)
  {
    safePos = self.origin + (direction*distance);
  }
  
  return (safePos);
}

////////////////////////////////////////////////////////////
// Starts a bot goal thread
///////////////////////////////////////////////////////////
BotGoal_EnterGoal(goal)
{
  if(isdefined(self.currentGoal) && self.currentGoal == goal)
  {
    return;
  }

//  println("Entering Goal" + goal);

  //clear all active goals so they dont fight with eachother (can probably fix this)
  self BotGoal_ClearGoals();

  //make sure we know what goal we are in  
  self.currentGoal = goal;
  
  switch(goal)
  {
    case "MeleeCombatGoal":
      self thread BotGoal_MeleeCombatGoal();
      break;  
      
    case "DynWaypointFollowGoal":
      self thread BotGoal_DynWaypointFollowGoal();
      break;  
      
    case "StaticWaypointFollowGoal":
      self thread BotGoal_StaticWaypointFollowGoal();
      break;  
      
      
  };

}

////////////////////////////////////////////////////////////
// Ends all current goal threads
///////////////////////////////////////////////////////////
BotGoal_ClearGoals()
{
  self notify ( "MeleeCombatGoalComplete" );
  self notify ( "AttackDogCombatGoalComplete" );
  self notify ( "DynWaypointFollowGoalComplete" );
  self notify ( "StaticWaypointFollowGoalComplete" );
  self.currentStaticWp = -1;
  self.currentGoal = "none";
}


////////////////////////////////////////////////////////////
// Melee combat goal for bot (Stabs, keeps in range etc)
///////////////////////////////////////////////////////////
BotGoal_MeleeCombatGoal()
{
  self endon ( "MeleeCombatGoalComplete" );
	self endon( "disconnect" );
	self endon("killed_player");
  
  while(1)
  {
    //stay in range
    if(isDefined(self.bestTarget))
    {
      //FIXME: should do both of these in the one function
      targetRange = Distance(self.bestTarget.origin, self.origin);
      direction = VectorNormalize(self.bestTarget.origin - self.origin);

      safeMoveToPos = self.origin;
      moveSpeed = 0.1;      
      
      //too far away get closer
      // if(targetRange > 100)
      if(targetRange > 50)
      {
        safeMoveToPos = self FindSafeMoveToPos(direction, 50.0);
        //move
        self BotMove(safeMoveToPos, moveSpeed);
      }
      else //in range, stabbage
      {
        self thread BotMelee();
      } 
      
    }
    wait 1;
  }
}


 

////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
ClampWpToGround(wpPos)
{
  trace = bulletTrace(wpPos, wpPos + (0,0,-300), false, undefined);
  
  if(trace["fraction"] < 1)
  {
    return trace["position"] + (0,0,30);
  }
  else
  {
    //probably under the ground, trace up
    trace = bulletTrace(wpPos, wpPos + (0,0,20), false, undefined);
    if(trace["fraction"] < 1)
    {
      return trace["position"] + (0,0,30);
    }
    else
    {
      return wpPos;
    }
  }

}

////////////////////////////////////////////////////////////
// Clamp a in between min and max
////////////////////////////////////////////////////////////
Clamp(min, a, max)
{
  return max(min(a, max), min);
}

////////////////////////////////////////////////////////////
// Builds a dynamic list of waypoints for the bot to follow, uses brute force wall following, 
// looks for exits nearest target direction, HAX!!! etc... ;)
// This function is still kinda bruteforce and dodgy but it will do for now :D
////////////////////////////////////////////////////////////
BuildDynWaypointList()
{

  self.dynWaypointCount = 0;
  self.currDynWaypoint = 0;

  from = self.origin + (0,0,30);
//  direction = anglesToForward(self.angles);
  enemydirection = VectorNormalize(self.vObjectivePos - from);
  direction = enemydirection;
  distance = 30.0;
  self.dynWaypointList = [];
  bCanTurnToTarget = true; // if true we can turn to try go towards our target
  maxWaypointCount = randomintrange(40, 60);
  lastWallDirection = (1,0,0);
  bValidLastWallDirection = false;
  
  while(self.dynWaypointCount < maxWaypointCount)
  {
    
    //add a waypoint
    self.dynWaypointList[self.dynWaypointCount] = ClampWpToGround(from);
    self.dynWaypointCount++;
  
    trace = bulletTrace(from, from + (direction * distance), false, self);

    enemydirection = VectorNormalize(self.vObjectivePos - from);
    
    //didnt hit keep moving
    if(trace["fraction"] == 1)
    {
      from = trace["position"];
      
      //add a waypoint
      self.dynWaypointList[self.dynWaypointCount] = ClampWpToGround(from);
      self.dynWaypointCount++;
      
      //move towards target
      if(bCanTurnToTarget)
      {
        direction = enemydirection;
        bValidLastWallDirection = false;
      }
      else //see if we need to keep following wall
      {
        //try keep following wall
        if(bValidLastWallDirection)
        {
          //trace
          trace = bulletTrace(from, from + (lastWallDirection * distance * 2.0), false, self);
          
          //wall no longer there, head that way
          if(trace["fraction"] == 1)
          {
            direction = lastWallDirection;
            from = trace["position"];
            dot = vectorDot(enemydirection, direction);
            if(dot > 0.5)
            {
              bCanTurnToTarget = true;
            }
            bValidLastWallDirection = false;
          }
        }
        else //still next to wall keep going straight ahead
        {
          bCanTurnToTarget = false;
        }
      }
    }
    else // hit something, navigate around it
    {
      //dont turn to target we need to navigate around collision    
      bCanTurnToTarget = false;
      
      //get collision normal and position    
      colNormal = trace["normal"];
      colPos = trace["position"];
        
      //move out from collision
//      from = colPos + (colNormal * 20.0);
      from = colPos + (VectorNormalize(VectorSmooth(direction * -1.0, colNormal, 0.5)) * 20.0); //normals are dodgy, especially on corrigated iron, use a fake normal
      
      tanDirection = VectorCross(direction * -1.0, (0,0,1));
      //tanDirection = VectorCross(colNormal, (0,0,1));

      //we were already traveling along a wall, pick tangent direction that keeps us going forwards
      if(bValidLastWallDirection)
      {
        dot = vectordot(lastWallDirection * -1.0, tanDirection);
        
        if(dot < 0)
        {
          tanDirection = tanDirection * -1.0;
        }
        
        lastWallDirection = colNormal * -1.0;
        bValidLastWallDirection = true;
        direction = tanDirection;
      }
      else //choose direction that best matches target dir
      {
        dot = vectordot(enemydirection, tanDirection);
        
        if(dot < 0)
        {
          tanDirection = tanDirection * -1.0;
        }
        
        lastWallDirection = colNormal * -1.0;
        bValidLastWallDirection = true;
        direction = tanDirection;
      }
    }
   
    //end of waypoint list
    if(Distance(self.vObjectivePos, from) <= (distance+5.0))
    {
      return true; 
    }
    
  }
    
  return true;
}

////////////////////////////////////////////////////////////
// Dynamic waypoint follow goal, follows a dynamically generated list of waypoints
///////////////////////////////////////////////////////////
BotGoal_DynWaypointFollowGoal()
{
  self endon ( "DynWaypointFollowGoalComplete" );
	self endon( "disconnect" );
	self endon("killed_player");
  
  //build waypoint list
  self BuildDynWaypointList();
  
  while(1)
  {
    tempWp = (self.dynWaypointList[self.currDynWaypoint][0], self.dynWaypointList[self.currDynWaypoint][1], self.origin[2]);

    //prevent enemy facing
    if(self CanSeeTarget())
    {
      self.bFaceNearestEnemy = true;
    }
    else
    {
      self.bFaceNearestEnemy = false;
      //face movement direction        
      self SetBotAngles(vectorToAngles(VectorNormalize(VectorSmooth(anglesToForward(self.angles), VectorNormalize(tempWp-self.origin), 0.5))));
    }
    
    distToWp = Distance(tempWp, self.origin);

    if(distToWp <= (level.MoveSpeed +5.0))
    {
      self.currDynWaypoint++;
      
      if(self.currDynWaypoint >= self.dynWaypointCount)
      {
        self.currentGoal = "none";
        self notify ( "DynWaypointFollowGoalComplete" );
      }
      else
      {
        tempWp = (self.dynWaypointList[self.currDynWaypoint][0], self.dynWaypointList[self.currDynWaypoint][1], self.origin[2]);
       
        //dogs are fast
       	if(isDefined(self.bIsDog) && self.bIsDog)
       	{
          self BotMove(tempWp, 15.0);
       	}
       	else //ppl are not ;)
       	{
          self BotMove(tempWp, 15.0);
       	}
      }
    }

    //draw waypointlist
    self DrawDynWaypointList();
    wait 0.01;
  }
}

////////////////////////////////////////////////////////////
// debug draw dynamic waypoint list
////////////////////////////////////////////////////////////
DrawDynWaypointList()
{
  if(CanDebugDraw())
  {
    for(i = 0; i < self.dynWaypointCount-1; i++)
    {
      line(self.dynWaypointList[i], self.dynWaypointList[i] + (0,0,200), (1,1,0));
      line(self.dynWaypointList[i], self.dynWaypointList[i+1], (0,1,1));
    }

    line(self.dynWaypointList[self.dynWaypointCount-1], self.dynWaypointList[self.dynWaypointCount-1] + (0,0,200), (1,1,0));
  }
}


////////////////////////////////////////////////////////////
// static waypoint implementation
// 1. Array of waypoints, each waypoint has a type (stand, crouch, prone, camp, climb, etc), and a position on the ground.
// 2. Array of connectivity, list of children for each waypoint
// Reasoning: Easy to find closest waypoint, and traverse children using connectivity
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// converts a string into a float
////////////////////////////////////////////////////////////
atof(string)
{
  setdvar("temp_float", string);
  return getdvarfloat("temp_float");
}

////////////////////////////////////////////////////////////
// converts a string into an integer
////////////////////////////////////////////////////////////
atoi(string)
{
  setdvar("temp_int", string);
  return getdvarint("temp_int");
}

////////////////////////////////////////////////////////////
// Loads static waypoint list from file
////////////////////////////////////////////////////////////
LoadStaticWaypoints()
{
  filename = "PeZBOT_" + tolower(getdvar("mapname")) + "_WP.csv";
  
  compiledFilename = "waypoints/PeZBOT_WP_0.csv";
  level.waypointCount = 0;
  level.waypoints = [];
  
  iLineOffset = 0;
  string = TableLookup(compiledFilename, 0, 0, 1);
//println("1st string '" + string + "'");
 iWPFileCount = int(string);
 // println("iWPFileCount = " + iWPFileCount);
  
  for(i = 0; i < iWPFileCount; i++)
  {
    string = TableLookup(compiledFilename, 0, i+1, 3);

	println("string = " + string);
	println("filename = " + filename);
    
    if(string == filename)
    {
		println(string + " = " + filename + " is true");

      string = TableLookup(compiledFilename, 0, i+1, 2);
      iLineOffset = int(string);
      
      println("iLineOffset of string = " + iLineOffset); 
      
      break;
    }
  } 
  
 if(iLineOffset == 0)
 {
  println("^1Map does not support PeZBOT waypoints (line offset == 0)^7");
 return;
 }
  
   for(i = 0; i < 6; i++)
  {
    compiledFilename = "waypoints/PeZBOT_WP_" + i + ".csv";
    println("reading '" + compiledFilename);

    string = TableLookup(compiledFilename, 0, iLineOffset, 1);
    println("read '" + string + "'");
      
    if(string != "")
    {
      break;
    }
  }
    
  while(1)
  {
//	println("offset + wpc = " + (iLineOffset + level.waypointCount));
    string = TableLookup(compiledFilename, 0, iLineOffset + level.waypointCount, 1);
    
    
      //  println("read '" + string + "'");
    
    if(!isDefined(string) || string == "" || string == "end")
    {
	  if(!isDefined(string))
      {
		println("^1Map does not support PeZBOT waypoints (string not defined)^7");
      }
      else if(string == "")
      {
        println("^1Map does not support PeZBOT waypoints (string == '')^7");
      }      
      else
      {
        println("^2PeZBOT waypoints loaded successfully^7");
      }
      return;
    }
    
    //new waypoint
    level.waypoints[level.waypointCount] = spawnstruct();
  
		tokens = strtok(string, " ");

    //read origin
		level.waypoints[level.waypointCount].origin = (atof(tokens[0]), atof(tokens[1]), atof(tokens[2]));

    string = TableLookup(compiledFilename, 0, iLineOffset+level.waypointCount, 2);
  //  println("read '" + string + "'");
		tokens = strtok(string, " ");

		
		//read in child connectivity
		level.waypoints[level.waypointCount].children = [];
		level.waypoints[level.waypointCount].childCount = 0;
		level.waypoints[level.waypointCount].childCount = tokens.size;
		for(i = 0; i < level.waypoints[level.waypointCount].childCount; i++)
		{
		  level.waypoints[level.waypointCount].children[i] = atoi(tokens[i]);
		}

    //read Type
    level.waypoints[level.waypointCount].type = TableLookup(compiledFilename, 0, iLineOffset+level.waypointCount, 3);

    //increment waypoint counter
    level.waypointCount++;
  }
}


////////////////////////////////////////////////////////////
// debug draw spawns, domination flags, hqs, bombs etc..
////////////////////////////////////////////////////////////
DrawLOI(pos, code)
{

  line(pos + (20,0,0), pos + (-20,0,0), (1,0.75, 0));
  line(pos + (0,20,0), pos + (0,-20,0), (1,0.75, 0));
  line(pos + (0,0,20), pos + (0,0,-20), (1,0.75, 0));
  
  Print3d(pos, code, (1,0,0), 4);

}

////////////////////////////////////////////////////////////
// debug draw static waypoint list
////////////////////////////////////////////////////////////
DrawStaticWaypoints()
{
  while(1)
  {
    if(CanDebugDraw() && isDefined(level.waypoints) && isDefined(level.waypointCount) && level.waypointCount > 0)
    {
      wpDrawDistance = getdvarint("svr_pezbots_WPDrawRange");
    
      for(i = 0; i < level.waypointCount; i++)
      {
        if(isdefined(level.players) && isdefined(level.players[0]))
        {
          distance = distance(level.players[0].origin, level.waypoints[i].origin);
          if(distance > wpDrawDistance)
          {
            continue;
          }
        }
      
        color = (0,0,1);

        //red for unlinked wps
        if(level.waypoints[i].childCount == 0)
        {
          color = (1,0,0);
        }
        else
        if(level.waypoints[i].childCount == 1) //purple for dead ends
        {
          color = (1,0,1);
        }
        else //green for linked
        {
          color = (0,1,0);
        }

        if(isdefined(level.players) && isdefined(level.players[0]))
        {
          distance = distance(level.waypoints[i].origin, level.players[0].origin);
          if(distance <= 30.0)
          {
            strobe = abs(sin(gettime()/10.0));
            color = (color[0]*strobe,color[1]*strobe,color[2]*strobe);
          }
        }

        line(level.waypoints[i].origin, level.waypoints[i].origin + (0,0,80), color);
        
        for(x = 0; x < level.waypoints[i].childCount; x++)
        {
          line(level.waypoints[i].origin + (0,0,5), level.waypoints[level.waypoints[i].children[x]].origin + (0,0,5), (0,0,1));
        }
//        print3d(level.waypoints[i].origin + (0,0,90), "Type: " + level.waypoints[i].type, (1,1,1), 2);
//        print3d(level.waypoints[i].origin + (0,0,100), "Pos: " + level.waypoints[i].origin[0] + ", " + level.waypoints[i].origin[1] + ", " + level.waypoints[i].origin[2], (1,1,1), 2);
//        print3d(level.waypoints[i].origin + (0,0,110), "Index: " + i, (1,1,1), 2);
      }
  
      
      //draw spawnpoints  
      DrawSpawnPoints(getentarray("mp_sab_spawn_axis", "classname"), "sabS");
      DrawSpawnPoints(getentarray("mp_sab_spawn_allies", "classname"), "sabS");
      DrawSpawnPoints(getentarray("mp_sab_spawn_axis_start", "classname"), "sabS");
      DrawSpawnPoints(getentarray("mp_sab_spawn_allies_start", "classname"), "sabS");
      DrawSpawnPoints(getentarray("mp_sd_spawn_attacker", "classname"), "sdS");
      DrawSpawnPoints(getentarray("mp_sd_spawn_defender", "classname"), "sdS");
      
      DrawSpawnPoints(getentarray("mp_dm_spawn", "classname"), "dmS");
      DrawSpawnPoints(getentarray("mp_tdm_spawn", "classname"), "tdmS");
      DrawSpawnPoints(getentarray("mp_dom_spawn", "classname"), "domS");

      //draw domination flags
	    DrawSpawnPoints(getEntArray("flag_primary", "targetname"), "F");
	    DrawSpawnPoints(getEntArray("flag_secondary", "targetname"), "F");

      //draw radios
      DrawSpawnPoints(getentarray("hq_hardpoint", "targetname"), "R");

      //draw bombzones
      DrawSpawnPoints(getEntArray("bombzone", "targetname"), "B");
      DrawSpawnPoints(getEntArray("sab_bomb_axis", "targetname"), "B");
      DrawSpawnPoints(getEntArray("sab_bomb_allies", "targetname"), "B");
    }
    wait 0.001;
  }
}

////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
DrawSpawnPoints(spawnpoints, code)
{
  if(isdefined(spawnpoints))
  {
	  for(i = 0; i < spawnpoints.size; i++)
	  {
		  spawnpoint = spawnpoints[i];

      DrawLOI(spawnpoint.origin, code);
    }
  }
}

////////////////////////////////////////////////////////////
// returns an index to the nearest static waypoint
////////////////////////////////////////////////////////////
GetNearestStaticWaypoint(pos)
{

  if(!isDefined(level.waypoints) || level.waypointCount == 0)
  {
    return -1;
  }

  nearestWaypoint = -1;
  nearestDistance = 9999999999;
  nearestZ = 9999999999;
  nearestXY = 9999999999;
  
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = Distance(pos, level.waypoints[i].origin);
    distanceX = level.waypoints[i].origin[0] - Pos[0];
    distanceY = level.waypoints[i].origin[1] - Pos[1];
    distanceZ = level.waypoints[i].origin[2] - Pos[2];
    
    if(distance < nearestDistance)
    {              
      if(nearestZ < distanceZ && (distanceX < 175 || distanceY < 175) && (distanceX < nearestXY || distanceY < nearestXY))
      {
		if(distanceX < distanceY)
		{
			nearestXY = distanceX;
		}
		else
		{
			nearestXY = distanceY;
		}
		
		nearestDistance = distance;  
		nearestZ = distanceZ;    
		nearestWaypoint = i;
      }     
      else
      {
		nearestDistance = distance;    
		nearestWaypoint = i;
      }       
    }
  }
  
  return nearestWaypoint;
}



////////////////////////////////////////////////////////////
// returns true if there is any waypoint closer to pos than wpIndex
////////////////////////////////////////////////////////////
AnyWaypointCloser(pos, wpIndex)
{
  if(!isDefined(level.waypoints) || level.waypointCount == 0)
  {
    return false;
  }
  nearestWaypoint = wpIndex;
  nearestDistance = Distance(pos, level.waypoints[wpIndex].origin);
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = Distance(pos, level.waypoints[i].origin);
    
    if(distance < nearestDistance)
    {
      nearestDistance = distance;
      nearestWaypoint = i;
    }
  }

//  Print3d(level.waypoints[nearestWaypoint].origin, "CLOSEST", (1,0,0), 3);
  
  if(nearestWaypoint == wpIndex)
  {
    return false;
  }
  else
  {
    return true;  
  }
}


////////////////////////////////////////////////////////////
// returns true if there is any waypoint closer to objPos than self.origin
////////////////////////////////////////////////////////////
AnyWaypointCloserToObjectiveThanMe(objPos)
{
  if(!isDefined(level.waypoints) || level.waypointCount == 0)
  {
    return false;
  }

  meToObjPosDistance = Distance(objPos, self.origin);
  for(i = 0; i < level.waypointCount; i++)
  {
    distance = Distance(objPos, level.waypoints[i].origin);
    
    if((distance+50) < meToObjPosDistance)
    {
      return true;
    }
  }

  return false;  
}

////////////////////////////////////////////////////////////
// static waypoint follow goal, follows static waypoints
///////////////////////////////////////////////////////////
BotGoal_StaticWaypointFollowGoal()
{
  self endon("StaticWaypointFollowGoalComplete");
	self endon("disconnect");
	self endon("killed_player");

  if(!isDefined(level.waypoints) || level.waypointCount == 0)
  {
    self.currentGoal = "none";
    self.currentStaticWp = -1;
    self notify("StaticWaypointFollowGoalComplete");
  }  

  //reset flank direction  
	self.flankSide = (randomIntRange(0,2) - 0.5) * randomFloatRange(0.2, 2.0);
  
  while(1)
  {

    //get waypoint nearest to ourselves  
    if(self.currentStaticWp == -1)
    {
//      print3d(self.origin + (0,0,40), "invalid WP", (1,0,0), 2);

      self.currentStaticWp = GetNearestStaticWaypoint(self.origin);
    }
    
    //get waypoint pos    
    tempWp = level.waypoints[self.currentStaticWp].origin;

    //prevent enemy facing
    if(self CanSeeTarget())
    {
      self.bFaceNearestEnemy = true;
    }
    else
    {
      self.bFaceNearestEnemy = false;

      //face movement direction        
      self SetBotAngles(vectorToAngles(VectorNormalize(VectorSmooth(anglesToForward(self.angles), VectorNormalize(tempWp-self.origin), 0.5))));
    }

    //clamp to xz plane    
    distToWp = Distance((tempWp[0], tempWp[1], self.origin[2]), self.origin);

    if(distToWp <= (level.MoveSpeed + 5.0))
    {
      //if there isn't any waypoint that is closer than our current waypoint then end our goal
      if(!AnyWaypointCloser(self.vObjectivePos, self.currentStaticWp))
      {
        //fixme: should do a check to make sure that one of the child paths doesn't get us closer
        self.currentGoal = "none";
        self.currentStaticWp = -1;
        
        self notify("StaticWaypointFollowGoalComplete");
      }
      else
      {

        //get waypoint nearest our target
        targetWpIdx = GetNearestStaticWaypoint(self.vObjectivePos);
        
        //find shortest path to our destination
        self.currentStaticWp = AStarSearch(self.currentStaticWp, targetWpIdx);

        //invalid waypoint, get outta here        
        if(!isdefined(self.currentStaticWp) || self.currentStaticWp == -1)
        {
          self.currentGoal = "none";
          self.currentStaticWp = -1;
          self notify("StaticWaypointFollowGoalComplete");
        }
        
        tempWp = level.waypoints[self.currentStaticWp].origin;
        
        //move there
        //dogs are fast
        if(isDefined(self.bIsDog) && self.bIsDog)
        {
          self BotMove(tempWp, 15.0);
        }
        else //ppl are not ;)
        {
          if(self.bFaceNearestEnemy)
          {
            self BotMove(tempWp, 15.0); //walk
          }
          else
          {
            self BotMove(tempWp, 20.0); //sprint
          }
        }
      }
    }
/*    
    else //bugging out so try move
    if(self.buggyBotCounter >= 10)
    {
      self.currentStaticWp = -1;
      self.currentGoal = "none";
      self.buggyBotCounter = 0;
      self notify("StaticWaypointFollowGoalComplete");
    }
    else
    if(level.MoveSpeed == 0) //couldnt make it to our waypoint, ohh well
    {
      self.currentStaticWp = -1;
      self.currentGoal = "none";
      self notify("StaticWaypointFollowGoalComplete");
    }
*/    
    wait 0.1;
  }
}


////////////////////////////////////////////////////////////
// AStarSearch, performs an astar search
///////////////////////////////////////////////////////////
/*

The best-established algorithm for the general searching of optimal paths is A* (pronounced “A-star”). 
This heuristic search ranks each node by an estimate of the best route that goes through that node. The typical formula is expressed as:

f(n) = g(n) + h(n)

where: f(n)is the score assigned to node n g(n)is the actual cheapest cost of arriving at n from the start h(n)is the heuristic 
estimate of the cost to the goal from n 

priorityqueue Open
list Closed


AStarSearch
   s.g = 0  // s is the start node
   s.h = GoalDistEstimate( s )
   s.f = s.g + s.h
   s.parent = null
   push s on Open
   while Open is not empty
      pop node n from Open  // n has the lowest f
      if n is a goal node 
         construct path 
         return success
      for each successor n' of n
         newg = n.g + cost(n,n')
         if n' is in Open or Closed,
          and n'.g < = newg
	       skip
         n'.parent = n
         n'.g = newg
         n'.h = GoalDistEstimate( n' )
         n'.f = n'.g + n'.h
         if n' is in Closed
            remove it from Closed
         if n' is not yet in Open
            push n' on Open
      push n onto Closed
   return failure // if no path found 
*/
AStarSearch(startWp, goalWp)
{
  pQOpen = [];
  pQSize = 0;
  closedList = [];
  listSize = 0;
  s = spawnstruct();
  s.g = 0; //start node
  s.h = distance(level.waypoints[startWp].origin, level.waypoints[goalWp].origin);
  s.f = s.g + s.h;
  s.wpIdx = startWp;
  s.parent = spawnstruct();
  s.parent.wpIdx = -1;
  
  //push s on Open
  pQOpen[pQSize] = spawnstruct();
  pQOpen[pQSize] = s; //push s on Open
  pQSize++;

  //while Open is not empty  
  while(!PQIsEmpty(pQOpen, pQSize))
  {
    //pop node n from Open  // n has the lowest f
    n = pQOpen[0];
    highestPriority = 9999999999;
    bestNode = -1;
    for(i = 0; i < pQSize; i++)
    {
      if(pQOpen[i].f < highestPriority)
      {
        bestNode = i;
        highestPriority = pQOpen[i].f;
      }
    } 
    
    if(bestNode != -1)
    {
      n = pQOpen[bestNode];
      //remove node from queue    
      for(i = bestNode; i < pQSize-1; i++)
      {
        pQOpen[i] = pQOpen[i+1];
      }
      pQSize--;
    }
    else
    {
      return -1;
    }
    
    //if n is a goal node; construct path, return success
    if(n.wpIdx == goalWp)
    {
     
      x = n;
      for(z = 0; z < 1000; z++)
      {
        parent = x.parent;
        if(parent.parent.wpIdx == -1)
        {
          return x.wpIdx;
        }
//        line(level.waypoints[x.wpIdx].origin, level.waypoints[parent.wpIdx].origin, (0,1,0));
        x = parent;
      }

      return -1;      
    }

    //for each successor nc of n
    for(i = 0; i < level.waypoints[n.wpIdx].childCount; i++)
    {
      //newg = n.g + cost(n,nc)
      newg = n.g + distance(level.waypoints[n.wpIdx].origin, level.waypoints[level.waypoints[n.wpIdx].children[i]].origin);
      
      //if nc is in Open or Closed, and nc.g <= newg then skip
      if(PQExists(pQOpen, level.waypoints[n.wpIdx].children[i], pQSize))
      {
        //find nc in open
        nc = spawnstruct();
        for(p = 0; p < pQSize; p++)
        {
          if(pQOpen[p].wpIdx == level.waypoints[n.wpIdx].children[i])
          {
            nc = pQOpen[p];
            break;
          }
        }
       
        if(nc.g <= newg)
        {
          continue;
        }
      }
      else
      if(ListExists(closedList, level.waypoints[n.wpIdx].children[i], listSize))
      {
        //find nc in closed list
        nc = spawnstruct();
        for(p = 0; p < listSize; p++)
        {
          if(closedList[p].wpIdx == level.waypoints[n.wpIdx].children[i])
          {
            nc = closedList[p];
            break;
          }
        }
        
        if(nc.g <= newg)
        {
          continue;
        }
      }
      
//      nc.parent = n
//      nc.g = newg
//      nc.h = GoalDistEstimate( nc )
//      nc.f = nc.g + nc.h
      
      nc = spawnstruct();
      nc.parent = spawnstruct();
      nc.parent = n;
      nc.g = newg;
      nc.h = distance(level.waypoints[level.waypoints[n.wpIdx].children[i]].origin, level.waypoints[goalWp].origin);
	    nc.f = nc.g + nc.h;
	    nc.wpIdx = level.waypoints[n.wpIdx].children[i];

      //if nc is in Closed,
	    if(ListExists(closedList, nc.wpIdx, listSize))
	    {
	      //remove it from Closed
        deleted = false;
        for(p = 0; p < listSize; p++)
        {
          if(closedList[p].wpIdx == nc.wpIdx)
          {
            for(x = p; x < listSize-1; x++)
            {
              closedList[x] = closedList[x+1];
            }
            deleted = true;
            break;
          }
          if(deleted)
          {
            break;
          }
        }
	      listSize--;
	    }
	    
	    //if nc is not yet in Open, 
	    if(!PQExists(pQOpen, nc.wpIdx, pQSize))
	    {
	      //push nc on Open
        pQOpen[pQSize] = spawnstruct();
        pQOpen[pQSize] = nc;
        pQSize++;
	    }
	  }
	  
	  //Done with children, push n onto Closed
	  if(!ListExists(closedList, n.wpIdx, listSize))
	  {
      closedList[listSize] = spawnstruct();
      closedList[listSize] = n;
	    listSize++;
	  }
  }
}



////////////////////////////////////////////////////////////
// PQIsEmpty, returns true if empty
////////////////////////////////////////////////////////////
PQIsEmpty(Q, QSize)
{
  if(QSize <= 0)
  {
    return true;
  }
  
  return false;
}


////////////////////////////////////////////////////////////
// returns true if n exists in the pQ
////////////////////////////////////////////////////////////
PQExists(Q, n, QSize)
{
  for(i = 0; i < QSize; i++)
  {
    if(Q[i].wpIdx == n)
    {
      return true;
    }
  }
  
  return false;
}

////////////////////////////////////////////////////////////
// returns true if n exists in the list
////////////////////////////////////////////////////////////
ListExists(list, n, listSize)
{
  for(i = 0; i < listSize; i++)
  {
    if(list[i].wpIdx == n)
    {
      return true;
    }
  }
  
  return false;
}

////////////////////////////////////////////////////////////
// Sets a bot's objective position
///////////////////////////////////////////////////////////
SetObjectivePos(pos)
{
  //FIXME: optimize
  dirToObjective = VectorNormalize(pos - self.origin);
  distToObj = distance(pos, self.origin); 

  //if a long way away from our objective, flank it
  minDistToObj = 1000;
  if(distToObj >= minDistToObj)
  {
    flankDir = VectorCross((0,0,1), dirToObjective);
    
    //project position out along tangent by distance to target
    self.vObjectivePos = pos + ((flankDir * ((distToObj / minDistToObj) * minDistToObj)) * self.flankSide);
    
    //set to pos of nearest waypoint so that we dont try walk out of the level
    if(isDefined(level.waypoints) && level.waypointCount)
    {
      self.vObjectivePos = level.waypoints[GetNearestStaticWaypoint(self.vObjectivePos)].origin;
    }
  }  
  else
  {
    self.vObjectivePos = pos;
  }

}


////////////////////////////////////////////////////////////
//returns true if stunned
////////////////////////////////////////////////////////////
IsStunned()
{
  if(isdefined(self.concussionEndTime) && self.concussionEndTime > gettime())
  {
//    print3d(self.origin, "stunned", (1,0,0), 2);
    return true;
  }

  return false;
}

////////////////////////////////////////////////////////////
// cast a ray from start to end through smoke, return false if cant see
////////////////////////////////////////////////////////////
SmokeTrace(start, end)
{
  for(g = 0; g < level.smokeListCount; g++)
  {
    if(level.smokeList[g].state == "smoking")
    {
      if(RaySphereIntersect(start, end, level.smokeList[g].origin, 300.0))
      {
//        line(start, end, (1,0,0));
        return false;  
      }
    }
  }

//  line(start, end, (0,1,0));
  
  return true;
}

////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
AddToSmokeList()
{
  if(level.smokeListCount+1 > level.smokeList.size)
  {
    level.smokelist[level.smokelist.size] = spawnstruct();
  }

  level.smokeList[level.smokeListCount].grenade = self;
  level.smokeList[level.smokeListCount].state = "moving";
  level.smokeList[level.smokeListCount].stateTimer = gettime();
  level.smokeList[level.smokeListCount].origin = self.origin;
  
  level.smokeListCount++;
}


////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
RemoveFromSmokeList(index)
{

  if(level.smokeListCount <= 0 || index >= level.smokeListCount || index < 0)
  {
    return;
  }

  for(i = index; i < level.smokeListCount-1; i++)
  {
    level.smokeList[i] = level.smokeList[i+1];
  }
  
  level.smokeListCount--;

}


////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
UpdateSmokeList()
{
  while(1)
  {
    for(g = 0; g < level.smokeListCount; g++)
    {
      bGrenadeFound = false;
	    grenades = getentarray("grenade", "classname");
	    //search grenade list for matching grenade entity
	    for(i = 0; i < grenades.size; i++)
	    {
	      grenade = grenades[i];
  	    
	      if(level.smokeList[g].grenade == grenade)
	      {
	        level.smokeList[g].origin = grenade.origin;
	        bGrenadeFound = true;
	        break;
	      }
 	    }

      //grenade not found, so must be smoking or just exploded
 	    if(!bGrenadeFound)
 	    {
 	      switch(level.smokeList[g].state)
 	      {
 	        case "moving":
 	        {
 	          level.smokeList[g].state = "smoking";
 	          level.smokeList[g].stateTime = gettime();
 	          break;
 	        }
 	        
 	        case "smoking":
 	        {
 	          if((gettime()-level.smokeList[g].stateTime) > 11000)
 	          {
    	        RemoveFromSmokeList(g);
    	      }
/*    	      
    	      else
    	      {
    	        print3d(level.smokeList[g].origin, "SMOKING", (1,0,0), 2);
    	        line(level.smokeList[g].origin, level.smokeList[g].origin + (0,0,300.0), (1,0,0));
    	      }
*/
 	          break;
 	        }
 	      }
 	    }
    }
  
    wait 0.05; 
  }
}

/*
   Calculate the intersection of a ray and a sphere
   The line segment is defined from start to end
   The sphere is of radius r and centered at spherePos
   There are potentially two points of intersection given by
   p = start + mu1 (end - start)
   p = start + mu2 (end - start)
   Return FALSE if the ray doesn't intersect the sphere.
*/
////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////
RaySphereIntersect(start, end, spherePos, radius)
{

   dp = end - start;
   a = dp[0] * dp[0] + dp[1] * dp[1] + dp[2] * dp[2];
   b = 2 * (dp[0] * (start[0] - spherePos[0]) + dp[1] * (start[1] - spherePos[1]) + dp[2] * (start[2] - spherePos[2]));
   c = spherePos[0] * spherePos[0] + spherePos[1] * spherePos[1] + spherePos[2] * spherePos[2];
   c += start[0] * start[0] + start[1] * start[1] + start[2] * start[2];
   c -= 2.0 * (spherePos[0] * start[0] + spherePos[1] * start[1] + spherePos[2] * start[2]);
   c -= radius * radius;
   bb4ac = b * b - 4.0 * a * c;
//   if(ABS(a) < 0.0001 || bb4ac < 0) 
   if(bb4ac < 0) 
   {
//      *mu1 = 0;
//      *mu2 = 0;
     return false;
   }

//   *mu1 = (-b + sqrt(bb4ac)) / (2 * a);
//   *mu2 = (-b - sqrt(bb4ac)) / (2 * a);

   return true;
}