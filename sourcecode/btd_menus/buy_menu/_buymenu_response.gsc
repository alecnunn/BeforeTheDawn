init()
{
	//game["menu_inventory"] = "inventory";
	game["menu_sniperb"] = "sniper";
	game["menu_shotgun"] = "shotgun";
	game["menu_assault"] = "assault";
	game["menu_LMG"] = "lmgmenu";
	game["menu_pistol"] = "pistol";
	game["menu_SMG"] = "SMG";
	precacheMenu(game["menu_shotgun"]);
	precacheMenu(game["menu_assault"]);
	precacheMenu(game["menu_LMG"]);
	precachemenu(game["menu_pistol"]);
	precachemenu(game["menu_sniperb"]);
	precachemenu(game["menu_SMG"]);
	precacheString(&"^9Money:");

	if(getdvar("btd_secondary_weap") == "")
		setdvar("btd_secondary_weap",1);
		
	if(getdvar("btd_primary_weap") == "")
		setdvar("btd_primary_weap",2);
		
	if(getDvar("btd_money_value") == "")
		setDvar("btd_money_value",20);
		
	if(getDvar("btd_startmoney")== "")
		setDvar("btd_startmoney", 1500);
		
	if(getDvar("btd_wallstreet")== "")
		setDvar("btd_wallstreet",1);
		
	thread onPlayerConnect();
}

onPlayerConnect()
{
	while(1)
	{
		level waittill("connecting", player);
		player thread onMenuResponse();
	}
}

