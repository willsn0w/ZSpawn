require "ISUI/ISPanel"

zSpawnFavourits = ISPanel:derive("zSpawnFavourits");
zSpawnFavourits.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnFavourits:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnFavourits:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnFavourits:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "Torch");
    self:CreateItemButton(1, 0, "Battery");
    self:CreateItemButton(2, 0, "Lighter");
    self:CreateItemButton(3, 0, "Sheet");

    self:CreateItemButton(0, 1, "Pills");
    self:CreateItemButton(1, 1, "PillsBeta");
    self:CreateItemButton(2, 1, "PillsAntiDep");
    self:CreateItemButton(3, 1, "PillsSleepingTablets");

    self:CreateItemButton(0, 2, "PillsVitamins");
    self:CreateItemButton(1, 2, "PillsVitamins");
    self:CreateItemButton(2, 2, "RippedSheets");
    self:CreateItemButton(3, 2, "Bandage");

    self:CreateItemButton(0, 3, "Nails");
    self:CreateItemButton(1, 3, "Plank");
    self:CreateItemButton(2, 3, "Hammer");
    self:CreateItemButton(3, 3, "Screwdriver");

    self:CreateItemButton(0, 4, "Saw");
    self:CreateItemButton(1, 4, "Log");
    self:CreateItemButton(2, 4, "BarbedWire");
    self:CreateItemButton(3, 4, "Gravelbag");

    self:CreateItemButton(0, 5, "Sandbag");
    self:CreateItemButton(1, 5, "BookCarpentry1");
    self:CreateItemButton(2, 5, "BookCarpentry2");
    self:CreateItemButton(3, 5, "Empty");

    self:CreateItemButton(0, 6, "BookCarpentry1");
    self:CreateItemButton(1, 6, "BookCarpentry2");
    self:CreateItemButton(2, 6, "PopBottle");
    self:CreateItemButton(3, 6, "WatermelonSliced");

    self:CreateItemButton(0, 7, "Schoolbag");
    self:CreateItemButton(1, 7, "Tote");
    self:CreateItemButton(2, 7, "Plasticbag");
    self:CreateItemButton(3, 7, "Duffelbag");

    self:CreateItemButton(0, 8, "NormalHikingBag");
    self:CreateItemButton(1, 8, "BigHikingBag");
    self:CreateItemButton(2, 8, "Empty");
    self:CreateItemButton(3, 8, "Empty");

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

function zSpawnFavourits:CreateItemButton(x, y, item)
	local new_x = 45 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnFavourits.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnFavourits:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end