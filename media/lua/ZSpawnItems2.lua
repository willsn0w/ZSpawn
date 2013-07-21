require "ISUI/ISPanel"

zSpawnItems_b = ISPanel:derive("zSpawnItems_b");
zSpawnItems_b.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnItems_b:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnItems_b:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnItems_b:create()

	-- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "Barricade");
    self:CreateItemButton(1, 0, "SheetRope");
    self:CreateItemButton(2, 0, "Wall");

    self:CreateItemButton(0, 1, "Stairs");
    self:CreateItemButton(1, 1, "WindowFrame");
    self:CreateItemButton(2, 1, "DoorFrame");

    self:CreateItemButton(0, 2, "Crate");
    self:CreateItemButton(1, 2, "Battery");
    self:CreateItemButton(2, 2, "Torch");

    self:CreateItemButton(0, 3, "CandleLit");
    self:CreateItemButton(1, 3, "Candle");
    self:CreateItemButton(2, 3, "Lighter");

    self:CreateItemButton(0, 4, "Matches");
    self:CreateItemButton(1, 4, "PetrolCan");
    self:CreateItemButton(2, 4, "Drawer");

    self:CreateItemButton(0, 5, "Pills");
    self:CreateItemButton(1, 5, "PillsBeta");
    self:CreateItemButton(2, 5, "PillsAntiDep");

    self:CreateItemButton(0, 6, "PillsSleepingTablets");
    self:CreateItemButton(1, 6, "BucketEmpty");
    self:CreateItemButton(2, 6, "BucketWaterFull");

    self:CreateItemButton(0, 7, "BucketPlasterFull");
    self:CreateItemButton(1, 7, "BucketConcreteFull");
    self:CreateItemButton(2, 7, "PlasterPowder");

    self:CreateItemButton(0, 8, "ConcretePowder");
    self:CreateItemButton(1, 8, "Gravelbag");
    self:CreateItemButton(2, 8, "BarbedWire");

    -- Loop through our buttons table to initialize our buttons and give them their parent.
    for k,v in ipairs(self.buttons) do
		v:initialise();
		self:addChild(v);
	end

	-- Credits, because, y'know, I love my fame. :~)
	streetCred = ISLabel:new(109, 361, 0, "Mod by Spyder638", 1, 1, 1, 1, UIFont.Small);
    streetCred:initialise();
    self:addChild(streetCred);

end

---------------------------------------------------------------------------------------------------------------------------------
-- Function to create buttons in a grid layout and add to a table. :: Input = Grid x coord, Grid y coord, string of items name --
---------------------------------------------------------------------------------------------------------------------------------

function zSpawnItems_b:CreateItemButton(x, y, item)
	local new_x = 55 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnItems_b.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnItems_b:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end