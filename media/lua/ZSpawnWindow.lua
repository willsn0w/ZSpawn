--***********************************
--*** Amended By ExcentriCreation ***
--***********************************

require "ISUI/ISCollapsableWindow"

zSpawnWindow = ISCollapsableWindow:derive("zSpawnWindow");

function zSpawnWindow:initialise()
	ISCollapsableWindow.initialise(self);
end

function zSpawnWindow:new (x, y, width, height)
	local o = {};
	o = ISCollapsableWindow:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	o.title = "zSpawn v0.3.2"
	o:noBackground();
	return o;
end

function zSpawnWindow:createChildren()
	ISCollapsableWindow.createChildren(self);

	self.tabs = ISTabPanel:new(0, 9, self.width, self.height-9);
	self.tabs:initialise();
	self:addChild(self.tabs);
	
	-- Favourits
	self.item5Screen = zSpawnFavourits:new(0, 9, self.width, self.height-9);
	self.item5Screen:initialise();
	self.tabs:addView("<3Itms", self.item5Screen);

	-- Weapons
	self.weaponScreen = zSpawnWeapons:new(0, 9, self.width, self.height-9);
	self.weaponScreen:initialise();
	self.tabs:addView("Weps", self.weaponScreen);

	-- Items
	self.itemScreen = zSpawnItems:new(0, 9, self.width, self.height-9);
	self.itemScreen:initialise();
	self.tabs:addView("Itms1", self.itemScreen);

	-- Items 2 
	self.item2Screen = zSpawnItems_b:new(0, 9, self.width, self.height-9);
	self.item2Screen:initialise();
	self.tabs:addView("Itms2", self.item2Screen);

	-- Items 3
	self.item3Screen = zSpawnItems_c:new(0, 9, self.width, self.height-9);
	self.item3Screen:initialise();
	self.tabs:addView("Itms3", self.item3Screen);

	-- Items 4
	self.item4Screen = zSpawnItems_d:new(0, 9, self.width, self.height-9);
	self.item4Screen:initialise();
	self.tabs:addView("Itms4", self.item4Screen);
	
	-- Clothing And Food 1
	self.candf1Screen = zSpawnClothingAndFood:new(0, 9, self.width, self.height-9);
	self.candf1Screen:initialise();
	self.tabs:addView("Cl/Fd", self.candf1Screen);

	-- Food 2 
	self.food2Screen = zSpawnFood_b:new(0, 9, self.width, self.height-9);
	self.food2Screen:initialise();
	self.tabs:addView("Food2", self.food2Screen);

	-- Food 3 
	self.food3Screen = zSpawnFood_c:new(0, 9, self.width, self.height-9);
	self.food3Screen:initialise();
	self.tabs:addView("Food3", self.food3Screen);

end

function zSpawn()
	zWin = zSpawnWindow:new(100, 100, 520, 400)
	zWin:addToUIManager();
    zWin:setVisible(false);
end

function zSKeyListener(key)  
	if key == 28 then
  		if not zWin:getIsVisible() then
  		    zWin:setVisible(true);
  		else
  		    zWin:setVisible(false);
  		end
	end
end

--Listen for a key push.
Events.OnKeyPressed.Add(zSKeyListener);

Events.OnGameStart.Add(zSpawn);



