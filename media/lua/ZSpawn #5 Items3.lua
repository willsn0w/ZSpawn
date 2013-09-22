require "ISUI/ISPanel"

zSpawnItems_c = ISPanel:derive("zSpawnItems_c");
zSpawnItems_c.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnItems_c:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnItems_c:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnItems_c:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "BathTowel");
    self:CreateItemButton(1, 0, "Bandaid");
    self:CreateItemButton(2, 0, "Dice");
    self:CreateItemButton(3, 0, "Lipstick");

    self:CreateItemButton(0, 1, "Locket");
    self:CreateItemButton(1, 1, "Bleach");
    self:CreateItemButton(2, 1, "Mirror");
    self:CreateItemButton(3, 1, "CardDeck");

    self:CreateItemButton(0, 2, "ToyBear");
    self:CreateItemButton(1, 2, "Wallet");
    self:CreateItemButton(2, 2, "Wallet2");
    self:CreateItemButton(3, 2, "Wallet3");

    self:CreateItemButton(0, 3, "Wallet4");
    self:CreateItemButton(1, 3, "Wire");
    self:CreateItemButton(2, 3, "Yoyo");
    self:CreateItemButton(3, 3, "String");

    self:CreateItemButton(0, 4, "WeddingRing_Man");
    self:CreateItemButton(1, 4, "WeddingRing_Woman");
    self:CreateItemButton(2, 4, "Razor");
    self:CreateItemButton(3, 4, "Radio");

    self:CreateItemButton(0, 5, "Bandage");
    self:CreateItemButton(1, 5, "WaterBottleEmpty");
    self:CreateItemButton(2, 5, "PopBottleEmpty");
    self:CreateItemButton(3, 5, "FullKettle");

    self:CreateItemButton(0, 6, "Journal");
    self:CreateItemButton(1, 6, "Doodle");
    self:CreateItemButton(2, 6, "Newspaper");
    self:CreateItemButton(3, 6, "Magazine");

    self:CreateItemButton(0, 7, "Book");
    self:CreateItemButton(1, 7, "Tissue");
    self:CreateItemButton(2, 7, "BigHikingBag");
    self:CreateItemButton(3, 7, "NormalHikingBag");

    self:CreateItemButton(0, 8, "Schoolbag");
    self:CreateItemButton(1, 8, "Tote");
    self:CreateItemButton(2, 8, "Plasticbag");
    self:CreateItemButton(3, 8, "Duffelbag");

    -- Loop through our buttons table to initialize our buttons and give them their parent.
    for k,v in ipairs(self.buttons) do
		v:initialise();
		self:addChild(v);
	end

	-- Credits, because, y'know, I love my fame. :~)
	streetCred = ISLabel:new(327, 361, 0, "Mod by Spyder638, Dylan1313 & ExcentriCreation", 1, 1, 1, 1, UIFont.Small);
    streetCred:initialise();
    self:addChild(streetCred);

end

---------------------------------------------------------------------------------------------------------------------------------
-- Function to create buttons in a grid layout and add to a table. :: Input = Grid x coord, Grid y coord, string of items name --
---------------------------------------------------------------------------------------------------------------------------------

function zSpawnItems_c:CreateItemButton(x, y, item)
	local new_x = 45 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnItems_c.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnItems_c:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end