onMenuResponse()
{	
	self endon("disconnect");
	self.totalweaponsprimary = 1;
	self.totalweaponssecondary = 1;
	self.startmoney = getDvarInt("btd_startmoney");
	self.startbudget = self.startmoney;
	
	self.money = self.startbudget;
	self.allowedweapons = getdvarint("btd_primary_weap");
	self.allowedweapons2 = getdvarint("btd_secondary_weap");
	self.moneyvalue = getDvarInt("btd_wallstreet");

	self thread makehud();

	while(1)
	{
		self waittill("menuresponse", menu, response);
		if(menu == game["menu_buymenu"] && level.pistolonly != 1)
		{
			switch(response)
			{
				case "LMG":
					//self openmenu(game["menu_buymenu"]);
					self openMenu(game["menu_LMG"]);					
				break;
				
				case "assault":
					//self openmenu(game["menu_buymenu"]);
					self openMenu(game["menu_assault"]);
				break;
				
				case "shotgun":
					//self openmenu(game["menu_buymenu"]);
					self openmenu(game["menu_shotgun"]);
				break;
				
				case "sniper":
					//self openmenu(game["menu_buymenu"]);
					self openMenu(game["menu_sniperb"]);
				break;
				
				case "pistol":
					//self openmenu(game["menu_buymenu"]);
					self openMenu(game["menu_pistol"]);
				break;
				
				case "SMG":
					//self openmenu(game["menu_buymenu"]);
					self openMenu(game["menu_SMG"]);
				break;
			}
		}
		if(menu == game["menu_buymenu"] && level.pistolonly == 1)
		{
			switch(response)
			{
				case "LMG":
					self iPrintLnBold("Not available with Pistol Only enabled!");
				break;
				
				case "assault":
					self iPrintLnBold("Not available with Pistol Only enabled!");
				break;
				
				case "shotgun":
					self iPrintLnBold("Not available with Pistol Only enabled!");
				break;
				
				case "sniper":
					self iPrintLnBold("Not available with Pistol Only enabled!");
				break;
				
				case "SMG":
					self iPrintLnBold("Not available with Pistol Only enabled!");
				break;
				
				case "pistol":
					//self openmenu(game["menu_buymenu"]);
					self openMenu(game["menu_pistol"]);
				break;
			}
		}
		if(menu == game["menu_pistol"])
		{
			switch(response)
			{
				
				case "1":
					selectedweapon = "deserteagle_mp";
					price = 400;
					self.totalweaponssecondary += 1;
					check = secondaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
					{
						self thread giveWeaponBuy(500,"deserteagle_mp","Weapon");
					}
					else 
					{
						self playSound("error_btd");
					}
				break;
				
				case "2":
					selectedweapon = "beretta_mp";
					price = 200;
					self.totalweaponssecondary += 1;
					check =	secondaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(300,"beretta_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
					
				case "3":
					selectedweapon = "usp_mp";
					price = 250;
					self.totalweaponssecondary += 1;
					check =	secondaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(350,"usp_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				case "4":
					selectedweapon = "colt45_mp";
					price = 300;
					self.totalweaponssecondary += 1;
					check =	secondaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(400,"colt45_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
			}
		}
		else if(menu == game["menu_LMG"])
		{
			switch(response)
			{
				
				case "SAW":
					selectedweapon = "saw_relex_mp";
					price = 3000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(3000,"saw_relex_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				case "RPD":
					selectedweapon = "rpd_mp";
					price = 3000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(3250,"rpd_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
					
				case "m60":
					selectedweapon = "m60e4_acog_mp";
					price = 3000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(3500,"m60e4_acog_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
			}
		}
		if(menu == game["menu_assault"])
		{
			switch(response)
			{
				
				case "1":
					selectedweapon = "m4_gl_mp";
					price = 1000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1700,"m4_gl_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				case "2":
					selectedweapon = "ak47_mp";
					price = 900;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1000,"ak47_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				case "3":
					selectedweapon = "g3_reflex_mp";
					price = 1200;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1600,"g3_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				case "4":
					selectedweapon = "m14_reflex_mp";
					price = 1500;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1200,"m14_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				case "5":
					selectedweapon = "G36c__reflex_mp";
					price = 1500;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1500,"G36c__reflex_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
					
				case "6":
					selectedweapon = "mp44_mp";
					price = 800;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1200,"mp44_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
			}
		}
		if(menu == game["menu_SMG"])
		{
			switch(response)
			{
				
				case "1":
					selectedweapon = "mp5_reflex_mp";
					price = 600;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(600,"mp5_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				case "2":
					selectedweapon = "skorpion_reflex_mp";
					price = 700;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(700,"skorpion_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				case "3":
					selectedweapon = "uzi_reflex_mp";
					price = 700;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(700,"uzi_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				case "4":
					selectedweapon = "ak47u_reflex_mp";
					price = 800;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(800,"ak47u_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				case "5":
					selectedweapon = "p90_refelx_mp";
					price = 1000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1000,"p90_ewflex_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				
			}
		}
		if(menu == game["menu_shotgun"])
		{
			switch(response)
			{
				
				case "1":
					selectedweapon = "winchester1200_reflex_mp";
					price = 700;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1000,"winchester1200_reflex_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				case "2":
					selectedweapon = "m1014_mp";
					price = 1000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1500,"m1014_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				
			}
		}
		if(menu == game["menu_sniperb"])
		{
			switch(response)
			{
				
				case "1":
					selectedweapon = "barrett_mp";
					price  = 5000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(5000,"barrett_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				case "2":
					selectedweapon = "remington700_mp";
					price  = 3000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(3000,"remington700_mp","Weapon");
					else 
						self playSound("error_btd");
					break;
				case "3":
					selectedweapon = "m40a3_mp";
					price  = 1500;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(1500,"m40a3_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				case "4":
					selectedweapon = "dragunov_mp";
					price  = 2500;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(2500,"dragunov_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				case "5":
					selectedweapon = "m21_mp";
					price = 2000;
					self.totalweaponsprimary += 1;
					check = primaryweapon();
					check = enoughmoney(price);
					check = sameweapon(selectedweapon);
					if(check)
						self thread giveWeaponBuy(2000,"m21_mp","Weapon");
					else 
						self playSound("error_btd");
				break;
				
				
			}
		}
	}
}

enoughmoney(price)
{
	if(self.money - price > 0)
	{
		self closeMenu();
	    self iPrintLn("Sorry - Insufficient Funds!");
		//self playSound("error_btd");
		self openMenu(game["menu_buymenu"]);
		
		return true;		
	}
}


primaryweapon()
{
	if(self.totalweaponsprimary >= self.allowedweapons )
	{
		self closeMenu();
	    self iPrintLn("Main Weapon Inventory Full");
		//self playSound("error_btd");
		//self.totalweaponsprimary -= 1;
		
		self openMenu(game["menu_buymenu"]);
		return false;
	}
	else 
	{	
		return true;
	}
}

secondaryweapon()
{
	if(self.totalweaponssecondary >= self.allowedweapons2 )
	{
		self closeMenu();
	    self iPrintLn("Pistol Inventory Full");
		//self playSound("error_btd");
		//self.totalweaponssecondary -= 1;
		
		self openMenu(game["menu_buymenu"]);
		return false;
	}
	else 
	{	
		return true;
	}
}


sameweapon(selectedweapon)
{
	ownweapon = self getCurrentWeapon();

	if(selectedweapon == ownweapon)
	{
		self closeMenu();
		self iPrintLnBold("You allready have that weapon");
	   	self playSound("error_btd");
		return false;
	}
	else 
		return true;
}

giveWeaponBuy(price,selectedweapon,class)
{
	
	if(self.money - price < 0)
	{
		self closeMenu();
	    self iPrintLn("Sorry - Insufficient Funds!");
		//self playSound("error_btd");
		self openMenu(game["menu_buymenu"]);
	}
	else
	{
		ownweapon = self getCurrentWeapon();
		
		if(selectedweapon == ownweapon)
		{
			self closeMenu();
			self iPrintLnBold("You allready have that weapon");
		   	self playSound("error_btd"); 
		}
		else
		{
			self giveWeapon(selectedweapon);
			self iPrintLn("Purchase Sucesefull - ^1[^7 " + selectedweapon + " ^1]");
			self playSound("kaching");
				
			checkprice = price * self.moneyvalue;
			self.money -= checkprice;	
		}	
	}
}


makehud()
{
	self endon("disconnect");

	self.moneyhud = newClientHudElem(self);
	self.moneyhud.x = 40;
	self.moneyhud.y = 415;
	self.moneyhud.alignX = "left";
	self.moneyhud.alignY = "middle";
	self.moneyhud.horzAlign = "left";
	self.moneyhud.vertAlign = "top";
	self.moneyhud.glowAlpha = 0.1;
	self.moneyhud.glowColor = (0.2, 0.3, 0.7);
	self.moneyhud.sort = 10;
	self.moneyhud.fontscale = 1.4;
	self.moneyhud.archived = false;
	self.moneyhud setText("Money:");

	self.money_num = newClientHudElem(self);
	self.money_num.x = 90;
	self.money_num.y = 415;
	self.money_num.alignX = "left";
	self.money_num.alignY = "middle";
	self.money_num.horzAlign = "left";
	self.money_num.vertAlign = "top";
	self.money_num.glowAlpha = 0.1;
	self.money_num.glowColor = (0.2, 0.3, 0.7);
	self.money_num.sort = 10;
	self.money_num.fontscale = 1.4;
	self.money_num.archived = false;

	while(1)
	{
		wait 0.05;
		if(self.sessionstate != "playing")
		{
			self.moneyhud.alpha = 0;
			self.money_num.alpha = 0;
			continue;
		}
		self.moneyhud.alpha = 1;
		self.money_num.alpha = 1;
		self.money_num setValue(self.money);
	}
}

/*
/// doesnt work because it keeps increases money 
monitorkills()
{
self endon("disconnect");
while(1)
	{
	wait 0.5;
killformoney = self.kills;
moneyforkill = getDvarInt("btd_money_value");
amount = 20*killformoney;
money = self.money + amount;
self.money = money;
}
}*/
