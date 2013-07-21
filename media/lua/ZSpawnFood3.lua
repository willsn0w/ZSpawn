require "ISUI/ISPanel"

zSpawnFood_c = ISPanel:derive("zSpawnFood_c");
zSpawnFood_c.buttons = {} -- Create a table to hold our buttons so we can loop through them later.

function zSpawnFood_c:initialise()
	ISPanel.initialise(self); -- Initialize the panel.
	self:create() -- Call the create function - where most of the work will be done.
end

function zSpawnFood_c:new (x, y, width, height) -- Create our new panel so we can add to to a window in the ZSpawnWindow.lua file.
	local o = {};
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self);
	self.__index = self;
	return o;
end

function zSpawnFood_c:create()

	-- Create each of our buttons using the CreateItemButton function below.
    -- Create each of our buttons using the CreateItemButton function below.
    self:CreateItemButton(0, 0, "MushroomGeneric4");
    self:CreateItemButton(1, 0, "MushroomGeneric5");
    self:CreateItemButton(2, 0, "MushroomGeneric6");

    self:CreateItemButton(0, 1, "MushroomGeneric7");
    self:CreateItemButton(1, 1, "BerryGeneric1");
    self:CreateItemButton(2, 1, "BerryGeneric2");

    self:CreateItemButton(0, 2, "BerryGeneric3");
    self:CreateItemButton(1, 2, "BerryGeneric4");
    self:CreateItemButton(2, 2, "BerryGeneric5");

    self:CreateItemButton(0, 3, "BerryPoisonIvy");
    self:CreateItemButton(1, 3, "Strawberry");
    self:CreateItemButton(2, 3, "Candycane");

    self:CreateItemButton(0, 4, "Empty");
    self:CreateItemButton(1, 4, "Empty");
    self:CreateItemButton(2, 4, "Empty");

    self:CreateItemButton(0, 5, "Empty");
    self:CreateItemButton(1, 5, "Empty");
    self:CreateItemButton(2, 5, "Empty");

    self:CreateItemButton(0, 6, "Empty");
    self:CreateItemButton(1, 6, "Empty");
    self:CreateItemButton(2, 6, "Empty");

    self:CreateItemButton(0, 7, "Empty");
    self:CreateItemButton(1, 7, "Empty");
    self:CreateItemButton(2, 7, "Empty");

    self:CreateItemButton(0, 8, "Empty");
    self:CreateItemButton(1, 8, "Empty");
    self:CreateItemButton(2, 8, "Empty");

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

function zSpawnFood_c:CreateItemButton(x, y, item)
	local new_x = 55 + (110*x); -- Generate new coordinates so I don't have to manually find the x, y location for buttons.
	local new_y = 45 + (35*y);
	butt = ISButton:new(new_x, new_y, 100, 25, item, butt, zSpawnFood_c.SpawnItem); -- Create the button
	butt.internal = item; -- Give it an internal value
	table.insert(self.buttons, butt); -- Insert button into table.
end

--------------------------------------------------------------------------
-- Function to spawn items into the players inventory :: Input = Button --
--------------------------------------------------------------------------

function zSpawnFood_c:SpawnItem(button)
	local inventory = getPlayer():getInventory(); -- Get the players inventory.
	local item = button.internal; -- Grab the name of the item.
	inventory:AddItem('Base.' .. item); --Add the item to the inventory.
end